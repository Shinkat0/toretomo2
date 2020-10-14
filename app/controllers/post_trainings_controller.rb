class PostTrainingsController < ApplicationController
  before_action :set_post_training, only: [:show, :edit, :update, :destroy]

  # GET /post_trainings
  # GET /post_trainings.json
  def index
    @post_trainings = PostTraining.all
  end

  # GET /post_trainings/1
  # GET /post_trainings/1.json
  def show
    @favorite = Favorite.new
  end

  # GET /post_trainings/new
  def new
    @post_training = PostTraining.new
  end

  # GET /post_trainings/1/edit
  def edit
  end

  # POST /post_trainings
  # POST /post_trainings.json
  def create
    @post_training = current_user.post_trainings.build(post_training_params)

    respond_to do |format|
      if @post_training.save
        format.html { redirect_to @post_training, notice: 'Post training was successfully created.' }
        format.json { render :show, status: :created, location: @post_training }
      else
        format.html { render :new }
        format.json { render json: @post_training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_trainings/1
  # PATCH/PUT /post_trainings/1.json
  def update
    respond_to do |format|
      if @post_training.update(post_training_params)
        format.html { redirect_to @post_training, notice: 'Post training was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_training }
      else
        format.html { render :edit }
        format.json { render json: @post_training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_trainings/1
  # DELETE /post_trainings/1.json
  def destroy
    @post_training.destroy
    respond_to do |format|
      format.html { redirect_to post_trainings_url, notice: 'Post training was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_training
      @post_training = PostTraining.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_training_params
      params.require(:post_training).permit(:note, :exercise, :weight, :rep, :bodyweight)
    end
end
