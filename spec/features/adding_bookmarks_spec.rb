feature 'adding bookmarks' do
  scenario 'enter bookmark, see bookmark' do
    visit '/'
    click_button 'Add Bookmark'
    fill_in :url, with: 'http://www.test.com'
    fill_in :title, with: 'Test'
    click_button 'Submit'
    expect(page).to have_link('Test', href: 'http://www.test.com')
  end
end
