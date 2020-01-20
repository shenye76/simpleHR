class EmployeesController < ApplicationController

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
    @company = Company.find(params[:id])
  end
