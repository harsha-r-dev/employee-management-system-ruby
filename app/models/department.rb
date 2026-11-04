class Department < ApplicationRecord
  has_many :employees, dependent: :nullify

  validates :name, presence: true, uniqueness: true

  def employee_count
    employees.count
  end
end