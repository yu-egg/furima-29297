class OrdersController < ApplicationController

  def index
    
  end

  def new
  end

  def create
    @order = order.new(order_params)
  end

end
