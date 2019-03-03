FactoryBot.define do
  factory :record do
    title { Faker::Book.title }
    author { Faker::Name.first_name }
    pages { rand(50..900) }
    dewey_decimal_code { "#{rand(0...1000).to_s.rjust(3, '0')}.#{rand(0...1000)}#{('A'..'Z').to_a.sample(3).join}" }
    book_read_status { Record.defined_enums["book_read_status"].keys.sample }
  end
end
