$( document ).on('turbolinks:load', function() {
  window.all_orders_table = $('#all-orders-table').DataTable();
  window.ongoing_orders_table = $('#ongoing-orders-table').DataTable();
  window.all_products_table = $('#all-products-table').DataTable();
  window.all_users_table = $('#all-users-table').DataTable();
  window.my_orders_table = $('#my-orders-table').DataTable();

  document.addEventListener("turbolinks:before-cache", function() {
	  if (all_orders_table !== null) {
	   all_orders_table.destroy();
	   all_orders_table = null;
	  }
	  if (ongoing_orders_table !== null) {
	   ongoing_orders_table.destroy();
	   ongoing_orders_table = null;
	  }
	  if (all_products_table !== null) {
	   all_products_table.destroy();
	   all_products_table = null;
	  }
	  if (all_users_table !== null) {
	   all_users_table.destroy();
	   all_users_table = null;
	  }
	  if (my_orders_table !== null) {
	   my_orders_table.destroy();
	   my_orders_table = null;
	  }
	});
} );
