require 'test_helper'

class TributesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Tribute.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Tribute.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Tribute.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to tribute_url(assigns(:tribute))
  end

  def test_edit
    get :edit, :id => Tribute.first
    assert_template 'edit'
  end

  def test_update_invalid
    Tribute.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Tribute.first
    assert_template 'edit'
  end

  def test_update_valid
    Tribute.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Tribute.first
    assert_redirected_to tribute_url(assigns(:tribute))
  end

  def test_destroy
    tribute = Tribute.first
    delete :destroy, :id => tribute
    assert_redirected_to tributes_url
    assert !Tribute.exists?(tribute.id)
  end
end
