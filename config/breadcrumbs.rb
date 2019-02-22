crumb :root do
  link "メルカリ", root_path
end

# user#show
crumb :users do
  link "マイページ", user_path(current_user)
  parent :root
end
# profiles#edit
crumb :profiles do
  link "プロフィール", edit_user_profile_path
  parent :users
end
# profiles#show
crumb :profiles_show do |user|
  link user.nickname, user_profile_path
  parent :root
end
# identifications#edit
crumb :identifications do
  link "本人情報の登録", edit_user_identification_path
  parent :users
end
# logout#show
crumb :logout do
  link "ログアウト", user_logout_path
  parent :users
end

# products#show
crumb :product do |product|
  link product.name, product_path
  parent :root
end
