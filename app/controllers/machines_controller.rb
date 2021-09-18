class MachinesController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @machines = Machine.all
  end

  def show
    @machine = Machine.find(params[:id])
  end

  def new
    @machine = Machine.new
  end

  def create
    @machine = Machine.new(machine_params)

    if @machine.save
      redirect_to machines_url, notice:"設備「#{@machine.machine_name}」を登録しました"
    else
      render :new
    end
  end

  def edit
    @machine = Machine.find(params[:id])
  end

  def update
    machine = Machine.find(params[:id])
    machine.update!(machine_params)
    redirect_to machine_url, notice: "設備「#{machine.machine_name}」を更新しました"
  end

  private

  def machine_params
    params.require(:machine).permit(:machine_name, :machine_operating_time_accumulation, :addition).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
