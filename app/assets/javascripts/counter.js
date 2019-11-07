// $(document).ready( function () {
// 	// var t0 = performance.now();

// 	// var t1 = performance.now();
// 	// console.log("Call to doSomething took " + (t1 - t0) + " milliseconds.");

// 	$("#plus-1").click(function(){
	    
// 	    num = parseInt($("#quantity-1").val());

// 	    if (num < 12) {
// 	    	$("#quantity-1").val(num+1);
// 	    	$("#mq-1").text(num+1);
// 	    }
// 	})

// 	$("#minus-1").click(function(){
// 	    num = parseInt($("#quantity-1").val());
// 	    if (num > 0) {
// 	    	$("#quantity-1").val(num-1);
// 	    	$("#mq-1").text(num-1);
// 	    }
// 	})

// 	$("#plus-2").click(function(){
	    
// 	    num = parseInt($("#quantity-2").val());

// 	    if (num < 12) {
// 	    	$("#quantity-2").val(num+1);
// 	    	$("#mq-2").text(num+1);
// 	    }
// 	})

// 	$("#minus-2").click(function(){
// 	    num = parseInt($("#quantity-2").val());
// 	    if (num > 0) {
// 	    	$("#quantity-2").val(num-1);
// 	    	$("#mq-2").text(num-1);
// 	    } 
// 	})

// 	$("#plus-3").click(function(){
	    
// 	    num = parseInt($("#quantity-3").val());

// 	    if (num < 12) {
// 	    	$("#quantity-3").val(num+1);
// 	    	$("#mq-3").text(num+1);
// 	    }
// 	})

// 	$("#minus-3").click(function(){
// 	    num = parseInt($("#quantity-3").val());
// 	    if (num > 0) {
// 	    	$("#quantity-3").val(num-1);
// 	    	$("#mq-3").text(num-1);
// 	    } 
// 	})

// 	$("#plus-4").click(function(){
	    
// 	    num = parseInt($("#quantity-4").val());

// 	    if (num < 12) {
// 	    	$("#quantity-4").val(num+1);
// 	    	$("#mq-4").text(num+1);
// 	    }
// 	})

// 	$("#minus-4").click(function(){
// 	    num = parseInt($("#quantity-4").val());
// 	    if (num > 0) {
// 	    	$("#quantity-4").val(num-1);
// 	    	$("#mq-4").text(num-1);
// 	    } 
// 	})

// 	// Subtotal
// 	$("#checkout").click(function(){
// 	    totalone = $("#quantity-1").val() * 200;
// 	    totaltwo = $("#quantity-2").val() * 220;
// 	    totalthree = $("#quantity-3").val() * 180;
// 	    totalfour = $("#quantity-4").val() * 300;
// 	    subtotal = totalone + totaltwo + totalthree + totalfour;

// 		$("#subtotal-field").val(subtotal);
// 		$("#subtotal").text(subtotal);
		
// 		// Modal View

		
// 		if (totalone > 1) {
// 			$("#product-1").show();

// 		} else {
// 			$("#product-1").hide();
// 		};
// 		if (totaltwo > 1) {
// 			$("#product-2").show();
// 		} else {
// 			$("#product-2").hide();
// 		};
// 		if (totalthree > 1) {
// 			$("#product-3").show();
// 		} else {
// 			$("#product-3").hide();
// 		};
// 		if (totalfour > 1) {
// 			$("#product-4").show();
// 		} else {
// 			$("#product-4").hide();
// 		};
		
// 	})

	





// });