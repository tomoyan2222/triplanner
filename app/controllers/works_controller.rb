class WorksController < ApplicationController
  before_action :manager_logined, except: [:login, :login_process]
  
  SEP = 10
  
  def home
  end

  def login
    render :layout => "not_login"
  end

  def sign_out
    manager_sign_out
    redirect_to works_login_path
  end

  def login_process
    if params[:user] == ENV['TRIP_USER'] &&
      params[:password] == ENV['SECRET_KEY']
      session_manager
      redirect_to works_home_path
    else
      flash[:notice] = "ユーザー名かパスワードが違います。"
      redirect_back(fallback_location: works_login_path)
    end
  end

  def spot_new
    region_json
  end

  def spot_save
    spot = Spot.new(spot_params)
    if spot.save
    else
      flash[:danger] = spot.errors.full_messages
      redirect_to works_spot_new_path
      return
    end

    if params[:thumbnail].present?
      file = params[:thumbnail]
      file_full = file.original_filename
      upload_thumbnail(file_full, file)
    end

    if params[:image].present?
      file = params[:image]
      file_full = file.original_filename
      upload_image(file_full, file)
      image = Image.new(spot_id: spot.id, file_name: file_full)
      image.save
    end

    if params[:code].present?
      movie = Movie.new(spot_id: spot.id, code: params[:code])
      movie.save
    end

    redirect_to works_home_path
  end

  def spot_destroy
    spot = Spot.find(params[:id])
    spot.destroy
    redirect_back(fallback_location: works_spot_list_path)
  end
  
  def spot_list
    @spot_list = Spot.all.order(id: :desc).page(params[:page]).per(SEP)
    region_json
  end

  def spot_single
    region_json

    @spot_data = Spot.find(params[:id])
    @image_data = Image.where(spot_id: params[:id]).count
    @movie_data = Movie.find_by(spot_id: params[:id])
  end

  def spot_update
    spot = Spot.find(params[:id])
    if spot.update(spot_params)
    else
      render "spot_single"
      flash.now[:danger] = "failed"
      redirect_to works_home_path
      return
    end

    if params[:thumbnail].present?
      file = params[:thumbnail]
      file_full = file.original_filename
      upload_thumbnail(file_full, file)
    end

    if params[:code].present?
      movie = Movie.find_by(spot_id: spot.id)
      if movie.present?
        movie.update(code: params[:code])
      else
        movie = Movie.new(spot_id: spot.id, code: params[:code])
        movie.save
      end
    end

    redirect_to works_spot_list_path
  end

  def spot_images
    @spot_data = Spot.find(params[:id])
    @image_data = Image.where(spot_id: params[:id])
  end

  def spot_images_update
    if params[:image].present?
      file = params[:image]
      file_full = file.original_filename
      upload_image(file_full, file)
      image = Image.new(file_name: file.original_filename, spot_id: params[:id])
      image.save
    end
    redirect_back(fallback_location: works_spot_images_path(params[:id]))
  end

  def spot_images_delete
    image = Image.find(params[:image_id])
    image.delete
    redirect_back(fallback_location: works_spot_images_path(image.spot_id))
  end

  def movie
    region_json
    @movie_data = AreaMovie.all
  end

  def movie_save
    movie = AreaMovie.find_by(region_num: params[:region_num])
    if movie.present?
      movie.update(code: params[:code])
    else
      movie = AreaMovie.new(movie_params)
      movie.save
    end
    redirect_back(fallback_location: works_movie_path)
  end

  private
  def spot_params
    if params[:thumbnail].present?
      file = params[:thumbnail]
      params.permit(:name, :region_num, :content).merge(thumbnail: file.original_filename)
    else
      params.permit(:name, :region_num, :content)
    end
  end

  def movie_params
    params.permit(:region_num, :code)
  end
end
