# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c1 = Company.create! :name => "freelancer"

# puts 'SETTING UP ADMIN USER'
# user = User.create! :student_id => '001234', :user_name => 'admin', :email => 'admin@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :permit => true, :role => 'admin'
puts 'New user created: ' << c1.name

admin = Developer.create! :email => 'admin@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "관리자", :admin => true, :field => 0

u1 = Developer.create! :email => 'student1@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이1", :field => 0
u2 = Developer.create! :email => 'student2@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이2", :field => 0

e = Evaluation.create! :appliable => false

a1 = e.applieds.create! :developer_id => u1.id

puts 'material created'

m1 = Material.create! :subject => "자료0", :content => "abcdefg", :field => 0, :developer_id => u1.id, :prate => 1
m2 = Material.create! :subject => "자료1", :content => "abcdefg", :field => 1, :developer_id => u2.id, :prate => 1

g1 = RateeGroup.create! :evaluation_id => e.id
g2 = RaterGroup.create! :evaluation_id => e.id

s1 = e.selecteds.create! :developer_id => u2.id

m = Mapping.create! :ratee_group_id => g1.id, :rater_group_id => g2.id, :evaluation_id => e.id

a1.ratee_group_id = g1.id
a1.save
s1.rater_group_id = g2.id
s1.save

