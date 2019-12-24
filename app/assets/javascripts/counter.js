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

  function scrollToDeliveryPoint() {
    if($('#select-delivery-point').val() == '') {
      // console.log('-- scroll --');

      $('html, body').animate({
         scrollTop: $("#select-delivery-point").offset().top - parseInt($('#right-holder-div').css('padding-top')) - 160 + 24
      }, 500);

      $('#menu-delivey-point-title').addClass('blink');

      return true;
    } else {
      // console.log('-- selected --');
      return false;
    }
  }

  $('#select-delivery-point').on('change', function(){
    // reset menu plus minus quantity
    $('#menu-holder').find('input').val(0);
    // reset cart quantity 
    $('#cart-number').html(0);
    $("#cart-btn").hide();


    var delivery_point_id = $('#select-delivery-point').val();

    if(delivery_point_id == '') {
      $('#menu-delivey-point-title').addClass('blink');
    } else {
      // stop blink
      $('#menu-delivey-point-title').removeClass('blink');

      // show hide product item
      $('.menu-product-item').each(function(index){
        if($(this).attr('datapointid') == delivery_point_id) {
          $(this).show();
        } else {
          $(this).hide();
        }
      });

      // scroll to menu
      setTimeout(function(){
        $('html, body').animate({
          scrollTop: $("#select-delivery-point").offset().top - parseInt($('#right-holder-div').css('padding-top')) - 95 + 24
        }, 500);
      }, 350);
    }
  });

  $('.plus-quantity').on('click', function(){

    if(scrollToDeliveryPoint()) {
      // console.log('++ plus: stop here ++');
      return false;
    }


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

    if(scrollToDeliveryPoint()) {
      // console.log('++ minus: stop here ++');
      return false;
    }

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

    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position){
        $('#order_lat').val(position.coords.latitude);
        $('#order_lng').val(position.coords.longitude);
      });
    }

    $('#order_delivery_point_id').val($('#select-delivery-point').val());

    var subtotal = 0;
    var order_items_string = '';

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

        if(order_items_string != '') { order_items_string = order_items_string + '---'; }
        order_items_string = order_items_string + id + '...' + quantity;

      } else {
        $("#modal-product-"+id).hide();
      }

      subtotal = subtotal + total;
    });

    $('#order_items_string').val(order_items_string);
    $("#subtotal-field").val(subtotal);
    $("#subtotal_amount").text(subtotal);
    $("#total_amount").text(subtotal);
  });

  $('#apply-promo-code').on('click', function(){
    var message = $('#promo-code-message').find('small');
    message.removeClass('text-danger').addClass('text-info').html('Loading...').parent().show();

    var promo_code = $('#promo-code-value').val();

    $('#promo-code-name').val('');

    $.ajax({
      method: 'post',
      url: $(this).attr('dataurl'),
      dataType: 'json',
      data: {
        authenticity_token: $('meta[name=csrf-token]').attr('content'),
        promo_code: promo_code,
        subtotal_amount: $('#subtotal_amount').val()
      },
      success: function(res){
        console.log('-- success --', res);


        if(res['status'] == 200) {
          //-------- apply promo code -------------------------------------------------------------------
          $('#promo-code-name').val(res['promo_code']['name']);
          var subtotal_amount = parseInt($('#subtotal_amount').text());
          var discount_amount = 0;
          var total_amount = 0;

          if(res['promo_code']['promo_type'] == 'flat_discount') {
            discount_amount = res['promo_code'].discount_value;
            $('#discount_percentage').hide();
          } else if(res['promo_code']['promo_type'] == 'percentage_discount') {
            discount_amount = ( subtotal_amount * (res['promo_code'].discount_value / 100) );
            $('#discount_percentage').text('(' + res['promo_code'].discount_value + '% )').show();
          }
          total_amount = subtotal_amount - discount_amount;
          $('#discount_amount').text(discount_amount);
          $("#total_amount").text(total_amount);

          $('#discount-wrap').show('slow');
          //-------- ./apply promo code -----------------------------------------------------------------

          // show success message
          message.removeClass('text-info').addClass('text-success').html('Promo code applied').parent().show();
          // setTimeout(function(){ message.parent().hide(); }, 3000);

        } else if(res['status'] == 202) {
          $("#total_amount").text($("#subtotal_amount").text());
          $('#discount-wrap').hide('slow');

          message.removeClass('text-info').addClass('text-danger').html(res['error_messages'][0]).parent().show();
        }
      },
      error: function (xhr) {
        console.log('-- error --', xhr);

        $("#total_amount").text($("#subtotal_amount").text());
        $('#discount-wrap').hide('slow');

        var error_message = ''; xhr.status + ' ' + xhr.statusText;
        if(xhr.status == 0) { 
          error_message = 'May be, internet connection error'
        } else {
          error_message = xhr.status + ' ' + xhr.statusText;
        }
        message.removeClass('text-info').addClass('text-danger').html(error_message).parent().show();
      }
    });

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