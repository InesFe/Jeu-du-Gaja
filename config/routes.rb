Rails.application.routes.draw do
  resources :arrets
  
  root "pages#home"
  get '/quiz/index', to: 'quiz#index'
  post '/quiz/submit', to: 'quiz#submit'
  get '/correct_answer', to: 'quiz#correct_answer'
  get '/wrong_answer', to: 'quiz#wrong_answer'
end
