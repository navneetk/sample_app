namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Admin",
                         email: "admin@abc.com",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)

    10.times do |i|
        User.create(name: "Person#{i}",
                    email: "person#{i}@abc.com",
                    password: "foobar",
                    password_confirmation: "foobar")
    end

    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end
end