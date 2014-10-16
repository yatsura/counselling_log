# -*- coding: utf-8 -*-
class CounsellingSessionsController < ApplicationController
  helper_method :resource_class, :parent, :resource
  helper_method :new_resource_path, :collection_path, :clients, :edit_resource_path

  before_action :get_new, only: [:new, :create]
  before_action :get_by_id, only: [:edit, :update, :show, :destroy]

  def get_new
    @counselling_session = CounsellingSession.new
  end

  def get_by_id
    @counselling_session = CounsellingSession.find params[:id]
  end



  def resource_class
    CounsellingSession
  end

  def parent
    if params.has_key? :organisation_id
      Organisation.find params[:organisation_id]
    elsif params.has_key? :supervisor_id
      Supervisor.find params[:supervisor_id]
    elsif params.has_key? :counselling_session_id
      CounsellingSession.find params[:counselling_session_id]
    elsif params.has_key? :client_id
      Client.find params[:client_id]
    else
      nil
    end
  end

  def resource
    @counselling_session
  end

  def new_resource_path
    new_counselling_session_path
  end

  def edit_resource_path
    edit_counselling_session_path
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

  end

  def update
    if @counselling_session.update_attributes(build_resource_params)
      redirect_to counselling_sessions_path,
      :notice => I18n.t(:notice, :scope => 'flash.actions.update', :resource_name => CounsellingSession.name.underscore.humanize)
    else
      render "edit"
    end
  end

  def destroy
    @counselling_session.destroy
    redirect_to counselling_sessions_path,
    :notice => I18n.t(:notice, :scope => 'flash.actions.destroy', :resource_name => CounsellingSession.name.underscore.humanize)
  end

  def clients
    Lookups::Client.by_parent(parent)
  end

  protected
  def build_resource_params
    params.require(:counselling_session).permit(:meetable_id, :zone, :date, :length, :notes, :billed)
  end
end
