defmodule PhoenixBlog.CarController do
  use PhoenixBlog.Web, :controller
  alias PhoenixBlog.User
  alias PhoenixBlog.Car

  plug :find_user
  plug :action
  

  def index(conn, %{"user_id" => user_id}) do
    user = conn.assigns.user
    cars = Repo.all assoc(user, :cars)

    render conn, cars: cars, user: user
  end

  def new(conn, %{"user_id" => user_id}) do
    user = conn.assigns.user
    car = Ecto.Model.build(user, :cars)
    changeset = Car.changeset(car)
    render conn, changeset: changeset
  end

  def create(conn, %{"car" => car_params}) do
    new_car = Ecto.Model.build(conn.assigns.user, :cars)
    changeset = Car.changeset(new_car, car_params)
    if changeset.valid? do
      Repo.insert(changeset)
      
      conn
        |> put_flash(:info, "Car has be successfully created.")
        |> redirect(to: user_car_path(conn, :index, conn.assigns.user))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  defp find_user(conn, _) do
    user = Repo.get(User, conn.params["user_id"])
    assign(conn, :user, user)
  end

end