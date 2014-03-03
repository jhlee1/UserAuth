class EvaluationsController < ApplicationController
	before_action :set_employee
	before_action :set_evaluation, only: [:show, :edit, :update, :destroy]
  def index
  	@evaluations = @employee.evaluations
  end

  def new
  	@evaluation = @employee.evaluations.build
  end

  def create
  	@evaluation = @employee.evaluations.build(evaluation_params)
  	if @evaluation.save
  		redirect_to employee_evaluations_path(@employee), notice: 'Evaluation created'
  	else 
  		render :new
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @evaluation.update_attributes(evaluation_params)
  			redirect_to employee_evaluations_path(@employee), notice: 'Evaluation Updated'
  	else
  		render :edit
  	end
  end

  def destroy
  	@evaluation.destroy
  	redirect_to employee_evaluations_path(@employee), notice: 'Evaluation Deleted'
  end

private
	
	def set_employee
		@employee = Employee.find(params[:employee_id])
	end

	def set_evaluation
		@evaluation = @employee.evaluations.find(params[:id])
	end

	def evaluation_params
		params.require(:evaluation).permit(:body)
	end



end
