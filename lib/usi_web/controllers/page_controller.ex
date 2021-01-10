defmodule UsiWeb.PageController do
  use UsiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
