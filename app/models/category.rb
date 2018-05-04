class Category < ApplicationRecord
  has_many :questions
  has_many :challenges
  has_many :answers
end
