class MachinePartsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    @machine_parts = MachinePart.all
    @stock_parts = StockPart.all
  end

  def show
    @machine_part = MachinePart.find(params[:id])
    @stock_part = StockPart.find(@machine_part.id)
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
    @machine_part = MachinePart.find(params[:id])
  end

  def update
    machine_part = MachinePart.find(params[:id])
    machine_part.update!(machine_part_params)
    redirect_to machine_part_url, notice: "設備部品を更新しました"
  end
  private

  def machine_part_params
    params.require(:machine_part).permit(:number_of_use, :replacement_frequency_setting, :machine_parts_operating_time_accumulation, :exchange_announcement, :order_announcement, :machine_parts_details_memo, :replacement_procedure_memo, :machine_id, :stock_part_id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
