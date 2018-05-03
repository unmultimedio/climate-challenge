Rails.application.routes.draw do
  scope 'slack', controller: :slack do
    post 'help', action: :help, as: :slack_help
  end
end
