first_number = input("Please enter first number:")
second_number = input("Please enter second number:")

while True:
    try:
       print(int(first_number) / int(second_number) )
    except ValueError:
        print("Bitch!enter number!")
