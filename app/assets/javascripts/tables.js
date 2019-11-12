$( document ).on('turbolinks:load', function() {

  

  window.all_orders_table = $('#all-orders-table').DataTable({
  	retrieve: true,
	"order": [[0,'desc']]
  });

} );
