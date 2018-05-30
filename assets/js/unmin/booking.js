(function(w, d){
	"use strict";

	w.Booking = function(opts){

        var defaults = {
           	bookingFormElm: '#form-wizard',
           	bookingCalendarElm : '#datepicker',
           	tourSessionsElm: '.tour-sessions',
           	tourItineraryElm: '.tour-itinerary',
           	selSessionElm: '.sel-tour-session',
           	btnBookNowStep2: '.tour-booking-btn',
            btnConfirmBooking: '#confirm-booking',
            priceTypeTmpl : '#session-price-type-tmpl',
           	actionUrl: '/ajax/booking.php'
        };

        this.options = $.extend(true, defaults, opts);
        
    };

    w.Booking.prototype.init = function() {

    	var ths = this, options = this.options;
        
        this.initFormWizard();
        this.initBookingCalendar();
        this.getTourSessions();
        this.selectSession();
        this.changePaxQty();
        this.applyPromoCode();
        this.setItinerary();
        this.confirmBooking();    
        
    };


    /**
     * Generating the first step content
     */
    w.Booking.prototype.getTourSessions = function() {
        var ths = this, options = this.options;

        if($(options.tourSessionsElm).length){
        
            var tourKey 			= $(options.bookingFormElm).data('token'),
            	selDateObj 			= $(options.bookingCalendarElm).datepicker( 'getDate' ),
            	selDate 			= $.datepicker.formatDate('dd/mm/yy', new Date(selDateObj)),
            	tourSessionsBody 	= $(options.tourSessionsElm).find('.tour-sessions-body'),
            	_tmpl       		= _.template( $('#tour-sessions-tmpl').html() );

        	$.post(options.actionUrl, 'action=fetch-tour-sessions&tour='+tourKey+'&date='+selDate, function(response){
                tourSessionsBody.empty();
                var compiledTmpl = _tmpl(response);
                tourSessionsBody.append(compiledTmpl);
            }, 'json');
        }
    };

    /**
     * Generating second step content (click BOOK NOW)
     */
    w.Booking.prototype.selectSession = function() {

    	var ths = this, options = this.options;

    	$(options.tourSessionsElm).on('click', options.selSessionElm, function(e){

			e.preventDefault();

			$(options.selSessionElm).removeClass('active');

			var self       		= $(this),
				parentElm  		= self.parents('.item__option'),
				selSessionToken = parentElm.data('token');

			self.addClass('active');

			var tourKey 	= $(options.bookingFormElm).data('token'),
	        	selDateObj 	= $(options.bookingCalendarElm).datepicker( 'getDate' ),
	        	selDate 	= $.datepicker.formatDate('dd/mm/yy', new Date(selDateObj));

	        $.post(options.actionUrl, 'action=fetch-session-details&tour='+tourKey+'&date='+selDate+'&session='+selSessionToken, function(response){
                
                if(response.isValid){
                	var sessionData = response.session;
                    var _tmpl      = _.template( $(options.priceTypeTmpl).html() );
                    var compiledTmpl = _tmpl(sessionData);

                    $('.price-type-wrapper').html(compiledTmpl);
	                $('.sel-datetime').text(sessionData.date+ ' ' +sessionData.time);

	         		$('.session-spaces').text(sessionData.remaining).data('originalRemaining', sessionData.remaining);
                }

            }, 'json');

			$(options.bookingFormElm).steps("next");
		});
    };

    w.Booking.prototype.changePaxQty = function() {

    	var ths = this, options = this.options;

    	$(options.tourItineraryElm).on('change', '.pax-selector', function(e)
        {
    		var self       	      = $(this),
                remainingDOM      = $('.session-spaces'),
                originalRemaining = $('.session-spaces').data('originalRemaining'),
                allSelectorDOMs   = $('.pax-selector'),
                otherSelectorDOMs = allSelectorDOMs.not(this);

            /**
             * Update remaining quantity.
             */
            var selectedValue = 0;
            $.each(allSelectorDOMs, function (index, element) {
                var item = $(element);
                selectedValue += parseInt(item.val());
            });

            var remainingQty  = originalRemaining - selectedValue;
            remainingDOM.text(remainingQty);

            /**
             * Generate new option list.
             */
     		$.each(allSelectorDOMs, function (index, element) {
                var newOptionList = '';
                var item = $(element);
                var thisSelectedValue = item.val();
                var listMax = (thisSelectedValue > remainingQty) ? thisSelectedValue : remainingQty;
                for (var i = 0; i <= listMax; i++) {
                    var isSelected = (i == thisSelectedValue) ? 'selected="selected"' : '';
                    newOptionList += '<option value="' + i + '" ' + isSelected + '>' + i + '</option>';
                }
                item.html(newOptionList);

            });

            /**
             * Preprocess paxQTY data. Get ready to post to fn update-booking-session.
             */
            var priceTypeQtyPairs = [];
            $.each(allSelectorDOMs, function (index, item) {
                item = $(item);
                var type = item.data('type');
                var typeKey = item.data('typeKey');
                var qty = parseInt(item.val());
                var rate = parseInt(item.data('rate'));
                var rateKey = parseInt(item.data('rateKey'));
                priceTypeQtyPairs.push({
                    'type' : type,
                    'typeKey' : typeKey,
                    'rateKey' : rateKey,
                    'qty' : qty,
                    'rate' : rate
                });
            });

            /**
             * Update total and trip details
             */
            var sessionRateTotalDOM = $('.session-rate-total');
            var tourToPayTotalDOM = $('.tour-topay-total');
            var tripDetailDOM = $('#step3-trip-detail');
            var promoCode = $('#booking-promo-code').val();
            $.post({
                url: options.actionUrl,
                data: {
                    'action' : 'update-booking-session',
                    'payload': priceTypeQtyPairs,
                },
                success: function (response) {
                    sessionRateTotalDOM.text('$' + response.total.toFixed(2));
                    tourToPayTotalDOM.text('$' + response.totalToPay.toFixed(2));
                    tripDetailDOM.html(response.tripDetails);

                    // DATA for STEP 3 - TO CONFIRM BOOKING
                    $('.step3-tour-sub-total').text('$' + response.total.toFixed(2));
                    $('.step3-tour-topay-total').text('$' + response.totalToPay.toFixed(2));

                    if(promoCode != '') {
                        $('#apply-promo-code').trigger('click');
                    }
                },
                dataType: 'JSON'
            });

            // ths.calculatePromoDiscount();
    	});

	};

    w.Booking.prototype.confirmBooking = function() {

        var ths = this, options = this.options;

        $(options.bookingFormElm).on('click', options.btnConfirmBooking, function(e){
            
            e.preventDefault();

            var bookingConfirmElm = $('#is_booking_confirmed');

            if (bookingConfirmElm.is(':checked')) {
                
                var data = $(options.bookingFormElm).find('select,input,textarea').serialize();
                
                $.post(options.actionUrl, 'action=make-booking&'+data, function(response){                        
                
                    if(response.isValid){
                        
                        var _tmpl        = _.template( $('#tour-payment-tmpl').html() );
                        var compiledTmpl = _tmpl(response);

                        $('.step4-content').html(compiledTmpl);

                        $(options.bookingFormElm).steps("next");

                        $(options.bookingFormElm).find('li.done').addClass('blocked');
                        $(options.bookingFormElm).find('li.done a').attr("disabled","true");                       
                    }

                }, 'json');

                //$(options.bookingFormElm).submit();

            } else {

                ths.showFlashMsg('.msg-step3','Please accept terms and conditions.', 'danger');
                return false;
            }
                
        });
    };


	w.Booking.prototype.setItinerary = function() {
    	var ths = this, options = this.options;

    	$(options.tourItineraryElm).on('click', options.btnBookNowStep2, function(e){

    		var firstNameElm = $('#booking-first-name'),
    			lastNameElm  = $('#booking-last-name'),
    			emailElm     = $('#booking-email'),
    			phoneElm     = $('#booking-phone');

    		var formIsvalid = true;

    		var allSelectorDOMs   = $('.pax-selector');

    		var selectorsValid = false;
    		$.each(allSelectorDOMs, function (index, item) {
                item = $(item);
                if(item.val() != 0) {
                    selectorsValid = true;
                }
            });

    		if( !selectorsValid )
    		{
    			ths.showFlashMsg('.msg-step2','Please select quantity for activities.', 'danger');
    			return false;
    		} else {
    			if(!firstNameElm.val()){
	    			firstNameElm.addClass('required');
	    			formIsvalid = false;
	    		} else {
	    			firstNameElm.removeClass('required');
	    		}

	    		if(!lastNameElm.val()){
	    			lastNameElm.addClass('required');
	    			formIsvalid = false;
	    		} else {
	    			lastNameElm.removeClass('required');
	    		}

	    		if(!emailElm.val()){
	    			emailElm.addClass('required');
	    			formIsvalid = false;
	    		} else {
	    			var regexEmail = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	    			if (!regexEmail.test(emailElm.val()))
	    			{
	    				ths.showFlashMsg('.msg-step2','Please provide valid email.', 'danger');
    					emailElm.addClass('required');
    					return false;
	    			} else {
	    				emailElm.removeClass('required');
	    			}
	    		}

	    		if(!phoneElm.val()){
	    			phoneElm.addClass('required');
	    			formIsvalid = false;
	    		} else {
	    			var regexPhone = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/;
	    			if (!regexPhone.test(phoneElm.val()))
	    			{
	    				ths.showFlashMsg('.msg-step2','Please provide valid phone.', 'danger');
    					phoneElm.addClass('required');
    					return false;
	    			} else {
	    				phoneElm.removeClass('required');
	    			}
	    		}
    		}

    		if(formIsvalid){
				$('.step3-fname').text(firstNameElm.val());
				$('.step3-lname').text(lastNameElm.val());
				$('.step3-email').text(emailElm.val());
				$('.step3-phone').text(phoneElm.val());
				$('.step3-comment').text( $('#booking-message').val() );

				$(options.bookingFormElm).steps("next");
    		} else {
    			ths.showFlashMsg('.msg-step2','Please provide details for required fields.', 'danger');
    		}
    	});
    };

    w.Booking.prototype.applyPromoCode = function() {
        var ths = this, options = this.options;

        $(options.tourItineraryElm).on('click', '#apply-promo-code', function(e){

            e.preventDefault();
	        
            var tourKey = $(options.bookingFormElm).data('token'),
	        	promoCode = $('#booking-promo-code').val();

	        if(promoCode){
                $.post({
                    url: options.actionUrl,
                    data: {
                        'action' : 'apply-promo-code',
                        'tour': tourKey,
                        'code': promoCode
                    },
                    success: function (response) {
                        if(response.isValid)
                        {
                            if(response.applicable && response.discountAmount > 0) {
                                var sessionRateTotalDOM = $('.session-rate-total');
                                var tourToPayTotalDOM = $('.tour-topay-total');
                                var hiddenTotalToPayDOM = $('#tour-topay-total');
                                var discountAmount = response.discountAmount;

                                sessionRateTotalDOM.text('$' + response.total.toFixed(2));
                                tourToPayTotalDOM.text('$' + response.totalToPay.toFixed(2));
                                hiddenTotalToPayDOM.val(response.totalToPay);

                                discountAmount = parseFloat(discountAmount).toFixed(2);
                                $('.tour-discount-label').text('-$' + discountAmount);
                                $('.tour-discount').removeClass('disabled');
                                $('.step3-tour-discount').text('-$' + discountAmount);


                            } else {
                                $('.tour-discount-label').text('$0.00');
                                $('.tour-discount').addClass('disabled');
                                $('.step3-tour-discount').text('$0.00');
                                ths.showFlashMsg('.msg-promo-code','Promo code is not applicable.', 'danger');
                            }
                        } else {
                            ths.showFlashMsg('.msg-promo-code','Invalid promo code provided.', 'danger');
                        }
                        // DATA for STEP 3 - TO CONFIRM BOOKING
                        $('.step3-tour-sub-total').text('$' + response.total.toFixed(2));
                        $('.step3-tour-topay-total').text('$' + response.totalToPay.toFixed(2));
                    },
                    dataType: 'JSON'
                });
	        } else {
                ths.showFlashMsg('.msg-promo-code','Please provide promo code.', 'danger');
            }
	    });
    };

    w.Booking.prototype.initBookingCalendar = function() {
        
        var ths = this, options = this.options;

        $(options.bookingCalendarElm).datepicker({
        	onSelect: function() { 
		      	ths.getTourSessions();
		    }
		});
                    
    };

    w.Booking.prototype.initFormWizard = function() {
        var ths = this, options = this.options;

        var form = $(options.bookingFormElm);

        var wizard = form.steps({
			headerTag: "h4",
			titleTemplate: "#title#",
			stepsContainerTag:"nav",
		    bodyTag: "div",
		    transitionEffect: "slideLeft",
		    autoFocus: true,
		    enablePagination: false,
            labels: {
		        current: "",
		        pagination: "Pagination",
		        finish: "Submit",
		        next: "Next",
		        previous: "Previous",
		        loading: "Loading ..."
		    }
		});
            
    };

    w.Booking.prototype.showFlashMsg = function(msgElm, msg, state) {
        var ths = this, options = ths.options;

        if( msg && state ) {

            $(msgElm).text('').removeAttr('class').addClass(msgElm.substr(1)).show().addClass('msg text-'+state).text(msg);

            setTimeout(function(){
                $(msgElm).fadeOut();
            }, 4500);

        }
    };	

}(window, document))