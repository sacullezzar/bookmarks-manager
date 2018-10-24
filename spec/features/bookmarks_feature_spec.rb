feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.makersacademy.com', 'Makers Academy');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', '???');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google');")

    visit('/bookmarks')

    expect(page).to have_content "Makers Academy"
    expect(page).to have_content "???"
    expect(page).to have_content "Google"
  end
end

feature 'Adding bookmarks' do
  scenario 'A user can add bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/bookmarks')
    click_button('Add')
    fill_in('URL', :with => 'http://www.facebook.com')
    fill_in('Title', :with => 'Facebook')
    click_button('Save')
    click_button('View')

    expect(page).to have_content "Facebook"
  end

  scenario 'A user can add multiple bookmarks' do
    #connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/bookmarks')
    click_button('Add')
    fill_in('URL', :with => 'http://www.facebook.com')
    fill_in('Title', :with => 'Facebook')
    click_button('Save')
    fill_in('URL', :with => 'http://www.github.com')
    fill_in('Title', :with => 'Github')
    click_button('Save')
    click_button('View')

    expect(page).to have_content "Facebook"
    expect(page).to have_content "Github"
  end

  scenario "A user provides a title and URL" do

    #connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/bookmarks')
    click_button('Add')
    fill_in('URL', :with => 'http://www.facebook.com')
    fill_in('Title', :with => 'Facebook')
    click_button('Save')
    click_button('View')
    expect(page).to have_content "Facebook"
  end
end
