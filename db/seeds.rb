def set_user!(obj)
  password = '12345678' # Choosen by a random dice roll, promise!
  obj.user = User.create!(email: "#{obj.name.downcase}@example.com", password: password)
  obj.save!
end

# We need a district first
west_district = District.create!(name: 'West district')


# Lets set up everything for North high, go wolves!

catelyn = Parent.create!(name: 'Catelyn')
set_user!(catelyn)

john = Student.create!(name: 'John', parent: catelyn)
set_user!(john)

sansa = Student.create!(name: 'Sansa', parent: catelyn)
set_user!(sansa)


north_high = School.create!(name: 'North high', district: west_district)

ludwin = Teacher.create!(name: 'Ludwin', school: north_high)
set_user!(ludwin)

s_class = SchoolClass.create!(name: 'Math 101', school: north_high, teacher: ludwin)
s_class.class_enrollment << ClassEnrollment.new(student: sansa)

# Now it's time for South high, go lions!

robert = Parent.create!(name: 'Robert')
set_user!(robert)

thommen = Student.create!(name: 'Thommen', parent: robert) # Yeah, right!
set_user!(thommen)

south_high = School.create!(name: 'South high', district: west_district)

pycelle = Teacher.create!(name: 'Pycelle', school: south_high)
set_user!(pycelle)

tywin = DistrictSuperintendent.create!(name: 'Tywin', district: west_district)
set_user!(tywin)

