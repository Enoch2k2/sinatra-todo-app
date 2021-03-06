class TodosController < ApplicationController

  # GET: /todos
  get "/todos" do
    @todos = Todo.all
    erb :"/todos/index.html"
  end

  # GET: /todos/new
  get "/todos/new" do
    erb :"/todos/new.html"
  end

  # POST: /todos
  post "/todos" do
    todo = Todo.new(params[:todo])
    if todo.save
      redirect "/todos"
    else
      redirect "/todos/new"
    end
  end

  # GET: /todos/5
  get "/todos/:id" do
    erb :"/todos/show.html"
  end

  # GET: /todos/5/edit
  get "/todos/:id/edit" do
    erb :"/todos/edit.html"
  end

  # PATCH: /todos/5
  patch "/todos/:id" do
    redirect "/todos/:id"
  end

  # DELETE: /todos/5/delete
  delete "/todos/:id/delete" do
    redirect "/todos"
  end
end
