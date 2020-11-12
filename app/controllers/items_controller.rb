class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:edit,:update]
  before_action :user_status, only:[:edit]
  before_action :item_set, only:[:show, :edit, :update, :destroy]

  def index
    @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
       redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user.id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:description,:category_id,:condition_id,:delivery_fee_id,:ship_form_id,:day_id,:price,:image).merge(user_id: current_user.id)
  end

  def user_status
    @item = Item.find(params[:id])
    redirect_to action: :index unless current_user.id == @item.user.id
  end

  def item_set
    @item = Item.find(params[:id])
  end
end

