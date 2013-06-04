require 'test_helper'

class PartTwoPredictsControllerTest < ActionController::TestCase
  setup do
    @part_two_predict = part_two_predicts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:part_two_predicts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create part_two_predict" do
    assert_difference('PartTwoPredict.count') do
      post :create, part_two_predict: { team_a: @part_two_predict.team_a, team_b: @part_two_predict.team_b, team_c: @part_two_predict.team_c, team_d: @part_two_predict.team_d, user_id: @part_two_predict.user_id }
    end

    assert_redirected_to part_two_predict_path(assigns(:part_two_predict))
  end

  test "should show part_two_predict" do
    get :show, id: @part_two_predict
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @part_two_predict
    assert_response :success
  end

  test "should update part_two_predict" do
    put :update, id: @part_two_predict, part_two_predict: { team_a: @part_two_predict.team_a, team_b: @part_two_predict.team_b, team_c: @part_two_predict.team_c, team_d: @part_two_predict.team_d, user_id: @part_two_predict.user_id }
    assert_redirected_to part_two_predict_path(assigns(:part_two_predict))
  end

  test "should destroy part_two_predict" do
    assert_difference('PartTwoPredict.count', -1) do
      delete :destroy, id: @part_two_predict
    end

    assert_redirected_to part_two_predicts_path
  end
end
