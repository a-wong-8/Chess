class Employee

    attr_reader :salary

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @bonus = (salary) * multiplier
    end

end

class Manager < Employee

    def initialize(employees, boss = nil)
        @employees = employees
    end

    def bonus(multiplier)
        total_employee_salary = 0
        @employees.each do |employee|
            total_employee_salary += employee.salary 
        end
        @bonus = (total_employee_salary) * multiplier
    end

end

ned = Employee.new('Ned', 'Founder', 1_000_000, nil)

p ned.bonus(5) # => 500_000
# darren.bonus(4) # => 88_000
# david.bonus(3) # => 30_000