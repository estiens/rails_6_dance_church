# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = [
  "Kitty Corner",
  "Big Darryl Jenkins",
  "Grandma Jones",
  "Anna Sthesia",
  "Paul Molive",
  "Anna Mull",
  "Gail Forcewind",
  "Paige Turner",
  "Bob Frapples",
  "Walter Melon",
]

names.each do |name|
  print '*' if Dj.find_or_create_by(name:name)
end

titles = [
  "dance church set",
  "great fire set",
  "all the dancers were amazing",
  "set title",
  "awesome set"
]

sets = %w(
  https://www.mixcloud.com/stantonwarriors/stanton-warriors-podcast-046-live-at-slut-garden-burning-man-2016/
  https://www.mixcloud.com/robotheart/lee-burridge-robot-heart-burning-man-2015/
  https://www.mixcloud.com/HOHME/david-hohme-love-cow-sunset-burning-man-2017/
  https://www.mixcloud.com/robotheart/lauren-lane-robot-heart-burning-man-2015/
  https://www.mixcloud.com/robotheart/barnt-robot-heart-burning-man-2015/
  https://www.mixcloud.com/robotheart/francesca-lombardo-robot-heart-burning-man-2015/
  https://www.mixcloud.com/robotheart/be-svendsen-robot-heart-burning-man-2015/
  https://www.mixcloud.com/music_4_friends/monolink-burning-man-2018/
  https://www.mixcloud.com/daveseaman/at-white-ocean-burning-man-festival-august-31st-2016/
  https://www.mixcloud.com/robotheart/major-lazer-robot-heart-sunset-burning-man-2015/
)

other_links = %w(
  www.example.com
)

Dj.all.each do |dj|
  rand(10).times.each do
    archive = Archive.new
    archive.date = (Date.today - rand(1000).days)
    if rand(10) > 2
      archive.mixcloud_url = sets.sample
    else
      archive.other_url = other_links.sample
    end
    archive.dj = dj
    archive.title = titles.sample
    print "!" if archive.save
  end
end

sunday = Date.today.sunday

ScheduledDate.find_or_create_by(date: sunday-1.week, dj: Dj.all.sample)
ScheduledDate.find_or_create_by(date: sunday-2.weeks, dj: Dj.all.sample)

ScheduledDate.find_or_create_by(date: sunday, dj: Dj.all.sample)
ScheduledDate.find_or_create_by(date: sunday + 1.week, dj: Dj.all.sample)
ScheduledDate.find_or_create_by(date: sunday + 2.weeks, no_dance_church: true)

