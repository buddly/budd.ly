
// onload
$(document).ready(function(){
  
  Buddly.init_datepickers();
	Buddly.show_flash_messages();
	Buddly.init_overlays();
	
});

Buddly = {
  
  close_overlay: function(name){
    $('#'+name+"_overlay_a").data('overlay').close();
  },
  
  hide_notice_messages: function(){
    $('#flash-container .notice').fadeOut();
  },
  
  init_datepickers: function(){
    $('.datepicker').each(function(){
  		$(this).datepicker();
  	});
  },
  
  init_overlays: function(){
  	$("#milestone_overlay_a").overlay({
    	mask: {
    		color: '#aaa',
    		loadSpeed: 200,
    		opacity: 0.8
    	},

    	closeOnClick: false, // makes the overlay modal
      // effect: 'apple',

  		onBeforeLoad: function() {
  			// grab wrapper element inside content
  			var wrap = this.getOverlay().find(".contentWrap");

  			// load the page specified in the trigger
  			wrap.load(this.getTrigger().attr("href"));
  		},
  		
  		onLoad: function(){window.setTimeout(Buddly.init_datepickers, 250)}

  	});
  },
  
  show_flash_messages: function(){
    $('#flash-container').show();
    $('#flash-container').animate({
      "top": "15px"
    });
    
    window.setTimeout(Buddly.hide_notice_messages, 2500);
  }
  
}