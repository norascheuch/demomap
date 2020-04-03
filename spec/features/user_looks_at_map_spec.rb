require 'rails_helper'


RSpec.feature 'User looks at map', js: true do
  # pp page.body
  # sleep 1
  # screenshot_and_open_image

  # initialize test data
  let!(:start_event_type) { create(:event_type, name: "Start")}
  let!(:end_event_type) { create(:event_type, name: "End")}
  n = 3
  let!(:demos) { create_list(:demo, n) }
  let(:demo_id) { demos.last.id }

  feature 'they click on a demo, see the show page and can access the map', js: true do
    scenario 'returns share buttons' do
      visit("/demos/#{demo_id}")
      assert_selector('.social-share-button')
    end

    scenario 'opens map and returns JS' do
      visit("/demos/#{demo_id}/events")
      assert_selector('.mapboxgl-marker')
      # save_and_open_screenshot
    end

    scenario 'events length is 2' do
      expect(demos.last.events.length).to eq(2)
    end
  end

  feature 'they see a list of demos' do
    scenario 'returns demos' do
      visit root_path
      click_link('Know')
      assert_selector('.card-demo', count: n)
    end
  end




end
