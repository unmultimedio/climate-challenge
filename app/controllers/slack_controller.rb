require 'http'

class SlackController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :slash_command_params, only: [:help]
  before_action :interactive_params, only: [:interactive]

  PENGUINS = [':penguin:', 'Penguin', ':dancepeng:']

  def help
    render status: 200, json: {
        text: 'Climate challenge help. Here are the *slash commands* you can use.',
        attachments: [
          {
            text: "`/penguin-help` to get this message\n`/penguin-test` to start a new test for yourself\n`/penguin-results` to see the general results",
            color: 'good'
          },
          {
            text: "Don't hesitate to ping us with new ideas",
            footer: 'Made with :green_heart: by @luisa, @santiagoballen and @julian.f',
            footer_icon: 'https://static1.squarespace.com/static/54d12b4de4b02f3989468d9c/t/59c9058146c3c452e8417bfb/1519144008724/imgtp-social.png?format=300w'
          }
        ]
      }
  end

  def challenge
    penguin = PENGUINS.sample
    challenge = Challenge.order("RANDOM()").first
    render status: 200, json: {
      text: "Here's a challenge from the #{penguin}!",
      attachments: [
        {
          text: challenge.challenge,
          footer: "Challenge ID ##{challenge.id} in #{challenge.category.name}"
        }
      ]
    }
  end

  def test
    render status: 200, plain: 'ok'
    response_url = params[:response_url]
    send_slack_dm({
      text: 'Are you ready to measure your carbon footprint?',
      channel: params[:user_id],
      attachments: [
        {
          text: '_Please select one option, and take your time_',
          fallback: 'You are unable to take the test now',
          callback_id: 'test_start',
          color: 'good',
          actions: [
            {
              name: 'test_start',
              text: 'Maybe later',
              type: 'button',
              value: 'later'
            },
            {
              name: 'test_start',
              text: 'Let\'s do this!',
              style: 'primary',
              type: 'button',
              value: 'now',
              confirm: {
                title: 'Please, answer with the truth',
                text: 'Are you ready?',
                ok_text: 'I was born ready!',
                dismiss_text: 'No, go back'
              }
            }
          ]
        }
      ]
    })
  end

  def interactive
    render status: 200, plain: 'ok'
    payload = JSON.parse(params[:payload])
    send_slack_dm({
      text: 'Hola Mundo!',
      channel: payload['channel']['id']
    })
  end

  private
    def send_slack_dm(payload)
      response = HTTP.headers(
        'Authorization': "Bearer #{ENV['SLACK_BOT_AUTH']}",
        'Content-type': 'application/json'
      ).post('https://slack.com/api/chat.postMessage', json: payload)
      puts response
    end

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
