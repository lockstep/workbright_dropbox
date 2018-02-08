Rails.application.routes.draw do
  devise_for :users

  # unauthenticated :user do
  #   root to: 'static_pages#landing'
  # end
end
