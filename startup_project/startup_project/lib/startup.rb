require "employee"

class Startup
    # part 2
    attr_accessor :name, :funding, :salaries, :employees

    def initialize(name,funding,salary)
        @name=name
        @funding=funding
        @salaries=salary
        @employees=[]

    end

    def valid_title?(title_str)
        return @salaries.key?(title_str)
    end

     def >(otherStartup)
        return self.funding>otherStartup.funding
     end

    
    
    def hire(emp_Name,emp_title)

        raise "title does not exist" if !valid_title?(emp_title)
            @employees.push(Employee.new(emp_Name,emp_title))
       
    end

    def size
        return @employees.length
    end

    def pay_employee(employee)

        pay_Check=@salaries[employee.title]

        raise "not enough funding" if pay_Check> @funding
            @funding-=pay_Check
            employee.pay(pay_Check)
       
    end
    
    def payday
        @employees.each{|empID| pay_employee(empID)}
    end


    # part 3
    def average_salary
        return @employees.sum{|emp| @salaries[emp.title]}/@employees.length
    end

    def close
        @employees=[]
        @funding=0
    end

    def acquire(startUpName)



        @funding+=startUpName.funding
        startUpName.salaries.each do |k,v|
            if !@salaries.key?(k)
                @salaries[k]=v
            end
        end

        @employees=@employees+startUpName.employees
        startUpName.close
    end

end
