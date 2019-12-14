class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :valid_answers

  scope :correct, -> { where(correct: true) }

  def valid_answers
    #errors.add(:answers, "limit error") if question.answers.size > 3
  end
end
