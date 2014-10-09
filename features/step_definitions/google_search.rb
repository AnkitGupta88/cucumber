Given(/^i visit the "(.*?)" page$/) do |url|
  visit("http://#{url}")
end

When(/^i enter the "(.*?)" keyword in the search form$/) do |keyword|
  fill_in('q', with: keyword)
end

When(/^i click on the submit button$/) do
  click_button('Cerca con Google')
end

Then(/^i should see the "(.*?)" result$/) do |result|
  page.has_content?(result)
end
