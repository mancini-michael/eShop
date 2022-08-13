Given('I am not logged in') do
    visit('http://localhost:3000')
end

Then('I display the items for sale') do
    expect(page).to have_content("In vendita")
end

When('I click on the Register button') do
    click_link_or_button 'Registrati'
end

When('I write my credentials') do
    within find('#sign_up') do
        fill_in 'Nome', with: 'Lorenzo'
        fill_in 'Cognome', with: 'Gizzi'
        fill_in 'Città', with: 'Frosinone'
        fill_in 'CAP', with: '03100'
        fill_in 'Indirizzo', with: 'Via Roma 82'
        fill_in 'Email', with: 'prova1@prova.it'
        fill_in 'Password', with: 'Crodino01'
        fill_in 'Conferma password', with: 'Crodino01'
        click_link_or_button 'Continua'
    end
end

When('I click on the Access button') do
    click_link_or_button 'Accedi'
end
  
When('I write my access_credentials') do
    user = User.create(
        first_name: "Virgilio",
        last_name: "Caiani",
        city: "Terracina",
        zip_code: "00039",
        address: "Via Italcanada 1",
        email: "baia@verde.it",
        password: "weSoFranco1")
    within find('#sign_in') do
        fill_in 'Email', with: 'baia@verde.it'
        fill_in 'Password', with: 'weSoFranco1'
        click_on 'continua'
    end
end

Then('I can be recognized as user') do
    expect(page).to have_content("Signed in successfully.")
end

Then('I become a new User') do
    click_link_or_button 'Profilo'
end

Given('I am logged in') do
    user = User.create(
        first_name: "Virgilio",
        last_name: "Caiani",
        city: "Terracina",
        zip_code: "00039",
        address: "Via Italcanada 1",
        email: "baia@verde.it",
        password: "weSoFranco1")

    visit('http://localhost:3000')
    click_on 'Accedi'
    within find('#sign_in') do
        fill_in 'Email', with: 'baia@verde.it'
        fill_in 'Password', with: 'weSoFranco1'
        click_on 'continua'
    end
end
  
When('I click on the profile button') do
    page.should have_no_content("Wait for the text which is available in the sign in page but not on next page")
    expect(page).to have_content("Signed in successfully.")
end
  
Then('I should display my information') do
    pending # Write code here that turns the phrase above into concrete actions
end