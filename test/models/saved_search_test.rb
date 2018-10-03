# frozen_string_literal: true
require 'test_helper'

class SavedSearchTest < ActiveSupport::TestCase
  setup do
    @saved_search = create(:saved_search)
  end

  test 'must have a name' do
    @saved_search.name = nil
    refute @saved_search.valid?
  end

  test 'must have a query' do
    @saved_search.query = nil
    refute @saved_search.valid?
  end

  test 'must have a user_id' do
    @saved_search.user_id = nil
    refute @saved_search.valid?
  end
end
