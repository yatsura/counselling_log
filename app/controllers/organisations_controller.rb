class OrganisationsController < ApplicationController
  helper_method :resource_class, :parent, :resource, :new_resource_path, :collection_path

  before_action :get_new, only: [:new, :create]

  def get_new
    @organisation = Organisation.new
  end

  def resource_class
    Organisation
  end

  def parent
    nil
  end

  def resource
    @organisation
  end

  def new_resource_path
    new_organisation_path
  end

  def collection_path
    organisations_path
  end

  def index
    @grid = OrganisationsGrid.new params[:organisations_grid]
    @assets = @grid.assets.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new
    if @organisation.update_attributes(build_resource_params)
      redirect_to organisations_path, :notice => I18n.t(:notice, :scope => 'flash.actions.create', :resource_name => Organisation.name)
    else
      render "new"
    end
  end

  def edit
    @organisation = Organisation.find params[:id]
  end

  def update
    @organisation = Organisation.find params[:id]
    if @organisation.update_attributes(build_resource_params)
      redirect_to organisations_path, :notice => I18n.t(:notice, :scope => 'flash.actions.update', :resource_name => Organisation.name)
    else
      render "edit"
    end
  end

  def destroy
    @organisation = Organisation.find params[:id]
    @organisation.destroy

    redirect_to supervisors_path, :notice => I18n.t(:notice, :scope => 'flash.actions.destroy', :resource_name => Organisation.name)
  end

  protected
  def build_resource_params
    params.require(:organisation).permit(:name, :billable, :address, :telephone, :contact_name, :contact_email)
  end
end
