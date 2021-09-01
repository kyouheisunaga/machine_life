class MachinePartsController < ApplicationController
  def index
  end

  def show
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
  end

  private

  def machine_part_params
    params.require(:machine_part).permit(:machine_parts_details_memo, :replacement_procedure_memo)
  end
end
