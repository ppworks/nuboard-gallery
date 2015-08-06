NuboardGallery::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'authentications' }, skip: [:sessions]
  devise_scope :user do
    delete '/sessions' => 'devise/sessions#destroy', as: :destroy_user_session
  end
  scope path: :my do
    resource :email, only: [:show, :edit, :update], as: :my_email do
      member do
        get 'finish'
        get 'confirmation/:hash' => :confirmation, hash: /[0-9a-f]+/, as: :confirmation
      end
    end
  end

  resources :posts
  authenticated :user do
    root 'posts#index', as: :authenticated_user_root
  end
  root to: 'pages#index'
end
