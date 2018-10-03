FactoryBot.define do
  factory :saved_search do
    user
    name { 'work' }
    query { 'inbox:true owner:octobox' }
  end
end
