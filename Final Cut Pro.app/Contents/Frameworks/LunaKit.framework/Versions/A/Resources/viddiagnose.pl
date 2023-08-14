#!/usr/bin/perl -w

use Cwd 'abs_path';
use File::Basename 'basename', 'dirname';
use Getopt::Long;

sub usage {
	print(STDERR "usage: " . basename($0) . <<USAGE);
 [--app|-a <path>] [--document|-d <path>]+ (--fromapp | --fromnuke) [--[no-]default-docs] [--[no-]reveal] [--verbose|-v]+ [--quiet|-q]+
    --app (-a) <path> Path to the app itself.  Default attempts to find the app by looking
                      for whatever app the script is contained within.
    --document (-p) <path>  Path to a project or library to include in the diagnostic 
                      archive.  May be specified multiple times.
    --[no-]reveal     Indicates whether or not to reveal the resulting tarball in the 
                      Finder.  Default is to do so.
    --[no-]system-profile Indicates whether or not to include (if possible) a system 
                      profile report (system_profile.spx).  Default is to do so.
    --system-profile-level (1|2) Indicates optional level of system profile detail data,
                      with 1 being minimal, and 2 being full.  Default is 2 unless we
                      are being invoked from the nukeprefs mode, in which case it is 1.
    --verbose (-v)    Enables diagnostic output.  Can be repeated for higher 
                      levels of verbosity.
    --quiet (-q)      Quiets diagnostic output.  Can be repeated for less 
                      verbosity.
USAGE
	exit(2);
}

my $appdir;			# path to app (if not specified, assume embedded)
my @documents = ();	# extra library documents to archive
my $fromapp = 0;
my $fromnuke = 0;
my $shouldreveal = 1;
my $defaultdocs = 1;
my $systemprofile = 1;
my $systemprofilelevel;
my $systemlog = 1;
my $verbose = 0;	# more diagnostic output
my $quiet = 0;		# less diagnostic output

Getopt::Long::Configure("bundling");
GetOptions(
	"app|a=s" => \$appdir,
	"document|d=s" => \@documents,
	"fromapp" => \$fromapp,
	"fromnuke" => \$fromnuke,
	"default-docs!" => \$defaultdocs,
	"reveal!" => \$shouldreveal,
	"system-profile!" => \$systemprofile,
	"system-profile-level=i" => \$systemprofilelevel,
	"system-log!" => \$systemlog,
	"verbose|v+" => \$verbose,
	"quiet|q+" => \$quiet,
	"help" => \&usage,
) || usage();
if (scalar(@ARGV) > 0) { usage(); }
if ($fromapp && $fromnuke) { usage(); }

if ($systemprofile && (! defined($systemprofilelevel))) {
	$systemprofilelevel = $fromnuke ? 1 : 2;
}

# TO-DO: add support for $fromapp, $fromnuke, $defaultdocs==0  (!!!)


$verbose -= $quiet;
if ($verbose < 0) { $verbose = 0; }

# get the app path
if (defined($appdir)) {
	$appdir = abs_path($appdir);
	if ($appdir !~ /^.+\.app$/) {
		die("specified app does not appear to be an app package\n");
	}
	elsif (! -e $appdir) {
		die("specified app does not exist\n");
	}
}
else {
	if (abs_path($0) =~ /^(.+\.app)\/Contents\/Frameworks\/LunaKit.framework\/Versions\/[^\/]+\/(?:Resources|Tools|Scripts|Helpers)\/[^\/]+\.pl$/) {
		$appdir = $1;
	}
	else {
		die("no app specified and script does not appear to be embedded within an app package\n");
	}
}
log_verbose(2, "app path: \"%s\"", $appdir);

# extract plist info
my $plistpath = $appdir . "/Contents/Info.plist";
if (! -e $plistpath) {
	die("specified/embedding app does not have Info.plist file\n");
}
my $bundleid = `/usr/bin/defaults read \"$plistpath\" CFBundleIdentifier`;
if (($? != 0) || (! defined($bundleid)) || ($bundleid =~ /^\s*[\r\n]*$/)) {
	die("cannot determine bundle identifier of specified/embedding app\n");
}
chomp($bundleid);
if ($bundleid !~ /com\.apple\.(?:[^\.]+\.)*([^.]+)$/) {
	die("unspected format for bundle identifier of specified/embedding app ($bundleid)\n");
}
my $bundleidelem = $1;
my $bundleexec = `/usr/bin/defaults read \"$plistpath\" CFBundleExecutable`;
if (($? != 0) || (! defined($bundleexec)) || ($bundleexec =~ /^\s*[\r\n]*$/)) {
	die("cannot determine bundle executable name of specified/embedding app\n");
}
chomp($bundleexec);
log_verbose(2, "bundle id: \"%s\" (elem: \"%s\", executable: \"%s\")", $appdir, $bundleidelem, $bundleexec);

