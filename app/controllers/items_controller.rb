class ItemsController < ApplicationController
  before_action :authenticate_user!,   only: [:new, :create, :edit, :destroy, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item[:id])
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

    private
  
    def item_params
      params.require(:item).permit(:name, :explanation, :category_id, :status_id, :delivery_fee_id, :shipper_id, :delivery_day_id, :price, :image ).merge(user_id: current_user.id)
    end


end
