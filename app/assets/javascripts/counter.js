// mq = modal quantity

$(document).on('turbolinks:load', function() {
	function updateCartNumber(quantity) {
		var cart_num = parseInt($("#cart-number").html());
		cart_num = cart_num + quantity;
		$("#cart-number").html(cart_num);

		if (cart_num = 0) {
			$("#cart-btn").hide();
		} else {
			$("footer").css('margin-bottom','50px');
			$("#cart-btn").show();

		}
	}

  $('.plus-quantity').on('click', function(){
    var id = $(this).parent().parent().attr('dataid');
    var input = $(this).parent().parent().find('input');

    num = parseInt($("#quantity-"+id).val());
    if (num < 12) {
      $("#quantity-"+id).val(num+1);
      $("#mq-"+id).text(num+1);
      updateCartNumber(1);
    }
  });

  $('.minus-quantity').on('click', function(){
    var id = $(this).parent().parent().attr('dataid');
    var input = $(this).parent().parent().find('input');

    num = parseInt($("#quantity-"+id).val());
    if (num > 0) {
      $("#quantity-"+id).val(num-1);
      $("#mq-"+id).text(num-1);
      updateCartNumber(-1);
    }
  });

	


	// Subtotal
  $("#cart-btn").on('click', function(){
    var subtotal = 0;

    itemquantity = $("#itemquantity");
    itemquantity.val("");

    $('.menu-product-item').each(function(){
      var id = $(this).attr('dataid');
      var quantity = $(this).find('input').val();
      var price = $(this).find('.product-price').text();
      
      var total = price * quantity;
      if(isNaN(total)) { total = 0; }

      if(quantity > 0) {
        $("#modal-product-"+id).show();
        itemquantity.val(itemquantity.val() + $("#product-"+id).text() + "." + $("#quantity-"+id).val() + "-");
      } else {
        $("#modal-product-"+id).hide();
      }

      subtotal = subtotal + total;
    });

    $("#subtotal-field").val(subtotal);
    $("#subtotal").text(subtotal);
  });


	// $("#cart-btn").click(function(){

	 //    totalone = $("#quantity-1").val() * parseInt($("#price-1").text());
	 //    totaltwo = $("#quantity-2").val() * parseInt($("#price-2").text());
	 //    totalthree = $("#quantity-3").val() * parseInt($("#price-3").text());
	 //    totalfour = $("#quantity-4").val() * parseInt($("#price-4").text());
	 //    totalfive = $("#quantity-5").val() * parseInt($("#price-5").text());

	 //    if (isNaN(totalone)) { totalone = 0}
	 //    if (isNaN(totaltwo)) { totaltwo = 0}
	 //    if (isNaN(totalthree)) { totalthree = 0}
  //   	if (isNaN(totalfour)) { totalfour = 0}
		// if (isNaN(totalfive)) { totalfive = 0}

	 //    subtotal = totalone + totaltwo + totalthree + totalfour + totalfive;

		// $("#subtotal-field").val(subtotal);
		// $("#subtotal").text(subtotal);
		// // Item Quantity Refresh
		// itemquantity = $("#itemquantity");
		// itemquantity.val("");

		// Modal View
		// if (totalone > 1) {
		// 	$("#modal-product-1").show();
		// 	itemquantity.val(itemquantity.val() + $("#product-1").text() + "." + $("#quantity-1").val() + "-");
		// } else {
		// 	$("#modal-product-1").hide();
		// };

		// if (totaltwo > 1) {
		// 	$("#modal-product-2").show();
		// 	itemquantity.val(itemquantity.val() + $("#product-2").text() + "." + $("#quantity-2").val() + "-");
			
		// } else {
		// 	$("#modal-product-2").hide();
		// };

		// if (totalthree > 1) {
		// 	$("#modal-product-3").show();
		// 	itemquantity.val(itemquantity.val() + $("#product-3").text() + "." + $("#quantity-3").val() + "-");
		// } else {
		// 	$("#modal-product-3").hide();
		// };

		// if (totalfour > 1) {
		// 	$("#modal-product-4").show();
		// 	itemquantity.val(itemquantity.val() + $("#product-4").text() + "." + $("#quantity-4").val() + "-");
		// } else {
		// 	$("#modal-product-4").hide();
		// };

		// if (totalfive > 1) {
		// 	$("#modal-product-5").show();
		// 	itemquantity.val(itemquantity.val() + $("#product-5").text() + "." + $("#quantity-5").val() + "-");
		// } else {
		// 	$("#modal-product-5").hide();
		// };



	// })

});