# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_19_053758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "company_id"
    t.string "family_name"
    t.string "first_name"
    t.string "family_name_f"
    t.string "first_name_f"
    t.date "birthday"
    t.integer "sex"
    t.integer "postal_code"
    t.text "address"
    t.text "address_f"
    t.date "hire_date"
    t.date "retirement_date"
    t.string "reason_for_retirement"
    t.integer "employee_id"
    t.string "employment_status"
    t.string "department"
    t.integer "working_hours"
    t.integer "working_days"
    t.string "pay_type"
    t.integer "amount_of_payment"
    t.integer "commuting_allowance"
    t.integer "cash"
    t.integer "in_kind"
    t.integer "monthly_remuneration"
    t.integer "standard_monthly_remuneration"
    t.date "social_insurance_acquisition_date"
    t.date "social_insurance_disqualification_date"
    t.integer "social_insurance_condition_acquisition"
    t.integer "social_insurance_condition_disqualification"
    t.integer "health_insurance_number"
    t.bigint "basic_pension_number"
    t.date "employment_insurance_acquisition_date"
    t.date "employment_insurance_disqualification_date"
    t.integer "employment_insurance_condition_acquisition"
    t.integer "employment_insurance_condition_disqualification"
    t.bigint "employment_insurance_number"
    t.text "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_employees_on_company_id"
  end

  add_foreign_key "employees", "companies"
end
