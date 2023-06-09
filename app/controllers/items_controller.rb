class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_action, except: [:index, :new, :create]
  def index 
    @items = Item.includes(:user).order("created_at DESC")
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
    if @item.purchase.present?
      redirect_to root_path
    elsif current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def show 
  end

  def destroy
    if @item.user.id == current_user.id
    @item.destroy
    redirect_to root_path
    end
  end


  private 
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :delivery_type_id, :prefecture_id, :delivery_date_id, :price, :user, :image).merge(user_id: current_user.id)
  end

  def set_action
    @item = Item.find(params[:id])
  end

end 