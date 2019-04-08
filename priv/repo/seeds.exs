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

pwhash = Argon2.hash_pwd_salt("password")

Repo.insert!(%User{email: "alice@example.com", password_hash: pwhash, zipcode: "02115"})
Repo.insert!(%User{email: "bob@example.com", password_hash: pwhash, zipcode: "99501"})

alias Weatherdrobe.Activities.Activity
Repo.insert!(%Activity{name: "skiing", indoor?: true, user_id: 1})

alias Weatherdrobe.Outfits.Outfit
Repo.insert!(%Outfit{outfit_type: "sunglasses", rain?: false, snow?: false, sun?: true, temp_low: 30, temp_high: 100, wind?: false, user_id: 1})

alias Weatherdrobe.Calendars.Calendar
Repo.insert!(%Calendar{date: ~N[2019-04-07 21:36:32], activity_id: 1, user_id: 1})

alias Weatherdrobe.Conjunctions.Conjunction
Repo.insert!(%Conjunction{user_id: 1, activity_id: 1, outfit_id: 1})


