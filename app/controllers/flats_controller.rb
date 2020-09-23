class FlatsController < ApplicationController
  def index
    @flats = Flat.where.not(latitude: nil, longitude: nil)
    flats_filter = params[:flats_filter]
    if flats_filter.present?
      if flats_filter[:search].present?
        @flats = Flat.search_by_name_and_address(flats_filter[:search])
      end
    if flats_filter.present?
        if flats_filter[:min_price].present?
          @flats = @flats.where("flats.price >= ?", flats_filter[:min_price])
        end
        if flats_filter[:max_price].present?
          @flats = @flats.where("flats.price <= ?", flats_filter[:max_price])
        end
      end
    end
    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { flat: flat })
      }
    end
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.create!(flat_params)
    # @flat = Flat.new(flat_params)
    # if @flat.save
      redirect_to flat_path(@flat), notice: 'Flat was successfully created.'
    # else
    #   render :new
    # end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    if @flat.update(flat_params)
      redirect_to flat_path(@flat), notice: 'Flat was successfully update.'
    else
      render :edit
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :stars, images: [] )
  end
end