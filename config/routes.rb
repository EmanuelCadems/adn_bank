Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v2 do
    post '/mutant', to: 'mutant#create'
  end

  namespace :v3 do
    post '/mutant', to: 'mutant#create'
    get '/stats', to: 'stats#index'
  end

  mount Raddocs::App => '/docs'

  root to: redirect('/docs', status: 302)
end
