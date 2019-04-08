defmodule Weatherdrobe.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password_hash, :string
    field :zipcode, :string

    field :password, :string, virtual: true
    # field :password_confirmation, :string, virtual: true

    field :latitude, :string
    field :longitude, :string

    has_many :conjunction, Weatherdrobe.Conjunctions.Conjunction
    has_many :outfit, Weatherdrobe.Outfits.Outfit
    has_many :activity, Weatherdrobe.Activities.Activity
    has_many :calendar, Weatherdrobe.Calendars.Calendar

    timestamps()
  end
 
  @doc false
  
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :zipcode])
    |> validate_confirmation(:password)
    |> validate_password(:password)
    |> put_pass_hash()
    |> validate_required([:email, :password_hash, :zipcode])
  end

# Password validation
# From Comeonin docs
  def validate_password(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, password ->
      case valid_password?(password) do
        {:ok, _} -> []
        {:error, msg} -> [{field, options[:message] || msg}]
      end
    end)
  end


  def put_pass_hash(%Ecto.Changeset{
    valid?: true, changes: %{password: password}} = changeset) do
      change(changeset, Comeonin.Argon2.add_hash(password))
    end

    def put_pass_hash(changeset), do: changeset


    
    def valid_password?(password) when byte_size(password) > 4 do
      {:ok, password}
    end
    
    def valid_password?(_), do: {:error, "The password is too short"}
end

'''
@doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password_hash, :zipcode])
    |> validate_required([:email, :password_hash, :zipcode])
  end
  end
  '''
