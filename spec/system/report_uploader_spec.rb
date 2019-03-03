require 'rails_helper'

RSpec.describe "ReportUploaders", type: :system do

  context 'form submission' do 
    it 'a user can fill out a single record through the form', js: true do 
      visit root_path

      fake_record = FactoryBot.build :record
      # within '' do 
      fill_in 'record_record_title', with: fake_record.title
      fill_in 'record_record_author', with: fake_record.author
      fill_in 'record_record_pages', with: fake_record.pages
      fill_in 'record_record_dewey_decimal_code', with: fake_record.dewey_decimal_code
      select fake_record.book_read_status, from: 'record_record_book_read_status'
      select "Partially", from: 'record_record_book_read_status'
      # end

      click_button('submit')
    end

    it 'a user can fill out multiple records through the form', js: true do 
      visit root_path

      find('[data-id="add-record-button"]').click
      fieldsets = page.find_all('fieldset')
      expect(page).to have_css('fieldset', count: 2)

      fake_record_0 = FactoryBot.build :record
      fieldsets[0].fill_in 'record_record_title', with: fake_record_0.title
      fieldsets[0].fill_in 'record_record_author', with: fake_record_0.author
      fieldsets[0].fill_in 'record_record_pages', with: fake_record_0.pages
      fieldsets[0].fill_in 'record_record_dewey_decimal_code', with: fake_record_0.dewey_decimal_code
      fieldsets[0].select fake_record_0.book_read_status, from: 'record_record_book_read_status'
      fieldsets[0].select "Partially", from: 'record_record_book_read_status'
      
      
      fake_record_1 = FactoryBot.build :record
      fieldsets[1].fill_in 'record_record_title', with: fake_record_1.title
      fieldsets[1].fill_in 'record_record_author', with: fake_record_1.author
      fieldsets[1].fill_in 'record_record_pages', with: fake_record_1.pages
      fieldsets[1].fill_in 'record_record_dewey_decimal_code', with: fake_record_1.dewey_decimal_code
      fieldsets[1].select fake_record_1.book_read_status, from: 'record_record_book_read_status'
      fieldsets[1].select "Partially", from: 'record_record_book_read_status'
      
      click_button 'submit'

      expect(page.current_path).to eq reports_path
byebug
      expect(page).to have_content 'Total Pages Read'
      expect(page).to have_content 'By Category'

    end
  end

  context 'testing js on screen' do 
    it 'can\'t remove record if only one exist', js: true  do 
      visit root_path
      click_button 'delete'
      
      expect(page).to have_css('fieldset', count: 1)
    end

    it 'can remove a record from the if multiple exist', js: true  do 
      visit root_path

      find('[data-id="add-record-button"]').click
      expect(page).to have_css('fieldset', count: 2)
      
      fieldsets = page.find_all('fieldset')
      within fieldsets[1] do 
        fill_in 'record_record_title', with: "title1"
      end
      within fieldsets[0] do 
        fill_in 'record_record_title', with: "title0"
        click_button 'delete'
      end

      expect(page).to have_css('fieldset', count: 1)
      expect(page).to have_field 'record_record_title', with: "title1"
      expect(page).to have_no_field 'record_record_title', with: "title0"
    end
    
    it 'can add a record from the form', js: true do 
      visit root_path
      expect(page).to have_css('fieldset', count: 1)
      find('[data-id="add-record-button"]').click
      expect(page).to have_css('fieldset', count: 2)
    end
  end
end
