<?php

$flagYes = FLAG_YES;

$bookingContentView .= <<<HTML
	<section class="section section-no-gutters">
	    <div class="container-fluid container--fluid-fw">
	    	<div class="has-gutters has--shadow bg--white">
	    		<div class="row">
	                <div class="col-xs-12">
	                	<form id="form-wizard" method="post" data-token="{$tourBookingEngineId}" action="{$bookingFormURL}/confirm">
	                		
	                		<h4>Booking Details</h4>
						    <div class="step1-content">
						    	{$tourBookingIntroduction}
						    	<div class="form__cols">
							    	<div class="form__col form__col-left">
							    		<div id="datepicker"></div>
							    	</div>
							    	<div class="form__col form__col-right tour-sessions">
							    		<div class="items__head">
							    			<span class="items__head__label items__head__label--lg">Date</span>
							    			<span class="items__head__label">Time</span>
							    			<span class="items__head__label">State</span>
							    		</div>
							    		<div class="items__body tour-sessions-body"></div>
							    	</div>
							    </div>
						    </div>
						 
						    <h4>Your Details</h4>
						    <div class="step2-content">
						    	<div class="form__cols">
							    	<div class="form__col">
							    		<img src="{$tourPhotoPath}" alt="{$tourMenuLabel}">
							    	</div>
							    	<div class="form__col tour-itinerary">
							    		<h3 class="form__heading">Selected Date: <span class="sel-datetime"></span></h3>
							    		<div class="form__fieldset">
							    			<div class="form__fieldset__head">
							    				<h4>Trip Details</h4>
							    				<p>The remaining spaces: <span class="session-spaces"></span></p>
							    			</div>
							    			<div class="form__fieldset__body">
							    				<fieldset class="price-type-wrapper">
							    				</fieldset>
							    				<fieldset>
							    					<div class="form__group form__group--rate ">
										                <label class="form__control__label rate-label">Total NZD</label>
										                <span class="session-rate-total">&#36; 0.00</span>
										            </div>
							    					<div class="form__group form__group--half form__group--inline">
										                <label class="form__control__label">Promo Code</label>
										                <input type="text" id="booking-promo-code" value="" class="form__control" name="booking_promo_code" tabindex="3">
										                <p class="msg-promo-code"></p>
										            </div>
										            <div class="form__group form__group--half form__group--inline">
										                <label class="form__control__label">&nbsp;</label>
										                <button type="text" id="apply-promo-code" value="" class="btn btn__gold" name="apply-promo-code">Apply Promo Code</button>
										            </div>
										            <div class="form__group form__group--rate tour-discount disabled">
										                <label class="form__control__label rate-label">Discount</label>
										                <span class="tour-discount-label">&#36;0.00</span>
										            </div>
										            <div class="form__group form__group--rate">
										                <label class="form__control__label rate-label">To Pay NZD</label>
										                <span class="tour-topay-total">&#36; 0.00</span>
										            </div>
							    				</fieldset>
							    			</div>
							    		</div>
							    		<div class="form__fieldset">
							    			<div class="form__fieldset__head">
							    				<h4>Contact Details</h4>
							    			</div>
							    			<div class="form__fieldset__body">
							    				<fieldset>
							    					<div class="form__group">
										                <label class="form__control__label">First Name<span class="text-danger">*</span></label>
										                <input type="text" id="booking-first-name" value="" class="form__control" name="first_name" tabindex="4">
										            </div>
										            <div class="form__group">
										                <label class="form__control__label">Last Name<span class="text-danger">*</span></label>
										                <input type="text" id="booking-last-name" value="" class="form__control" name="last_name" tabindex="5">
										            </div>
										            <div class="form__group">
										                <label class="form__control__label">Email<span class="text-danger">*</span></label>
										                <input type="text" id="booking-email" value="" class="form__control" name="email" tabindex="6">
										            </div>
										            <div class="form__group">
										                <label class="form__control__label">Phone/Mobile<span class="text-danger">*</span></label>
										                <input type="tel" id="booking-phone" value="" class="form__control" name="phone" tabindex="7">
										            </div>
										            <div class="form__group">
										                <label class="form__control__label">Message</label>
										                <textarea name="message" id="booking-message" class="form__control" rows="8" tabindex="8"></textarea>
										            </div>
							    				</fieldset>
							    			</div>
							    		</div>
							    		<a class="btn btn--ghost tour-booking-btn" onClick="ga('send', 'event', { eventCategory: 'Your Details', eventAction: 'clicked', eventLabel: 'Step 2'});">Book Now</a>
							    		<p class="msg-step2"></p>
							    	</div>
							    </div>						    	
						    </div>
						    <h4>Confirm</h4>
						    <div class="step3-content">
						    	<div class="form__cols">
							    	<div class="form__col">
							    		<img src="{$tourPhotoPath}" alt="{$tourMenuLabel}">
							    	</div>
							    	<div class="form__col">
							    		<h3 class="form__heading">Selected Date: <span class="sel-datetime"></span></h3>
							    		<div class="form__fieldset">
							    			<div class="form__fieldset__head">
							    				<h4>Trip Details</h4>
							    			</div>
							    			<div class="form__fieldset__body">
							    				<div id="step3-trip-detail"></div>
							    				<p><span><label>Total NZD</label> <span class="step3-tour-sub-total"></span></span></p>
							    				<p><span><label>Discount NZD</label> <span class="step3-tour-discount"></span></span></p>
							    				<p><span><label>To Pay NZD</label> <span class="step3-tour-topay-total"></span></span></p>
							    			</div>
							    		</div>
							    		<div class="form__fieldset">
							    			<div class="form__fieldset__head">
							    				<h4>Contact Details</h4>
							    			</div>
							    			<div class="form__fieldset__body">
							    				<p><span><label>First Name</label> <span class="step3-fname"></span></span></p>
							    				<p><span><label>Last Name</label> <span class="step3-lname"></span></span></p>
							    				<p><span><label>Email</label> <span class="step3-email"></span></span></p>
							    				<p><span><label>Phone</label> <span class="step3-phone"></span></span></p>
							    				<p><span><label>Comment</label> <span class="step3-comment"></span></span></p>
							    			</div>
							    		</div>		    		
							    	</div>
							    </div>						    	
							    <div class="form__cols text-center">
							    	<div class="form__col form__col--fw text-left">							    	
								    	<div class="form__fieldset">
							    			<div class="form__fieldset__head">
							    				<h4>Terms and Conditions</h4>
							    			</div>
							    			<div class="form__fieldset__body form__fieldset__body--scroll">
							    				{$bookingTermsAndConditions}
							    			</div>
								    	</div>
								    	<div class="form__fieldset">
							    			<div class="form__fieldset__head">
							    				<h4>Confirm your booking</h4>
							    			</div>
							    			<div class="form__fieldset__body">
							    				<p>Secure payment is made to us via Real Time Booking Systems (RTBS). Please have your credit card handy.</p>
							    				<fieldset>
							    					<div class="form__group">
										                <label class="form__control__label form__control__label--inline">
										                	<input name="is_booking_confirmed" type="checkbox" id="is_booking_confirmed" value="{$flagYes}">
										                	I have read and clearly understand the Terms and Conditions above.
										                </label>
										            </div>
										        </fieldset>							    				
							    			</div>
							    		</div>
							    	</div>
							    	 
						    		<button type="submit" id='confirm-booking' value="confirm" class="btn btn__gold confirm-booking-btn" onClick="ga('send', 'event', { eventCategory: 'Confirm Details', eventAction: 'clicked', eventLabel: 'Step 3'});">Confirm and go to payment</button>
								    <p class="msg-step3"></p>
								</div>
						    </div>
						    <h4>Payment & Completion</h4>
						    <div class="step4-content">

						    </div>
						</form>
	                </div>
	            </div>
	        </div>
        </div>
    </section>
