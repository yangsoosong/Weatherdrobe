# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Weatherdrobe.Repo.insert!(%Weatherdrobe.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Weatherdrobe.Repo
alias Weatherdrobe.Users.User

pwhash = ARgon2.hash_pwd_salt("password")

Repo.insert!(%User{email: "alice@example.com", password: pwhash, zipcode: "02115"})
Repo.insert!(%User{email: "bob@example.com", password: pwhash, zipcode: "99501"})

