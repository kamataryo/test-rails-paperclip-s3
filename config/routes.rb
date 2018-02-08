Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :images
  resource :images do
    member do
      get 'show_image'
    end
  end

end
