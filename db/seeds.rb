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

u1 = Developer.create! :email => 'student1@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name
u2 = Developer.create! :email => 'student2@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name
u3 = Developer.create! :email => 'student3@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name
u4 = Developer.create! :email => 'student4@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name
u5 = Developer.create! :email => 'student5@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name
u6 = Developer.create! :email => 'student6@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name
u7 = Developer.create! :email => 'student7@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name
u8 = Developer.create! :email => 'student8@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name
u9 = Developer.create! :email => 'student9@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name
u10 = Developer.create! :email => 'student10@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :cname => c1.name

e = Evaluation.create!

a1 = e.applieds.create! :developer_id => u1.id
a2 = e.applieds.create! :developer_id => u2.id
a3 = e.applieds.create! :developer_id => u3.id
a4 = e.applieds.create! :developer_id => u4.id
a5 = e.applieds.create! :developer_id => u5.id
a6 = e.applieds.create! :developer_id => u6.id
a7 = e.applieds.create! :developer_id => u7.id

