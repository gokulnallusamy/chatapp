require 'rails_helper'

RSpec.describe "conversations/show", type: :view do
  before(:each) do
    assign(:conversation, Conversation.create!(
      sender_id: 2,
      receiver_id: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
