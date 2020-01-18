class CompaniesController < ApplicationController

  def edit
  end

  def update
    if current_company.update(company_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :email)
  end
end
