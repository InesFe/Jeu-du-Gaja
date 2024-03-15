require "test_helper"

class ArretsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @arret = arrets(:one)
  end

  test "should get index" do
    get arrets_url
    assert_response :success
  end

  test "should get new" do
    get new_arret_url
    assert_response :success
  end

  test "should create arret" do
    assert_difference("Arret.count") do
      post arrets_url, params: { arret: { apport: @arret.apport, name: @arret.name, year: @arret.year } }
    end

    assert_redirected_to arret_url(Arret.last)
  end

  test "should show arret" do
    get arret_url(@arret)
    assert_response :success
  end

  test "should get edit" do
    get edit_arret_url(@arret)
    assert_response :success
  end

  test "should update arret" do
    patch arret_url(@arret), params: { arret: { apport: @arret.apport, name: @arret.name, year: @arret.year } }
    assert_redirected_to arret_url(@arret)
  end

  test "should destroy arret" do
    assert_difference("Arret.count", -1) do
      delete arret_url(@arret)
    end

    assert_redirected_to arrets_url
  end
end
