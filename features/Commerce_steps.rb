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
        fill_in 'Email', with: 'prova@prova.it'
        fill_in 'Password', with: 'prova'
        fill_in 'Conferma password', with: 'prova'
        click_link_or_button 'Continua'
    end
end

When('I click on the Access button') do
    click_link_or_button 'Accedi'
end
  
When('I write my access_credentials') do
    within find('#sign_in') do
        fill_in 'Email', with: 'prova@prova.it'
        fill_in 'Password', with: 'prova'
        click_link_or_button 'Continua'
    end
end

Then('I can be recognized as user') do
    click_link_or_button 'Profilo'
end

Then('I become a new User') do
    click_link_or_button 'Profilo'
end