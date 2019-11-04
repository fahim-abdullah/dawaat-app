$(document).ready( function () {

	$("#plus-1").click(function(){
	    num = parseInt($("#quantity-1").val());
	    if (num < 12) {
	    	$("#quantity-1").val(num+1);
	    }
	})

	$("#minus-1").click(function(){
	    num = parseInt($("#quantity-1").val());
	    if (num > 0) {
	    	$("#quantity-1").val(num-1);	
	    } 
	})

	$("#plus-2").click(function(){
	    num = parseInt($("#quantity-2").val());
	    if (num < 12) {
	    	$("#quantity-2").val(num+1);
	    }
	})

	$("#minus-2").click(function(){
	    num = parseInt($("#quantity-2").val());
	    if (num > 0) {
	    	$("#quantity-2").val(num-1);	
	    } 
	})

	$("#plus-3").click(function(){
	    num = parseInt($("#quantity-3").val());
	    if (num < 12) {
	    	$("#quantity-3").val(num+1);
	    }
	})

	$("#minus-3").click(function(){
	    num = parseInt($("#quantity-3").val());
	    if (num > 0) {
	    	$("#quantity-3").val(num-1);	
	    } 
	})

	$("#plus-4").click(function(){
	    num = parseInt($("#quantity-4").val());
	    if (num < 12) {
	    	$("#quantity-4").val(num+1);
	    }
	})

	$("#minus-4").click(function(){
	    num = parseInt($("#quantity-4").val());
	    if (num > 0) {
	    	$("#quantity-4").val(num-1);	
	    } 
	})

	// Subtotal
	$("#checkout").click(function(){
	    totalone = $("#quantity-1").val() * 200;
	    totaltwo = $("#quantity-2").val() * 220;
	    totalthree = $("#quantity-3").val() * 180;
	    totalfour = $("#quantity-4").val() * 300;
	    subtotal = totalone + totaltwo + totalthree + totalfour;

		$("#subtotal").val(subtotal);
	})
	








});