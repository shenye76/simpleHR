class Employee < ApplicationRecord
  belongs_to :company
  mount_uploader :image, ImageUploader

  validates :family_name_f, :first_name_f, allow_blank: true, format: { with: /[\u{ff66}-\u{ff9f}]/ }
  validates :basic_pension_number, allow_blank: true, length: { minimum: 10, maximum: 10 }
  validates :employment_insurance_number, allow_blank: true, length: { minimum: 11, maximum: 11 }

  enum sex: {"男":0, "女":1}
  enum pay_type: {"月給":0, "時給":1, "日給":2, "その他":3}
  

  after_create do #社保雇保の手続き要否を判断しカラムに追記する
    if working_hours.blank? #週労働時間がblankの場合
      self.update(social_insurance_condition_acquisition: 0, employment_insurance_condition_acquisition: 0) #社保雇保共に手続き不要
    else 
      if working_hours >= 30 #社会保険加入条件
        self.update(social_insurance_condition_acquisition: 1) #条件を満たせば社保手続が必要
      else
        self.update(social_insurance_condition_acquisition: 0) #条件を満たさないので社保手続不要
      end
      if working_hours >= 20 #雇用保険加入条件
        self.update(employment_insurance_condition_acquisition: 1) #条件を満たせば雇保手続が必要
      else
        self.update(employment_insurance_condition_acquisition: 0) #条件を満たさないので雇保手続不要
      end
    end
  end


end
