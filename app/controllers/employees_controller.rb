class EmployeesController < ApplicationController

  before_filter :authenticate_employee, only:[:show,:edit,:update]
  before_filter :authenticate_manager, only: [:new,:create,:index,:destroy] #Moot - should employee have accessto index
 
  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    if authenticateEmployeeOperation(params[:id])
      @employee = Employee.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @employee }
      end
    end
  end

  # GET /employees/new
  # GET /employees/new.json
  def new
    @employee = Employee.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    if authenticateEmployeeOperation(params[:id])
      @employee = Employee.find(params[:id])
    end
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(params[:employee])
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render json: @employee, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
    if authenticateEmployeeOperation(params[:id])
      @employee = Employee.find(params[:id])
      respond_to do |format|
        if @employee.update_attributes(params[:employee])
          format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @employee.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end

  private

  def authenticateEmployeeOperation(id)
    unless is_manager? || id == current_employee.id.to_s
      redirect_to current_employee, :notice => "Invalid Operation"
    return false
    end
    return true
  end
end
