def show_message(list_LJ):
    for _ in list_LJ:
        print(_)

def send_messages(message,L):
    while message:
        A = message.pop
        print(A)
        L.append(A)

