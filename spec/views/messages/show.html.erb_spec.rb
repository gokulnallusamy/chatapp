require 'rails_helper'

RSpec.describe "messages/show", type: :view do
  before(:each) do
    assign(:message, Message.create!(
      content: "MyText",
      conversation: nil,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
