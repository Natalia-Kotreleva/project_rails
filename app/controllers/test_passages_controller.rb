class TestPassagesController < ApplicationController
  before_action :set_test_passage

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.question).call

    Gist.create( question: @test_passage.question, user: current_user, gist: result.html_url )

    flash_options = if result.success?
      { notice: t('.success', gist_link: result.html_url, target: :blank) }
    else
      { alert: t('.test_passage.gist.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
