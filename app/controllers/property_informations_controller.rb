class PropertyInformationsController < ApplicationController

  def index
    @rents = PropertyInformation.all
  end

  def new
    @rent = PropertyInformation.new
    @rent.nearest_stations.build
    @rent.nearest_stations.build
  end

  def create
    @rent = PropertyInformation.new(rent_params)
    if @rent.save
      redirect_to property_informations_path, notice: "物件を登録しました！"
    else
      if @rent.nearest_stations[0].nil? && @rent.nearest_stations[1].nil?
        @rent.nearest_stations.build
        @rent.nearest_stations.build
      elsif  @rent.nearest_stations[0].nil? || @rent.nearest_stations[1].nil?
        @rent.nearest_stations.build
      end
      render :new
    end
  end

  def show
    @rent = PropertyInformation.find(params[:id])
    @stations = @rent.nearest_stations

  end

  def edit
    @rent = PropertyInformation.find(params[:id])
    i = 2-@rent.nearest_stations.count
    i.times {@rent.nearest_stations.build}

  end

  def update
    @rent = PropertyInformation.find(params[:id])
    if @rent.update(rent_params)
      redirect_to property_informations_path, notice: "物件情報を編集しました！"
    else
      if @rent.nearest_stations[0].nil? && @rent.nearest_stations[1].nil?
        @rent.nearest_stations.build
        @rent.nearest_stations.build
      elsif  @rent.nearest_stations[0].nil? || @rent.nearest_stations[1].nil?
        @rent.nearest_stations.build
      end
      render :edit
    end
  end

  def destroy
    @rent = PropertyInformation.find(params[:id])
    @rent.destroy
    redirect_to property_informations_path, notice:"物件情報を削除しました！"
  end

  private
  def rent_params
    params.require(:property_information).permit(
      :property_name,
      :rent,
      :address,
      :age,
      :note,
      nearest_stations_attributes: [
        :id,
        :property_information_id,
        :transit_name,
        :station_name,
        :walk_fraction])
  end
end
