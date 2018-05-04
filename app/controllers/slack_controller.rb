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
            text: "`/penguin-help` to get this message\n`/penguin-test` to start a new test for yourself, privately via @slackbot\n`/penguin-challenge` to be challenged by the Penguin",
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
    challenge = Challenge.offset(rand(Challenge.count)).first
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
    render status: 200, plain: 'Ok, please check your private conversation with @slackbot'
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
    render status: 200, body: nil
    payload = JSON.parse(params[:payload])
    puts payload.to_json
    case payload['actions'][0]['name']
    when 'test_start'
      if payload['actions'][0]['value'] == 'now'
        send_slack_response(payload['response_url'], {
          text: 'Starting... :dancepeng:'
        })
        start_test(payload)
      else
        send_slack_response(payload['response_url'], {
          text: 'Ok, you can start your test anytime using `/penguin-test` :penguin:'
        })
      end
    when 'option_selected'
      option_selected = JSON.parse(payload['actions'][0]['value'])
      save_answer(option_selected, payload['response_url'])
      make_next_question(option_selected['questionnaire'], option_selected['question'])
    else
      send_slack_response(payload['response_url'], {
        text: 'Command not recognized!',
        channel: payload['channel']['id']
      })
    end
    payload['actions'][0]['name']
  end

  def manual
    offer_results(10)
  end

  private

    def start_test(payload)
      user = User.find_or_create_by(slack_id: payload['user']['id']) do |user|
        user.slack_id = payload['user']['id']
        user.username = payload['user']['name']
      end

      questionnaire = user.questionnaires.create

      send_slack_dm({
        text: "Good #{payload['user']['name']}, let's start with your questionnaire ID #{questionnaire.id}.",
        channel: payload['user']['id']
      })

      make_next_question(questionnaire.id)
    end

    def send_slack_dm(payload)
      response = HTTP.headers(
        'Authorization': "Bearer #{ENV['SLACK_BOT_AUTH']}",
        'Content-type': 'application/json'
      ).post('https://slack.com/api/chat.postMessage', json: payload)
      puts "DM to Slack #{response}"
    end

    def send_slack_response(webhook, payload)
      HTTP.headers('Content-type': 'application/json')
      .post(webhook, json: payload)
    end

    def make_next_question(questionnaire_id, current_question_index = 0)
      questionnaire = Questionnaire.find(questionnaire_id.to_i)
      question = Question.where("id > #{current_question_index}").order(:id).first
      # If there are no more questions
      offer_results(questionnaire.id) unless question
      callback = 'option_selected'
      send_slack_dm({
        text: "Question ##{question.id}",
        channel: questionnaire.user.slack_id,
        attachments: [
          {
            text: question.question,
            fallback: 'You are unable to take the test now',
            callback_id: callback,
            actions: question.options.map do |option|
              {
                type: 'button',
                name: callback,
                text: option.option,
                value: {
                  questionnaire: questionnaire.id,
                  question: question.id,
                  option: option.id
                }.to_json
              }
            end
          }
        ]
      })
    end

    def offer_results(questionnaire_id)
      questionnaire = Questionnaire.find(questionnaire_id)
      send_slack_dm({
        text: 'Hooray! You have finished!',
        channel: questionnaire.user.slack_id,
        attachments: [
          {
            text: "You have completed the questionnaire ##{questionnaire.id}",
            fallback: 'You are unable to see the results now',
            callback_id: 'see_results',
            actions: [
              {
                type: 'button',
                name: 'see_results',
                text: 'See my results',
                value: {
                  questionnaire: questionnaire_id
                }.to_json
              }
            ]
          }
        ]
      })
    end

    def save_answer(payload, confirmation_channel)
      questionnaire = Questionnaire.find(payload['questionnaire'].to_i)
      question = Question.find(payload['question'].to_i)
      option = Option.find(payload['option'].to_i)
      Answer.create(
        user: questionnaire.user,
        questionnaire: questionnaire,
        category: question.category,
        option: option,
        question: question,
        value: option.value
      )
      send_slack_response(confirmation_channel, { text: "*#{question.question}*:\n#{option.option}" })
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
