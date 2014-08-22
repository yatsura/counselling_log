class ClientsController < ApplicationController
  def index
    @grid = ClientsGrid.new(params[:clients_grid])
    @assets = @grid.assets.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @client = Client.new
  end	
  
  def create
    @client = Client.new
    if @client.update_attributes(build_resource_params)
      redirect_to clients_path, :notice => I18n.t(:notice, :scope => 'flash.actions.create', :resource_name => Client.name)
    else
      render "new"
    end
  end
  
  def edit
    @client = Client.find params[:id]
  end
  
  def update
    @client = Client.find params[:id]
    if @client.update_attributes(build_resource_params)
      redirect_to clients_path, :notice => I18n.t(:notice, :scope => 'flash.actions.update', :resource_name => Client.name)
    else
      render "edit"
    end
  end

  def destroy
    @client = Client.find params[:id]
    @client.destroy
    
    redirect_to clients_path, :notice => I18n.t(:notice, :scope => 'flash.actions.destroy', :resource_name => Client.name)
  end
    
  protected
  def build_resource_params
    params.require(:client).permit(:code, :zone,:organisation_id, :notes, :gender)
  end
end

