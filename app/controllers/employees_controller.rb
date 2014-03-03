class EmployeesController < ApplicationController
		before_action :set_employee, only: [:show, :edit, :update, :destroy]
  def index
  		@employees = Employee.all
  end
  
  def new 
  		@employee = Employee.new
  end

  def show
  end

  def create
  		@employee = Employee.new(employee_params)
  		if @employee.save
  				redirect_to @employee, notice: 'Employee hired'
  		else 
  				render 'new'
  		end
  end

  def edit
  end

  def update 
  		@employee.update_attributes(employee_params)
  		if @employee.save 
  			redirect_to @employee, notice: 'Employee is updated.'
  		else
  			render 'edit'
  		end
  end

  def destroy
  		@employee.destroy
  		redirect_to employees_path, notice: 'Employee is terminated'
  end



private
	def employee_params
			params.require(:employee).permit(:name, :position, :hireDate, :wage)
	end

	def set_employee
			@employee = Employee.find(params[:id])
	end

end