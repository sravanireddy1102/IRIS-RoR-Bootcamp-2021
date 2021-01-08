Rails.application.routes.draw do
  get '/', to: 'page#root'
  get 'about_me', to: 'page#about_me'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
