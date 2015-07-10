# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pans = ["abcde12345", "12345abxyz"]
pans.each do |pan|
  User.find_or_create_by(pan: pan) do |usr|
    usr.email = "citizen_#{pan}@mygovt.com"
    usr.password = "secret123"
    usr.password_confirmation = "secret123"
  end
end

User.all.each do |usr|
  usr.confirm!
end


usr = User.where(pan: "12345abxyz").first
(1..16).each do |i|
  appeal = usr.appeals.new
  appeal.subject = "Public Appeal #{i}"
  appeal.description = "Public Appeal Description #{i}"
  appeal.appeal_type = Appeal::AppealType.all.sample.code
  appeal.department = Appeal::Department.all.sample.code
  appeal.private = false
  appeal.save!
end