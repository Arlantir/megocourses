require 'rails_helper'

RSpec.describe "lessons/index", type: :view do
  before(:each) do
    assign(:lessons, [
      Lesson.create!(
        title: "Title",
        content: "MyText",
        course: nil
      ),
      Lesson.create!(
        title: "Title",
        content: "MyText",
        course: nil
      )
    ])
  end

  it "renders a list of lessons" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
