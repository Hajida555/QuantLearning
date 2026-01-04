def greet_users(names):
    for name in names:
        msg = f"Hello, {name.title()}!"
        print(msg)

username = ['hannah', 'try', 'margot']
greet_users(username)