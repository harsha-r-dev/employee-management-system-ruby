class CreateEmployees < ActiveRecord::Migration[8.1]
  def change
    create_table :employees do |t|
      t.string :employee_code
      t.string :status
      t.string :name
      t.string :email
      t.date :joining_date
      t.string :designation
      t.decimal :salary, precision: 10, scale: 2

      t.references :manager, null: false, foreign_key: true
      t.references :department, null: true, foreign_key: true

      t.timestamps
    end
  end
end
