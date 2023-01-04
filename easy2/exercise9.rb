name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# "Save_name" is actually a pointer that points to the variable "name" memory space in the PC's RAM.
# When we do .upcase! for name, we are actually pointing to that same memory place in the computer's RAM,
# and changing the value permanently. Since "save_name" is just a pointer, it is also changed permanently!