class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :questionnaire
  belongs_to :category
  belongs_to :option
  belongs_to :question
end
