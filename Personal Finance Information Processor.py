#！/usr/bin/env python3
# -*- coding: utf-8 -*-

'My Personal Finance Information Processor'

__author__ = 'Hajida555'
__date__   = '2025-11-18'

class PersonalFinanceProcessor:
    def __init__(self):
        self.name = ""
        self.age  = 0
        self.monthly_income = 0.0
        self.monthly_fixed  = 0.0
        self.monthly_save   = 0.0

    def get_valid_number(self, prompt, min_val=0):
        while True:
            user_input = input(prompt).strip()
            try:
                num = float(user_input)
                if num >= min_val:
                    return num
                else:
                    print(F"Input >= {min_val}! Try again")
            except ValueError:
                print("Enter vaild number!")

    def get_name(self):
        while True:
            name = input("Your name:").strip()
            if name:
                self.name = name
                break
            else:
                print("Can't be empty!")

    def get_age(self):
        while True:
            age_input = input("Your age:").strip()
            if age_input.isdigit():
                age = int(age_input)
                if 1 <= age <= 120:
                    self.age = age
                    break
                else:
                    print("Age:1-120")
            else:
                print("Enter vaild integer!")

    def get_monthly_income(self):
        self.monthly_income = self.get_valid_number(
            prompt = "Last month's income:",
            min_val = 0
        )

    def get_fixed_exp(self):
        while True:
            self.monthly_fixed = self.get_valid_number(
                prompt = "fixed exp (rent/living costs):",
                min_val = 0
            )
            if self.monthly_fixed <= self.monthly_income:
                break
            else:
                print(f'Fixed exp <= income({self.monthly_income:.2f}!)')
    
    def get_monthly_save(self):
        remaining = self.monthly_income - self.monthly_fixed
        while True:
            self.monthly_save = self.get_valid_number(
                prompt = "Investment/savings:",
                min_val = 0
            )
            if self.monthly_save <= remaining:
                break
            else:
                print(f"Saving <=remaining({remaining:.2f})!")

    def calcuate(self):
        self.monthly_surplus = self.monthly_income - self.monthly_fixed - self.monthly_save
        self.daily_spend = self.monthly_surplus / 30 if self.monthly_surplus > 0 else 0
        self.annual_income = self.monthly_income * 12
        self.annual_save = self.monthly_save * 12
        self.next_age = self.age + 1

    def display(self):
        print("Processend Info:")
        print(f"Hello, {self.name}!")
        print(f"You'll be {self.next_age} next year!")
        print(f"Dailly spend limit: ${self.daily_spend:.2f}")
        print(f"Est. annual income: ${self.annual_income:.2f}")
        print(f"Est. annual saving: ${self.annual_save:.2f}")

        if self.monthly_surplus < 0:
            print("Tip: Spend less than you earn!")
        elif self.monthly_save < self.monthly_income * 0.2:
            print("Tip: Save more (aim for 20% of income)!")
        else:
            print("Tip: Great financial habit")

    def run(self):
        print("Finance Processor")
        self.get_name()
        self.get_age()
        self.get_monthly_income()
        self.get_fixed_exp()
        self.get_monthly_save()
        self.calcuate()
        self.display()
    
if __name__ == "__main__":
    tool = PersonalFinanceProcessor()
    tool.run()