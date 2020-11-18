class AddressPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code,      format:       { with: /\A\d{3}-\d{4}\z/, message: 'ハイフンを入れて入力してください' }
    validates :prefectures_id,   numericality: { other_than: 1, message: '--は選択できません' }
    validates :city
    validates :address
    validates :phone_number,     format: { with: /\A\d{11}\z/, message: '数字のみで11文字以内で入力してください' }
    validates :token, presence: true
  end

  def save
    @purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: @purchase.id)
  end
end