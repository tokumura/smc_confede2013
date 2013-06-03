require 'test_helper'

class PartOnePredictsControllerTest < ActionController::TestCase
  setup do
    @part_one_predict = part_one_predicts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:part_one_predicts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create part_one_predict" do
    assert_difference('PartOnePredict.count') do
      post :create, part_one_predict: { game_no: @part_one_predict.game_no, score_a: @part_one_predict.score_a, score_b: @part_one_predict.score_b }
    end

    assert_redirected_to part_one_predict_path(assigns(:part_one_predict))
  end

  test "should show part_one_predict" do
    get :show, id: @part_one_predict
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @part_one_predict
    assert_response :success
  end

  test "should update part_one_predict" do
    put :update, id: @part_one_predict, part_one_predict: { game_no: @part_one_predict.game_no, score_a: @part_one_predict.score_a, score_b: @part_one_predict.score_b }
    assert_redirected_to part_one_predict_path(assigns(:part_one_predict))
  end

  test "should destroy part_one_predict" do
    assert_difference('PartOnePredict.count', -1) do
      delete :destroy, id: @part_one_predict
    end

    assert_redirected_to part_one_predicts_path
  end
end
