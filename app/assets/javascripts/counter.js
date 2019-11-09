// mq = modal quantity

$(document).on('turbolinks:load', function() {
	$("#plus-1").click(function(){
		num = parseInt($("#quantity-1").val());
	    if (num < 12) {
	    	$("#quantity-1").val(num+1);
	    	$("#mq-1").text(num+1);
	    }
	})
	$("#minus-1").click(function(){
	    num = parseInt($("#quantity-1").val());
	    if (num > 0) {
	    	$("#quantity-1").val(num-1);
	    	$("#mq-1").text(num-1);
	    }
	})

	$("#plus-2").click(function(){
	    num = parseInt($("#quantity-2").val());
	    if (num < 12) {
	    	$("#quantity-2").val(num+1);
	    	$("#mq-2").text(num+1);
	    }
	})
	$("#minus-2").click(function(){
	    num = parseInt($("#quantity-2").val());
	    if (num > 0) {
	    	$("#quantity-2").val(num-1);
	    	$("#mq-2").text(num-1);
	    } 
	})

	$("#plus-3").click(function(){
	    num = parseInt($("#quantity-3").val());
	    if (num < 12) {
	    	$("#quantity-3").val(num+1);
	    	$("#mq-3").text(num+1);
	    }
	})
	$("#minus-3").click(function(){
	    num = parseInt($("#quantity-3").val());
	    if (num > 0) {
	    	$("#quantity-3").val(num-1);
	    	$("#mq-3").text(num-1);
	    } 
	})

	$("#plus-4").click(function(){
	    num = parseInt($("#quantity-4").val());
	    if (num < 12) {
	    	$("#quantity-4").val(num+1);
	    	$("#mq-4").text(num+1);
	    }
	})
	$("#minus-4").click(function(){
	    num = parseInt($("#quantity-4").val());
	    if (num > 0) {
	    	$("#quantity-4").val(num-1);
	    	$("#mq-4").text(num-1);
	    } 
	})

	$("#plus-5").click(function(){
	    num = parseInt($("#quantity-5").val());
	    if (num < 12) {
	    	$("#quantity-5").val(num+1);
	    	$("#mq-5").text(num+1);
	    }
	})
	$("#minus-5").click(function(){
	    num = parseInt($("#quantity-5").val());
	    if (num > 0) {
	    	$("#quantity-5").val(num-1);
	    	$("#mq-5").text(num-1);
	    } 
	})


	// Subtotal
	$("#checkout").click(function(){

	    totalone = $("#quantity-1").val() * parseInt($("#price-1").text());
	    totaltwo = $("#quantity-2").val() * parseInt($("#price-2").text());
	    totalthree = $("#quantity-3").val() * parseInt($("#price-3").text());
	    totalfour = $("#quantity-4").val() * parseInt($("#price-4").text());
	    totalfive = $("#quantity-5").val() * parseInt($("#price-5").text());
	    subtotal = totalone + totaltwo + totalthree + totalfour + totalfive;

		$("#subtotal-field").val(subtotal);
		$("#subtotal").text(subtotal);
		// Item Quantity Refresh
		itemquantity = $("#itemquantity");
		// Modal View
		if (totalone > 1) {
			$("#modal-product-1").show();
			itemquantity.val(itemquantity.val() + $("#product-1").text() + "." + $("#quantity-1").val() + "-");
		} else {
			$("#modal-product-1").hide();
		};

		if (totaltwo > 1) {
			$("#modal-product-2").show();
			itemquantity.val(itemquantity.val() + $("#product-2").text() + "." + $("#quantity-2").val() + "-");
			
		} else {
			$("#modal-product-2").hide();
		};

		if (totalthree > 1) {
			$("#modal-product-3").show();
			itemquantity.val(itemquantity.val() + $("#product-3").text() + "." + $("#quantity-3").val() + "-");
		} else {
			$("#modal-product-3").hide();
		};

		if (totalfour > 1) {
			$("#modal-product-4").show();
			itemquantity.val(itemquantity.val() + $("#product-4").text() + "." + $("#quantity-4").val() + "-");
		} else {
			$("#modal-product-4").hide();
		};

		if (totalfive > 1) {
			$("#modal-product-5").show();
			itemquantity.val(itemquantity.val() + $("#product-5").text() + "." + $("#quantity-5").val() + "-");
		} else {
			$("#modal-product-5").hide();
		};



	})

});