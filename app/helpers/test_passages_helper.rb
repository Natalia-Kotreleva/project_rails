module TestPassagesHelper
  def procent(test_passage)
    a = test_passage.correct_question
    b = test_passage.test.questions.size
    procent_result = a*100/b
  end
end
