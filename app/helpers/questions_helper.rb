module QuestionsHelper
  def question_header(test)
    if test.persisted?
      "Edit #{test.title} question"
    else
      "Create #{test.title} question"
    end
  end
end
