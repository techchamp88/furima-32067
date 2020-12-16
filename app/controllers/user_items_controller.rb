class UserItemsController < ApplicationController
  def index
    @pay = Pay.new
    @item = Item.find(params[:item_id])
  end


  def create

  end
end
