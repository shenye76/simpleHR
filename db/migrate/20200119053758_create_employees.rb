class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.references :company, foreign_key: true
      t.string  :family_name,        null: false, index: true
      t.string  :first_name,         null: false, index: true
      t.string  :family_name_f,      null: false, index: true
      t.string  :first_name_f,       null: false, index: true
      t.date    :birthday,           null: false
      t.integer :sex,                null: false
      t.integer :postal_code
      t.text    :address
      t.text    :address_f
      t.date    :hire_date
      t.date    :retirement_date
      t.string  :reason_for_retirement
      t.string  :employee_id,        unique: true 
      t.string  :employment_status
      t.string  :department
      t.integer :working_hours
      t.integer :working_days
      t.string  :pay_type
      t.integer :amount_of_payment
      t.integer :commuting_allowance
      t.integer :cash
      t.integer :in_kind
      t.integer :monthly_remuneration
      t.integer :standard_monthly_remuneration
      t.date    :social_insurance_acquisition_date
      t.integer :social_insurance_condition
      t.integer :health_insurance_number
      t.integer :basic_pension_number
      t.date    :employment_insurance_acquisition_date
      t.integer :employment_insurance_condition
      t.integer :employment_insurance_number
      t.text    :image
      t.timestamps
    end
  end
end
