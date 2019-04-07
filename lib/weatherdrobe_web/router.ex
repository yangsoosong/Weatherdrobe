defmodule WeatherdrobeWeb.Router do
  use WeatherdrobeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug WeatherdrobeWeb.Plugs.FetchSession
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WeatherdrobeWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/home", PageController, :home
    resources "/users", UserController
    resources "/outfits", OutfitController
    resources "/activities", ActivityController
    resources "/conjunctions", ConjunctionController
    resources "/calendars", CalendarController
    resources "/sessions", SessionController, only: [:create, :delete], singelton: true
  end

  # Other scopes may use custom stacks.
  # scope "/api", WeatherdrobeWeb do
  #   pipe_through :api
  # end
end
