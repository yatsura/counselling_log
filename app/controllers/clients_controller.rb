class ClientsController < ApplicationController

  def index
    @grid = ClientsGrid.new(params[:clients_grid])
    @assets = @grid.assets.paginate(:page => params[:page], :per_page => 10)
  end

end

