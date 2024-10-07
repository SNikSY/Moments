# lib/tasks/seed.rake
namespace :db do
  desc "Fill the database with sample data"
  task seed_data: :environment do
    require 'faker'

    # Очистка старых данных
puts "Очистка старых данных..."
Like.destroy_all
Comment.destroy_all
Moment.destroy_all
Follow.destroy_all
User.destroy_all


    # Создание пользователей
    puts "Создание пользователей..."
    10.times do
      User.create!(
        username: Faker::Internet.username,
        email: Faker::Internet.email,
        password: "password",
        full_name: Faker::Name.name,
        bio: Faker::Lorem.sentence,
        profile_picture: Faker::Avatar.image,
        last_login: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
      )
    end
    users = User.all

    # Создание моментов (постов)
    puts "Создание моментов..."
    100.times do
      user = users.sample
      Moment.create!(
        user: user,
        content: Faker::Lorem.paragraph(sentence_count: 5),
        created_at: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
        expires_at: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 3)
      )
    end
    moments = Moment.all

    # Создание комментариев к моментам
    puts "Создание комментариев..."
    700.times do
      moment = moments.sample
      user = users.sample
      Comment.create!(
        moment: moment,
        user: user,
        content: Faker::Lorem.sentence,
        created_at: Faker::Time.between(from: moment.created_at, to: DateTime.now)
      )
    end

    # Создание лайков к моментам
    puts "Создание лайков..."
    moments.each do |moment|
      rand(1..100).times do
        user = users.sample
        unless moment.likes.exists?(user: user)
          Like.create!(
            user: user,
            moment: moment,
            created_at: Faker::Time.between(from: moment.created_at, to: DateTime.now)
          )
        end
      end
    end

    # Создание подписок
    puts "Создание подписок..."
    users.each do |user|
      other_users = users.reject { |u| u == user }
      rand(1..1000).times do
        followed_user = other_users.sample
        unless user.following.include?(followed_user)
          Follow.create!(
            follower: user,
            following: followed_user,
            created_at: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now)
          )
        end
      end
    end

    puts "База данных успешно заполнена!"
  end
end
