require 'spec_helper'

describe "comments/edit" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :sid => "MyString",
      :classification => "MyString",
      :comment => "MyText"
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path(@comment), :method => "post" do
      assert_select "input#comment_sid", :name => "comment[sid]"
      assert_select "input#comment_classification", :name => "comment[classification]"
      assert_select "textarea#comment_comment", :name => "comment[comment]"
    end
  end
end
