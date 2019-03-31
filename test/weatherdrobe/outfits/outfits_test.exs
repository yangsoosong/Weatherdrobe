defmodule Weatherdrobe.OutfitsTest do
  use Weatherdrobe.DataCase

  alias Weatherdrobe.Outfits

  describe "outfits" do
    alias Weatherdrobe.Outfits.Outfit

    @valid_attrs %{outfit_temp: "some outfit_temp", outfit_type: "some outfit_type", rain?: true, snow?: true, sun?: true, wind?: true}
    @update_attrs %{outfit_temp: "some updated outfit_temp", outfit_type: "some updated outfit_type", rain?: false, snow?: false, sun?: false, wind?: false}
    @invalid_attrs %{outfit_temp: nil, outfit_type: nil, rain?: nil, snow?: nil, sun?: nil, wind?: nil}

    def outfit_fixture(attrs \\ %{}) do
      {:ok, outfit} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Outfits.create_outfit()

      outfit
    end

    test "list_outfits/0 returns all outfits" do
      outfit = outfit_fixture()
      assert Outfits.list_outfits() == [outfit]
    end

    test "get_outfit!/1 returns the outfit with given id" do
      outfit = outfit_fixture()
      assert Outfits.get_outfit!(outfit.id) == outfit
    end

    test "create_outfit/1 with valid data creates a outfit" do
      assert {:ok, %Outfit{} = outfit} = Outfits.create_outfit(@valid_attrs)
      assert outfit.outfit_temp == "some outfit_temp"
      assert outfit.outfit_type == "some outfit_type"
      assert outfit.rain? == true
      assert outfit.snow? == true
      assert outfit.sun? == true
      assert outfit.wind? == true
    end

    test "create_outfit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Outfits.create_outfit(@invalid_attrs)
    end

    test "update_outfit/2 with valid data updates the outfit" do
      outfit = outfit_fixture()
      assert {:ok, %Outfit{} = outfit} = Outfits.update_outfit(outfit, @update_attrs)
      assert outfit.outfit_temp == "some updated outfit_temp"
      assert outfit.outfit_type == "some updated outfit_type"
      assert outfit.rain? == false
      assert outfit.snow? == false
      assert outfit.sun? == false
      assert outfit.wind? == false
    end

    test "update_outfit/2 with invalid data returns error changeset" do
      outfit = outfit_fixture()
      assert {:error, %Ecto.Changeset{}} = Outfits.update_outfit(outfit, @invalid_attrs)
      assert outfit == Outfits.get_outfit!(outfit.id)
    end

    test "delete_outfit/1 deletes the outfit" do
      outfit = outfit_fixture()
      assert {:ok, %Outfit{}} = Outfits.delete_outfit(outfit)
      assert_raise Ecto.NoResultsError, fn -> Outfits.get_outfit!(outfit.id) end
    end

    test "change_outfit/1 returns a outfit changeset" do
      outfit = outfit_fixture()
      assert %Ecto.Changeset{} = Outfits.change_outfit(outfit)
    end
  end

  describe "outfits" do
    alias Weatherdrobe.Outfits.Outfit

    @valid_attrs %{outfit_type: "some outfit_type", rain?: true, snow?: true, sun?: true, temp_high: 42, temp_low: 42, wind?: true}
    @update_attrs %{outfit_type: "some updated outfit_type", rain?: false, snow?: false, sun?: false, temp_high: 43, temp_low: 43, wind?: false}
    @invalid_attrs %{outfit_type: nil, rain?: nil, snow?: nil, sun?: nil, temp_high: nil, temp_low: nil, wind?: nil}

    def outfit_fixture(attrs \\ %{}) do
      {:ok, outfit} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Outfits.create_outfit()

      outfit
    end

    test "list_outfits/0 returns all outfits" do
      outfit = outfit_fixture()
      assert Outfits.list_outfits() == [outfit]
    end

    test "get_outfit!/1 returns the outfit with given id" do
      outfit = outfit_fixture()
      assert Outfits.get_outfit!(outfit.id) == outfit
    end

    test "create_outfit/1 with valid data creates a outfit" do
      assert {:ok, %Outfit{} = outfit} = Outfits.create_outfit(@valid_attrs)
      assert outfit.outfit_type == "some outfit_type"
      assert outfit.rain? == true
      assert outfit.snow? == true
      assert outfit.sun? == true
      assert outfit.temp_high == 42
      assert outfit.temp_low == 42
      assert outfit.wind? == true
    end

    test "create_outfit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Outfits.create_outfit(@invalid_attrs)
    end

    test "update_outfit/2 with valid data updates the outfit" do
      outfit = outfit_fixture()
      assert {:ok, %Outfit{} = outfit} = Outfits.update_outfit(outfit, @update_attrs)
      assert outfit.outfit_type == "some updated outfit_type"
      assert outfit.rain? == false
      assert outfit.snow? == false
      assert outfit.sun? == false
      assert outfit.temp_high == 43
      assert outfit.temp_low == 43
      assert outfit.wind? == false
    end

    test "update_outfit/2 with invalid data returns error changeset" do
      outfit = outfit_fixture()
      assert {:error, %Ecto.Changeset{}} = Outfits.update_outfit(outfit, @invalid_attrs)
      assert outfit == Outfits.get_outfit!(outfit.id)
    end

    test "delete_outfit/1 deletes the outfit" do
      outfit = outfit_fixture()
      assert {:ok, %Outfit{}} = Outfits.delete_outfit(outfit)
      assert_raise Ecto.NoResultsError, fn -> Outfits.get_outfit!(outfit.id) end
    end

    test "change_outfit/1 returns a outfit changeset" do
      outfit = outfit_fixture()
      assert %Ecto.Changeset{} = Outfits.change_outfit(outfit)
    end
  end
end
