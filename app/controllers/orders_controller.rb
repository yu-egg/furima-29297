class OrdersController < ApplicationController

  def index
    @orders = Order.new
    # @item = Item.all
    @item = Item.find(params[:item_id])
    @price = @item.price.to_s(:delimited, delimiter: ',')
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    end
  end



  private

  def order_params
    params.permit(:token, :postal_code, :prefectures_id, :city, :address, :building, :phone_number, :item_id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

end
