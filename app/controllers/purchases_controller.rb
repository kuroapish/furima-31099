class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_set, only: [:index, :create]

  def index
    redirect_to root_path if current_user.id == @item.user.id || @item.purchase
    @address_purchase = AddressPurchase.new
  end

  def create
    @address_purchase = AddressPurchase.new(purchase_params)
    if @address_purchase.valid?
       pay_item
       @address_purchase.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_set
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:address_purchase).permit(:postal_code, :prefectures_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end