class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index 
    @items = Item.all.order("created_at DESC")
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

  def edit 
    @item = Item.find(params[:id])
    redirect_to item_path unless current_user.id == @item.user.id
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :new
    end
  end

  def show 
    @item = Item.find(params[:id])
  end

  def destroy
    #@item = Item.find(params[:id])
    #@item.destroy
    #redirect_to root_path
  end


  private 
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :delivery_type_id, :prefecture_id, :delivery_date_id, :price, :user, :image).merge(user_id: current_user.id)
  end

end 