class SupervisorsController < ApplicationController
  helper_method :resource_class, :parent, :resource, :new_resource_path, :collection_path

  before_action :get_new, only: [:new, :create]

  def get_new
    @supervisor = Supervisor.new
  end

  def resource_class
    Supervisor
  end

  def parent
    nil
  end

  def resource
    @supervisor
  end

  def new_resource_path
    new_supervisor_path
  end

  def collection_path
    supervisors_path
  end

  def index
    @grid = SupervisorsGrid.new(params[:supervisors_grid])
    @assets = @grid.assets.paginate(:page => params[:page], :per_page => 10)
  end

  def new

  end

  def create
    if @supervisor.update_attributes(build_resource_params)
      redirect_to supervisors_path, :notice => I18n.t(:notice, :scope => 'flash.actions.create', :resource_name => Supervisor.name)
    else
      render "new"
    end
  end

  def edit
    @supervisor = Supervisor.find params[:id]
  end

  def update
    @supervisor = Supervisor.find params[:id]
    if @supervisor.update_attributes(build_resource_params)
      redirect_to supervisors_path, :notice => I18n.t(:notice, :scope => 'flash.actions.update', :resource_name => Supervisor.name)
    else
      render "edit"
    end
  end

  def destroy
    @supervisor = Supervisor.find params[:id]
    @supervisor.destroy

    redirect_to supervisors_path, :notice => I18n.t(:notice, :scope => 'flash.actions.destroy', :resource_name => Supervisor.name)
  end


  protected
  def build_resource_params
    params.require(:supervisor).permit(:name, :zone, :cost, :address, :contact_name, :email_address)
  end
end
