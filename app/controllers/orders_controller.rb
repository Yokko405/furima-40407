class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @shipping_address = ShippingAddress.new
  end
  

  def create
    @item = Item.find(params[:item_id])
    @shipping_address = ShippingAddress.new(shipping_address_params)
    # binding.pry
    if @shipping_address.valid?
      @shipping_address.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private
  def shipping_address_params
    params.require(:shipping_address).permit(:purchase_record, :postal_code, :prefecture_id, :city, :address_number, :building_name, :phone_number, :item_price)
  end
end
