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
$('.edit_post').on('click', function(){
	$(this).parent('form').find('input').attr('readonly', false).focus();
	$(this).html(`
		<p><em>  You may now make changes</em></p>
		<input class="btn btn-elegant round edit_button" type="submit" value="done">
		`);
});



















});