# determine what stuff we should include in the diagnostic package
# expected format for an info hash:
#	parent_dir <PATH> | parent_dirs <ARRAY> - this is the directory in which to match candidates
#	path[s] <PATH|ARRAY> | path_pattern[s] <PATTERN|ARRAY> - entries to match within the parent dir
#			(pattern matching here is done on the whole, i.e. the pattern is wrapped with an implicit ^$
#	dest_name - the folder name in the archive which will contain the entries from path[s]|path_pattern[s]
#   (includes | excludes) <PATTERN-ARRAY> - patterns to include or exclude (only one or the other) when recursing dirs
#			(pattern matching here does not wrap with an implicit ^$, and the match will be made against the full path)
my %document_rules_fcp_library = (
	"extension" => "fcpbundle",
	"includes" => [
		"CurrentVersion\\.fcpevent(?:-(?:wal|shm))?\$",
		"CurrentVersion\\.flexolibrary(?:-(?:wal|shm))?\$",
		"Settings\\.plist\$",
	],
	"dest_name" => "Projects",
);
my %document_rules_imovie_library = (
	"extension" => "imovielibrary",
	"includes" => [
		"CurrentVersion\\.imovieevent(?:-(?:wal|shm))?\$",
		"CurrentVersion\\.flexolibrary(?:-(?:wal|shm))?\$",
		"Settings\\.plist\$",
	],
	"dest_name" => "Projects",
);
my %document_processors_by_app = (
	"FinalCut" => [
		{
			%document_rules_fcp_library,
		},
	],
	"iMovieApp" => [
		{
			%document_rules_imovie_library,
		},
	],
	"motionapp" => [
		{
			"extensions" => ["motn", "mopr"],
			"dest_name" => "Documents/Projects",
		},
		{
			"extension" => "moti",
			"dest_name" => "Documents/Titles",
		},
		{
			"extension" => "motr",
			"dest_name" => "Documents/Effects",
		},
		{
			"extension" => "moef",
			"dest_name" => "Documents/Transitions",
		},
	],
	"Compressor" => [
		{
			"extension" => "compressor",
			"dest_name" => "Documents",
		},
	],
);
my %infos_by_app = (
	"FinalCut" => [
		{
			"parent_dir" => "~/Movies",
			%document_rules_fcp_library,
		},
	],
	"iMovieApp" => [
		{
			"parent_dir" => "~/Movies",
			%document_rules_imovie_library,
		},
	],
	"motionapp" => [
	],
	"Compressor" => [
		{
			"parent_dir" => "~/Library/Logs",
			"path" => "Compressor",
			"dest_name" => "CompressorLogs",
		},
	],
);
my %app_info_aliases = (
	"FinalCutTrial" => "FinalCut",
);
my @infos = (
	{
		"parent_dir" => "~/Library/Application Support/$bundleexec",
		"path" => "Layouts",
		"dest_name" => "WindowLayouts",
	},
	{
		"parent_dir" => "~/Library/Application Support/$bundleexec",
		"path" => "Workspaces",
		"dest_name" => "WindowLayouts",
	},
	{
		"parent_dir" => "~/Library",
		"path" => "Preferences",
		"includes" => [
			quotemeta($bundleid) . "\\..*plist",
		],
		"dest_name" => undef,
	},
	{
		"parent_dirs" => [
			"/Library/Logs",
			"~/Library/Logs",
		],
		"path" => "DiagnosticReports",
		"includes" => [
			quotemeta($bundleexec) . "_.+\\.spin\$",
			quotemeta($bundleexec) . "_.+\\.hang\$",
			quotemeta($bundleexec) . "_.+\\.crash\$",
		],
		"dest_name" => undef,
	},
	{
		"parent_dir" => "~/Library/Caches/$bundleid",
		"path" => ".registryCache",
		"dest_name" => "Caches",
	},
	{
		"parent_dir" => "$appdir/Contents",
		"path" => "version.plist",
		"dest_name" => "AppInfo",
	},
	{
		"parent_dir" => "$appdir/Contents",
		"path" => "Info.plist",
		"dest_name" => "AppInfo",
	},
);

