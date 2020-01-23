class EmployeesController < ApplicationController
  before_action :set_company

  def index
    @employees = Employee.where(company_id: current_company.id) #後ほど社員No.順になるようにorderを追記
  end

  def task
    @employees = Employee.where(company_id: current_company.id)
    @social_insurance_acquisition_procedures\
      = @employees.where(social_insurance_condition: 1)
    @employment_insurance_acquisition_procedures\
      = @employees.where(employment_insurance_condition: 1)
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to root_path
    else
      render :new
    end
  end

  # 利用者は常に自社従業員情報を編集可能であると想定、showは不要

  def edit
    @employee = Employee.find(params[:id])
    if @employee.company_id == current_company.id
    else
      redirect_to root_path
    end
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to root_path #後ほど従業員一覧に変更
    else
      render :edit
    end
  end




end



private


  def employee_params
    params.require(:employee).permit(
    :first_name,
    :family_name,
    :first_name_f,
    :family_name_f,
    :image,
    :birthday,
    :sex,
    :postal_code,
    :address,
    :address_f,
    :hire_date,
    :retirement_date,
    :reason_for_retirement,
    :employee_id,
    :employment_status,
    :department,
    :working_hours,
    :working_days,
    :pay_type,
    :amount_of_payment,
    :commuting_allowance,
    :cash,
    :in_kind,
    :monthly_remuneration,
    :standard_monthly_remuneration,
    :social_insurance_acquisition_date,
    :health_insurance_number,
    :basic_pension_number,
    :employment_insurance_acquisition_date,
    :employment_insurance_number
    ).merge(company_id: current_company.id)
  end

  def set_company
    @company = current_company
  end
   
