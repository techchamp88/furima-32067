class UserItemsController < ApplicationController
  before_action :authenticate_user!,   only: [:index]


  def index
    if current_user.id == @item.user_id
       redirect_to root_path
    end
    if @item.user_item.present?
      redirect_to root_path
    end
    @pay = Pay.new
    @item = Item.find(params[:item_id])
  end
  
  
  def create
    @pay = Pay.new(pay_params)
    @item = Item.find(params[:item_id])
    
    if @pay.valid?
      pay_item
      @pay.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def pay_params
    params.require(:pay).permit(:post_code, :shipper_id, :city, :address, :building, :tel_num, :card_status, :month, :year, :security).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: pay_params[:token],    
      currency: 'jpy'                 
    )
  end



end