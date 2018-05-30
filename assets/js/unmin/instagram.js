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

}(window, document))