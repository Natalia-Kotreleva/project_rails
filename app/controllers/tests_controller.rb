class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy, :start]
  before_action :set_user, only: [:start]

  # GET /tests
  def index
    @tests = Test.all
  end

  # GET /tests/1
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  def create
    @test = Test.new(title: params[:title], level: params[:level])

    if @test.save
      redirect_to @test
    else
      render plain: 'Error create'
    end
  end

  # PATCH/PUT /tests/1
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    def set_user
      @user = User.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:title, :level)
    end
end
