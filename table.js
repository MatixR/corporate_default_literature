<!--html_preserve-->
<script src='js/jquery.dataTables.min.js'></script>
<script type="text/javascript">
// Sort function for NA from https://datatables.net/forums/discussion/7446/numeric-sort-with-na-in-some-cells
$.fn.dataTableExt.oSort['numeric_ignore_nan-asc'] = function(x,y) {
	if (isNaN(x) && isNaN(y)) return ((x < y) ? 1 : ((x > y) ? -1 : 0));
	if (isNaN(x)) return 1;
	if (isNaN(y)) return -1;
	x = parseFloat( x );
	y = parseFloat( y );
	return ((x < y) ? -1 : ((x > y) ? 1 : 0));
};
$.fn.dataTableExt.oSort['numeric_ignore_nan-desc'] = function(x,y) {
	if (isNaN(x) && isNaN(y)) return ((x < y) ? 1 : ((x > y) ? -1 : 0));
	if (isNaN(x)) return 1;
	if (isNaN(y)) return -1;
	x = parseFloat( x );
	y = parseFloat( y );
	return ((x < y) ? 1 : ((x > y) ? -1 : 0));
};
$(document).ready(function() {
	$('#review_tbl').DataTable( {
		"scrollY": "600px",
		"scrollX": true,
		"scrollCollapse": true,
		"order": [[3, 'asc']],
		"columnDefs": [
			{ "targets": 0, "className": "dt-body-left", "width": "18em" }, 
			{ "targets": 1, "className": "dt-body-left", "width": "10em" }, 
			{ "targets": 2, "className": "dt-body-left", "width": "20em" }, 
			{ "targets": 3, "className": "dt-body-center", "width": "9em", "type": "numeric_ignore_nan" }, 
			{ "targets": 4, "className": "dt-body-left", "width": "40em" }, 
			{ "targets": 5, "className": "dt-body-center", "width": "5em" }, 
			{ "targets": 6, "className": "dt-body-left", "width": "40em" }, 
			{ "targets": 7, "className": "dt-body-left", "width": "20em" }, 
			{ "targets": 8, "className": "dt-body-left", "width": "20em" }, 
			{ "targets": 9, "className": "dt-body-left", "width": "20em" }
		]
	});
} );
</script>
<!--/html_preserve-->
