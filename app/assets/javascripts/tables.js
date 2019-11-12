$( document ).on('turbolinks:load', function() {
  window.all_orders_table = $('#all-orders-table').DataTable({
  	"order": [[0, "desc" ]]
  });
  window.ongoing_orders_table = $('#ongoing-orders-table').DataTable();
  window.all_products_table = $('#all-products-table').DataTable();
  window.all_users_table = $('#all-users-table').DataTable();
  window.my_orders_table = $('#my-orders-table').DataTable();
} );
