require 'http'

class SlackController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :slash_command_params, only: [:help]
  def help
    response_url = params[:response_url]
    # HTTP.post(response_url, json: { text: "Hello World! #{params[:user_name]}" })
    render status: 200, body: nil
    HTTP.post('https://hooks.slack.com/services/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', json: {
      text: "Hello World! #{params[:user_name]}, Text: \"#{params[:text]}\""
    })
  end

  private
    def slash_command_params
      params.permit(
        :channel_id,
        :channel_name,
        :command,
        :response_url,
        :team_domain,
        :team_id,
        :text,
        :token,
        :trigger_id,
        :user_id,
        :user_name
      )
    end
end
