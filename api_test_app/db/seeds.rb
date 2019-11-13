User.create([
	{email: 'test@user.com' , password: 'password' , password_confirmation: 'password', first_name: 'test', last_name: 'user'},
 	{email: 'fake@user.com' , password: 'password' , password_confirmation: 'password', first_name: 'fake', last_name: 'user'},
 	{email: 'mock@user.com' , password: 'password' , password_confirmation: 'password', first_name: 'mock', last_name: 'user'}
])

# NOTE: TO Generate tags for first feed entry so that we can show feeds on the homepage.
User.first.tags.create([
	{name: 'development'},
	{name: 'test'}
])

User.all[1].tags.create([
	{name: 'music'},
	{name: 'audio'}
])

User.last.tags.create([
	{name: 'football'},
	{name: 'hockey'}
])