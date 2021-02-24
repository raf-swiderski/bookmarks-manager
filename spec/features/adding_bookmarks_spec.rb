feature 'adding bookmarks' do
  scenario 'enter bookmark, see bookmark' do
    visit '/'
    click_button 'Add Bookmark'
    fill_in :url, with: 'http://www.test.com'
    click_button 'Submit'
    expect(page).to have_content('http://www.test.com')
  end
end
