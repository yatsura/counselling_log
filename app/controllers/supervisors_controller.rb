class SupervisorsController < ApplicationController

  def index
    @grid = SupervisorsGrid.new(params[:supervisors_grid])
    @assets = @grid.assets.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @supervisor = Supervisor.new
  end 
  
  def create
    @supervisor = Supervisor.new
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
