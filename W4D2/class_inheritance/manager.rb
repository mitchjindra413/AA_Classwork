require_relative "employee"

class Manager < Employee #Ned
    attr_reader :managed
    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        @managed = [] #Darren
    end

    def add_employee(employee)
        @managed << employee
        @managed
    end

    def bonus(multiplier)
        salary_of_sub_employees * multiplier
    end

    def salary_of_sub_employees
        total = 0
        @managed.each do |employee|
            if employee.is_a?(Manager)
                total += employee.salary_of_sub_employees
                total += employee.salary
            else
                total += employee.salary
            end 
        end
        total
    end
end

