
function callback()
{
    $("#btn-valid").css("display", "none");
    
	$("#btn-edit").click(function(){
	
	    $("#btn-edit").css("display", "none");
	    $("#btn-valid").css("display", "inline");

	    $(".editable").each(function(index, value){
		var $input = $("<input>", {
           	    id: $(this).attr('id'),
           	    val: $(this).text(),
	            type: "text"
		});
		$(this).replaceWith($input);
	    });
	    
	    $(".selectable.site").each(function(index, value){
		v = $(this).text();
		var $input = $("<select>", {
           	    id: $(this).attr('id')
		});
		
   		for (var key in g_sites)
		{
		    var o = new Option(g_sites[key], key);
		    $(o).html(g_sites[key]);
		    $input.append(o);
		    if ($(this).attr('bid') == key)
		    {
			$(o).attr("selected", true);
		    }
		}
		$input.on("change", function(){
		    var id = $(this).val();
		    $("#site_pic").attr("src", g_sites_pic[id]);
		});
		$(this).replaceWith($input);
		
	    });
	    
	    $(".selectable.user").each(function(index, value){
		v = $(this).text();
		var $input = $("<select>", {
           	    id: $(this).attr('id')
		});
		
   		for (var key in g_users)
		{
		    var o = new Option(g_users[key], key);
		    $(o).html(g_users[key]);
		    $input.append(o);
		    if ($(this).attr('bid') == key)
		    {
			$(o).attr("selected", true);
		    }
		}
		$(this).replaceWith($input);
		
	    });
	    
	    $(".selectable.deal_state").each(function(index, value){
		v = $(this).text();
		var $input = $("<select>", {
           	    id: $(this).attr('id')
		});
		for (i = 0; i < g_deal_states.length; i++)
		{
		    var o = new Option(g_deal_states[i]);
		    $(o).html(g_deal_states[i]);
		    $input.append(o);
		    if ($(this).val() == g_deal_states[i])
		    {
			$(o).attr("selected", true);
		    }
		}
		$(this).replaceWith($input);
		
	    });
	});
    

    $("#btn-valid").click(function(){

	$("#btn-valid").css("display", "none");
	$("#btn-edit").css("display", "inline");

	jQuery.ajax({
	    type: 'POST',
	    url: '/ajax',
	    data: {
		bdcid: $('#f_bdcid').val(),
		creator_id: $('#f_creator_name').val(),
		validator_id: $('#f_validator_name').val(),
		state: $('#f_state').val()
	    },
	    success: function(data, textStatus, jqXHR) {
		data = JSON.parse(data);
		console.log("success", data);
		if(data.success)
		{
		    ;
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
	
    });
}

