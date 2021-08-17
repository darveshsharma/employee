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
      'email' => 'emailexample.com',
    }
  end

  let(:valid_headers) {
    {'id' => 'id','name' => 'name','department' => 'department','email' => 'email','salary' => 'salary'}
  }

  describe "GET /index" do
    it "renders a successful response" do
      EmployeeTable.create! valid_attributes
      get employee_tables_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end


  describe "GET /show" do
    it "renders a successful response" do
      employee = EmployeeTable.create! valid_attributes
      get employee_table_url(employee), as: :json
      expect(response).to be_successful
    end
  end


  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new employee" do
        expect {
          post employee_tables_url,
               params: { employee_table: valid_attributes }, headers: valid_headers, as: :json
        }.to change(EmployeeTable, :count).by(1)
      end

      it "renders a JSON response with the new employee" do
        post employee_tables_url,
             params: { employee_table: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid email" do
      let(:invalid_email_attributes) do
        {
          'id' => '1',  
          'name' => 'name',
          'department' => 'department',
          'email' => 'email.example.com',
          'salary' => '25'
        }
      end
      it "does not create a new Employee" do
        
        expect {
          post employee_tables_url,
               params: { employee_table: invalid_email_attributes }, as: :json
        }.to change(EmployeeTable, :count).by(0)
      end
    end
    context "with invalid name length" do
      let(:invalid_name_attributes) do
        {
            'id' => '1',  
          'name' => 'n',
          'department' => 'department',
          'email' => 'email@example.com',
          'salary' => '25'
        }
      end
      it "does not create a new Employee" do
          
        expect {
          post employee_tables_url,
              params: { employee_table: invalid_name_attributes }, as: :json
        }.to change(EmployeeTable, :count).by(0)
      end
      it "renders a JSON response with errors for the new employee" do
        post employee_tables_url,
             params: { employee_table: invalid_name_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid salary type" do
      let(:invalid_salary_attributes) do
        {
          'id' => '1',  
          'name' => 'name',
          'department' => 'department',
          'email' => 'email@example.com',
          'salary' => '25.6'
        }
      end
      it "does not create a new Employee" do
          
        expect {
          post employee_tables_url,
              params: { employee_table: invalid_salary_attributes }, as: :json
        }.to change(EmployeeTable, :count).by(0)
      end
      it "renders a JSON response with errors for the new employee" do
        post employee_tables_url,
             params: { employee_table: invalid_salary_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
         { 
        'id' => '1',
        'name' => 'name',
        'department' => 'department',
        'email' => 'email@example.com',
        'salary' => '25'
      }
      end

      it "updates the requested employee" do
        employee = EmployeeTable.create! valid_attributes
        patch employee_table_url(employee),
              params: { employee_table: new_attributes }, headers: valid_headers, as: :json
        employee.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the employee" do
        employee = EmployeeTable.create! valid_attributes
        patch employee_table_url(employee),
              params: { employee_table: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the employee" do
        employee = EmployeeTable.create! valid_attributes
        patch employee_table_url(employee),
              params: { employee_table: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end  
end
