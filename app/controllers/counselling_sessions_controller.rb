class CounsellingSessionsController < ApplicationController
  helper_method :resource_class, :parent, :resource, :new_resource_path, :collection_path, :clients

  before_action :get_new, only: [:new, :create]

  def get_new
    @counselling_session = CounsellingSession.new
  end

  def resource_class
    CounsellingSession
  end

  def parent
    nil
  end

  def resource
    @counselling_session
  end

  def new_resource_path
    new_counselling_session_path
  end

  def collection_path
    counselling_sessions_path
  end

  def index
    @grid = CounsellingSessionsGrid.new(params[:counselling_sessions_grid])
    @assets = @grid.assets.paginate(:page => params[:page], :per_page => 10)
  end

  def new

  end

  def create
    if @counselling_session.update_attributes(build_resource_params)
      redirect_to counselling_sessions_path, :notice => I18n.t(:notice, :scope => 'flash.actions.create', :resource_name => CounsellingSession.name)
    else
      render "new"
    end
  end

  def edit
    @counselling_session = CounsellingSession.find params[:id]
  end

  def update
    @counselling_session = CounsellingSession.find params[:id]
    if @counselling_session.update_attributes(build_resource_params)
      redirect_to counselling_sessions_path, :notice => I18n.t(:notice, :scope => 'flash.actions.update', :resource_name => CounsellingSession.name)
    else
      render "edit"
    end
  end

  def destroy
    @counselling_session = CounsellingSession.find params[:id]
    @counselling_session.destroy

    redirect_to counselling_sessions_path, :notice => I18n.t(:notice, :scope => 'flash.actions.destroy', :resource_name => CounsellingSession.name)
  end

  def clients
    client_lookup = Proc.new { |n| [n.code,n.id] }
    if parent.is_a? Organisation
      parent.meetable.map(&client_lookup)
    elsif parent.is_a? Supervisor
      [CounsellingSession.where(:code => "Self").map(&client_lookup)]
    elsif parent.is_a? CounsellingSession
      resource.meetable = parent
      [client_lookup.call(parent)]
    else
      CounsellingSession.all.map(&client_lookup)
    end
  end

  protected
  def build_resource_params
    params.require(:counselling_session).permit(:meetable_id, :zone, :date, :length, :notes, :billed)
  end
end
