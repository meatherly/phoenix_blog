defmodule PhoenixBlog.HelloController do
	use PhoenixBlog.Web, :controller

	plug :action
  # plug :respond_with

	def index(conn, _params) do
		render conn, :index
	end

  def show(conn, %{"messenger" => messenger, "butts" => butts}) do
    IO.puts "3"
    # render conn
    render conn, :show, messenger: messenger, dicks: butts
  end

  def show(conn, %{"dicks" => dicks, "messenger" => messenger}) do
    IO.puts "2"
    render conn, :show, messenger: messenger, dicks: dicks
  end

  def show(conn, %{"messenger" => messenger}) do
    IO.puts "1"
    render conn, messenger: messenger
  end  

end