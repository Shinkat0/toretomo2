class PostTrainingsController < ApplicationController
  before_action :set_post_training, only: [:show, :edit, :update, :destroy]

  def index
    @post_trainings = PostTraining.all
  end

  def show
    @favorite = Favorite.new
    @comments = @post_training.comments
  end

  def new
    @post_training = PostTraining.new
  end

  def edit
  end

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

  def destroy
    @post_training.destroy
    respond_to do |format|
      format.html { redirect_to post_trainings_url, notice: 'Post training was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post_training
      @post_training = PostTraining.find(params[:id])
    end

    def post_training_params
      params.require(:post_training).permit(:note, :exercise, :weight, :rep, :bodyweight, :image)
    end
end
