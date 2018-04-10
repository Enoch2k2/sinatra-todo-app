require_relative "../spec_helper"

describe Todo do
  describe "#name" do
    it "can have a name" do
      todo = Todo.create(name: "Feed the fish", completed: false, due_date: "2018-04-10")
      expect(todo.name).to eq("Feed the fish")
    end

    it "must have a name" do
      todo = Todo.create(completed: false, due_date: "2018-04-10")
      expect(todo).to_not be_valid
    end
  end
end
