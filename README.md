# Employee Management System

## Overview

Employee Management System is a Ruby on Rails application developed to manage Employees, Managers, and Departments within an organization.

The application provides CRUD operations, employee assignment, search functionality, and multiple filtering options to efficiently manage employee information.

---

## Features

### Employee Management

- Create Employee
- View Employee Details
- Update Employee
- Delete Employee

Employee information includes:

- Employee Code
- Name
- Email
- Designation
- Salary
- Status
- Joining Date
- Manager
- Department

---

### Manager Management

- Create Manager
- View Manager
- Update Manager
- Delete Manager

Additional Features:

- View Team Members under a Manager
- Employee Count per Manager

---

### Department Management

- Create Department
- View Department
- Update Department
- Delete Department

Additional Features:

- View Employees within a Department
- Department Employee Count

---

## Employee Status

Supported employee statuses:

- Active
- Inactive
- Resigned

---

## Search Functionality

Employees can be searched using:

- Employee Code
- Employee Name
- Email
- Designation
- Manager Name
- Department Name
- Status

---

## Filter Functionality

### Status Filter

Filter employees by:

- Active
- Inactive
- Resigned

### Department Filter

Filter employees based on Department.

### Manager Filter

Filter employees based on Manager.

### Joining Date Range Filter

Filter employees between selected joining date ranges.

---

## Associations

### Manager

```ruby
has_many :employees
```

### Department

```ruby
has_many :employees
```

### Employee

```ruby
belongs_to :manager
belongs_to :department, optional: true
```

---

## Database Schema

### Managers

| Column | Type |
|----------|----------|
| id | Integer |
| name | String |
| email | String |
| created_at | DateTime |
| updated_at | DateTime |

### Departments

| Column | Type |
|----------|----------|
| id | Integer |
| name | String |
| description | Text |
| created_at | DateTime |
| updated_at | DateTime |

### Employees

| Column | Type |
|----------|----------|
| id | Integer |
| employee_code | String |
| status | String |
| name | String |
| email | String |
| joining_date | Date |
| designation | String |
| salary | Decimal |
| manager_id | Integer |
| department_id | Integer |
| created_at | DateTime |
| updated_at | DateTime |

---

## Rails Concepts Used

- MVC Architecture
- Routes
- Controllers
- Models
- Views
- Partials
- Validations
- Associations
- Scopes
- Strong Parameters
- Flash Messages
- before_action Callbacks
- Search and Filtering
- ActiveRecord Queries
- Eager Loading using includes
- Database Migrations
- Seed Data
- Foreign Keys

---

## Validations Implemented

### Employee

```ruby
validates :employee_code, presence: true, uniqueness: true
validates :status,
          presence: true,
          inclusion: {
            in: ["Active", "Inactive", "Resign"]
          }

validates :name, presence: true
validates :email, presence: true, uniqueness: true
validates :joining_date, presence: true
validates :designation, presence: true

validates :salary,
          presence: true,
          numericality: {
            greater_than: 0
          }
```

### Manager

```ruby
validates :name, presence: true
validates :email, presence: true, uniqueness: true
```

### Department

```ruby
validates :name, presence: true, uniqueness: true
```

---

## Scopes Implemented

```ruby
search
active
inactive
resigned
by_department
by_manager
joining_date_between
```

---

## Model Methods

### Employee

```ruby
annual_salary
```

Calculates annual salary using monthly salary.

Example:

```text
Monthly Salary: 50,000

Annual Salary: 600,000
```

### Manager

```ruby
employee_count
```

Returns the total number of employees reporting to a manager.

### Department

```ruby
employee_count
```

Returns the total number of employees within a department.

---

## Performance Optimization

Implemented eager loading to prevent N+1 queries.

```ruby
includes(:manager, :department)
```

---

## Project Structure

```text
app/
├── controllers
│   ├── employees_controller.rb
│   ├── managers_controller.rb
│   └── departments_controller.rb
│
├── models
│   ├── employee.rb
│   ├── manager.rb
│   └── department.rb
│
├── views
│   ├── employees
│   ├── managers
│   └── departments
│
db/
├── migrate
├── schema.rb
└── seeds.rb
│
config/
└── routes.rb
```

---

## Seed Data

Sample seed data has been included for:

- Managers
- Departments
- Employees

This helps in testing the application quickly.

Sample Data:

```text
Managers:
- Prem
- Anish

Departments:
- IT
- Cloud

Employees:
- Harsha
- Rahul
- Sharath
- Kiran
```

---

## Installation

Clone the repository:

```bash
git clone https://github.com/harsha-r-dev/employee-management-system-ruby.git
```

Navigate to the project:

```bash
cd employee_management_system
```

Install dependencies:

```bash
bundle install
```

Create database:

```bash
ruby bin/rails db:create
```

Run migrations:

```bash
ruby bin/rails db:migrate
```

Load sample data:

```bash
ruby bin/rails db:seed
```

Start the Rails server:

```bash
ruby bin/rails server
```

Open in browser:

```text
http://localhost:3000
```

---

## Functional Highlights

✅ Employee CRUD Operations

✅ Manager CRUD Operations

✅ Department CRUD Operations

✅ Employee-to-Manager Assignment

✅ Employee-to-Department Assignment

✅ Employee Search

✅ Status-Based Filtering

✅ Department-Based Filtering

✅ Manager-Based Filtering

✅ Joining Date Range Filtering

✅ Team Member Listing Under Manager

✅ Department Employee Count

✅ Manager Employee Count

✅ Annual Salary Calculation

✅ Validation Rules

✅ N+1 Query Optimization

✅ Migration-Based Database Design

✅ Seed Data for Testing

---

## Future Enhancements

- User Authentication using Devise
- Role-Based Authorization
- Dashboard Analytics
- Bootstrap/Tailwind CSS Integration
- Pagination
- REST API Development
- RSpec Test Cases
- Export Data to Excel/PDF
- Employee Profile Photos
- Audit Logging
- Email Notifications

---

## Learning Outcomes

This project helped in understanding:

- Ruby on Rails MVC Architecture
- CRUD Operations
- Active Record Associations
- Database Design
- Validations
- Scopes
- Strong Parameters
- Routing
- Partials
- Search Implementation
- Filter Implementation
- Model Methods
- Active Record Queries
- N+1 Query Optimization
- Migrations and Schema Management
- Seed Data Creation
- Rails Best Practices

---

## Author

**Harsha R**

Ruby on Rails Training Project – Employee Management System
