require 'rails_helper'

RSpec.describe "records/index", type: :view do
  before(:each) do
    assign(:records, [
      Record.create!(
        :title => "Title",
        :author => "Author",
        :pages => 2,
        :dewey_decimal_code => "Dewey Decimal Code",
        :read_status => 3
      ),
      Record.create!(
        :title => "Title",
        :author => "Author",
        :pages => 2,
        :dewey_decimal_code => "Dewey Decimal Code",
        :read_status => 3
      )
    ])
  end

  it "renders a list of records" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Dewey Decimal Code".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
