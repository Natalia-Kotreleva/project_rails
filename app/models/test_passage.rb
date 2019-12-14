class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :question

  CONST_RESULT = 85

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_question += 1
    end

    self.question = next_question
    save
  end

  def completed?
    question.nil?
  end

  def procent
    a = self.correct_question
    b = self.test.questions.size
    procent_result = a*100/b
  end

  def passed_test
    if self.procent > CONST_RESULT
      "color:Green"
    else
      "color:Red"
    end
  end

  private

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id>?', question.id).first
  end
end
