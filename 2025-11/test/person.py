def build_person(frist_name, last_name, age=None):
    person = {'frist': frist_name, 'last': last_name}
    if age:
        person['age'] = age
    return person

musician = build_person('Q', 'W')
print(musician)