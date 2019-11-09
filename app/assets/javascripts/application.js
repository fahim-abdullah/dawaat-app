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
  notify_sound.play();
  notify_sound.onended = function() {
    if($('reload-page').length > 0) {
      Turbolinks.visit(location.toString());
    }
  };
}

// function update_realtime_message(elem, connected) {
//   var msg = connected ? 'Connected' : 'Not connected';
//   $('#realtime-status-message').html(msg);
// }
