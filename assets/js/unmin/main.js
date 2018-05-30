/*! cms 2018-03-26 */
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

}(window, document));// General App
(function (w) {

    w.App = function () {
        this.config = {
            serviceUrl: '/requests/service',
            loadedGalleries: {}
        };
    };

    w.App.prototype.init = function () {
        var ths = this;

        this.config = $.extend(true, this.config, jsVars);

        this.toggleNav('.nav-toggle');
        this.toggleSubNav('.toggle-sub-nav');

        this.initHeroSlider('#slider');
        this.initHeroScroll('.hero__scroll');

        this.initReviewsCarousel('.reviews-carousel');
        this.initFeaturedCarousel('.featured-carousel');
        this.initCaseStudyCarousel('.case-study-carousel');
        this.initPartnerLogosCarousel('.partner-logos');

        this.initGalleryCarousel('.gallery__carousel');
        this.initPhotoswipe('.gallery__carousel a');
        this.initShuffle('#shuffle');

        this.initGallery('[data-launch-gallery]');
        this.initVideoPopup('[data-toggle-popup]');

        this.initMap();

        this.initNewsletterSignup('#news-signup-form');

        this.matchElmHeight('.tour-item');

        // Scroll Top Trigger

        $(window).on('resize', function () {

            app.matchElmHeight('.tour-item');
            app.setHeroVideoDimensions();

        }).trigger('resize');

        $('.scroll-trigger').on('click', function (e) {
            e.preventDefault();

            var scrollTo = $(window).height();
            scrollPoint = $(window).scrollTop();

            if (scrollPoint < scrollTo) {
                $('html, body').delay(200).animate({scrollTop: scrollTo}, {duration: 350});
            }

        });

        $('.general-page .primary__header').addClass("section-white");
        if ($(window).width() <= 991) {
            $('.home-page .primary__header').addClass("section-white");
        }

        $(window).scroll(function () {
            if ($(window).width() < 991) {
                $('.home-page .primary__header').addClass("section-white");
            } else {
                if ($(this).scrollTop() > 100) {
                    $('.home-page .primary__header').addClass("section-white");
                } else {
                    $('.home-page .primary__header').removeClass("section-white");
                }
            }
        });

        var allModalDOMs = $('.package-modal');
        var blackGroundDOM = $('.package-modal-wrapper');

        $('.package-modal__close-button').on('click', function () {
            allModalDOMs.hide();
            blackGroundDOM.hide();
        });

        $('.package-view-detail__button').on('click', function (event) {
            blackGroundDOM.show();
            var packageId = $(event.target).data('packageId');
            allModalDOMs.hide();
            $('.package-modal[data-package-id=' + packageId + ']').show();
            $(window).scrollTop(0);
        });

        $('.faq-item__question').on('click', function (event) {
            $(this).next().toggle();
        })
    };

    w.App.prototype.setHeroVideoDimensions = function () {
        var iframe = $('.video__wrapper iframe');

        if (iframe.length) {
            var wHeight = $(window).height(),
                wWidth = $(window).width(),
                newIframeWidth = wHeight * 1.77;

            if (newIframeWidth < wWidth) {
                newIframeWidth = wWidth;
                newIframeHeight = (wWidth * 0.565);
            }
            else {
                newIframeHeight = wHeight;
            }

            var leftOffset = (newIframeWidth / 2) * -1;
            iframe.css({'height': newIframeHeight, 'width': newIframeWidth});
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
                autoplaySpeed: this.config.globals.slideshowSpeed,
                fade: true,
                cssEase: 'linear',
                arrows: true,
                prevArrow: '<div class="slider__nav slider__nav--prev"><i class="fa fa-angle-left"></i></div>',
                nextArrow: '<div class="slider__nav slider__nav--next"><i class="fa fa-angle-right"></i></div>',
                mobileFirst: true,
                adaptiveHeight: false,
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
            prevArrow: '<div class="review__carousel__nav review__carousel__nav--prev"><i class="fa fa-angle-left"></i></div>',
            nextArrow: '<div class="review__carousel__nav review__carousel__nav--next"><i class="fa fa-angle-right"></i></div>',
            mobileFirst: true,
            adaptiveHeight: false,
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
            prevArrow: '<div class="featured__carousel__nav featured__carousel__nav--prev"><i class="fa fa-angle-left"></i></div>',
            nextArrow: '<div class="featured__carousel__nav featured__carousel__nav--next"><i class="fa fa-angle-right"></i></div>',
            mobileFirst: true,
            adaptiveHeight: false,
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

    w.App.prototype.initCaseStudyCarousel = function (elm) {

        var slick = $(elm);

        slickInst = slick.slick({
            dots: true,
            infinite: false,
            speed: 300,
            slidesToShow: 1,
            slidesToScroll: 1,
            cssEase: 'linear',
            arrows: true,
            mobileFirst: true,
            adaptiveHeight: false
        });
    };

    w.App.prototype.initPartnerLogosCarousel = function (elm) {

        var slick = $(elm);

        slickInst = slick.slick({
            dots: false,
            infinite: true,
            speed: 300,
            slidesToShow: 6,
            slidesToScroll: 3,
            cssEase: 'linear',
            arrows: true,
            prevArrow: '<div class="partner-carousel-nav-button partner-carousel-nav-button--prev"><i class="fa fa-angle-left"></i></div>',
            nextArrow: '<div class="partner-carousel-nav-button partner-carousel-nav-button--next"><i class="fa fa-angle-right"></i></div>',
            mobileFirst: true,
            adaptiveHeight: false,
            responsive: [
                {
                    breakpoint: 319,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    }
                }, {
                    breakpoint: 991,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3,
                    }
                },
                {
                    breakpoint: 1200,
                    settings: {
                        slidesToShow: 6,
                        slidesToScroll: 3,
                    }
                }
            ]
        });
    };

    w.App.prototype.initHeroScroll = function (elm) {

        var scrollElm = $(elm);

        scrollElm.on('click', function (e) {
            e.preventDefault();

            topHeight = ($(window).width() <= 991) ? 50 : 220;

            $('html, body').delay(100).animate({
                scrollTop: $("#main").offset().top - topHeight
            }, 400);
        });
    };

    w.App.prototype.initMap = function () {
        if ($('#map-canvas').length) {
            var latitude = app.getConfigItem('latitude'),
                longitude = app.getConfigItem('longitude'),
                zoomLevel = app.getConfigItem('zoomLevel'),
                address = app.getConfigItem('address');

            if (latitude && longitude) {

                var map,
                    windowWidth = $(window).width(),
                    isDraggable = false,
                    image = '/graphics/map-marker.png';

                if (windowWidth > 992) {
                    isDraggable = true;
                }

                var mapOptions = {
                    zoom: parseInt(zoomLevel),
                    center: new google.maps.LatLng(latitude, longitude),
                    scrollwheel: false,
                    zoomControl: true,
                    draggable: isDraggable,
                    mapTypeId: google.maps.MapTypeId.ROAD,
                };

                map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

                marker = new google.maps.Marker({
                    position: new google.maps.LatLng(latitude, longitude),
                    map: map,
                    icon: image
                });

                var infowindow = new google.maps.InfoWindow({
                    content: address
                });

                marker.addListener('click', function () {
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
            prevArrow: '<div class="gallery__carousel__prev"><i class="fa fa-angle-left"></i></div>',
            nextArrow: '<div class="gallery__carousel__next"><i class="fa fa-angle-right"></i></div>',
            mobileFirst: true,
            adaptiveHeight: false,
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

    w.App.prototype.initPhotoswipe = function (elm) {

        var jElm = $(elm);

        if (jElm.length) {
            var slides = app.getConfigItem('galleryImages');

            var options = {
                index: 0,
                shareEl: false,
                preload: [1, 2],
                history: false,
                bgOpacity: 0.8
            };

            $.each(slides, function (i, item) {
                slides[i].src = item.full_path;
            });

            jElm.on('click', function (e) {
                e.preventDefault();

                options.index = $(this).data('key');

                var gallery = new PhotoSwipe($('.pswp').get(0), PhotoSwipeUI_Default, slides, options);
                gallery.init();
            });
        }
    };

    w.App.prototype.initShuffle = function (elm) {
        var jElm = $(elm),
            ths = this;

        if (jElm.length) {
            jElm.shuffle({
                group: 'all',
                itemSelector: 'figure',
                speed: 450
            });

            $('.shuffle-trigger').on('click', function (e) {

                e.preventDefault();

                jElm.shuffle('shuffle', $(this).attr('data-group'));

                $('.shuffle-trigger').removeClass('active');
                $(this).addClass('active');

            });

            jElm.on('done.shuffle', function () {
                ths.initPhotoswipeShuffle(elm + ' .gallery__item.ps-item');
            });
        }
    };
    w.App.prototype.initPhotoswipeShuffle = function (elm) {

        var jElm = $(elm);

        if (jElm.length) {
            var template = app.getConfigItem('templates').psGallery;

            if ($('.pswp').length == 0) {
                $('body').append(template);
            }

            var options = {
                index: 0,
                shareEl: false,
                preload: [1, 2],
                history: false,
                bgOpacity: 0.8
            };


            jElm.on('click', function (e) {
                e.preventDefault();

                var self = $(this),
                    group = self.data('gp'),
                    siblings = $(elm).siblings('.filtered'),
                    href = self.data('fpath'),
                    photos = [];

                if (siblings.length) {
                    siblings.each(function (i, e) {
                        var jE = $(e);
                        var src = jE.attr('data-fpath'),
                            title = jE.attr('title'),
                            size = jE.data('size').split('x');

                        photos.push({src: src, w: size[0], h: size[1], title: title});
                    });
                }


                if (photos.length) {

                    var srcs = $.map(photos, function (photo, i) {
                        return photo.src;
                    });

                    options.index = srcs.indexOf(href);

                    var gallery = new PhotoSwipe($('.pswp').get(0), PhotoSwipeUI_Default, photos, options);

                    gallery.init();

                }
            });
        }
    };

    w.App.prototype.initGallery = function (elm) {

        var template = app.getConfigItem('templates').galleryModal;

        if ($('.pswp').length == 0) {
            $('body').append(template);
        }

        var options = {
            index: 0,
            shareEl: false,
            preload: [1, 3],
            history: false,
            bgOpacity: 0.9
        };

        function fetchGalleryPhotos(key, index, callback) {
            if (!key) return false;

            if (!app.config.loadedGalleries.hasOwnProperty(key)) {

                $.get(app.getConfigItem('serviceUrl'), 'action=fetch-gallery&key=' + key, function (response) {
                    app.config.loadedGalleries[key] = response;


                    if (typeof callback === 'function') callback.call();
                }, 'json');

            }
            else {
                if (typeof callback === 'function') callback.call();
            }

        }


        function generateView(key, index) {

            if (!key) return false;

            var photos = app.config.loadedGalleries[key];

            if (photos.length > 0) {

                if (index) options.index = index;

                var gallery = new PhotoSwipe($('.pswp').get(0), PhotoSwipeUI_Default, photos, options);

                gallery.init();

            }
        }


        $('body').on('click', elm, function (e) {
            e.preventDefault();

            var self = $(this),
                key = self.data('launch-gallery'),
                index = self.data('index');

            if (self.hasClass('launch-gallery')) {

                fetchGalleryPhotos(key, index, function () {
                    generateView(key, index);
                });

            }
        });

    };

    w.App.prototype.initVideoPopup = function (elm) {

        var jElm = $(elm);

        if (jElm.length) {
            jElm.on('click', function (e) {
                e.preventDefault();

                var self = $(this),
                    popup = $(self.data('toggle-popup'));

                popup.toggleClass('open');
                $('body').addClass('no-scroll');

                var iframe = popup.find('iframe');

                if (iframe.length) {
                    iframe.attr('src', iframe.data('src'));
                }

            });


            $('body').on('click', '.popup .close', function (e) {
                e.preventDefault();

                var self = $(this),
                    popup = $(self.attr('href'));

                popup.toggleClass('open');
                $('body').removeClass('no-scroll');

                var iframe = popup.find('iframe');

                if (iframe.length) {
                    iframe.removeAttr('src');
                }

            });

        }

    };


    w.App.prototype.getVar = function (property, obj) {
        if (obj.hasOwnProperty(property)) return obj[property];

        for (var prop in obj) {
            if (obj[prop].hasOwnProperty(property)) {
                return obj[prop][property];
            }
        }

        return false;
    };


    w.App.prototype.getConfigItem = function (prop) {
        return this.getVar(prop, this.config);

    };


    w.App.prototype.toggleNav = function (elm) {

        var jElm = $(elm);

        if (jElm.length) {
            jElm.on('click', function (e) {
                e.preventDefault();

                var self = $(this),
                    target = $('header nav');

                if (target.length) {
                    target.toggle();
                    $('.nav-toggle').toggleClass('active');
                    $('body').toggleClass('no-scroll');
                }

            });
        }
    };

    w.App.prototype.toggleSubNav = function (elm) {

        var jElm = $(elm);

        if (jElm.length) {
            jElm.on('click', function (e) {
                e.preventDefault();

                var self = $(this),
                    target = self.parents('.has-sub').find('ul');

                if (target.length) {
                    target.toggleClass('active');
                    self.toggleClass('active');
                }

            });

        }
    };


    w.App.prototype.matchElmHeight = function (elm) {
        var jElm = (typeof elm == 'string') ? $(elm) : elm;

        if (jElm) {
            jElm.css('height', 'auto');

            var height = 0;

            jElm.each(function (i, el) {
                var jEl = $(el),
                    elHeight = jEl.height();

                if (elHeight > height) height = elHeight;
            });

            jElm.css('height', height);
        }
    };

    w.App.prototype.initNewsletterSignup = function (elm) {
        var jElm = $(elm);

        if (jElm.length) {

            var triggerBtn = jElm.find('#newsletter-submit');

            if (triggerBtn.length) {
                triggerBtn.on('click', function (e) {
                    e.preventDefault();

                    var emailAddress = $.trim(jElm.find('#signup-email').val()),
                        msg = '',
                        msgType = 'msg--error';


                    var msgHodler = jElm.find('.msg');

                    if (emailAddress) {
                        var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;

                        if (emailRegex.test(emailAddress)) {
                            $.post(app.getConfigItem('serviceUrl'), 'action=sign-up&email=' + emailAddress, function (response) {

                                if (response.msg) {
                                    msgHodler.removeAttr('class').addClass('msg ' + response.type).html(response.msg);
                                }


                                if (response.isValid) {
                                    setTimeout(function () {
                                        msgHodler.removeClass(response.type).html('');
                                        jElm.find('#full-name').val('');
                                        jElm.find('#signup-email').val('');

                                    }, 5000);
                                }

                                return false;

                            }, 'json');
                        }
                        else {
                            msg = 'Invalid email address provided.';
                        }
                    }
                    else {
                        msg = 'Your email address is required.';

                    }


                    if (msg) {
                        msgHodler.removeAttr('class').addClass('msg ' + msgType).html(msg);
                    }

                });
            }
        }
    };

    w.onYouTubeIframeAPIReady = function () {

        // slideshow youtube video
        var elm = $('.cover-video').get(0);
        if(elm) {
            var parentElm = $('.video__wrapper'),
                id = elm.getAttribute("data-id"),
                frameWidth = parentElm.width(),
                frameHeight = parentElm.height(),
                newFrameWidth,
                newFrameHeight;

            parentElm.css('overflow', 'hidden');

            var player = new YT.Player(elm, {
                videoId: id,
                width: frameWidth,
                height: frameHeight,
                playerVars: {
                    start: 0,
                    autoplay: true,
                    controls: false,
                    showinfo: false,
                    modestbranding: true,
                    loop: true,
                    fs: false,
                    cc_load_policy: true,
                    iv_load_policy: 3,
                    autohide: false,
                    playlist: id,
                    rel: 0
                },
                events: {
                    onReady: function (e) {
                        e.target.mute();

                        // Make video element full screen
                        newFrameWidth = frameHeight * 1.77;
                        if (newFrameWidth < frameWidth) {
                            newFrameWidth = frameWidth;
                            newFrameHeight = (frameWidth * 0.565);
                        } else {
                            newFrameHeight = frameHeight;
                        }

                        $('.cover-video').css({
                            'height': newFrameHeight,
                            'width': newFrameWidth
                        });

                        //$('.page__photo__caption--ghost').delay(2000).animate({"opacity": "1"}, 1500).delay(7500).animate({"opacity": "0"}, 1500);
                    }
                }
            });
        }


        // the second video, the one in homepage intro section
        var introVideoDOMId = 'ytplayer';
        var introVideoDOM = $('#' + introVideoDOMId);
        var introYoutubeVideoId = introVideoDOM.data('id');
        var playButton = $('.play-video-btn');

        console.log('second video loading up');
        if (introVideoDOM && introYoutubeVideoId) {
            var autoplayFlag = parseInt(introVideoDOM.data('autoplay'));

            var player;
            player = new YT.Player(introVideoDOMId, {
                videoId: introYoutubeVideoId,
                playerVars: {
                    autoplay: autoplayFlag,
                    controls: false,
                    rel: false,
                    showinfo: false,
                    modestbranding: false, // <- hide Youtube Logo on bottom right corner
                    loop: false,
                    fs: false,
                    cc_load_policy: true,
                    iv_load_policy: 3,
                    autohide: false
                },
                events: {
                    'onReady': function (event) {
                        if (autoplayFlag == 1) {
                            event.target.mute();
                            event.target.playVideo();
                        }
                        playButton.on("click", function () {
                            event.target.playVideo();
                            playButton.hide();
                        })
                    },
                    'onStateChange': function (event) {
                        if( event.data == YT.PlayerState.ENDED ) {
                            $('.homepage-youtube__background').fadeIn();
                            playButton.fadeIn();
                        }
                        if( event.data == YT.PlayerState.PLAYING ) {
                            $('.homepage-youtube__background').fadeOut();
                        }
                    }
                }
            });
        }
    };

    function appendYouTubeAPI() {

        var jElm = $('.cover-video'),
            videoId = jElm.data('id');

        var introVideoDOMId = 'ytplayer';
        var introVideoDOM = $('#' + introVideoDOMId);
        var introYoutubeVideoId = introVideoDOM.data('id');

        if ((jElm.length == 1 && videoId) || (introVideoDOM.length == 1 && introYoutubeVideoId)) {

            var apiUrl = 'https://www.youtube.com/iframe_api?callback=onYouTubeIframeAPIReady';

            var tag = document.createElement('script');
            tag.src = apiUrl;

            $('head').append(tag);

        }
        ;
    }

    appendYouTubeAPI();

    var wow = new WOW(
        {
            animateClass: 'animated',
            offset: 100,
            mobile: false,
            callback: function (box) {

            }
        }
    );
    wow.init();

}(window));
var app = new App();