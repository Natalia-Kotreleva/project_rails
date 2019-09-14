class Question < ApplicationRecord
  belongs_to :test
  has_and_belongs_to_many :answers
end