my $nameforinfo = $bundleidelem;
if (exists($app_info_aliases{$nameforinfo})) {
	$nameforinfo = $app_info_aliases{$nameforinfo};
}
if (exists($infos_by_app{$nameforinfo})) {
	push(@infos, @{$infos_by_app{$nameforinfo}});
}

# scan in the set of files to collect
my @scanned = ();
foreach my $infoelem (@infos) {
	my $scanresults = scan_items($infoelem, $bundleid);
	push(@scanned, $scanresults);
}

# scan in the documents
if (scalar(@documents) > 0) {
	my $docprocessors = $document_processors_by_app{$nameforinfo};
	if (defined($docprocessors)) {
		foreach my $document (@documents) {
			if (-l $document) { next; }
			$document = abs_path($document);
			if ((! defined($document)) || ($document eq "")) { next; }
			
			my $pardir = dirname($document);
			my $docname = basename($document);
			log_verbose(2, "processing document: %s/./%s\n", $pardir, $docname);
			
			my $usedocprocessor = undef;
			foreach my $docprocessor (@{$docprocessors}) {
				my $patterns = collect_match_patterns($docprocessor);
				foreach my $pattern (@{$patterns}) {
					log_verbose(3, "using document match pattern: %s\n", $pattern);
				}
				if (match_patterns_fully($docname, $patterns)) {
					$usedocprocessor = $docprocessor;
					log_verbose(3, "identified document processor for: %s/./%s\n", $pardir, $docname);
					last;
				}
			}
			
			if (defined($usedocprocessor)) {
 				my %documentitem = (
 					"parent_dir" => $pardir,

 					%{$usedocprocessor}
 				);
 				foreach $key ("path", "paths", "path_pattern", "path_patterns", "extension", "extensions") {
 					if (exists($documentitem{$key})) {
 						delete($documentitem{$key});
 					}
 				}
 				$documentitem{"path"} = $docname;
 				
 				my $scanresults = scan_items(\%documentitem, $bundleid);
 				push(@scanned, $scanresults);
			}
		}
	}
}

# create unique destination tarball file
my $desttarball = mk_unique_file("VideoAppDiagnostics-" . $nameforinfo, "tar", resolve_tilde("~/Desktop"));
log_verbose(1, "tarball: %s", $desttarball);

# append all the files to the tarball
my %visitedpaths = ();
foreach my $scanresults (@scanned) {
	my $destname = $scanresults->{"dest_name"};
	my $expanded = $scanresults->{"expanded"};
	foreach my $pardir (sort(keys(%{$expanded}))) {
		log_verbose(3, "processing parent: %s", $pardir);
		my @files = sort(keys(%{$expanded->{$pardir}}));
		append_paths_to_tarball($desttarball, $pardir, \@files, $destname);
	}
}

# add a system profile .spx report
if ($systemprofile) {
	my $spxpath = mk_unique_file("system_profile", "spx", "/tmp");
	my @spxcmd = ("/usr/sbin/system_profiler", "-xml");
	push(@spxcmd, "-detailLevel", ($systemprofilelevel > 1) ? "full" : "basic");
	
	log_verbose(2, "gathering system profile");
	if (system_verbose(join(" ", @spxcmd) . " > \"$spxpath\"") == 0) {
		my $spxrelpath = $spxpath;
		$spxrelpath =~ s/^\/tmp\///;
		append_paths_to_tarball($desttarball, "/tmp", [$spxrelpath], "SystemProfile");
		log_verbose(3, "gathered system profile");
	}
	else {
		log_verbose(1, "cannot gather system profile: %s", $?);
	}
}

# add a filtered log (if supported)
if ($bundleexec eq "iMovie") {
	log_verbose(1, "not gathering system logs for sandboxed app %s", $bundleexec);
	$systemlog = 0;
}
if ($systemlog) {
	my $logpath = mk_unique_file("system_log", "log", "/tmp");
	my @logcmd = ("/usr/bin/log", "show", "--predicate", "\'process contains \"" . $bundleexec . "\"\'");
 
	log_verbose(2, "gathering system logs for %s", $bundleexec);
	if (system_verbose(join(" ", @logcmd) . " > \"$logpath\"") == 0) {
		my $logrelpath = $logpath;
		$logrelpath =~ s/^\/tmp\///;
		append_paths_to_tarball($desttarball, "/tmp", [$logrelpath], "SystemLog");
		log_verbose(3, "gathered system logs");
	}
	else {
		log_verbose(1, "cannot gather system logs: %s", $?);
	}
}

