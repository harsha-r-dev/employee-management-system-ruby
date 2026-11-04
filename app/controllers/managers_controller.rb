class ManagersController < ApplicationController
  before_action :set_manager,
                only: [:show, :edit, :update, :destroy]

  def index
    @managers = Manager.order(:name)
  end

  def show
  end

  def new
    @manager = Manager.new
  end

  def create
    @manager = Manager.new(manager_params)

    if @manager.save
      redirect_to managers_path,
                  notice: "Manager created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @manager.update(manager_params)
      redirect_to managers_path,
                  notice: "Manager updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @manager.destroy

    redirect_to managers_path,
                notice: "Manager deleted successfully."
  end

  private

  def manager_params
    params.require(:manager).permit(
      :name,
      :email
    )
  end

  def set_manager
    @manager = Manager.find(params[:id])
  end
end