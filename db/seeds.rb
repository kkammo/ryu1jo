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

u1 = Developer.create! :email => 'student1@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이1"
u2 = Developer.create! :email => 'student2@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이2"
u3 = Developer.create! :email => 'student3@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이3"
u4 = Developer.create! :email => 'student4@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이4"
u5 = Developer.create! :email => 'student5@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이5"
u6 = Developer.create! :email => 'student6@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이6"
u7 = Developer.create! :email => 'student7@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이7"
u8 = Developer.create! :email => 'student8@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이8"
u9 = Developer.create! :email => 'student9@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이9"
u10 = Developer.create! :email => 'student10@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이10"

e = Evaluation.create!

a1 = e.applieds.create! :developer_id => u1.id
a2 = e.applieds.create! :developer_id => u2.id
a3 = e.applieds.create! :developer_id => u3.id
a4 = e.applieds.create! :developer_id => u4.id
a5 = e.applieds.create! :developer_id => u5.id
a6 = e.applieds.create! :developer_id => u6.id
a7 = e.applieds.create! :developer_id => u7.id

puts 'material created'

m0 = Material.create! :subject => "자료0", :content => "abcdefg", :field => 0, :developer_id => u0.id, :prate => 1
m1 = Material.create! :subject => "자료1", :content => "abcdefg", :field => 1, :developer_id => u1.id, :prate => 1
m2 = Material.create! :subject => "자료2", :content => "abcdefg", :field => 2, :developer_id => u2.id, :prate => 1
m3 = Material.create! :subject => "자료3", :content => "abcdefg", :field => 3, :developer_id => u3.id, :prate => 1
m4 = Material.create! :subject => "자료4", :content => "abcdefg", :field => 4, :developer_id => u4.id, :prate => 1
