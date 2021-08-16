require 'rails_helper'

RSpec.describe EmployeeTable, type: :model do
  context 'validation tests' do 
    it 'ensures name presence' do 
      employee = EmployeeTable.new(department: "department", email: "email@example.com", salary: 25).save
      expect(employee).to eq(false)  
    end
    
    
    it 'ensures department presence' do 
      employee = EmployeeTable.new(name: "name", email: "email@example.com", salary: 25).save
      expect(employee).to eq(false)  
    end

    it 'ensures email presence' do 
      employee = EmployeeTable.new(name: "name", department: "department", salary: 25).save
      expect(employee).to eq(false)  
    end
    
    it 'ensures salary presence' do 
      employee = EmployeeTable.new(name: "name", department: "department", email: "email@example.com").save
      expect(employee).to eq(false)  
    end
    it 'ensures email format' do
      employee = EmployeeTable.new(name: "name", department: "department", email: "email,ahauha.com", salary: 25).save
      expect(employee).to eq(false) 
    end

    it 'should save successfully' do
      employee = EmployeeTable.new(name: "name", department: "department", email: "email@example.com", salary: 25).save
      expect(employee).to eq(true)
    end
  end

end
