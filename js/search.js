
    var openSearchFormButton = $('#navbarNav #open_search_form'),
        closeSearchFormButton =  $('#navbarNav #close_search_form'),
        searchForm =  $('#navbarNav #search_form'),
        searchFormInput = $('input[name="query"]', searchForm);

    openSearchFormButton.on('click', triggerSearchForm);

    closeSearchFormButton.on('click', function(e) {
		if(searchForm.hasClass('is_open')) {
			closeSearchForm();
		}
    });

    searchForm.on('keyup', function(e) {
		if(searchForm.hasClass('is_open') && e.keyCode == 27) {
			closeSearchForm();
		}
    });

    searchFormInput.on('blur', function() {
 		if(!searchForm.val() && searchForm.hasClass('is_open')) {
			closeSearchForm();
		}
	});  
    
    /**
	 * Open or submit search form
	 *
	 * @param Event e Optional event handler
	 */
	function triggerSearchForm(e) {

		if (typeof e !== 'undefined') {
			e.preventDefault();
			e.stopPropagation();
		}

		if (searchForm.hasClass('is_open')) {
			searchForm.submit();
			return;
		}
        searchForm.removeClass('is_close');
		searchForm.addClass('is_open');
		setTimeout(function() {
			searchForm.find('input[type="text"]').focus();
		},200);
	}
    /**
	 * Close the search panel
	 *
	 * @param Event e Optional event handler
	 */
	function closeSearchForm(e) {

		if (typeof e !== 'undefined') {
			e.preventDefault();
			e.stopPropagation();
		}

        searchForm.removeClass('is_open');
        searchForm.addClass('is_close');

		setTimeout(function() {
			searchFormInput.val('');
		},300)
	}

	