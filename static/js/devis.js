
function devis_edit()
{
    $("#btn-valid").css("display", "block");
    $("#btn-edit").css("display", "none");
    
    $(".editable").each(function(index, value){
	var $input = $("<input>", {
            id: $(this).attr('id'),
            val: $(this).text(),
	    type: "text"
	});
	$(this).replaceWith($input);
    });

    $(".selectable.devis_state").each(function(index, value){
	v = $(this).text();
	var $input = $("<select>", {
            id: $(this).attr('id')
	});
	for (i = 0; i < g_devis_states.length; i++)
	{
	    var o = new Option(g_devis_states[i]);
	    $(o).html(g_devis_states[i]);
	    $input.append(o);
	    if (v == g_devis_states[i])
	    {
		$(o).attr("selected", true);
	    }
	}
	$(this).replaceWith($input);
    });

    $(".selectable.contractor").each(function(index, value){
	v = $(this).text();
	var $input = $("<select>", {
            id: $(this).attr('id')
	});
	
   	for (var key in g_contractors)
	{
	    var o = new Option(g_contractors[key], key);
	    $(o).html(g_contractors[key]);
	    $input.append(o);
	    if ($(this).attr('bid') == key)
	    {
		$(o).attr("selected", true);
	    }
	}
	$(this).replaceWith($input);
    });
    
    $(".selectable.date").each(function(index, value){
	v = $(this).text();
	var $div = $("<div>", { class: "input-group date col-md-3 col-lg-3" });
	var $input = $("<input>", {
            id: $(this).attr('id'),
            val: $(this).text(),
	    type: "text",
	    class: "form-control"
	});
	var $span = $("<span>", { class: "input-group-addon" });
	var $i = $("<i>", { class: "fa fa-calendar", 'aria-hidden': "true" });
	$span.append($i);
	$div.append($input);
	$div.append($span);
	$(this).replaceWith($div);
	$div.datepicker({format: "yyyy-mm-dd", autoclose: true, todayHighlight: true, todayBtn: "linked"});
    });
    

    
}

function devis_valid()
{
    jQuery.ajax({
	type: 'POST',
	url: '/api/devis/' + g_deal_id + '/' + g_devis_id,
	data: {
	    contractor_id: $('#f_contractor').val(),
	    amount:        $('#f_amount').val(),
	    date_received: $('#f_date_received').val(),
	    state:         $('#f_state').val(),
	},
	success: function(data, textStatus, jqXHR) {
	    //data = JSON.parse(data);
	    console.log("success", data);
	    if (data.success)
	    {
		$("#btn-valid").css("display", "none");
		document.location = "/devis/" + g_deal_id + "/" + data.res;
		//document.location = "/deal/" + g_deal_id;
	    }
	    else
	    {
		return false;
	    }
	},
	error: function(jqXHR, textStatus, errorThrown) {
	    console.log(textStatus);
	}
    });
}

function callback()
{
    $("#btn-edit").click(function(){
	devis_edit();
    });
    
    $("#btn-valid").click(function(){
	devis_valid();
    });

    if (g_devis_id == 0)
	devis_edit();
}

