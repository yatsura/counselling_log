class ClientsController < InheritedResources::Base
  belongs_to :organisation, :shallow => true
  
  def index
    @grid = ClientsGrid.new(params[:clients_grid])
    @assets = @grid.assets.paginate(:page => params[:page], :per_page => 10)
  end

  protected
  def build_resource_params
    [params.fetch(:client, {}).permit(:code, :zone, :organisation_id, :notes, :gender)]
  end
end

