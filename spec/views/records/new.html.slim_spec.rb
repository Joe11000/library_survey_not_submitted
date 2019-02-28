require 'rails_helper'

RSpec.describe "records/new", type: :view do
  before(:each) do
    assign(:record, Record.new(
      :title => "MyString",
      :author => "MyString",
      :pages => 1,
      :dewey_decimal_code => "MyString",
      :read_status => 1
    ))
  end

  it "renders new record form" do
    render

    assert_select "form[action=?][method=?]", records_path, "post" do

      assert_select "input[name=?]", "record[title]"

      assert_select "input[name=?]", "record[author]"

      assert_select "input[name=?]", "record[pages]"

      assert_select "input[name=?]", "record[dewey_decimal_code]"

      assert_select "input[name=?]", "record[read_status]"
    end
  end
end
