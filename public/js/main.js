$(function(){

	// $('#nav_search').keyup(function(e) {
	// 	console.log(e.key);
	// 	let search_term = $(this).val();
	// 	if(search_term.length > 1) {
	// 		$.post('/search_for_user', {search_term: search_term}, function(results){
	// 			$('#results').html(results);
	// 		});
	// 	}

	// });
$('.edit_button').hide();
$('.edit_post').on('click', function(){
	// $('.post').attr('readonly', false).focus();
	parent = $(this).parent('form');
	parent.find('textarea').attr('readonly', false).focus();
	$(this).html(`
		<p><em>You may now make changes</em></p>
		`);
	parent.find('.edit_button').show();
});



















});