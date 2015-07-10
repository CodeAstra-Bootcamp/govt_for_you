# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

emails = ["citizen@mygovt.herokuapp.com", "anothercitizen@mygovt.herokuapp.com"]
emails.each do |email|
  User.find_or_create_by(email: email) do |usr|
    usr.password = "secret123"
    usr.password_confirmation = "secret123"
  end
end

User.all.each do |usr|
  usr.confirm!
end


usr = User.where(email: "anothercitizen@mygovt.herokuapp.com").first
(1..16).each do |i|
  appeal = usr.appeals.new
  appeal.subject = "Public Appeal #{i}"
  appeal.description = "Public Appeal Description #{i}"
  appeal.appeal_type = Appeal::AppealType.all.sample.code
  appeal.department = Appeal::Department.all.sample.code
  appeal.private = false
  appeal.save!
end