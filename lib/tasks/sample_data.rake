namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_branches
    make_manager
    make_employee
  end
end

def make_branches
  Branch.create!(location:  "sector 12",
                       city:    "noida",
                       state: "Uttar Pradesh",
                          )
  Branch.create!(location:  "sector 19",
                       city:    "noida",
                       state: "Uttar Pradesh",
                          )
end

def make_manager
  Employee.create!(branch_id: 1,
                 fullName:  "Amitabh Bachchan",
                 address: "Prateeksha, Mumbai",
                 phone: "66776474",
                 employeeRole: "manager",
                 loginID: "amitabh123",
                 password: "bachchan"
                          )
  end
  
def make_employee
  Employee.create!(branch_id: 1,
                 fullName:  "Gabbar Singh",
                 address: "Outskirts of Ramgarh",
                 phone: "66776474",
                 employeeRole: "non-manager",
                 loginID: "gabbar123",
                 password: "singh123"
                          )
  end