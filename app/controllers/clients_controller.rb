class ClientsController < ApplicationController
  helper_method :resource_class, :parent, :resource, :new_resource_path, :collection_path

  before_action :get_new, only: [:new, :create]

  def get_new
    @client = Client.new
  end

  def resource_class
    Client
  end

  def parent
    nil
  end

  def resource
    @client
  end

  def new_resource_path
    new_client_path
  end

  def collection_path
    clients_path
  end

  def index
    @grid = ClientsGrid.new(params[:clients_grid])
    @assets = @grid.assets.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @organisation = Organisation.find params[:organisation_id] if params.has_key?(:organisation_id)
  end

  def create
    if @client.update_attributes(build_resource_params)
      redirect_to clients_path, :notice => I18n.t(:notice, :scope => 'flash.actions.create', :resource_name => Client.name)
    else
      render "new"
    end
  end

  def edit
    @client = Client.find params[:id]
    @organisation = Organisation.find params[:organisation_id] if params.has_key?(:organisation_id)
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
