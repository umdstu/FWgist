require 'spec_helper'

describe "comments/show" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :sid => "Sid",
      :classification => "Classification",
      :comment => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Sid/)
    rendered.should match(/Classification/)
    rendered.should match(/MyText/)
  end
end
