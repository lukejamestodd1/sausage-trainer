
//========== MODELS ==========//


var User = Backbone.Model.extend({
		urlRoot: 'http://localhost:3000/api/users'
	});

var Activity = Backbone.Model.extend({
	urlRoot: 'http://localhost:3000/api/activities'
});

var Venue = Backbone.Model.extend({
	urlRoot: 'http://localhost:3000/api/venues'
});

var Participant = Backbone.Model.extend({
	urlRoot: 'http://localhost:3000/api/participants'
});

var ActivityType = Backbone.Model.extend({
	urlRoot: 'http://localhost:3000/api/activity_types'
});

var Contact = Backbone.Model.extend({
	urlRoot: 'http://localhost:3000/api/users/10/contacts'
});

var Group = Backbone.Model.extend({
	urlRoot: 'http://localhost:3000/api/groups'
});

var GroupEntry = Backbone.Model.extend({
	urlRoot: 'http://localhost:3000/api/group_entries'
});




//========= COLLECTIONS ===========// 


var Users = Backbone.Collection.extend({
	model: User,
	url: 'http://localhost:3000/api/users'
});

var Activities = Backbone.Collection.extend({
	model: Activity,
	url: 'http://localhost:3000/api/activities'
});

var Venues = Backbone.Collection.extend({
	model: Venue,
	url: 'http://localhost:3000/api/venues'
});

var Participants = Backbone.Collection.extend({
	model: Participant,
	url: 'http://localhost:3000/api/participants'
});

var ActivityTypes = Backbone.Collection.extend({
	model: ActivityTypes,
	url: 'http://localhost:3000/api/activity_types'
});

var Contacts = Backbone.Collection.extend({
	model: Contact,
	url: 'http://localhost:3000/api/users/10/contacts'
});

var Groups = Backbone.Collection.extend({
	model: Group,
	url: 'http://localhost:3000/api/groups'
});

var GroupEntries = Backbone.Collection.extend({
	model: GroupEntry,
	url: 'http://localhost:3000/api/group_entries'
});


