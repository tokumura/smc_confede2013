require 'test_helper'

class PartTwoResultsControllerTest < ActionController::TestCase
  setup do
    @part_two_result = part_two_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:part_two_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create part_two_result" do
    assert_difference('PartTwoResult.count') do
      post :create, part_two_result: { team_a: @part_two_result.team_a, team_b: @part_two_result.team_b, team_c: @part_two_result.team_c, team_d: @part_two_result.team_d }
    end

    assert_redirected_to part_two_result_path(assigns(:part_two_result))
  end

  test "should show part_two_result" do
    get :show, id: @part_two_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @part_two_result
    assert_response :success
  end

  test "should update part_two_result" do
    put :update, id: @part_two_result, part_two_result: { team_a: @part_two_result.team_a, team_b: @part_two_result.team_b, team_c: @part_two_result.team_c, team_d: @part_two_result.team_d }
    assert_redirected_to part_two_result_path(assigns(:part_two_result))
  end

  test "should destroy part_two_result" do
    assert_difference('PartTwoResult.count', -1) do
      delete :destroy, id: @part_two_result
    end

    assert_redirected_to part_two_results_path
  end
end
