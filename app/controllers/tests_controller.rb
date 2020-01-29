class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test, only: [:start]

  # GET /tests
  def index
    @tests = current_user.tests
  end

  def show
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

end
