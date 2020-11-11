class Item < ApplicationRecord
  belongs_to:user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :ship_form
  belongs_to_active_hash :day

  with_options presence: true do
    validates :image
    validates :name,        length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :ship_form_id
    validates :day_id
    validates :price, inclusion: { in: 300..9999999, message: '300円〜9,999,999円の間で入力してください' }, numericality:{ message: '半角数字で入力してください' }
    validates :user
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :ship_form_id
    validates :day_id
  end

end