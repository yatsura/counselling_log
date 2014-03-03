class OrganisationsController < InheritedResources::Base

  def index
    @grid = OrganisationsGrid.new params[:organisations_grid]
    @assets = @grid.assets.paginate(:page => params[:page], :per_page => 10)
  end

  protected
  def build_resource_params
    [params.fetch(:organisation, {}).permit(:name, :billable, :address, :telephone, :contact_name, :contact_email)]
  end
end
