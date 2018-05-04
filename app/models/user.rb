class User < ApplicationRecord
  has_many :questionnaires
  has_many :answers
end
