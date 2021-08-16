class CreateEmployeeTables < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_tables do |t|
      t.string :name
      t.string :department
      t.string :email
      t.integer :salary

      t.timestamps
    end
  end
end
