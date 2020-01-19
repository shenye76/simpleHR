class Employee < ApplicationRecord
  belongs_to :company
  mount_uploader :image, ImageUploader

  validates :family_name_f,:first_name_f, presence: true, format: { with: /[\u{ff66}-\u{ff9f}]/, \
            message: 'には日本語を含めてください。(Text must contain katakana.)' }

  enum sex: {"男":0, "女":1}
  enum pay_type: {"月給":0, "時給":1, "日給":2, "その他":3}
  
end
