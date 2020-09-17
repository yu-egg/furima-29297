class ItemsController < ApplicationController
  :authenticate_user!
  
  # def index
  #   @items =  Items.all
  #   @item = Items.index(params[:item_id])
  #   @items = Item.all.order("created_at DESC")
  # end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image,:name,:text,:category_id,:product_status_id,:presence_of_shipping_id,:shipping_origin_id,:date_of_shipment_id,:price).merge(user_id: current_user.id)
  end
end
