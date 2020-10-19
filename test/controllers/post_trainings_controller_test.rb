require 'test_helper'

class PostTrainingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_training = post_trainings(:one)
  end

  test "should get index" do
    get post_trainings_url
    assert_response :success
  end

  test "should get new" do
    get new_post_training_url
    assert_response :success
  end

  test "should create post_training" do
    assert_difference('PostTraining.count') do
      post post_trainings_url, params: { post_training: { bodyweight: @post_training.bodyweight, exercise: @post_training.exercise, note: @post_training.note, rep: @post_training.rep, user_id: @post_training.user_id, weight: @post_training.weight } }
    end

    assert_redirected_to post_training_url(PostTraining.last)
  end

  test "should show post_training" do
    get post_training_url(@post_training)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_training_url(@post_training)
    assert_response :success
  end

  test "should update post_training" do
    patch post_training_url(@post_training), params: { post_training: { bodyweight: @post_training.bodyweight, exercise: @post_training.exercise, note: @post_training.note, rep: @post_training.rep, user_id: @post_training.user_id, weight: @post_training.weight } }
    assert_redirected_to post_training_url(@post_training)
  end

  test "should destroy post_training" do
    assert_difference('PostTraining.count', -1) do
      delete post_training_url(@post_training)
    end

    assert_redirected_to post_trainings_url
  end
end
