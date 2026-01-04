users = {
    'aeinstein': {
        'first': 'albert',
        'last': 'einstein',
        'location': 'princetion',
        },

    'mcurie': {
        'first': 'marice',
        'last': 'curie',
        'location': 'paris'
        },
    }

for username, user_info in users.items():
    print(f"\nUsernamr: {username}")
    full_name = f"{user_info['first']} {user_info['last']}"
    location = user_info['location']
    
    print(f"\tFull name: {full_name.title()}")
    print(f"\tlocation: {location.title()}")