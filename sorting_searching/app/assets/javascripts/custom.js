// $('#search').keyup(function(e){
// 	// e.keyCode == 13 for handle button enter
// 	if(e.keyCode == 13) {
// 		$.ajax({
// 			url : '/articles',
// 			type : 'GET',
// 			dataType : 'script',
// 			data : {
// 				"search" : $(this).val()
// 			}
// 		});
// 	}
// });

// $(document).ready(function(){
// 	$('#title, #content').on('click', function(){
// 		// direction digunakan untuk menentukan arah sorting
// 		var dierction = $('#dierction').is(':checked');
// 		direction = direction ? 'asc' : 'desc';

// 		// method jQuery ajax untuk melakukan sorting
// 		$.ajax({
// 			// '/articles' mengarah ke alamat routes index articles
// 			url : '/articles',
// 			type : 'GET',
// 			dataType : 'script',
// 			data : {
// 				//$(this).attr('id') digunakan untuk mendapatkan nama id
// 				"column" : $(this).attr('id'),
// 				"direction" : direction
// 			}
// 		});
// 	});
// });

