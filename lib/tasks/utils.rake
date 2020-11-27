namespace :utils do
  desc "Popoular banco de dados."
  task seed: :environment do
    puts "Gerando os tipos de contato (Kinds)..."
    Kind.create!([{description: "Amigo"}, {description: "Contato"}, {description: "Comercial"}])
    puts "Gerando os tipos de contato (Kinds)...[OK]"

    puts "Gerando os contato (Contacts)..."
    10.times do |i|
      Contact.create!(name: Faker::Name.name, email: Faker::Internet.email, kind: Kind.all.sample, rmk: Faker::Lorem.paragraph(sentence_count: [1,2,3,4,5].sample))
    end
    puts "Gerando os contato (Contatcs)...[OK]"

    puts "Gerando os endereços (Addresses)..."
      Contact.all.each do |contact|
        Address.create!(street: Faker::Address.street_address, city:Faker::Address.city, state:Faker::Address.state_abbr, contact: contact)
      end
    puts "Gerando os endereços (Addresses)... [OK]"

    puts "Gerando os telefones (Phones)..."
      Contact.all.each do |contact|
        Random.rand(1..5).times do |i|
          Phone.create!(phone: Faker::PhoneNumber.phone_number, contact: contact)
        end
      end
    puts "Gerando os telefones (Phones)...[OK]"

  end

end
