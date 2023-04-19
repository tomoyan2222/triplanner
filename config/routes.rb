Rails.application.routes.draw do
  # content get
  root to: "contents#top", as: "content_top"
  get 'contents/top', to: "contents#top"
  get 'contents/:area_name', to: "contents#area", as: "content_area"
  get 'contents/:area_name/:id', to: "contents#spot", as: "content_spot"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # works get
  get 'mkSMtEB5SwVZ/home', to: "works#home", as: "works_home"
  get 'mkSMtEB5SwVZ/login', to: "works#login", as: "works_login"
  get 'mkSMtEB5SwVZ/spot_new', to: "works#spot_new", as: "works_spot_new"
  get 'mkSMtEB5SwVZ/spot_list', to: "works#spot_list", as: "works_spot_list"
  get 'mkSMtEB5SwVZ/spot_list/:id', to: "works#spot_single", as: "works_spot_single"
  get 'mkSMtEB5SwVZ/spot_list/:id/image', to: "works#spot_images", as: "works_spot_images"
  get 'mkSMtEB5SwVZ/movie', to: "works#movie", as: "works_movie"

  # works get 送信系
  get 'mkSMtEB5SwVZ/sign_out', to: "works#sign_out", as: "works_sign_out"
  get 'mkSMtEB5SwVZ/spot_list/destroy/:id', to: "works#spot_destroy", as: "works_spot_destroy"
  get 'mkSMtEB5SwVZ/spot_list/image/delete/:id/:image_id', to: "works#spot_images_delete", as: "works_spot_images_delete"

  
  # works post
  post 'mkSMtEB5SwVZ/login', to: "works#login_process"
  post 'mkSMtEB5SwVZ/spot_new', to: "works#spot_save"
  post 'mkSMtEB5SwVZ/spot_list/:id', to: "works#spot_update"
  post 'mkSMtEB5SwVZ/spot_list/:id/image', to: "works#spot_images_update"
  post 'mkSMtEB5SwVZ/movie', to: "works#movie_save"

end
