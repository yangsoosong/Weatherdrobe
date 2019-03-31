defmodule Weatherdrobe.ConjunctionsTest do
  use Weatherdrobe.DataCase

  alias Weatherdrobe.Conjunctions

  describe "conjunctions" do
    alias Weatherdrobe.Conjunctions.Conjunction

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def conjunction_fixture(attrs \\ %{}) do
      {:ok, conjunction} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Conjunctions.create_conjunction()

      conjunction
    end

    test "list_conjunctions/0 returns all conjunctions" do
      conjunction = conjunction_fixture()
      assert Conjunctions.list_conjunctions() == [conjunction]
    end

    test "get_conjunction!/1 returns the conjunction with given id" do
      conjunction = conjunction_fixture()
      assert Conjunctions.get_conjunction!(conjunction.id) == conjunction
    end

    test "create_conjunction/1 with valid data creates a conjunction" do
      assert {:ok, %Conjunction{} = conjunction} = Conjunctions.create_conjunction(@valid_attrs)
    end

    test "create_conjunction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Conjunctions.create_conjunction(@invalid_attrs)
    end

    test "update_conjunction/2 with valid data updates the conjunction" do
      conjunction = conjunction_fixture()
      assert {:ok, %Conjunction{} = conjunction} = Conjunctions.update_conjunction(conjunction, @update_attrs)
    end

    test "update_conjunction/2 with invalid data returns error changeset" do
      conjunction = conjunction_fixture()
      assert {:error, %Ecto.Changeset{}} = Conjunctions.update_conjunction(conjunction, @invalid_attrs)
      assert conjunction == Conjunctions.get_conjunction!(conjunction.id)
    end

    test "delete_conjunction/1 deletes the conjunction" do
      conjunction = conjunction_fixture()
      assert {:ok, %Conjunction{}} = Conjunctions.delete_conjunction(conjunction)
      assert_raise Ecto.NoResultsError, fn -> Conjunctions.get_conjunction!(conjunction.id) end
    end

    test "change_conjunction/1 returns a conjunction changeset" do
      conjunction = conjunction_fixture()
      assert %Ecto.Changeset{} = Conjunctions.change_conjunction(conjunction)
    end
  end
end
