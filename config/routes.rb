Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/mutant', to: 'mutant#create'

  mount Raddocs::App => '/docs'

  root to: redirect('/docs', status: 302)
end
