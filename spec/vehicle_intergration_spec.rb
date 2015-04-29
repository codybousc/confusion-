require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expections, false)

  describe('the Vehicle path', {:type => :feature}) do
    visit('/')
    fill_in('something', with => 'something for test')
    click_button('Send')
    expect(page).to have_content('something as output')
  end
end
