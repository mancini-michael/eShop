Given('I am not logged in') do
    user = User.create(
        first_name: "Franco",
        last_name: "Ciccarelli",
        city: "Terracina",
        zip_code: "00042",
        address: "Via Baia 96",
        email: "lorenzo.blu@gmail.com",
        password: "password")
    
    seller = Seller.create(user: user)

    insertion = Insertion.new(
      seller: seller,
      title: "Iphone 13",
      description: "Iphone 13 by Apple California",
      price: 895,
      categories: 3
    )
    insertion.image.attach(io: File.open("db/seeds/iphone-13.jfif"), filename: "iphone-13.jpg")
    insertion.save
    visit('http://localhost:3000')
end

Then('I display the items for sale') do
    expect(page).to have_content("In vendita")
end

When('I click any insertion') do
    within find('#carousel') do
        click_on 'Visualizza'
    end
end

Then('I display the information of item') do
    expect(page).to have_content("Posizione del venditore")
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
    
    user_2 = User.create(
        first_name: "Franco",
        last_name: "Ciccarelli",
        city: "Terracina",
        zip_code: "00042",
        address: "Via Baia 96",
        email: "lorenzo.blu@gmail.com",
        password: "password")
        
    seller = Seller.create(user: user_2)
    
    insertion = Insertion.new(
        seller: seller,
        title: "Iphone 13",
        description: "Iphone 13 by Apple California",
        price: 895,
        categories: 3
    )
    insertion.image.attach(io: File.open("db/seeds/iphone-13.jfif"), filename: "iphone-13.jpg")
    insertion.save

    visit('http://localhost:3000')
    click_on 'Accedi'
    within find('#sign_in') do
        fill_in 'Email', with: 'baia@verde.it'
        fill_in 'Password', with: 'weSoFranco1'
        click_on 'continua'
    end
end
  
When('I click on the profile button') do
    click_on 'Profilo'
end
  
Then('I should display my information') do
    expect(page).to have_content("Virgilio Caiani")
end

When('I click on the purchases button') do
    click_on 'Acquisti'
end
  
Then('I display my purchases') do
    expect(page).to have_content("I tuoi acquisti")
end

When('I click on the change button') do
    click_on 'modifica'
end
  
Then('I can change my password') do
    within find('#edit_registration') do
        fill_in 'Password', with: 'weSoFranco'
        fill_in 'Conferma password', with: 'weSoFranco'
        click_on 'Continua'
    end
end

Given('I am logged in as a seller') do
    user = User.create(
        first_name: "Virgilio",
        last_name: "Caiani",
        city: "Terracina",
        zip_code: "00039",
        address: "Via Italcanada 1",
        email: "baia@verde.it",
        password: "weSoFranco1")
    
    user_2 = User.create(
        first_name: "Franco",
        last_name: "Ciccarelli",
        city: "Terracina",
        zip_code: "00042",
        address: "Via Baia 96",
        email: "lorenzo.blu@gmail.com",
        password: "password")
        
    seller = Seller.create(user: user_2)
    
    insertion = Insertion.new(
        seller: seller,
        title: "Iphone 13",
        description: "Iphone 13 by Apple California",
        price: 895,
        categories: 3
    )
    insertion.image.attach(io: File.open("db/seeds/iphone-13.jfif"), filename: "iphone-13.jpg")
    insertion.save

    visit('http://localhost:3000')
    click_on 'Accedi'
    within find('#sign_in') do
        fill_in 'Email', with: 'lorenzo.blu@gmail.com'
        fill_in 'Password', with: 'password'
        click_on 'continua'
    end
end

When('I click write the item\'s name in the search bar') do
    within first('#search') do
        fill_in 'Cerca', with: 'iphone 12'
    end
end

When('I press the search button') do
    within first('#search') do
        click_on 'Submit'
    end
end

Then('I display that item') do
    expect(page).to have_content("iphone 12")
end

When('I click any seller') do
    within first('#carousel') do
        click_on 'Franco Ciccarelli'
    end
