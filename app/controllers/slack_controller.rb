require 'http'

class SlackController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :slash_command_params, only: [:help]
  before_action :interactive_params, only: [:interactive]

  def help
    render status: 200, json: {
        text: 'Climate challenge help. Here are the *slash commands* you can use.',
        attachments: [
          {
            text: '*/ch-help* to get this message',
            color: 'good'
          },
          {
            text: '*/ch-test* to start a new test for yourself',
            color: 'good'
          },
          {
            text: '*/ch-results* to see the general results',
            color: 'good'
          },
          {
            text: 'Don\'t hesitate to ping us with new ideas',
            footer: 'Made with :green_heart: by @luisa, @santiagoballen and @julian.f',
            footer_icon: 'https://static1.squarespace.com/static/54d12b4de4b02f3989468d9c/t/59c9058146c3c452e8417bfb/1519144008724/imgtp-social.png?format=300w'
          }
        ]
      }
  end

  def test
    render status: 200, body: nil
    response_url = params[:response_url]
    HTTP.post(response_url,
      json: {
        "text": "Would you like to play a game?",
        "attachments": [
          {
            "text": "Choose a game to play",
            "fallback": "You are unable to choose a game",
            "callback_id": "wopr_game",
            "color": "#3AA3E3",
            "attachment_type": "default",
            "actions": [
              {
                "name": "game",
                "text": "Chess",
                "type": "button",
                "value": "chess"
              },
              {
                "name": "game",
                "text": "Falken's Maze",
                "type": "button",
                "value": "maze"
              },
              {
                "name": "game",
                "text": "Thermonuclear War",
                "style": "danger",
                "type": "button",
                "value": "war",
                "confirm": {
                  "title": "Are you sure?",
                  "text": "Wouldn't you prefer a good game of chess?",
                  "ok_text": "Yes",
                  "dismiss_text": "No"
                }
              }
            ]
          }
        ]
      }
    )
  end

  def interactive
    render status: 200, plain: 'ok'
    payload = JSON.parse(params[:payload])
    response = HTTP.headers(
      'Authorization': "Bearer #{ENV['SLACK_BOT_AUTH']}",
      'Content-type': 'application/json'
    ).post('https://slack.com/api/chat.postMessage',
      json: {
        text: 'Hola Mundo!',
        channel: payload['channel']['id']
      }
    )
    puts response
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

    def interactive_params
      params.permit(:payload)
    end
end
