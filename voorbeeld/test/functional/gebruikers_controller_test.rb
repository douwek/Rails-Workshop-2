require 'test_helper'

class GebruikersControllerTest < ActionController::TestCase
  setup do
    @gebruiker = gebruikers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gebruikers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gebruiker" do
    assert_difference('Gebruiker.count') do
      post :create, :gebruiker => @gebruiker.attributes
    end

    assert_redirected_to gebruiker_path(assigns(:gebruiker))
  end

  test "should show gebruiker" do
    get :show, :id => @gebruiker
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @gebruiker
    assert_response :success
  end

  test "should update gebruiker" do
    put :update, :id => @gebruiker, :gebruiker => @gebruiker.attributes
    assert_redirected_to gebruiker_path(assigns(:gebruiker))
  end

  test "should destroy gebruiker" do
    assert_difference('Gebruiker.count', -1) do
      delete :destroy, :id => @gebruiker
    end

    assert_redirected_to gebruikers_path
  end
end
