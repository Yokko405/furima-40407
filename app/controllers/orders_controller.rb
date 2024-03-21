class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_seller

  def index
    @order_form = OrderForm.new
  end
  

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      Payjp.api_key = "sk_test_0f996e2c15d176b269d7029a"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: order_form_params[:price],  # 商品の値段
        card: order_form_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order_form.save
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private
  def order_form_params
    params.require(:order_form).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :address_number, :building_name, :phone_number)
      .merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_seller
    redirect_to root_path if current_user == @item.user
  end
end
