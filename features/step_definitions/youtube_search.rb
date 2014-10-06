Given(/^i have visited "(.*?)"$/) do |url|
  visit("http://#{url}")
end

When(/^i enter "(.*?)" in the search box$/) do |keyword|
  fill_in('search_query', with: keyword)
end

When(/^i submit the form$/) do
  click_button('search-btn')
end

Then(/^i should see the "(.*?)" result$/) do |result|
  expect(page).to have_content(result)
end
