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
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require popper
//= require bootstrap-sprockets
//= require jquery.dataTables.min
//= require turbolinks
//= require imagesloaded.pkgd

//= require address
//= require analytics
//= require assign_delivery
//= require action_cable
//= require cable
//= require channels/order
//= require counter
//= require delivery_points
//= require google_analytics
//= require imagesloaded.pkgd
//= require jquery.dataTables.min
//= require loader
//= require tables
//= require moment
//= require Chart

//= require_self


function hideLoader() {
  // console.log('-- hideLoader --');
  $('.loader').fadeOut('fast', function() {
    $(this).remove();
  });
}

$(document).on('turbolinks:load', function() {
 
  $('#orders-new-page').imagesLoaded(hideLoader);

  $('.dropdown-toggle').dropdown();


  // find domain, if domain is dawaat.co -> redirect to https
  var domain_prefix_length = window.location.protocol.length + 2;
  var site_domain = window.location.href.substring(domain_prefix_length, domain_prefix_length+9)
  var demo_site_domain = window.location.href.substring(domain_prefix_length, domain_prefix_length+14)
  if(site_domain == 'dawaat.co' || demo_site_domain == 'demo.dawaat.co') { // force https
    if (location.protocol != 'https:')
    {
      location.href = 'https:' + window.location.href.substring(window.location.protocol.length);
    }
  }

  $('.print-current-page').on('click', function(){
    window.print();
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

var notify_sound = new Audio('/definite.ogg');

function enable_notify() {
  notify_sound.play();
}

function notify_and_reload_page() {
  notify_sound.play().catch(function(e) {
    console.log('-- can not play sound --', e);
    // if($('.reload-page').length > 0) {
      Turbolinks.visit(location.toString());
    // }
  });;
  notify_sound.onended = function() {
    // if($('.reload-page').length > 0) {
      console.log('-- reload page with turbolink --');
      Turbolinks.visit(location.toString());
    // }
  };
}

$(document).on('turbolinks:load', function() {
  $('#enable-notification-sound').on('click', function(){
    enable_notify();
    $(this).removeClass('btn-warning').addClass('btn-success').html('Notification Sound Enabled');
  });
});

// function update_realtime_message(elem, connected) {
//   var msg = connected ? 'Connected' : 'Not connected';
//   $('#realtime-status-message').html(msg);
// }
