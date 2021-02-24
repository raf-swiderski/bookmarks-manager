feature 'viewing bookmarks' do
    scenario 'viewing bookmarks from the homepage' do
        con = PG.connect :dbname => 'bookmark_manager_test'
        con.exec "INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com')"
        con.exec "INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com')"
        con.exec "INSERT INTO bookmarks (url) VALUES('http://www.google.com')"
        visit '/'
        click_link 'View Bookmarks'
        expect(page).to have_content('google.com')
        expect(page).to have_content('makersacademy')
        expect(page).to have_content('destroyallsoftware')
    end
end
