class Questionnaire < ApplicationRecord
  belongs_to :user
  has_many :answers

  def calculate_results
    update_attribute(:value, answers.sum(:value))
  end
end
