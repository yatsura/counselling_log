class OrganisationsController < ApplicationController
  def new
  end

  def index
    @grid = OrganisationsGrid.new params[:organisations_grid]
    @assets = @grid.assets.paginate(:page => params[:page], :per_page => 10)
  end
end
