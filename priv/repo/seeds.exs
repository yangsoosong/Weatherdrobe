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

Repo.insert!(%User{email: "alice@example.com", password_hash: pwhash, zipcode: "01129"})
Repo.insert!(%User{email: "bob@example.com", password_hash: pwhash, zipcode: "02115", latitude: "42.360081", longitude: "-71.058884"})

alias Weatherdrobe.Activities.Activity
Repo.insert!(%Activity{name: "skiing", indoor?: false, user_id: 1})
Repo.insert!(%Activity{name: "swimming", indoor?: true, user_id: 2})
Repo.insert!(%Activity{name: "work", indoor?: true, user_id: 2})
Repo.insert!(%Activity{name: "football", indoor?: false, user_id: 2})

alias Weatherdrobe.Outfits.Outfit
Repo.insert!(%Outfit{outfit_type: "sunglasses", name: "shades", rain?: false, snow?: false, sun?: true, temp_low: 0, temp_high: 100, wind?: false, user_id: 1})
Repo.insert!(%Outfit{outfit_type: "sunglasses", name: "goggles", rain?: false, snow?: false, sun?: false, temp_low: 0, temp_high: 100, wind?: false, user_id: 2})
Repo.insert!(%Outfit{outfit_type: "pants", name: "swim_trunks", rain?: false, snow?: false, sun?: false, temp_low: 0, temp_high: 100, wind?: false, user_id: 2})
Repo.insert!(%Outfit{outfit_type: "jackets", name: "sports_coat", rain?: false, snow?: false, sun?: false, temp_low: 0, temp_high: 100, wind?: false, user_id: 2})
Repo.insert!(%Outfit{outfit_type: "shirts", name: "dress_shirts", rain?: false, snow?: false, sun?: false, temp_low: 0, temp_high: 100, wind?: false, user_id: 2})
Repo.insert!(%Outfit{outfit_type: "footwear", name: "dress_shoes", rain?: false, snow?: false, sun?: false, temp_low: 0, temp_high: 100, wind?: false, user_id: 2})
Repo.insert!(%Outfit{outfit_type: "pants", name: "slacks", rain?: false, snow?: false, sun?: false, temp_low: 0, temp_high: 100, wind?: false, user_id: 2})
Repo.insert!(%Outfit{outfit_type: "tie", name: "tie", rain?: false, snow?: false, sun?: false, temp_low: 0, temp_high: 100, wind?: false, user_id: 2})
Repo.insert!(%Outfit{outfit_type: "shirts", name: "long_sleeve", rain?: false, snow?: false, sun?: false, temp_low: 25, temp_high: 65, wind?: true, user_id: 2})
Repo.insert!(%Outfit{outfit_type: "shirts", name: "sweat_shirts", rain?: true, snow?: true, sun?: false, temp_low: 25, temp_high: 65, wind?: true, user_id: 2})
Repo.insert!(%Outfit{outfit_type: "pants", name: "jeans", rain?: false, snow?: false, sun?: false, temp_low: 25, temp_high: 65, wind?: false, user_id: 2})
Repo.insert!(%Outfit{outfit_type: "umbrella", name: "umbrella", rain?: true, snow?: true, sun?: false, temp_low: 0, temp_high: 100, wind?: false, user_id: 2})
Repo.insert!(%Outfit{outfit_type: "hats", name: "football_helmet", rain?: false, snow?: false, sun?: false, temp_low: 0, temp_high: 100, wind?: false, user_id: 2})
Repo.insert!(%Outfit{outfit_type: "jackets", name: "winter_coat", rain?: true, snow?: true, sun?: true, temp_low: 0, temp_high: 10, wind?: true, user_id: 2})
Repo.insert!(%Outfit{outfit_type: "shirts", name: "t-shirts", rain?: false, snow?: false, sun?: true, temp_low: 70, temp_high: 100, wind?: false, user_id: 2})

alias Weatherdrobe.Calendars.Calendar
Repo.insert!(%Calendar{date: ~D[2019-04-07], name: "skiing festival", activity_id: 1, user_id: 1})
Repo.insert!(%Calendar{date: ~D[2019-04-08], name: "swimming inside", activity_id: 2, user_id: 2})
Repo.insert!(%Calendar{date: ~D[2019-04-08], name: "workin in the office", activity_id: 2, user_id: 2})

alias Weatherdrobe.Conjunctions.Conjunction
Repo.insert!(%Conjunction{user_id: 2, activity_id: 2, outfit_id: 1})
Repo.insert!(%Conjunction{user_id: 2, activity_id: 2, outfit_id: 2})
Repo.insert!(%Conjunction{user_id: 2, activity_id: 2, outfit_id: 3})
Repo.insert!(%Conjunction{user_id: 2, activity_id: 3, outfit_id: 4})
Repo.insert!(%Conjunction{user_id: 2, activity_id: 3, outfit_id: 5})
Repo.insert!(%Conjunction{user_id: 2, activity_id: 3, outfit_id: 6})
Repo.insert!(%Conjunction{user_id: 2, activity_id: 3, outfit_id: 7})
Repo.insert!(%Conjunction{user_id: 2, activity_id: 3, outfit_id: 8})
Repo.insert!(%Conjunction{user_id: 2, activity_id: 3, outfit_id: 9})

