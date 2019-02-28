require 'rails_helper'

RSpec.describe "records/show", type: :view do
  before(:each) do
    @record = assign(:record, Record.create!(
      :title => "Title",
      :author => "Author",
      :pages => 2,
      :dewey_decimal_code => "Dewey Decimal Code",
      :read_status => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Dewey Decimal Code/)
    expect(rendered).to match(/3/)
  end
end
