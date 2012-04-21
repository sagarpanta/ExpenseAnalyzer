require 'test_helper'

class GraphsControllerTest < ActionController::TestCase
  test "should get y_right" do
    get :y_right
    assert_response :success
  end

end
