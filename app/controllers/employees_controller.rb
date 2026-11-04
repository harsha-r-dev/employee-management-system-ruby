class EmployeesController < ApplicationController
  before_action :set_employee,
                only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.includes(:manager, :department).order(:name)
    @departments = Department.order(:name)
    @managers = Manager.order(:name)
  end

  def show
  end

  def new
    @employee = Employee.new
    @managers = Manager.order(:name)
    @departments = Department.order(:name)
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employees_path,
                  notice: "Employee created successfully."
    else
      @managers = Manager.order(:name)
      @departments = Department.order(:name)
      render :new
    end
  end

  def edit
    @managers = Manager.order(:name)
    @departments = Department.order(:name)
  end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path,
                  notice: "Employee updated successfully."
    else
      @managers = Manager.order(:name)
      @departments = Department.order(:name)
      render :edit
    end
  end

  def destroy
    @employee.destroy

    redirect_to employees_path,
                notice: "Employee deleted successfully."
  end

  def search
    keyword = params[:keyword]

    @employees =
      if keyword.present?
        Employee.search(keyword)
                .includes(:manager, :department)
                .order(:name)
      else
        Employee.includes(:manager, :department)
                .order(:name)
      end
    
    @departments = Department.order(:name)
    @managers = Manager.order(:name)

    render :index
  end

  def filter
    @employees =
      case params[:status]
      when "Active"
        Employee.active
      when "Inactive"
        Employee.inactive
      when "Resign"
        Employee.resigned
      else
        Employee.all
      end

    @employees = @employees.includes(:manager, :department).order(:name)
    @departments = Department.order(:name)
    @managers = Manager.order(:name)

    render :index
  end

  def department_filter
    @employees =
      if params[:department_id].present?
        Employee.by_department(params[:department_id])
      else
        Employee.all
      end

    @employees = @employees.includes(:manager, :department).order(:name)
    @departments = Department.order(:name)
    @managers = Manager.order(:name)

    render :index
  end

  def manager_filter
    @employees =
      if params[:manager_id].present?
        Employee.by_manager(params[:manager_id])
      else
        Employee.all
      end

    @employees = @employees.includes(:manager, :department).order(:name)
    @departments = Department.order(:name)
    @managers = Manager.order(:name)

    render :index
  end

  def joining_date_filter
    @employees =
      if params[:start_date].present? &&
         params[:end_date].present?

        Employee.joining_date_between(
          params[:start_date],
          params[:end_date]
        )
      else
        Employee.all
      end

    @employees = @employees.includes(:manager, :department).order(:name)
    @departments = Department.order(:name)
    @managers = Manager.order(:name)

    render :index
  end

  private

  def employee_params
    params.require(:employee).permit(
      :employee_code,
      :status,
      :name,
      :email,
      :joining_date,
      :designation,
      :salary,
      :manager_id,
      :department_id
    )
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end
end