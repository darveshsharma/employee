require "test_helper"

class EmployeeTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_table = employee_tables(:one)
  end

  test "should get index" do
    get employee_tables_url, as: :json
    assert_response :success
  end

  test "should create employee_table" do
    assert_difference('EmployeeTable.count') do
      post employee_tables_url, params: { employee_table: { department: @employee_table.department, email: @employee_table.email, name: @employee_table.name, salary: @employee_table.salary } }, as: :json
    end

    assert_response 201
  end

  test "should show employee_table" do
    get employee_table_url(@employee_table), as: :json
    assert_response :success
  end

  test "should update employee_table" do
    patch employee_table_url(@employee_table), params: { employee_table: { department: @employee_table.department, email: @employee_table.email, name: @employee_table.name, salary: @employee_table.salary } }, as: :json
    assert_response 200
  end

  test "should destroy employee_table" do
    assert_difference('EmployeeTable.count', -1) do
      delete employee_table_url(@employee_table), as: :json
    end

    assert_response 204
  end
end
