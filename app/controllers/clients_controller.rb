class ClientsController < ApplicationController
  before_filter :get_by_id, :only => [:edit, :update]
  before_filter :get_new, :only => [:new, :create]

  def get_new
    @form_vars = Client.new
  end

  def get_by_id
    @form_vars = Client.find(params[:id])
  end
  
  def index
    @grid = ClientsGrid.new(params[:clients_grid])
    @assets = @grid.assets.paginate(:page => params[:page], :per_page => 10)
  end

  def edit
  end

  def new
  end

  def create
    respond_to do |format|
      if @form_vars.update_attributes(client_params)
        format.html { redirect_to(clients_path, :notice => t(:successful_form_model_create, :scope => :standard_forms, :resource_name => @form_vars.class.model_name.human))}
      else
        format.html { render :action => "new"}
      end
    end
  end
  
  def update
    respond_to do |format|
      if @form_vars.update_attributes(client_params)
        format.html { redirect_to(clients_path, :notice => t(:successful_form_model_update, :scope => :standard_forms, :resource_name => @form_vars.class.model_name.human))}
      else
        format.html { render :action => "edit"}
      end
    end
  end

  def client_params
    params.require(:client).permit!
  end
end

