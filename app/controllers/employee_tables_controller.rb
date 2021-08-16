class EmployeeTablesController < ApplicationController
  before_action :set_employee_table, only: [:show, :update, :destroy]

  # GET /employee_tables
  def index
    @employee_tables = EmployeeTable.all

    render json: @employee_tables
  end

  # GET /employee_tables/1
  def show
    render json: @employee_table
  end

  # POST /employee_tables
  def create
    @employee_table = EmployeeTable.new(employee_table_params)

    if @employee_table.save
      render json: @employee_table, status: :created, location: @employee_table
    else
      render json: @employee_table.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employee_tables/1
  def update
    if @employee_table.update(employee_table_params)
      render json: @employee_table
    else
      render json: @employee_table.errors, status: :unprocessable_entity
    end
  end

  # DELETE /employee_tables/1
  def destroy
    @employee_table.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_table
      @employee_table = EmployeeTable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_table_params
      params.require(:employee_table).permit(:name, :department, :email, :salary)
    end
end
