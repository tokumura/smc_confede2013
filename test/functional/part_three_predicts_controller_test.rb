require 'test_helper'

class PartThreePredictsControllerTest < ActionController::TestCase
  setup do
    @part_three_predict = part_three_predicts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:part_three_predicts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create part_three_predict" do
    assert_difference('PartThreePredict.count') do
      post :create, part_three_predict: { team_a: @part_three_predict.team_a, team_b: @part_three_predict.team_b, team_c: @part_three_predict.team_c }
    end

    assert_redirected_to part_three_predict_path(assigns(:part_three_predict))
  end

  test "should show part_three_predict" do
    get :show, id: @part_three_predict
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @part_three_predict
    assert_response :success
  end

  test "should update part_three_predict" do
    put :update, id: @part_three_predict, part_three_predict: { team_a: @part_three_predict.team_a, team_b: @part_three_predict.team_b, team_c: @part_three_predict.team_c }
    assert_redirected_to part_three_predict_path(assigns(:part_three_predict))
  end

  test "should destroy part_three_predict" do
    assert_difference('PartThreePredict.count', -1) do
      delete :destroy, id: @part_three_predict
    end

    assert_redirected_to part_three_predicts_path
  end
end
