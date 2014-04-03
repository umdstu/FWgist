require 'spec_helper'

describe "comments/index" do
  before(:each) do
    assign(:comments, [
      stub_model(Comment,
        :sid => "Sid",
        :classification => "Classification",
        :comment => "MyText"
      ),
      stub_model(Comment,
        :sid => "Sid",
        :classification => "Classification",
        :comment => "MyText"
      )
    ])
  end

  it "renders a list of comments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sid".to_s, :count => 2
    assert_select "tr>td", :text => "Classification".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
