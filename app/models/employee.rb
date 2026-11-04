class Employee < ApplicationRecord
  belongs_to :manager
  belongs_to :department, optional: true

  validates :employee_code, presence: true, uniqueness: true
  validates :status, presence: true, inclusion: {in: ["Active", "Resign", "Inactive"] }
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :joining_date, presence: true
  validates :designation, presence: true
  validates :salary, presence: true, numericality: { greater_than: 0 }

  scope :search, ->(keyword) {
    joins(:manager)
      .left_joins(:department)
      .where(
        "employees.employee_code LIKE :q OR
        employees.name LIKE :q OR
        employees.email LIKE :q OR
        employees.designation LIKE :q OR
        employees.status LIKE :q OR
        managers.name LIKE :q OR
        departments.name LIKE :q",
        q: "%#{keyword}%"
      )
  }

  scope :active, -> { where(status: "Active") }
  scope :inactive, -> { where(status: "Inactive") }
  scope :resigned, -> { where(status: "Resign") }

  scope :by_department, ->(department_id) {
    where(department_id: department_id)
  }

  scope :by_manager, ->(manager_id) {
    where(manager_id: manager_id)
  }

  scope :joining_date_between, ->(start_date, end_date) {
    where(joining_date: start_date..end_date)
  }

  def annual_salary
    salary * 12
  end
end