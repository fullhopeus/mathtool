import math

def prime(number):
    for x in range(2, number):
        if number % x == 0:
            return False
    return True

def ifprime(number): #直接调用
    x = prime(number)
    if x == False:
        return "Odd number"
    else:
        return "Prime number"

def factor(number): #直接调用
    z = 0
    for x in range(number, 0, -1):
        if number % x == 0:
            x = int(number/x)
            print(f"--> {x}")
            z = z + 1
    return(f"Total: {z}")

def primefactors(n):
    factors = []
    divisor = 2
    
    while n > 1:
        while n % divisor == 0:
            factors.append(divisor)
            n //= divisor
        divisor += 1
    
    return factors

def primefactor(n): #直接调用
    factors = primefactors(n)
    formatted_factors = []
    for factor in factors:
        count = factors.count(factor)
        formatted_factors.append(str(factor) + "\n")
        factors = [x for x in factors if x != factor]
    a = '--> '.join(formatted_factors)
    a = a.rstrip()
    if a == "":
        a = "0 (None)"
    return a

def gcd(a, b):
    while b:
        a, b = b, a % b
    return a

def trsss():
    a = float(input("Enter the length of side a: "))
    b = float(input("Enter the length of side b: "))
    c = float(input("Enter the length of side c: "))
    # Check if the sides form a valid triangle
    if a + b > c and a + c > b and b + c > a:
        # Calculate angles using law of cosines
        alpha = math.degrees(math.acos((b**2 + c**2 - a**2) / (2 * b * c)))
        beta = math.degrees(math.acos((a**2 + c**2 - b**2) / (2 * a * c)))
        gamma = 180 - alpha - beta
        
        # Print angles
        print("--> Angles (in degrees):")
        print(f"--> A: {alpha:.2f}")
        print(f"--> B: {beta:.2f}")
        print(f"--> C: {gamma:.2f}")
        
        # Calculate area using Heron's formula
        s = (a + b + c) / 2
        area = math.sqrt(s * (s - a) * (s - b) * (s - c))
        print(f"--> Area: {area:.2f}")
        
        # Print additional information
        print(f"--> Perimeter: {a + b + c:.2f}")
    else:
        print("--> Invalid sides. They do not form a valid triangle.")


def simplify(numerator, denominator): #直接调用
    common_factor = gcd(numerator, denominator)
    simplified_numerator = numerator // common_factor
    simplified_denominator = denominator // common_factor
    print(f"--> Simplified fraction: {simplified_numerator}/{simplified_denominator}")
    print(f"--> Prime factors of the numerator: {primefactor(simplified_numerator)}")
    print(f"--> Prime factors of the denominator: {primefactor(simplified_denominator)}")

def help():
    print("Math tool v1.1 by leoltsh. It is a freeware.")
    print("Use ifprime(number) to judge if a number is prime number.")
    print("Use factor(number) to look all factors of a number.")
    print("Use primefactor(number) to look all prime factors of a number.")
    print("Use simplify(numerator, denominator) to see the simplified fraction.")
    print("Use trsss() to solve triangles with SSS known.")
    print("Have a good day!")

help()

while True:
    user_input = input("Enter a function call (e.g., factor(383)), or 'exit' to quit: ")
    if user_input == "exit":
        print("Exiting the program. Have a great day!")
        break
    else:
        try:
            result = eval(user_input)
            result = str(result)
            if result is not None:
                print("--> " + result)
        except Exception as e:
            print("An error occurred:", e)
