class ItemsController < ApplicationController
  def index
  end

  def new
    @items = items.all
  end
end
