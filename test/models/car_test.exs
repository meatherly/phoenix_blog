defmodule PhoenixBlog.CarTest do
  use PhoenixBlog.ModelCase

  alias PhoenixBlog.Car

  @valid_attrs %{name: "some content", user: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Car.changeset(%Car{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Car.changeset(%Car{}, @invalid_attrs)
    refute changeset.valid?
  end
end
