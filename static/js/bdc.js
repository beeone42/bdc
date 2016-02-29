$(document).ready(function() {
    $("#tdeals").DataTable({
	ajax: {
	    url: "api/deals",
	    type: "GET"
	},
	serverSide: false,
	columns: [
	    { data: "id" },
	    { data: "bdcid" },
	    { data: "description" },
	    { data: "creator_name" },
	    { data: "state" }
	]
    });
});
