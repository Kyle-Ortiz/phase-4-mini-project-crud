class SpicesController < ApplicationController
  # GET /spices
  def index
    @spices = Spice.all

    render json: @spices
  end

  def show
    spice = set_spice
    render json: spice
  end

  # POST /spices
  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  # DELETE /spices/1
  def destroy
    @spice = set_spice
    @spice.destroy
    head :no_content
  end

  def update
    spice = set_spice
    spice.update(spice_params)
    render json: spice
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spice
      @spice = Spice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spice_params
      params.permit(:title, :image, :description, :notes, :rating)
    end
end
