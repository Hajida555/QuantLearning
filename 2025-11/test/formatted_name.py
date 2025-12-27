def get_formatted_name(frirst_name, middle_name, last_name):
    if middle_name:
        full_name = f"{frirst_name} {middle_name} {last_name}"
    else:
        full_name = f"{frirst_name} {last_name}"
    return full_name.title()
    
musician = get_formatted_name('Q', 'Q', 'Q')
print(musician)