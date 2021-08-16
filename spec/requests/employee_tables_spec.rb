require 'rails_helper'

RSpec.describe "EmployeeTables", type: :request do

  let(:valid_attributes) do
    {
      'id' => '1',  
      'name' => 'name',
      'department' => 'department',
      'email' => 'email@example.com',
      'salary' => '25'
    }
  end

  let(:invalid_attributes) do
    {
      'id' => 'a',
      'name' => 'name',
      'department' => 'department',
      'email' => 'email@example.com',
    }
  end

  describe "GET /index" do
    it 'returns a success respnse' do 
      employee = EmployeeTable.new(valid_attributes)
      employee.save
      get employee_tables_url
      expect(response).to be_successful
    end
  end


  describe 'GET /show' do
    it 'renders a successful response' do
      employee = EmployeeTable.new(valid_attributes)
      employee.save
      get employee_tables_url(employee)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new employee' do
        expect do
          employee = EmployeeTable.new(valid_attributes)
          employee.save
          get employee_tables_url params: { employee_table: valid_attributes }
        end.to change(EmployeeTable, :count).by(1)
      end

    end

    context 'with invalid parameters' do
      it 'does not create a new employee' do
        expect do
          employee = EmployeeTable.new(invalid_attributes)
          employee.save
          post employee_tables_url params: { employee_table: invalid_attributes}
        end.to change(EmployeeTable, :count).by(0)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          'id' => '1',  
          'name' => 'name',
          'department' => 'department',
          'email' => 'email@example.com',
          'salary' => '25'
        }
      end

      it 'updates the requested employee' do
        employee = EmployeeTable.new(new_attributes)
        employee.save
        patch employee_table_url(employee), params: { employee_table: new_attributes }
        skip('Add assertions for updated state')
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        employee = EmployeeTable.create! valid_attributes
        patch employee_table_url(employee), params: { employee_table: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  
end
