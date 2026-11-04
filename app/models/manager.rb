class Manager < ApplicationRecord
  has_many :employees, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def employee_count
    employees.count
  end
end