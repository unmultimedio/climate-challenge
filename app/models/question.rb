class Question < ApplicationRecord
  belongs_to :category
  has_many :options
  has_many :answers
end
