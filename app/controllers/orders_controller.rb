class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create, :login]
  before_action :login
  
  def index
    @orders = Order.new
    @price = @item.price.to_s(:delimited, delimiter: ',')
  end
  
  def create
    @order = OrderForm.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    end
  end

  private

  def order_params
    params.permit(:token, :postal_code, :prefectures_id, :city, :address, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def login
    if user_signed_in? && @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end
