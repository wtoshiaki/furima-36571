class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :sold_out_item, only: [:index]
  before_action :move_to_index
  

  def index

    @order_address = OrderAddress.new
  end

  def create
    
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :item_prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id] ,token: params[:token])
  end
 
  def set_item
    @item = Item.find(params[:item_id]) 
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],   
        currency: 'jpy'                
    )
  end

  def sold_out_item
    if @item.order.present?
     redirect_to root_path 
   end
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end


  

end
