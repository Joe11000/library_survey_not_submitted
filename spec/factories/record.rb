FactoryBot.define do
  factory :record do
    title { Faker::Book.title }
    author { Faker::Name.first_name }
    pages { rand(50..900) }
    dewey_decimal_code { rand(0...1000)}
    book_read_status { Record.defined_enums["book_read_status"].keys.sample }
  end
end
