class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item
  before_action :sold_out

  def index
    @purchase_address = PurchaseAddress.new 
    if @item.purchase.present?
      return redirect_to root_path
    elsif  current_user.id == @item.user.id
      return redirect_to root_path
    end
  end

  def create 
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private 
    def purchase_params 
    params.require(:purchase_address).permit(:zip_code, :prefecture_id, :city, :block_number, :building_name, :phone_number)
    .merge(item_id:params[:item_id] , user_id: current_user.id, token: params[:token])
    end

    def set_item
      @item = Item.find(params[:item_id])
    end 

    def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
    end

    def sold_out
      return redirect_to root_path if @item.purchase.present?
    end
  end

