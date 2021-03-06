Rails.application.routes.draw do
  
  default_url_options :host => "localhost:3000"
  
  get 'password_resets/new'
  get 'password_resets/edit'
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
  resources :questions
  resources :answers
  
  root               'static_pages#home'
  get 'info'      => 'static_pages#info'
  get 'signup'    => 'users#new'
  
  get 'users/:id/changeAdmin' => 'users#changeAdmin', as: :changeAdmin
  get 'users/:id/changeUser' => 'users#changeUser', as: :changeUser
  
  get 'users/:id/changePassword'  => 'users#changePassword', as: :changePw
  
  get 'my_questions'    => 'questions#my_questions'

  get 'leaderboard'     => 'leaderboard#index'
  
  post 'answer_value'    => 'answers#answer_value'
  
  get 'simulation'    => 'questions#simulation'
  post 'start_simulation'    => 'questions#start_simulation'
  post 'start_pot_eval'    => 'questions#start_pot_eval'
  
  get :question_stats, controller: :questions
  
end
