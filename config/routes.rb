Rails.application.routes.draw do
  resources :arrets
  
  root "pages#home"
  get '/quiz/index', to: 'quiz#index'
  post '/quiz/submit', to: 'quiz#submit'
end
