class CounsellingSessionsController < ApplicationController
  before_filter :get_by_id, :only => [:edit, :update]
  before_filter :get_new, :only => [:new, :create]

  def get_new
    @form_vars = CounsellingSession.new
  end

  def get_by_id
    @form_vars = CounsellingSession.find(params[:id])
  end
  
  def index
    @grid = CounsellingSessionsGrid.new(params[:counselling_sessions_grid]) do |scope|
      if params.has_key? :client_id
        scope.where(:client_id => params[:client_id])
      else
        scope.all
      end
      
    end
    @assets = @grid.assets.paginate(:page => params[:page], :per_page => 10)
  end

  def edit
  end

  def new
    @form_vars.client_id = param[:client_id]
    @form_vars = @form_vars.decorate
  end

  def create
    respond_to do |format|
      if @form_vars.update_attributes(counselling_sessions_params)
        format.html { redirect_to(counselling_sessions_path, :notice => t(:successful_form_model_create, :scope => :standard_forms, :resource_name => @form_vars.class.model_name.human))}
      else
        format.html { render :action => "new"}
      end
    end
  end
  
  def update
    respond_to do |format|
      if @form_vars.update_attributes(counselling_sessions_params)
        format.html { redirect_to(counselling_sessions_path, :notice => t(:successful_form_model_update, :scope => :standard_forms, :resource_name => @form_vars.class.model_name.human))}
      else
        format.html { render :action => "edit"}
      end
    end
  end

  def counselling_sessions_params
    params.require(:counselling_sessions_params).permit!
  end
end

