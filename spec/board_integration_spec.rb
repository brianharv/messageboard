require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe '#Board' do
  
  before(:each) do
    Board.clear()
  end

  describe('create an initial path', {:type => :feature}) do
    it('creates a landing page') do
      visit('/')
      expect(page).to have_content('Robots')
    end
  end

  describe('create /boards path', {:type => :feature}) do
    it('creates a page for all the boards') do
      visit('/boards')
      expect(page).to have_content('Robots')
    end
  end

  describe('create a board path', {:type => :feature}) do
    it('creates a board and the goest to the new board page') do
      visit('/boards')
      click_on('Add a new board')
      fill_in('title_name', :with => 'Robots')
      click_on('Make a new board')
      expect(page).to have_content('Robots')
    end
  end
end