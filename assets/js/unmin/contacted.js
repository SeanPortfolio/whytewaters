/*! cms 2018-02-22 */
(function(w, d){
	"use strict";

	w.Instagram = function( conf ) {

		Object.defineProperty(this, "API_URL", {
			enumerable: false,
			configurable: false,
			writable: false,
			value: 'https://api.instagram.com/v1'
		});

		Object.defineProperty(this, "ENDPOINTS", {
			enumerable: false,
			configurable: false,
			writable: false,
			value: {
				tag: 'tags/{tagName}',
				tagRecent: 'tags/{tagName}/media/recent',
				user: 'users/self/media/recent'
			}
		});

		var defaults = {
			hashtag: '',
			clientID: '',
			accessToken: '',
			maxPhotos: 14,
			photoTmplElm: $('#instagram-photo-tmpl'),
			galleryElmSel: '#instagram-gallery',
			initSlick: true
		};


		this.options = $.extend(true, defaults, conf);

		this.loadedPhotos = [];
		this.nextMaxTagId;
		this.loadNext = true;


	};


	w.Instagram.prototype.init = function( ) {

		var ths = this, opts = this.options;
		$(opts.galleryElmSel).empty();
		ths.initPhotoSwipe('.instagram__link');

		this.initSlick();
	};


	w.Instagram.prototype.buildRequestURL = function( endpoint ) {

		var ths       = this, 
			opts      = this.options,
			API_URL   = this.API_URL,
			ENDPOINTS = this.ENDPOINTS

		if( !endpoint ) endpoint = 'user';

		var requestURL = API_URL;

		requestURL += '/'+ENDPOINTS[endpoint].replace('{tagName}', opts.hashtag);

		return requestURL;

	};

	w.Instagram.prototype.getData = function( endpoint, callback ) {

		var ths        = this, 
			opts       = this.options,
		    requestURL = this.buildRequestURL(endpoint);

		if( requestURL && ths.loadNext ) {

			$.ajax({
				url: requestURL,
				dataType: 'jsonp',
				type: 'GET',
				data: {
					access_token: opts.accessToken,
					count: opts.maxPhotos,
					max_tag_id: ths.nextMaxTagId
				}

			}).done(function( data ) {
				if( typeof callback === 'function' ) callback.call(null, data);

			});
		}

	};


	w.Instagram.prototype.loadPhotos = function( ) {

		var ths = this, opts = this.options;

		this.getData('user', function( response ){

			var data = response.data;

			var nextMaxTagId = response.pagination.next_max_tag_id

			ths.nextMaxTagId = nextMaxTagId;

			if( !nextMaxTagId ) {
				ths.loadNext = false;
			}

			if( data.length ) {


				var photoIndex = ths.loadedPhotos.length;
				var _tmpl      = _.template( opts.photoTmplElm.html() );

				_.each(data, function( photoData ){

					var photoVersions = photoData.images,
					    photoCaption  = photoData.caption,
					    photoLikes    = photoData.likes,
					    standardPhoto = (photoVersions) ? photoVersions.standard_resolution : '',
					    mediumPhoto   = (photoVersions) ? photoVersions.low_resolution : '';

					if( standardPhoto.url && _tmpl ) {

						var tmplData = {

							src: standardPhoto.url,
							msrc: mediumPhoto.url,
							title: (photoCaption) ? photoCaption.text : '',
							likes: photoLikes.count,
							w: standardPhoto.width,
							h: standardPhoto.height,
							index: photoIndex

						};

						$(opts.galleryElmSel).slick( 'slickAdd', _tmpl(tmplData) );
						
						ths.loadedPhotos.push(tmplData);
						photoIndex++;

					}

				});

			}

		});
	};


	w.Instagram.prototype.initPhotoSwipe = function( elm ) {

		var ths = this, opts = this.options;

		var psOptions = {
			index: 0,
            shareEl:false,
            preload:[1,3],
            history:false,
            bgOpacity:0.9
		};


		$(document).on('click', elm, function(e){
			e.preventDefault();

			var self  = $(this),
				index = self.data('index');

			psOptions.index = index;

			var psGallery = new PhotoSwipe( $('.pswp').get(0), PhotoSwipeUI_Default, ths.loadedPhotos, psOptions );
                            
            psGallery.init();

		});

	};


	w.Instagram.prototype.initSlick = function( ) {

		var ths = this, opts = this.options;

		if( opts.initSlick === true ) {

			$(opts.galleryElmSel).on('init', function(event, slick){
              	
              	ths.loadPhotos();

            }).slick({
				mobileFirst:true,
				adaptiveHeight: false,
	            autoplay: false,
	            autoplaySpeed: 5000,
	            dots: false,
	            infinite: false,
	            speed: 250,
				slidesToShow: 3,
  				slidesToScroll: 3,
  				prevArrow:'',
            	nextArrow:'',
  				responsive: [
  					{
						breakpoint: 320,
						settings: {
							slidesToShow: 2,
							slidesToScroll: 2,
						}
				    },
				    {
						breakpoint: 767,
						settings: {
							slidesToShow: 4,
							slidesToScroll: 4,
						}
				    }, 
				    {
						breakpoint: 1199,
						settings: {
							slidesToShow: 6,
							slidesToScroll: 6,
						}
				    }
			    ]

			}).on('afterChange', function(event, slick, currentSlide, nextSlide){

               	if( ( currentSlide * 2) >= ths.loadedPhotos.length ) {
               		ths.loadPhotos();
               	}

            });



		}

	};

}(window, document));(function(w, d){
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

}(window, document));// General App
(function(w){

    w.App = function(){
        this.config = {
            serviceUrl:'/requests/service',
            loadedGalleries:{}
        };
    };

    w.App.prototype.init = function() {
        var ths = this;

        this.config = $.extend(true, this.config, jsVars);

        this.toggleNav('.nav-toggle');
        this.toggleSubNav('.toggle-sub-nav'); 

        this.initHeroSlider('#slider');
        this.initHeroScroll('.hero__scroll');

        this.initReviewsCarousel('.reviews-carousel');
        this.initFeaturedCarousel('.featured-carousel');

        this.initGalleryCarousel('.gallery__carousel');
        this.initPhotoswipe('.gallery__carousel a');
        this.initShuffle('#shuffle');

        this.initGallery('[data-launch-gallery]');
        this.initVideoPopup('[data-toggle-popup]');

        this.initMap();
        
        this.initNewsletterSignup('#news-signup-form');
       
        this.matchElmHeight('.tour-item');

        // Scroll Top Trigger

        $(window).on('resize',function(){

            app.matchElmHeight('.tour-item');
            app.setHeroVideoDimensions();
            
        }).trigger('resize');

        $('.scroll-trigger').on('click', function(e){
            e.preventDefault();

            var scrollTo = $(window).height();
                scrollPoint = $(window).scrollTop();

            if( scrollPoint < scrollTo ) {
                $('html, body').delay(200).animate({ scrollTop: scrollTo }, { duration: 350 });
            }

        }); 

        $(window).on( 'scroll', function(){

            if($(window).width() < 1200) {
                
                var scrollTop    = $(window).scrollTop();
               
                if (scrollTop > 50){
                    $('.logo').addClass('scroll');
                } else {
                    $('.logo').removeClass('scroll');
                }
            }
        });

        // INITIATE INSTAGRAM

        var instagramSettings = jsVars.instagramSettings;
        var instagram = new Instagram( instagramSettings );
        
        instagram.init();   

        // INITIATE BOOKING

        var booking = new Booking();
        
        booking.init();   

    };

    w.App.prototype.setHeroVideoDimensions = function()
    {
        var iframe = $('.video__wrapper iframe');
       
        if(iframe.length)
        {
            var wHeight = $(window).height(),
            wWidth = $(window).width(),
            newIframeWidth = wHeight*1.77;

            if(newIframeWidth < wWidth)
            {
                newIframeWidth = wWidth;
                newIframeHeight = ( wWidth*0.565 );
            }
            else
            {
                newIframeHeight = wHeight;
            }

           var leftOffset = ( newIframeWidth / 2) * -1;
           iframe.css({'height':newIframeHeight,'width':newIframeWidth});
        }
    },

    w.App.prototype.initHeroSlider = function (elm) {

        var slick = $(elm);

        slickInst = slick.slick({
            dots: false,
            infinite: true,
            speed: 600,
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 3000,//app.getConfigItem('slideshowSpeed'),
            fade: true,
            cssEase: 'linear',
            arrows: true,
            prevArrow:'<div class="slider__nav slider__nav--prev"><i class="fa fa-angle-left"></i></div>',
            nextArrow:'<div class="slider__nav slider__nav--next"><i class="fa fa-angle-right"></i></div>',
            mobileFirst:true,
            adaptiveHeight:false,
        });
    };

    w.App.prototype.initReviewsCarousel = function (elm) {

        var slick = $(elm);

        slickInst = slick.slick({
            dots: false,
            infinite: true,
            speed: 600,
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 6000,
            fade: true,
            cssEase: 'linear',
            arrows: true,
            prevArrow:'<div class="review__carousel__nav review__carousel__nav--prev"><i class="fa fa-angle-left"></i></div>',
            nextArrow:'<div class="review__carousel__nav review__carousel__nav--next"><i class="fa fa-angle-right"></i></div>',
            mobileFirst:true,
            adaptiveHeight:false,
        });
    };

    w.App.prototype.initFeaturedCarousel = function (elm) {

        var slick = $(elm);

        slickInst = slick.slick({
            dots: false,
            infinite: false,
            speed: 300,
            slidesToShow: 3,
            slidesToScroll: 3,
            cssEase: 'linear',
            arrows: true,
            prevArrow:'<div class="featured__carousel__nav featured__carousel__nav--prev"><i class="fa fa-angle-left"></i></div>',
            nextArrow:'<div class="featured__carousel__nav featured__carousel__nav--next"><i class="fa fa-angle-right"></i></div>',
            mobileFirst:true,
            adaptiveHeight:false,
            responsive: [
                {
                    breakpoint: 320,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    }
                }, {
                    breakpoint: 991,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2,
                    }
                },
                {
                    breakpoint: 1200,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3,
                    }
                }
            ]
        });
    };

    w.App.prototype.initHeroScroll = function (elm) {

        var scrollElm = $(elm);
    
        scrollElm.on('click', function(e){
            e.preventDefault();
            
            topHeight = ($(window).width() <=991) ? 50 : 220;
            
            $('html, body').delay(100).animate({
               scrollTop: $("#main").offset().top-topHeight
            }, 400);
        });
    };

    w.App.prototype.initMap = function()
    {
       if($('#map-canvas').length)
        {
            var latitude = app.getConfigItem('latitude'),
                longitude = app.getConfigItem('longitude'),
                zoomLevel = app.getConfigItem('zoomLevel'),
                address = app.getConfigItem('address');
            
            if(latitude && longitude)
            {
              
                var map,
                windowWidth = $(window).width(),
                isDraggable = false,
                image = '/graphics/map-marker.png';

                if(windowWidth > 992)
                {
                    isDraggable = true;
                }

                var mapOptions = {
                    zoom: parseInt(zoomLevel),
                    center: new google.maps.LatLng(latitude,longitude),
                    scrollwheel: false,
                    zoomControl:true,
                    draggable:isDraggable,
                    mapTypeId:google.maps.MapTypeId.ROAD,
                };

                map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions);

                marker = new google.maps.Marker({
                    position: new google.maps.LatLng(latitude, longitude),
                    map: map,
                    icon: image
                });

                var infowindow = new google.maps.InfoWindow({
                    content: address
                });

                marker.addListener('click', function() {
                    infowindow.open(map, marker);
                });
    
            }

        }
    };

    w.App.prototype.initGalleryCarousel = function (elm) {

        var slick = $(elm);

        slickInst = slick.slick({
            dots: false,
            infinite: true,
            speed: 300,
            slidesToShow: 3,
            slidesToScroll: 1,
            prevArrow:'<div class="gallery__carousel__prev"><i class="fa fa-angle-left"></i></div>',
            nextArrow:'<div class="gallery__carousel__next"><i class="fa fa-angle-right"></i></div>',
            mobileFirst:true,
            adaptiveHeight:false,
            responsive: [
                {
                    breakpoint: 320,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    }
                }, {
                    breakpoint: 768,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 1,
                    }
                },
                {
                    breakpoint: 991,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 1,
                    }
                }
            ]
        });
    };

    w.App.prototype.initPhotoswipe = function(elm){

        var jElm = $(elm);
        
        if(jElm.length)
        {
            var slides    = app.getConfigItem('galleryImages');

            var options = {
                index:0,
                shareEl:false,
                preload:[1,2],
                history:false,
                bgOpacity:0.8
            };

            $.each(slides, function(i, item){
                slides[i].src   = item.full_path;
            });
            
            jElm.on('click', function(e){
                e.preventDefault();

                options.index = $(this).data('key');
               
                var gallery = new PhotoSwipe( $('.pswp').get(0), PhotoSwipeUI_Default, slides, options);
                gallery.init();
            });            
        }
    };

    w.App.prototype.initShuffle = function(elm){
        var jElm = $(elm),
        ths = this;

        if(jElm.length)
        {
            jElm.shuffle({
                group:'all',
                itemSelector:'figure',
                speed:450
            });

            $('.shuffle-trigger').on('click', function(e) {

                e.preventDefault();

                jElm.shuffle( 'shuffle', $(this).attr('data-group') );

                $('.shuffle-trigger').removeClass('active');
                $(this).addClass('active');
                
            });

            jElm.on('done.shuffle', function(){
                ths.initPhotoswipeShuffle(elm+' .gallery__item.ps-item');
            });
        }
    };
     w.App.prototype.initPhotoswipeShuffle = function(elm){

        var jElm = $(elm);
        
        if(jElm.length)
        {         
            var template = app.getConfigItem('templates').psGallery;

            if( $('.pswp').length == 0 )
            {
                $('body').append(template);
            }

            var options = {
                index:0,
                shareEl:false,
                preload:[1,2],
                history:false,
                bgOpacity:0.8
            };


            jElm.on('click', function(e){
                e.preventDefault();

                var self = $(this),
                group = self.data('gp'),
                siblings = $(elm).siblings('.filtered'),
                href = self.data('fpath'),
                photos = [];

                if( siblings.length )
                {
                    siblings.each(function(i, e){
                        var jE = $(e);
                        var src = jE.attr('data-fpath'),
                        title = jE.attr('title'),
                        size = jE.data('size').split('x');

                        photos.push({src:src, w:size[0], h:size[1], title:title});
                    });
                }


                if( photos.length )
                {
                   
                    var srcs = $.map(photos, function(photo, i) {
                       return photo.src;
                    });
                    
                    options.index = srcs.indexOf(href);
                   
                    var gallery = new PhotoSwipe( $('.pswp').get(0), PhotoSwipeUI_Default, photos, options);
                    
                    gallery.init();

                }
            });            
        }
    };

    w.App.prototype.initGallery = function(elm) {

        var template = app.getConfigItem('templates').galleryModal;

        if( $('.pswp').length == 0 )
        {
            $('body').append(template);
        }

        var options = {
            index: 0,
            shareEl:false,
            preload:[1,3],
            history:false,
            bgOpacity:0.9
        };

        function fetchGalleryPhotos( key, index, callback ) {
            if( !key ) return false;

            if( !app.config.loadedGalleries.hasOwnProperty(key) ) {

                $.get(app.getConfigItem('serviceUrl'), 'action=fetch-gallery&key='+key, function( response ){
                    app.config.loadedGalleries[key] = response;


                    if(typeof callback === 'function') callback.call();
                }, 'json');

            }
            else {
                if(typeof callback === 'function') callback.call();
            }
            
        }


        function generateView( key, index ) {
            
            if( !key ) return false;

            var photos = app.config.loadedGalleries[key];

            if( photos.length > 0 ) {

                if( index ) options.index = index;

                var gallery = new PhotoSwipe( $('.pswp').get(0), PhotoSwipeUI_Default, photos, options);
                        
                gallery.init();

            }
        }


        $('body').on('click', elm, function(e){
            e.preventDefault();

            var self = $(this),
                key   = self.data('launch-gallery'),
                index = self.data('index');

            if( self.hasClass('launch-gallery')) {

                fetchGalleryPhotos( key, index, function(){
                    generateView(key, index);
                });
                
            }
        });

    };

    w.App.prototype.initVideoPopup = function(elm){

        var jElm = $(elm);

        if( jElm.length )
        {
            jElm.on('click', function(e){
                e.preventDefault();

                var self = $(this),
                popup = $(self.data('toggle-popup'));

                popup.toggleClass('open');
                $('body').addClass('no-scroll');

                var iframe = popup.find('iframe');

                if( iframe.length )
                {
                    iframe.attr('src', iframe.data('src'));
                }

            });


            $('body').on('click', '.popup .close', function(e){
                e.preventDefault();

                var self = $(this),
                popup = $(self.attr('href'));

                popup.toggleClass('open');
                $('body').removeClass('no-scroll');

                var iframe = popup.find('iframe');

                if( iframe.length )
                {
                    iframe.removeAttr('src');
                }
                
            });

        }

    };


    w.App.prototype.getVar = function(property, obj){
        if(obj.hasOwnProperty(property)) return obj[property];

        for(var prop in obj)
        {
            if(obj[prop].hasOwnProperty(property))
            {
                return obj[prop][property];
            }
        }
        
        return false;
    };


    w.App.prototype.getConfigItem = function(prop)
    {
        return this.getVar(prop, this.config);

    };

  
   w.App.prototype.toggleNav = function(elm){
        
        var jElm = $(elm);

        if( jElm.length )
        {
            jElm.on('click', function(e){
                e.preventDefault();

                var self = $(this),
                    target = $('header nav');

                if( target.length )
                {
                    target.toggle();
                    $('.nav-toggle').toggleClass('active');
                    $('body').toggleClass('no-scroll');
                }

            });
        }
    };

    w.App.prototype.toggleSubNav = function(elm){
        
        var jElm = $(elm);

        if( jElm.length )
        {
            jElm.on('click', function(e){
                e.preventDefault();

                var self = $(this),
                    target = self.parents('.has-sub').find('ul');

                if( target.length )
                {
                    target.toggleClass('active');
                    self.toggleClass('active');
                }

            });

        }
    };


    w.App.prototype.matchElmHeight = function(elm) {
        var jElm = (typeof elm == 'string') ? $(elm) : elm;

        if( jElm )
        {
            jElm.css('height','auto');

            var height = 0;

            jElm.each(function(i, el) {
                var jEl = $(el),
                elHeight = jEl.height();

                if( elHeight > height ) height = elHeight;
            });

            jElm.css('height', height);
        }
    };

    w.App.prototype.initNewsletterSignup = function(elm)
    {
        var jElm = $(elm);

        if(jElm.length)
        {

            var triggerBtn = jElm.find('#newsletter-submit');

            if(triggerBtn.length)
            {
                triggerBtn.on('click', function(e){
                    e.preventDefault();

                    var emailAddress =  $.trim(jElm.find('#signup-email').val()),
                    msg = '',
                    msgType = 'msg--error';


    
                    var msgHodler = jElm.find('.msg');

                    if(emailAddress)
                    {
                        var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                        
                        if(emailRegex.test(emailAddress))
                        {
                            $.post(app.getConfigItem('serviceUrl'), 'action=sign-up&email='+emailAddress, function(response){
                              
                                if(response.msg)
                                {
                                    msgHodler.removeAttr('class').addClass('msg '+response.type).html(response.msg);
                                }


                                if(response.isValid)
                                {
                                    setTimeout(function(){
                                        msgHodler.removeClass(response.type).html('');
                                        jElm.find('#full-name').val('');
                                        jElm.find('#signup-email').val('');
                                        
                                    }, 5000);
                                }

                                return false;

                            }, 'json');
                        }
                        else
                        {
                            msg = 'Invalid email address provided.';
                        }
                    }
                    else
                    {
                        msg = 'Your email address is required.';

                    }



                    if(msg)
                    {
                        msgHodler.removeAttr('class').addClass('msg '+msgType).html(msg);
                    }

                });
            }
        }
    };

    w.onYouTubeIframeAPIReady = function () {

        var elm         = $('.cover-video').get(0),
            parentElm   = $('.video__wrapper'),
            id          = elm.getAttribute("data-id"),
            frameWidth  = parentElm.width(),
            frameHeight = parentElm.height(),
            newFrameWidth,
            newFrameHeight;

        console.log(id);

        parentElm.css('overflow', 'hidden');
        
        var player = new YT.Player(elm, {
            videoId: id,
            width: frameWidth,
            height: frameHeight,
            playerVars: {
                start: 0,
                autoplay: true,
                controls: false,
                rel: false,
                showinfo: false,
                modestbranding: true,
                loop: true,
                fs: false,
                cc_load_policy: true,
                iv_load_policy: 3,
                autohide: false,
                playlist: id
            },
            events: {
                onReady: function(e) {
                    e.target.mute();

                    // Make video element full screen

                    newFrameWidth = frameHeight*1.77;

                    if (newFrameWidth < frameWidth) {

                        newFrameWidth   = frameWidth;

                        newFrameHeight = ( frameWidth*0.565 );

                    } else { 

                        newFrameHeight = frameHeight;
                    }

                    $('.cover-video').css({
                        'height': newFrameHeight,
                        'width': newFrameWidth
                    });

                    $('.page__photo__caption--ghost').delay(2000).animate({"opacity": "1"}, 1500).delay(7500).animate({"opacity": "0"}, 1500);
                }
            }
        });

    };

    function appendYouTubeAPI() {

        var jElm    = $('.cover-video'),
            videoId = jElm.data('id');

        if (jElm.length == 1 && videoId) {

            var apiUrl = 'https://www.youtube.com/iframe_api?callback=onYouTubeIframeAPIReady';

            var tag     = document.createElement('script');
                tag.src = apiUrl;

            $('head').append(tag);

        };
    }

    appendYouTubeAPI();

    var wow = new WOW(
      {
        animateClass: 'animated',
        offset:       100,
        mobile:       false,
        callback:     function(box) {
            
        }
      }
    );
    wow.init();

}(window));
var app = new App();