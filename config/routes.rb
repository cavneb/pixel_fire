PixelFire::Engine.routes.draw do
  resources :tags
  resources :triggers
  
  root to: "tags#index"
end
