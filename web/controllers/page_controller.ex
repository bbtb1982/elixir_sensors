defmodule ElixirSensors.PageController do
  use ElixirSensors.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
