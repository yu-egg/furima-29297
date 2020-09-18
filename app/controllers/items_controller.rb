class ItemsController < ApplicationController
  :authenticate_user!
  
  def index
    @items = Item.all.order("created_at DESC")
  end
  
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

  def show
    @item = Item.find(params[:id])
    @price = @item.price.to_s(:delimited, delimiter: ',')
    @user = @item.user
  end

    def edit
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])
      if @item.user_id == current_user.id
        if @item.update(item_params)
          redirect_to item_path(@item.id)
        else
          redirect_to action: :edit
        end
      else
        redirect_to action: :edit
      end
    end

  private
  def item_params
    params.require(:item).permit(:image,:name,:text,:category_id,:product_status_id,:presence_of_shipping_id,:shipping_origin_id,:date_of_shipment_id,:price).merge(user_id: current_user.id)
  end
end
