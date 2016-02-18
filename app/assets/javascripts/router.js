
//wrap it all in app object when finished
var sausageTrainerApp = {};

// helper function
var setupBody = function() {
  if ($('.navbar').length === 0) {
    console.log('Creating nav bar.');
    // no current nav bar found so append to body
    var navBar = new NavBarView();
    $('body').append(navBar.render().el);
    $('.navbar').attr('role', 'navigation');
  }

  // collect all elements and remove all except nav bar, footer and scripts
  $('body').children().each( function(child) {
    if ($(this).is('script') || $(this).is('nav')) {
    } else {
      $(this).remove();
    }
  });
};


//========== ROUTER ========= //


var Router = Backbone.Router.extend({

	routes: {
		"": "showIndex",
		"login": "login",
		"signup": "signUp",

		"trainer/dash": "trainerDash",
		"trainer/activities": "trainerActivitiesList",
		"trainer/calendar": "trainerCalendar",
		"trainer/contacts": "trainerContactsList",

		"trainer/activities/:id": "trainerActivityDetails",
		// "trainer/activities/new": "trainerActivityCreate",
		// "trainer/activities/edit": "trainerActivityEdit",
		// "trainer/contacts/message": "trainerSendMessage",
		
		"student/dash": "studentDash",
		"student/activities": "studentActivitiesList",
		"student/calendar": "studentCalendar",
		"student/contacts": "studentContactsList",

		"student/activities/:id": "studentActivityDetails",
		// "student/activities/:id/book": "studentActivityBook",
		//	"student/contacts/:id": "studentTrainerDetail",
		
	},

	showIndex: function(){
    console.log('Index route loading...');
    // index page made up of:
    // nav bar
    // welcome/splash screen view
    // footer
    setupBody();

    var splashCarousel = new CarouselView();
    $('body').append(splashCarousel.render().el);
    $('.carousel').carousel({ interval: 5000 });

    var splashMain = new SplashMainView();
    $('body').append(splashMain.render().el);

    var footer = new FooterView();
    $('body').append(footer.render().el);
	},

	login: function(){
		console.log("Login route loading...");

    setupBody();

    var loginForm = new LoginFormView();
    $('body').append(loginForm.render().el);

    var footer = new FooterView();
    $('body').append(footer.render().el);
	},

	signUp: function(){

	},

	trainerDash: function(){
		setupBody();
		var trainerDash = new TrainerDashContainerView();
		$('body').append(trainerDash.render().el);
	},

	trainerActivitiesList: function(){
		setupBody();
		var trainersActivityList = new TrainerActivitiesListView();
		$('body').append(trainersActivityList.render().el);

		//activities list
		var activities = new Activities();
		activities.fetch().done(function() {
			activities.each(function(instance) {
				var activityItem = new ActivityItemView({ model: instance});
				$('.activities-list').append(activityItem.render().el);
			});
		});
	},

	trainerCalendar: function(){
		setupBody();
		var trainerCalendar = new TrainerCalendarView();
		$('body').append(trainerCalendar.render().el);
		$('#calendar').fullCalendar({
	      theme: true,
	      header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'month,agendaWeek,agendaDay'
	      },
	      defaultDate: '2016-01-12',
	      editable: true,
	      eventLimit: true, // allow "more" link when too many events
	      events: [
	        {
	          title: 'All Day Event',
	          start: '2016-01-01'
	        }
	      ]
  	});
	},

	trainerContactsList: function(){
		setupBody();
		//container for contacts list
		var contactListContainer = new ContactListContainerView();
		$('body').append(contactListContainer.render().el);

		//contacts list with user data
		var contacts = new Contacts();
		contacts.fetch().done(function() {
			contacts.each(function(person) {
				var contactsList = new ContactItemView({ model: person});
				$('.users-list').append(contactsList.render().el);
			});
		});
	},

	trainerActivityDetails: function(){
		setupBody();
		var activityItem = new Activity({id: 33});
		activityItem.fetch().done(function(){
			var trainerActivityDetails = new ActivityDetailView({model: activityItem});
			$('body').append(trainerActivityDetails.render().el);
		});
		
		
	},

	trainerActivityCreate: function(){

	},

	trainerActivityEdit: function(){

	},

	
	trainerSendMessage: function(){

	},

	
	studentDash: function(){
		setupBody();
		var studentDash = new StudentDashContainerView();
		$('body').append(studentDash.render().el);
	},

	studentActivitiesList: function(){
		setupBody();
		var studentActivityList = new StudentActivitiesListView();
		$('body').append(studentActivityList.render().el);

		//activities list with
		var activities = new Activities();
		activities.fetch().done(function() {
			activities.each(function(instance) {
				var activityItem = new ActivityItemView({ model: instance});
				$('.activities-list').append(activityItem.render().el);
			});
		});
	},

	studentCalendar: function(){
		setupBody();
		var studentCalendar = new StudentCalendarView();
		$('body').append(studentCalendar.render().el);
		$('#calendar').fullCalendar({
	      theme: true,
	      header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'month,agendaWeek,agendaDay'
	      },
	      defaultDate: '2016-01-12',
	      editable: true,
	      eventLimit: true, // allow "more" link when too many events
	      events: [
	        {
	          title: 'All Day Event',
	          start: '2016-01-01'
	        }
	      ]
  	});
	},

	studentContactsList: function(){
		setupBody();
		//container for contacts list
		var trainersListContainer = new TrainersListContainerView();
		$('body').append(trainersListContainer.render().el);

		//contacts list with user data
		var contacts = new Contacts();
		contacts.fetch().done(function() {
			contacts.each(function(person) {
				var contactsList = new ContactItemView({ model: person});
				$('.users-list').append(contactsList.render().el);
			});
		});
	},

	studentActivityDetails: function(){
		setupBody();
		var activityItem = new Activity({id: 33});
		activityItem.fetch().done(function(){
			var studentActivityDetails = new StudentActivityDetailView({model: activityItem});
			$('body').append(studentActivityDetails.render().el);
		});
	},

	studentActivityBook: function(){

	},

	studentTrainerDetail: function(){

	}

});

		//Parts of pages
		// //append container to body
		// var mainContainer = new MainContainer();
		// $('body').append(mainContainer.render().el);

		// //append header to container main
		// var header = new TrainerHeader();
		// $('.main').append(header.render().el);

		// //append colour bar to container main
		// var colourBar = new ColourBar();
		// $('.main').append(colourBar.render().el);

		// //append other divs of info below colour bar.
