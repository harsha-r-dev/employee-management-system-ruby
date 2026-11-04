# Managers

manager1 = Manager.create!(
  name: "Prem",
  email: "prem@test.com"
)

manager2 = Manager.create!(
  name: "Anish",
  email: "anish@test.com"
)

# Departments

it_department = Department.create!(
  name: "IT",
  description: "Software Development Team"
)

cloud_department = Department.create!(
  name: "Cloud",
  description: "AWS and Infrastructure Team"
)

# Employees

Employee.create!(
  employee_code: "EMP001",
  status: "Active",
  name: "Harsha",
  email: "harsha@test.com",
  joining_date: Date.new(2024, 1, 10),
  designation: "Developer",
  salary: 60000,
  manager: manager1,
  department: it_department
)

Employee.create!(
  employee_code: "EMP002",
  status: "Active",
  name: "Rahul",
  email: "rahul@test.com",
  joining_date: Date.new(2024, 3, 15),
  designation: "Tester",
  salary: 50000,
  manager: manager1,
  department: it_department
)

Employee.create!(
  employee_code: "EMP003",
  status: "Inactive",
  name: "Sharath",
  email: "sharath@test.com",
  joining_date: Date.new(2023, 11, 1),
  designation: "DevOps",
  salary: 50000,
  manager: manager2,
  department: cloud_department
)

Employee.create!(
  employee_code: "EMP004",
  status: "Resign",
  name: "Kiran",
  email: "kiran@test.com",
  joining_date: Date.new(2022, 8, 20),
  designation: "AWS Cloud",
  salary: 50000,
  manager: manager2,
  department: cloud_department
)