end
  
Then('I display the page of seller') do
    expect(page).to have_content("Franco Ciccarelli")
end

When('I click on the {string}') do |string|
    click_on 'Diventa un venditore'
end
  
Then('I can change my role') do
    expect(page).to have_button("Fai una pausa dalle vendite")
end

When('I click on the plus button') do
    click_on 'Visualizza'
    click_on 'add_cart'
end
  
Then('I display that item in the shopping cart') do
    click_on 'Carrello'
    expect(page).to have_content("Iphone 13")
end

When('I display the shopping cart') do
    click_on 'Visualizza'
    click_on 'add_cart'
    click_on 'Carrello'
end
  
When('I click on the minus button') do
    click_on 'remove_cart'
end
  
Then('I should remove that item from the shopping cart') do
    click_on 'Carrello'
    page.should_not have_content("Iphone 13")
end

When('I click on a seller\'s name') do
    within first('#carousel') do
        click_on 'Franco Ciccarelli'
    end
end

When('I click on the review button') do
    click_on 'review'
end

When('I fill the form') do
    within first('#review_form') do
        fill_in 'Rating', with: '3'
        click_on 'Continua'
    end
end

Then('I should see my review') do
    page.should have_content("Virgilio Caiani")
end

When('I fill the form for my question') do
    within first('#question_form') do
        fill_in 'question_area', with: 'Funziona?'
        click_on 'Invia'
    end
end
  
Then('I should see my question') do
    page.should have_content("Funziona?")
end

When('I click on {string}') do |string|
    click_on 'Prenota un incontro'
end
  
When('I fill the meeting form') do
    within first('#meeting_form') do
        fill_in 'date', with: '28/08/2022 04:10'
        fill_in 'Place', with: 'Alatri'
        click_on 'Prenota'
    end
end
  
Then('I should have organized a meeting') do
    expect(page).to have_content("Prenotazioni")
    expect(page).to have_content("Iphone 13")
end

When('I click on Fai una pausa dalle vendite') do
    click_on 'Fai una pausa dalle vendite'
end
  
Then('I bacame an user') do
    expect(page).to have_button("Diventa un venditore")
end

When('I click on Visualizza annunci') do
    click_on 'Visualizza annunci'
end
  
Then('I should display my selling list') do
    expect(page).to have_content("Annunci")
end

When('I click on the button to add an item for sale') do
    click_on 'aggiungi_elemento'
end

When('I fill the form to add the item') do
    within first('#new_insertion_form') do
        fill_in 'Title', with: 'Prova'
        fill_in 'Price', with: '10'
        fill_in 'Description', with: 'prova'
        page.attach_file 'Image', File.join(Rails.root, 'db/seeds/iphone-12.jfif')
        click_on 'Continua'
    end
end
  
Then('I should see that item in my selling list') do
    expect(page).to have_content("Prova")
end

When('the seller change place and hour') do
    visit('http://localhost:3000')
    click_on 'Esci'
    click_on 'Accedi'
    within first('#sign_in') do
        fill_in 'Email', with: 'lorenzo.blu@gmail.com'
        fill_in 'Password', with: 'password'
        click_on 'continua'
    end
    click_on 'Prenotazioni'
    click_on 'Modifica'
    within first('#change_meeting') do
        fill_in 'date', with: '29/09/2022 12:05'
        fill_in 'Place', with: 'Tecchiena'
        click_on 'Aggiorna'
    end
end
  
Then('I can accept the changes') do
    visit('http://localhost:3000')
    click_on 'Esci'
    click_on 'Accedi'
    within first('#sign_in') do
        fill_in 'Email', with: 'baia@verde.it'
        fill_in 'Password', with: 'weSoFranco1'
        click_on 'continua'
    end
    click_on 'Prenotazioni'
    click_on 'Accetta'
end

