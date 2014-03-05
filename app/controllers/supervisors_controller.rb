class SupervisorsController < InheritedResources::Base

  def index
    @grid = SupervisorsGrid.new(params[:supervisors_grid])
    @assets = @grid.assets.paginate(:page => params[:page], :per_page => 10)
  end

  protected
  def build_resource_params
    [params.fetch(:supervisor, {}).permit(:name, :zone, :cost, :address, :contact_name, :email_address)]
  end
end
