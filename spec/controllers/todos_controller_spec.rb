require_relative "../spec_helper"

def app
  TodosController
end

describe TodosController do
  describe "/todos" do
    before(:each) do
      @todo = Todo.create(name: "Feed the fish", completed: false, due_date: "2018-04-10")
      visit "/todos"
    end

    it "responds with a 200 status code" do
      expect(page.status_code).to eq(200)
    end

    it "has a title of Todos" do
      expect(page.body).to include("<h1>Todos</h1>")
    end

    it "lists todos" do
      expect(page.body).to include("Feed the fish")
    end
  end

  describe "/todos/new" do
    before(:each) do
      visit "/todos/new"
    end

    it "returns a 200 status code" do
      expect(page.status_code).to eq(200)
    end

    it "can create a todo" do
      fill_in "name", with: "Feed the fish"
      check "complete"
      fill_in "date", with: "2018-04-10"
      click_button "Create Todo"
      expect(page.body).to include("Feed the fish")
    end
  end

end