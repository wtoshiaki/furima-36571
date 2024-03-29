class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show]
  before_action :set_item, except: [ :index, :new, :create]
  before_action :move_to_index, only: [:edit]
  before_action :sold_out_item, only: [:edit]
  
  
  
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:title, :introduction, :category_id, :status_id, :fee_id, :shipping_id, :item_prefecture_id, :price, :image).merge(user_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:id])  
  end


  def move_to_index
    unless current_user == @item.user
      redirect_to action: :index
    end
  end

  def sold_out_item
    if @item.order.present?
     redirect_to root_path 
   end
  end
  



end
