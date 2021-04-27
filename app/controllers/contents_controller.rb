class ContentsController < ApplicationController
  require "json"

  SEP = 21
  
  def top
    File.open("#{Rails.public_path}/json/area.json") do |j|
      @json_str = JSON.load(j)
    end
  end

  def area
    region_json
    region_id = @str_param.select {|k, v| k == params[:area_name]}
    @area_data = Spot.where(region_num: region_id.first[1].to_i).page(params[:page]).per(SEP)
    @movie_data = AreaMovie.find_by(region_num: region_id.first[1].to_i)
  end

  def spot
    @spot_data = Spot.find(params[:id])
    @movie_data = Movie.find_by(spot_id: @spot_data.id)
    @images = Image.where(spot_id: @spot_data.id)
  end
end
