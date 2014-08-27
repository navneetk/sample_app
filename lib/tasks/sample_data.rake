namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Admin",
                         email: "admin@abc.com",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)

  end
end