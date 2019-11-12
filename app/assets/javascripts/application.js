// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require jquery.dataTables.min
//= require_tree .

$(document).on('turbolinks:load', function() {
  
	$('.loader').fadeOut('fast', function() {
		$(this).remove();
	});
  
  $('.dropdown-toggle').dropdown();


  // find domain, if domain is dawaat.co -> redirect to https
  var domain_prefix_length = window.location.protocol.length + 2;
  var site_domain = window.location.href.substring(domain_prefix_length, domain_prefix_length+9)
  if(site_domain == 'dawaat.co') { // force https
    if (location.protocol != 'https:')
    {
      location.href = 'https:' + window.location.href.substring(window.location.protocol.length);
    }
  }

});

// document.onkeydown = function(e) {

//   if(event.keyCode == 123) {
//      return false;
//   }
//   if((e.ctrlKey || event.keyCode === 91) && e.shiftKey && e.keyCode == 'I'.charCodeAt(0)) {
//      return false;
//   }
//   if(event.keyCode == 93 && e.shiftKey && e.keyCode == 'C'.charCodeAt(0)) {
//      return false;
//   }
//   if((e.ctrlKey || event.keyCode === 91) && e.shiftKey && e.keyCode == 'J'.charCodeAt(0)) {
//      return false;
//   }
//   if((e.ctrlKey || event.keyCode === 91) && e.keyCode == 'U'.charCodeAt(0)) {
//      return false;
//   }
// }

function notify_and_reload_page() {
  var notify_sound = new Audio('/definite.ogg');
  notify_sound.play().catch(function(e) {
    console.log('-- can not play sound --', e);
    if($('.reload-page').length > 0) {
      Turbolinks.visit(location.toString());
    }
  });;
  notify_sound.onended = function() {
    if($('.reload-page').length > 0) {
      console.log('-- reload page with turbolink --');
      Turbolinks.visit(location.toString());
    }
  };
}

// function update_realtime_message(elem, connected) {
//   var msg = connected ? 'Connected' : 'Not connected';
//   $('#realtime-status-message').html(msg);
// }
