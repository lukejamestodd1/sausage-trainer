# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# sausage trainer seeding

User.delete_all
Activity.delete_all
ActivityType.delete_all
Venue.delete_all
Participant.delete_all
Group.delete_all
GroupEntry.delete_all
Contact.delete_all

User.create(username: 'cake', email: 'cake@pudding.com' , password: 'pudding', instructor: true, student: false, bio: "this is me",  photo_url: "", local_timezone: "Melbourne")
User.create(username: 'donuts', email: 'donuts@pudding.com' , password: 'pudding', instructor: false, student: true, bio: "this is me",  photo_url: "", local_timezone: "Sydney")
User.create(username: 'jam', email: 'jam@pudding.com', password: 'pudding', instructor: true, student: true, bio: "this is me",  photo_url: "", local_timezone: "Auckland")

ActivityType.create(name: 'Yoga')
ActivityType.create(name: 'Boxing')
ActivityType.create(name: 'Spinning')

Venue.create(name: 'The Fitness Palace', address: 'Hard Body Lane', description: 'this is here', geo_lat: 33.33, geo_lng:-44.44)
Venue.create(name: 'Crunch Hut', address: 'Fab Ab Street', description: 'this is here', geo_lat: 22.22, geo_lng:-66.66)
Venue.create(name: 'Lifting Emporium', address: 'Pec Flex Road', description: 'this is here', geo_lat: 11.11, geo_lng:-88.88)

durations = [ 1.0, 1.5, 2.0, 2.2, 2.5 ]
bools = [ true, false ]
costs = [ 20.0, 25.0, 28.0, 36.0, 106.34 ]

10.times do |count|
  Activity.create(title: "activity_#{count}", start_time:"", duration: durations.sample, description: "", proposed: bools.sample, confirmed: bools.sample, requires_payment: bools.sample, cost: costs.sample, venue_id: Venue.pluck(:id).sample, activity_type_id: ActivityType.pluck(:id).sample, user_id: User.pluck(:id).sample)
end

30.times do |count|
  Participant.create(confirmed: bools.sample, paid: bools.sample, user_id: User.pluck(:id).sample, activity_id: Activity.pluck(:id).sample)
end

Group.create(name: "Friday Fitness Freaks", user_id: User.pluck(:id).sample)
Group.create(name: "Yoga Warriors", user_id: User.pluck(:id).sample)
Group.create(name: "Spin Group", user_id: User.pluck(:id).sample)

10.times do |count|
  GroupEntry.create(group_id: Group.pluck(:id).sample, user_id: User.pluck(:id).sample)
end

# Generate two random contacts for each of the user accounts

User.all.each do |user|
  4.times do |count|
    Contact.create(owner_id: user.id, user_id: User.pluck(:id).sample)
  end
end
