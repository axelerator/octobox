require 'test_helper'

class SavedSearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    stub_fetch_subject_enabled(value: false)
    stub_notifications_request
    @user = create(:user)
  end

  test 'will render new saved search form' do
    sign_in_as(@user)
    get '/saved_searches/new'
    assert_response :success
  end

  # create

  # edit

  # update

  test 'will delete a saved search' do
    sign_in_as(@user)
    saved_search = create(:saved_search, user: @user)
    delete "/saved_searches/#{saved_search.id}"
    assert_response :redirect
    assert_redirected_to '/settings'
    assert_equal @user.saved_searches.count, 0
  end

  test 'will only delete saved searches owned by the current user' do
    sign_in_as(@user)
    other_user = create(:user)
    saved_search = create(:saved_search, user: other_user)
    assert_raises ActiveRecord::RecordNotFound do
      delete "/saved_searches/#{saved_search.id}"
      assert_response :not_found
    end

    assert_equal other_user.saved_searches.count, 1
  end

  test 'will redirect index page requests to settings' do
    sign_in_as(@user)
    get '/saved_searches'
    assert_response :redirect
    assert_redirected_to '/settings'
  end

  test 'will redirect show page requests to settings' do
    sign_in_as(@user)
    get '/saved_searches/1'
    assert_response :redirect
    assert_redirected_to '/settings'
  end
end