# compress the results
my $compressedtarball;
$compressedtarball = compress_tarball("/usr/bin/gzip", $desttarball, ".gz");
if (! defined($compressedtarball)) {
	$compressedtarball = compress_tarball("/usr/bin/bzip2", $desttarball, ".bz2");
	if (! defined($compressedtarball)) {
		$compressedtarball = compress_tarball("/usr/bin/compress", $desttarball, ".Z");
	}
}
if (defined($compressedtarball)) {
	$desttarball = $compressedtarball;
}

if ($shouldreveal) {
	# reveal in finder
	system_verbose("/usr/bin/osascript", "-e", "tell application \"Finder\"", "-e", "reveal (\"" . $desttarball . "\" as POSIX file)", "-e", "activate", "-e", "end tell");
}


sub compress_tarball {
	my $compressor = $_[0];
	my $tarball = $_[1];
	my $newextension = $_[2];
	
	if ((-e $compressor) && (-x $compressor) && (! -e $tarball . $newextension)) {
		if (system_verbose($compressor, $tarball) == 0) {
			if (-e $tarball . $newextension) {
				return $tarball . $newextension;
			}
			log_verbose(1, "compressor (%s) called successfully, but did not write anticipated file (%s)", $compressor, $tarball . $newextension);
		}
	}
	
	return undef;
}

# returns a hash of hashes (sets, really), $parentdirs => $matchedfiles
sub expand_paths {
	my $infoelem = $_[0];
	my $bundlid = $_[1];
	
		# first find all the parent dirs
	my @scanpardirs = ();
	if (exists($infoelem->{"parent_dir"})) {
		push(@scanpardirs, $infoelem->{"parent_dir"});
	}
	if (exists($infoelem->{"parent_dirs"})) {
		push(@scanpardirs, @{$infoelem->{"parent_dirs"}});
	}
	my %pardirs = ();	# a set so that we do not multiply add identically-resolving paths
	foreach my $pardir (@scanpardirs) {
		if ($pardir =~ /^~/) {
			my ($ignorepath, $homedir, $rest) = resolve_tilde($pardir);
			if (defined($homedir) && defined($rest)) {
				my $resolveddir = abs_path($homedir . "/" . $rest);
				if (defined($resolveddir) && (-e $resolveddir) && (! -l $resolveddir)) {
					$pardirs{$resolveddir} = {};
					log_verbose(2, "adding parent: %s", $resolveddir);
				}
				$resolveddir = abs_path($homedir . "/Library/Containers/$bundleid/Data/" . $rest);
				if (defined($resolveddir) && (-e $resolveddir) && (! -l $resolveddir)) {
					$pardirs{$resolveddir} = {};
					log_verbose(2, "adding parent: %s", $resolveddir);
				}
			}
		}
		else {
			$pardir = abs_path($pardir);
			if (defined($pardir) && (-e $pardir) && (! -l $pardir)) {
				$pardirs{$pardir} = {};
				log_verbose(2, "adding parent: %s", $pardir);
			}
		}
	}
	
		# for each parent dir, find children that match the names or patterns specified
	my @matchpatterns = collect_match_patterns($infoelem);
	foreach my $matchpattern (@matchpatterns) {
		log_verbose(3, "using top-level match pattern: %s", $matchpattern);
	}
	if (scalar(@matchpatterns) > 0) {
		foreach my $pardir (keys(%pardirs)) {
			if (opendir(my $dfd, $pardir)) {
				my @files = readdir($dfd);
				closedir($dfd);
				foreach my $file (@files) {
					if (($file eq ".") || ($file eq "..")) {
						next;
					}
					if (-l $pardir . "/" . $file) {
						next;
					}
					if (match_patterns_fully($file, \@matchpatterns)) {
						$pardirs{$pardir}->{$file} = {};
						log_verbose(2, "adding top-level: %s/./%s", $pardir, $file);
					}
					else {
						log_verbose(4, "skipping: %s/./%s", $pardir, $file);
					}
				}
			}
			else {
				log_verbose(2, "could not open directory: %s (%s)", $pardir, $!);
			}
		}
	}
	
		# for each such child match, if it is a directory, recurse, filtering out/in exclude/only patterns
	my $includes = undef;
	if (exists($infoelem->{"includes"})) {
		$includes = $infoelem->{"includes"};
		foreach my $include (@{$includes}) {
			log_verbose(3, "using top-level include pattern: %s", $include);
		}
	}
	my $excludes = undef;
	if (exists($infoelem->{"excludes"})) {
		$excludes = $infoelem->{"excludes"};
		foreach my $exclude (@{$excludes}) {
			log_verbose(3, "using top-level exclude pattern: %s", $exclude);
		}
	}
	foreach my $pardir (keys(%pardirs)) {
		my $toplevelmatches = $pardirs{$pardir};
		$pardirs{$pardir} = {};
		foreach my $toplevelmatch (keys(%{$toplevelmatches})) {
			my $toplevelpath = $pardir . "/" . $toplevelmatch;
			if (-d $toplevelpath) {
				use File::Find;
				find({wanted => sub {
						if ((-f $File::Find::name) && (! -l $File::Find::name)) {
							my $filesubpath = substr($File::Find::name, length($toplevelpath) + 1);
							my $match = 1;
							if (defined($includes)) {
								$match = match_patterns_unanchored($File::Find::name, $includes);
							}
							elsif (defined($excludes)) {
								$match = ! match_patterns_unanchored($File::Find::name, $excludes);
							}
							if ($match) {
								$pardirs{$pardir}->{$toplevelmatch . "/" . $filesubpath} = 1;
								log_verbose(3, "adding file: %s/./%s/./%s", $pardir, $toplevelmatch, $filesubpath);
							}
						}
					}, no_chdir => 1, dangling_symlinks => 0, follow => 0}, $toplevelpath);
			}
			else {
				$pardirs{$pardir}->{$toplevelmatch} = 1;
				log_verbose(3, "adding file: %s/./%s", $pardir, $toplevelmatch);
			}
		}
	}
	return \%pardirs;
}

