class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
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
    @question = @test.questions.find(params[:id])
    @question.destroy
    if @question.destroy
      redirect_to controller: 'questions', action: 'index'
    else
      render plain: 'Error'
    end
  end

  def new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update_attribute(:body, question_params[:body])
      redirect_to @question
    else
      render plain: 'Error update'
    end
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
