$( document ).on('turbolinks:load', function() {
  window.all_orders_table = $('#all-orders-table').DataTable({
  	retrieve: true,
	"order": [[0,'desc']]
  });
} );

$( document ).on('turbolinks:before-cache', function() {
  try {
    window.all_orders_table.destroy();
  } catch (e) {
    console.log('DataTable Turbolink Error:', e);
  }
} );