sub collect_match_patterns {
	my $infoelem = $_[0];
	
	my @matchpatterns = ();
	
	if (exists($infoelem->{"path_pattern"})) {
		push(@matchpatterns, $infoelem->{"path_pattern"});
	}
	if (exists($infoelem->{"path_patterns"})) {
		push(@matchpatterns, @{$infoelem->{"path_patterns"}});
	}
	
	my @paths = ();
	if (exists($infoelem->{"path"})) {
		push(@paths, $infoelem->{"path"});
	}
	if (exists($infoelem->{"paths"})) {
		push(@paths, @{$infoelem->{"paths"}});
	}
	foreach my $path (@paths) {
		push(@matchpatterns, quotemeta($path));
	}
	
	my @extensions = ();
	if (exists($infoelem->{"extension"})) {
		push(@extensions, $infoelem->{"extension"});
	}
	if (exists($infoelem->{"extensions"})) {
		push(@extensions, @{$infoelem->{"extensions"}});
	}
	foreach my $extension (@extensions) {
		push(@matchpatterns, "[^\/]+\." . quotemeta($extension));
	}
	
	return wantarray() ? @matchpatterns : \@matchpatterns;
}

sub match_patterns {
	my ($string, $patterns, $anchorfront, $anchorend) = @_;
	my @matchedpatterns = ();
	foreach my $pattern (@{$patterns}) {
		my $moddedpattern = $pattern;
		if ($anchorfront) {
			$moddedpattern = "^" . $moddedpattern;
		}
		if ($anchorend) {
			$moddedpattern = $moddedpattern . "\$";
		}
		if ($string =~ /$moddedpattern/) {
			if (wantarray()) {
				push(@matchedpatterns, $pattern);
			}
			else {
				return 1;
			}
		}
	}
	return wantarray() ? @matchedpatterns : 0;
}

sub match_patterns_fully {
	my ($string, $patterns) = @_;
	return match_patterns($string, $patterns, 1, 1);
}

sub match_patterns_unanchored {
	my ($string, $patterns) = @_;
	return match_patterns($string, $patterns, 0, 0);
}

# returns a hash { dest_name, expanded => <results-of-expand_paths> }
sub scan_items {
	my $infoelem = $_[0];
	my $bundlid = $_[1];
	
	return {
		"dest_name" => $infoelem->{"dest_name"},
		"expanded" => expand_paths($infoelem, $bundleid)
	};
}

