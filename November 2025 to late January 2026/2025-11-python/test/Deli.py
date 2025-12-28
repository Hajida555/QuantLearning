sandwich_orders = ['aoerliang', 'JINGQIANGYU', 'jirou']
finished_sandwichs = []
while sandwich_orders:
    finished_sandwich = sandwich_orders.pop()
    print(f"I made your {finished_sandwich}.")
    finished_sandwichs.append(finished_sandwich)
    
print(finished_sandwichs)