HTML;

$tags_arr['body_html'] .= <<<HTML
	<script id="tour-sessions-tmpl" type="text/html">
		<% if(sessions.length > 0) {  %>
			<% _.each( sessions, function( session,index ) {  %>
			<div class="item__option" data-token="<%= index %>">
				<span class="item__label item__label--lg"><%= session.date %></span>
				<span class="item__label"><%= session.time %></span>
				<span class="item__label">
					<a class="btn btn--ghost sel-tour-session <%= ( (session.isOpen != '1') ? 'disabled' : '' ) %>" onClick="ga('send', 'event', { eventCategory: 'Booking Details', eventAction: 'clicked', eventLabel: 'Step 1'});"><%= session.status %></a>
				</span>
			</div>
			<% index = index + 1; }) %>
		<% } else { %>
			<p style="margin-top: 30px;">There are no tours available on this date.<p>
		<% } %>
	</script>
	<script id="tour-payment-tmpl" type="text/html">
		<iframe src="<%= paymentURL %>" style="width: 100%; height: 850px; position: relative; z-index: 1001; opacity: 1; visibility: visible;" frameborder="0"></iframe>
	</script>
	<script id="session-price-type-tmpl" type="text/html">
	<% _.each( price, function( item ) {  %>
	    <% 
            var optionList = '';
            var i = 0;
            for(i; i <= parseInt(remaining); i++){
                optionList += '<option value="'+i+'">'+i+'</option>';
            }     
        %>
		<div class="form__group form__group--full form__group--inline">
            <label class="form__control__label"><%= item.type %></label>
            <select class="form__control pax-selector" data-rate-key="<%= item.rateKey %>" data-type-key="<%= item.typeKey %>" data-rate="<%= item.rate %>" data-type="<%= item.type %>">
               <%= optionList %>
            </select> 
            <span id="type-key-<%= item.typeKey %>">$<%= item.rate %></span>
        </div>
    <% }) %>
	</script>
HTML;

?>