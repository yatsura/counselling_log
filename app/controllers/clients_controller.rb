class ClientsController < ApplicationController
  helper_method :new_resource_path, :collection_path, :edit_resource_path
  helper_method :resource_class, :parent, :resource
  helper_method :org_list

  before_action :get_new, only: [:new, :create]
  before_action :get_by_id, only: [:edit, :update, :show, :destroy]

  def get_new
    @client = Client.new
    @organisation = Organisation.find params[:organisation_id] if params.has_key?(:organisation_id)
  end

  def get_by_id
    @client = Client.find params[:id]
    @organisation = Organisation.find params[:organisation_id] if params.has_key?(:organisation_id)
  end

  def resource_class
    Client
  end

  def parent
    @organisation
  end

  def resource
    @client
  end

  def new_resource_path
    new_client_path
  end

  def edit_resource_path
    edit_client_path
  end

  def collection_path
    clients_path
  end

  def org_list
    Organisation.all.map { |org| [org.name, org.id] }
  end

  def index
    @grid = ClientsGrid.new(params[:clients_grid])
    @assets = @grid.assets.paginate(:page => params[:page], :per_page => 10)
  end

  def new
  end

  def create
    if @client.update_attributes(build_resource_params)
      redirect_to clients_path, :notice => I18n.t(:notice, :scope => 'flash.actions.create', :resource_name => Client.name)
    else
      render "new"
    end
  end

  def edit
    render "edit"
  end

  def update
    if @client.update_attributes(build_resource_params)
      redirect_to clients_path, :notice => I18n.t(:notice, :scope => 'flash.actions.update', :resource_name => Client.name)
    else
      render "edit"
    end
  end

  def destroy
    @client.visible = false
    @client.save

    redirect_to clients_path, :notice => I18n.t(:notice, :scope => 'flash.actions.destroy', :resource_name => Client.name)
  end

  protected
  def build_resource_params
    params.require(:client).permit(:code, :zone,:organisation_id, :notes, :gender)
  end
end