Then('I can decline the changes') do
    visit('http://localhost:3000')
    click_on 'Esci'
    click_on 'Accedi'
    within first('#sign_in') do
        fill_in 'Email', with: 'baia@verde.it'
        fill_in 'Password', with: 'weSoFranco1'
        click_on 'continua'
    end
    click_on 'Prenotazioni'
    click_on 'Modifica'
    within first('#change_meeting') do
        fill_in 'date', with: '30/09/2022 12:05'
        fill_in 'Place', with: 'Tecchiena'
        click_on 'Aggiorna'
    end
end

When('I sell an item') do
    visit('http://localhost:3000')
    click_on 'Esci'
    click_on 'Accedi'
    within first('#sign_in') do
        fill_in 'Email', with: 'baia@verde.it'
        fill_in 'Password', with: 'weSoFranco1'
        click_on 'continua'
    end
    click_on 'Visualizza'
    click_on 'Prenota un incontro'
    within first('#meeting_form') do
        fill_in 'date', with: '28/08/2022 04:10'
        fill_in 'Place', with: 'Alatri'
        click_on 'Prenota'
    end
    visit('http://localhost:3000')
    click_on 'Esci'
    click_on 'Accedi'
    within first('#sign_in') do
        fill_in 'Email', with: 'lorenzo.blu@gmail.com'
        fill_in 'Password', with: 'password'
        click_on 'continua'
    end
    click_on 'Prenotazioni'
    click_on 'Concludi'
end
  
Then('I should display that item in my sold list') do
    click_on 'Profilo'
    expect(page).to have_content("Articoli venduti")
end

When('I click on the button to remove an item for sale') do
    click_on 'Profilo'
    click_on 'Elimina'
end
  
Then('I should not see that item in my selling list') do
    page.should_not have_content("Iphone 13")
end
  
When('I click on an item in my selling list') do
    visit('http://localhost:3000')
    click_on 'Esci'
    click_on 'Accedi'
    within first('#sign_in') do
        fill_in 'Email', with: 'baia@verde.it'
        fill_in 'Password', with: 'weSoFranco1'
        click_on 'continua'
    end
    click_on 'Visualizza'
    within first('#question_form') do
        fill_in 'question_area', with: 'Funziona?'
        click_on 'Invia'
    end
    visit('http://localhost:3000')
    click_on 'Esci'
    click_on 'Accedi'
    within first('#sign_in') do
        fill_in 'Email', with: 'lorenzo.blu@gmail.com'
        fill_in 'Password', with: 'password'
        click_on 'continua'
    end
    click_on 'Profilo'
    click_on 'show_insertion'
end
  
When('I display the question I received for that item') do
    page.should have_content("Funziona?")
end
  
Then('I can answer to it') do
    click_on 'Rispondi alla domanda'
end

Then('I should display the reviews I received') do
    page.should have_content("Recensioni")
end

When('I click on Prenotazioni') do
    visit('http://localhost:3000')
    click_on 'Esci'
    click_on 'Accedi'
    within first('#sign_in') do
        fill_in 'Email', with: 'baia@verde.it'
        fill_in 'Password', with: 'weSoFranco1'
        click_on 'continua'
    end
    click_on 'Visualizza'
    click_on 'Prenota un incontro'
    within first('#meeting_form') do
        fill_in 'date', with: '28/08/2022 04:10'
        fill_in 'Place', with: 'Alatri'
        click_on 'Prenota'
    end
    visit('http://localhost:3000')
    click_on 'Esci'
    click_on 'Accedi'
    within first('#sign_in') do
        fill_in 'Email', with: 'lorenzo.blu@gmail.com'
        fill_in 'Password', with: 'password'
        click_on 'continua'
    end
    click_on 'Prenotazioni'
end
  
Then('I should decline meeting place and hour') do
    click_on 'Modifica'
    within first('#change_meeting') do
        fill_in 'date', with: '30/09/2022 12:05'
        fill_in 'Place', with: 'Tecchiena'
        click_on 'Aggiorna'
    end
end

Then('I should accept meeting place and hour') do
    click_on 'Accetta'
end

Then('I should conclude the sale') do
    click_on 'Concludi'
end
  