# table_names = %w(
#   users
# )

# table_names.each do |table_name|
#   path = Rails.root.join("db/seeds/#{Rails.env}/#{table_name}.rb")

#   # ファイルが存在しない場合はdevelopmentディレクトリを読み込む
#   path = path.sub(Rails.env, "development") unless File.exist?(path)

#   puts "#{table_name}..."
#   require path
# end
10.times do |n|
  name = "user#{n}"
  email = "#{name}@example.com"
  user = User.find_or_initialize_by(email: email, activated: true)

  if user.new_record?
    user.name = name
    user.password = "password"
    user.save!
  end
end

puts "users = #{User.count}"