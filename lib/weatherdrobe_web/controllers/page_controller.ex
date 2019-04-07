defmodule WeatherdrobeWeb.PageController do
  use WeatherdrobeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
  def home(conn, _params) do
    render(conn, "home.html")
  end
end
