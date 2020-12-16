class UserItemsController < ApplicationController
  def index
    @pay = Pay.new
    @item = Item.find(params[:item_id])
  end


  def create
    @pay = Pay.new(pay_params)
    @pay.valid?
    @pay.save
    redirect_to root_path
  end

  private

  def pay_params
    params.require(:pay).permit(:post_code, :shipper_id, :city, :address, :building, :tel_num, :card_status, :month, :year, :security).merge(user_id: current_user.id, item_id: params[:item_id])
  end


end