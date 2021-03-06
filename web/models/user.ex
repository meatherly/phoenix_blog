defmodule PhoenixBlog.User do
  use PhoenixBlog.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :bio, :string
    field :number_of_pets, :integer
    has_many :cars, PhoenixBlog.Car

    timestamps
  end

  @required_fields ~w(name email bio number_of_pets)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