sub append_paths_to_tarball {
	my $tarballpath = $_[0];
	my $parentdir = $_[1];
	my $paths = $_[2];
	my $prefixdir = $_[3];
	
	my @cmd = ("/usr/bin/tar", "-r", "-f", $tarballpath);
	for (my $i=0; $i<$verbose; ++$i) {
		push(@cmd, "-v");
	}
	if (defined($prefixdir)) {
		push(@cmd, "-s", ",.*," . $prefixdir . "/~,");
	}
	push(@cmd, "-C", $parentdir);
	foreach my $path (@{$paths}) {
		my @localcmd = @cmd;
		push(@localcmd, $path);
		system_verbose(@localcmd);	# append each one individually to avoid exceeding argument length
	}
}


sub resolve_tilde {
	my $path = $_[0];
	
	if ($path =~ /^~/) {
		if (($path =~ /^~([^\/]*)()$/) || ($path =~ /^~([^\/]*)(\/.+)$/)) {
			my $uname = $1;
			my $rest = $2;
			
			my $homedir;
			if (defined($uname) && ($uname ne "")) {
				$homedir = (getpwnam($uname))[7];
			}
			else {
				$homedir = (getpwuid($<))[7];
			}
			if ((! defined($homedir)) || ($homedir eq "")) {
				die("could not determine the home directory of tilde path: $path ($!)\n");
			}
			return wantarray() ? ($homedir . $rest, $homedir, $rest) : $homedir . $rest;
		}
		else {
			die("unrecognized tilde path: $path\n");
		}
	}
	
	return wantarray() ? ($path, undef, $path) : $path;
}

sub mk_unique_filedir {
	use Fcntl;
	
	my $isfile = $_[0];
	my $extension = $_[1];
	if (defined($extension) && ($extension ne "")) {
		if ($extension !~ /^\./) {
			$extension = "." . $extension;
		}
	}
	else {
		$extension = "";
	}
	my $prefix = $_[2];
	my $parentdir = "/tmp";
	if (scalar(@_) > 3) {
		$parentdir = $_[3];
	}
	
	my $uniqname = undef;
	
	my @datetimeparts = localtime();
	my $datetimestr = sprintf("%4u-%02u-%02u-%02u%02u%02u", $datetimeparts[5] + 1900, $datetimeparts[4] + 1, @datetimeparts[3,2,1,0]);
	my $origname = $parentdir . "/" . $prefix . "-" . $datetimestr;
	my $name = $origname . $extension;
	if (! -e $name) {
		if ($isfile) {
			if (sysopen(my $fd, $name, O_WRONLY | O_EXCL | O_CREAT)) {
				$uniqname = $name;
				close($fd);
			}
		}
		else {
			if (mkdir($name)) {
				$uniqname = $name;
			}
		}
	}
	
	if (! defined($uniqname)) {
		for (my $i=0; $i<20; ++$i) {
			$name = $origname . "-" . $i . $extension;
			if (! -e $name) {
				if ($isfile) {
					if (sysopen(my $fd, $name, O_WRONLY | O_EXCL | O_CREAT)) {
						$uniqname = $name;
						close($fd);
					}
				}
				else {
					if (mkdir($name)) {
						$uniqname = $name;
					}
				}
			}
			if (defined($uniqname)) {
				last;
			}
		}
	}
	
	if (! defined($uniqname)) {
		die("could not create a unique filesystem name\n");
	}
	
	return $uniqname;
}

sub mk_unique_file {
	return mk_unique_filedir(1, $_[1], $_[0], $_[2]);
}

sub mk_unique_dir {
	return mk_unique_filedir(0, undef, @_);
}

sub log_verbose {
	my $minverbosity = shift(@_);
	my $fmt = shift(@_);
	if ($verbose >= $minverbosity) {
		if ($fmt !~ /\n$/) {
			$fmt .= "\n";
		}
		if ($fmt !~ /^#/) {
			$fmt = "# " . $fmt;
		}
		printf(STDERR $fmt, @_);
	}
}

sub system_verbose {
	my @cmdargs = @_;
	
	if ($verbose > 1) {
		printf(STDERR "calling: system(");
		my($sawfirst) = 0;
		foreach my $arg (@cmdargs) {
			if ($sawfirst) {
				printf(STDERR " ");
			}
			printf(STDERR "\"%s\"", $arg);
			$sawfirst += 1;
		}
		printf(STDERR ")\n");
	}
	
	my($cmdresult) = system(@cmdargs);
	
	if ($verbose > 1) {
		printf(STDERR "called: system returned %d\n", $cmdresult);
	}
	
	return $cmdresult;
}

