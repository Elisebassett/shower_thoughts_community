$(function(){

	$('.edit_button').hide();
	$('.edit_post').on('click', function(){
		// $('.post').attr('readonly', false).focus();
		parent = $(this).closest('form');
		parent.find('textarea').attr('readonly', false).focus();
		$(this).html(`
			<p><em>You may now make changes</em></p>
			`);
		parent.find('.edit_button').show();
	});

	$('.edit_form').on('submit', function() {
		$('.edit_button').hide();
	});



















});