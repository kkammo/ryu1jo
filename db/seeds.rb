# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c1 = Company.create! :name => "freelancer"
c2 = Company.create! :name => "LG"
c3 = Company.create! :name => "Yonsei"

# puts 'SETTING UP ADMIN USER'
# user = User.create! :student_id => '001234', :user_name => 'admin', :email => 'admin@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :permit => true, :role => 'admin'
puts 'New user created: ' << c1.name
puts 'New user created: ' << c2.name
puts 'New user created: ' << c3.name


u1 = Developer.create! :email => 'student1@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이1", :field => 0
u2 = Developer.create! :email => 'student2@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이2", :field => 0
u3 = Developer.create! :email => 'student3@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c2.name, :name => "개똥이3", :field => 0
u4 = Developer.create! :email => 'student4@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c2.name, :name => "개똥이4", :field => 0
u5 = Developer.create! :email => 'student5@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c2.name, :name => "개똥이5", :field => 0
u6 = Developer.create! :email => 'student6@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c2.name, :name => "개똥이6", :field => 0
u7 = Developer.create! :email => 'student7@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c2.name, :name => "개똥이7", :field => 0
u8 = Developer.create! :email => 'student8@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c2.name, :name => "개똥이8", :field => 0
u9 = Developer.create! :email => 'student9@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c2.name, :name => "개똥이9", :field => 0
u10 = Developer.create! :email => 'student10@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c3.name, :name => "개똥이10", :field => 0
u11 = Developer.create! :email => 'student11@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c3.name, :name => "개똥이11", :field => 0
u12 = Developer.create! :email => 'student12@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c3.name, :name => "개똥이12", :field => 0
u13 = Developer.create! :email => 'student13@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c3.name, :name => "개똥이13", :field => 0
u14 = Developer.create! :email => 'student14@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c3.name, :name => "개똥이14", :field => 0
u15 = Developer.create! :email => 'student15@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c3.name, :name => "개똥이15", :field => 0
u16 = Developer.create! :email => 'student16@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이16", :field => 0
u17 = Developer.create! :email => 'student17@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이17", :field => 0
u18 = Developer.create! :email => 'student18@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이18", :field => 0
u19 = Developer.create! :email => 'student19@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이19", :field => 0
u20 = Developer.create! :email => 'student20@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이20", :field => 0
u21 = Developer.create! :email => 'student21@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이21", :field => 0
u22 = Developer.create! :email => 'student22@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이22", :field => 0
u23 = Developer.create! :email => 'student23@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이23", :field => 0
u24 = Developer.create! :email => 'student24@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이24", :field => 0
u25 = Developer.create! :email => 'student25@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이25", :field => 0
u26 = Developer.create! :email => 'student26@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이26", :field => 0
u27 = Developer.create! :email => 'student27@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이27", :field => 0
u28 = Developer.create! :email => 'student28@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이28", :field => 0
u29 = Developer.create! :email => 'student29@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이29", :field => 0
u30 = Developer.create! :email => 'student30@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "개똥이30", :field => 0


a1 = Developer.create! :email => 'admin@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name, :name => "관리자", :admin =>true, :field => 0

e = Evaluation.create! :appliable => false 

a1 = e.applieds.create! :developer_id => u1.id

puts 'material created'

m1 = Material.create! :subject => "자료0", :content => "abcdefg", :field => 0, :developer_id => u1.id, :prate => 1
m2 = Material.create! :subject => "자료1", :content => "abcdefg", :field => 1, :developer_id => u2.id, :prate => 1
m3 = Material.create! :subject => "자료2", :content => "abcdefg", :field => 1, :developer_id => u3.id, :prate => 1
m4 = Material.create! :subject => "자료3", :content => "abcdefg", :field => 1, :developer_id => u4.id, :prate => 1
m5 = Material.create! :subject => "자료4", :content => "abcdefg", :field => 1, :developer_id => u5.id, :prate => 1
m6 = Material.create! :subject => "자료5", :content => "abcdefg", :field => 1, :developer_id => u6.id, :prate => 1
m7 = Material.create! :subject => "자료6", :content => "abcdefg", :field => 1, :developer_id => u7.id, :prate => 1
m8 = Material.create! :subject => "자료7", :content => "abcdefg", :field => 1, :developer_id => u8.id, :prate => 1
m9 = Material.create! :subject => "자료8", :content => "abcdefg", :field => 1, :developer_id => u9.id, :prate => 1
m10 = Material.create! :subject => "자료9", :content => "abcdefg", :field => 1, :developer_id => u10.id, :prate => 1
m11 = Material.create! :subject => "자료10", :content => "abcdefg", :field => 1, :developer_id => u11.id, :prate => 1

g1 = RateeGroup.create! :evaluation_id => e.id
g2 = RaterGroup.create! :evaluation_id => e.id

s1 = e.selecteds.create! :developer_id => u2.id

m = Mapping.create! :ratee_group_id => g1.id, :rater_group_id => g2.id, :evaluation_id => e.id

a1.ratee_group_id = g1.id
a1.save
s1.rater_group_id = g2.id
s1.save

