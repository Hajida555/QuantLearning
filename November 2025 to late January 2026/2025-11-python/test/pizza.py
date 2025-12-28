# pizza = {
#     'crust': 'thick',
#     'toppings': ['mushrooms', 'extra cheese']
#     }

# print(f"You ordered a {pizza['crust']}-crust pizza "
#       "with the following toppings:")

# for topping in pizza['toppings']:
#     print(f"\t{topping}")

def make_pizza(size, *toppings):
    print(f'\nmaking a {size}-inch pizza with the following toppings:')
    for topping in toppings:
        print(f"- {topping}")

