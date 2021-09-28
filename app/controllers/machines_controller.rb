class MachinesController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    if user_signed_in?
      @machines = current_user.machines
    else
      redirect_to sign_in_url, notice: "ログインしてください"
    end
  end

  def show
    @machine = current_user.machines.find(params[:id])
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
    @machine = current_user.machines.find(params[:id])
  end

  def update
    machine = current_user.machines.find(params[:id])
    machine.update!(machine_params)
    redirect_to machine_url, notice: "設備「#{machine.machine_name}」を更新しました"
  end

  def destroy
    machine = current_user.machines.find(params[:id])
    machine.destroy
    redirect_to machines_url, notice: "設備「#{machine.machine_name}」を削除しました"
  end

  private

  def machine_params
    params.require(:machine).permit(:machine_name, :machine_operating_time_accumulation, :addition).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
