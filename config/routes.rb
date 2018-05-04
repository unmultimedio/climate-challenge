Rails.application.routes.draw do
  scope 'slack', controller: :slack do
    post 'help', action: :help, as: :slack_help
    post 'test', action: :test, as: :slack_test
    post 'interactive', action: :interactive, as: :slack_interactive
    post 'interactive_load', action: :interactive_load, as: :slack_interactive_load
  end
end
