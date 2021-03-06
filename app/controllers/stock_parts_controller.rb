class StockPartsController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :set_q, only: [:index, :search]

  def index
    if user_signed_in?
      @stock_parts = current_user.stock_parts
    else
      redirect_to sign_in_url, notice: "ログインしてください"
    end
  end

  def show
    @stock_part = current_user.stock_parts.find(params[:id])
  end

  def new
    @stock_part = StockPart.new
  end

  def create
    @stock_part = StockPart.new(stock_part_params)

    if @stock_part.save
      redirect_to stock_parts_url, notice:"在庫部品「#{@stock_part.stock_parts_name}」を登録しました"
    else
      render :new
    end
  end

  def edit
    @stock_part = current_user.stock_parts.find(params[:id])
  end

  def update
    stock_part = current_user.stock_parts.find(params[:id])
    stock_part.update!(stock_part_params)
    redirect_to stock_parts_url, notice: "在庫部品「#{stock_part.stock_parts_name}」を更新しました"
  end

  def destroy
    stock_part = current_user.stock_parts.find(params[:id])
    stock_part.destroy
    redirect_to stock_parts_url, notice: "在庫部品「#{stock_part.stock_parts_name}」を削除しました"
  end

  # def search
  #   if params[:stock_parts_name].present?
  #     @stock_parts = StockPart.where('name LIKE ?', "%#{params[:stock_parts_name]}%")
  #   else
  #     @stock_parts = StockPart.none
  #   end
  # end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = current_user.stock_parts.ransack(params[:q])
  end

  def stock_part_params
    params.require(:stock_part).permit(:stock_parts_name, :model, :maker, :stock, :price, :stock_parts_details_memo).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
