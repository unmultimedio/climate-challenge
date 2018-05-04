Rails.application.routes.draw do
  resources :answers
  resources :questionnaires
  resources :users
  resources :options
  resources :challenges
  resources :questions
  resources :categories
  scope 'slack', controller: :slack do
    post 'help', action: :help, as: :slack_help
    post 'test', action: :test, as: :slack_test
    post 'challenge', action: :challenge, as: :slack_challenge
    post 'interactive', action: :interactive, as: :slack_interactive
    post 'interactive_load', action: :interactive_load, as: :slack_interactive_load
  end

  root to: 'application#home'
end
