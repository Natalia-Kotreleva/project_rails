class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :find_question, only: [:new, :create]

  def show
  end

  # GET /answers/new
  def new
    @answer = @question.answers.new

  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to @answer.question
    else
      render plain: 'Error save'
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      redirect_to @answer
    else
      render plain: 'Error'
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
    redirect_to @answer.question
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def find_question
      @question = Question.find(params[:question_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:body, :correct)
    end

end
