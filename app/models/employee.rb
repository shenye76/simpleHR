class Employee < ApplicationRecord
  belongs_to :company

  enum sex: [:"男", :"女"]
  enum pay_type: [:"月給", :"時給", :"日給", :"その他"]
  
end
