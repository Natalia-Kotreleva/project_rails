class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validates :valid_answers

  def valid_answers
    errors.add(:answers, "limit error") if answers.size > 3
end
