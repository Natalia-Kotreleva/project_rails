class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
  end

  def show
  end

  def create
   @question = @test.questions.new(question_params)
   if @question.save
     render plain: @question.inspect
   else
     render plain: 'Error'
   end

  end

  def destroy
  end

  def new
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end

  def question_params
    params.require(:question).permit(:body,:test_id)
  end
end
