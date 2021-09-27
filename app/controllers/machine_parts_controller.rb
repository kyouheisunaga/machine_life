class MachinePartsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    if user_signed_in?
      @machine_parts = current_user.machine_parts
      @stock_parts = current_user.stock_parts
    else
      redirect_to sign_in_url, notice: "ログインしてください"
    end
  end

  def show
    @machine_part = current_user.machine_parts.find(params[:id])
    @stock_part = current_user.stock_parts.find(@machine_part.stock_part_id)
  end

  def new
    @machine_part = MachinePart.new
  end

  def create
    machine_part = MachinePart.new(machine_part_params)
    machine_part.save!
    redirect_to machine_parts_url, notice: "設備部品を登録しました"
  end

  def edit
    @machine_part = current_user.machine_parts.find(params[:id])
  end

  def update
    machine_part = current_user.machine_parts.find(params[:id])
    machine_part.update!(machine_part_params)
    redirect_to machine_part_url, notice: "設備部品を更新しました"
  end
  private

  def machine_part_params
    params.require(:machine_part).permit(:number_of_use, :replacement_frequency_setting, :machine_parts_operating_time_accumulation, :exchange_announcement, :order_announcement, :machine_parts_details_memo, :replacement_procedure_memo, :machine_id, :stock_part_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
