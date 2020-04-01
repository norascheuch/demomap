require 'rails_helper'


RSpec.feature 'User looks at map' do

  # initialize test data
  let!(:start_event_type) { create(:event_type, name: "Start")}
  let!(:end_event_type) { create(:event_type, name: "End")}
  n = 3
  let!(:demos) { create_list(:demo, n) }
  let(:demo_id) { demos.last.id }

  feature 'they click on a demo and see the show page', js: true do
    scenario 'returns share buttons' do
      visit("/demos/#{demo_id}")
      assert_selector('.social-share-button')
      visit("/demos/#{demo_id}/events")
      Capybara::Screenshot.screenshot_and_open_image
      assert_selector('.marker')
    end
  end

  feature 'they see a list of demos' do
    scenario 'returns demos' do
      visit root_path
      click_link('Know')
      assert_selector('.card-demo', count: n)
      screenshot_and_open_image
    end
  end




end
