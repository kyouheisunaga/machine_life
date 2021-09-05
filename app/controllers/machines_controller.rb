class MachinesController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end

  def show
  end

  def new
    @machine = Machine.new
  end

  def create
    machine = Machine.new(machine_params)
    machine.save!
    redirect_to machines_url, notice: "#{machine.machine_name}を登録しました"
  end

  def edit
  end

  private

  def machine_params
    params.require(:machine).permit(:machine_name, :machine_operating_time_accumulation, :user_id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
