% include('head.inc.tpl', title='Page Title')

<script>

function callback()
{
	$("#btn-edit").click(function(){
	
		$(".editable").each(function(index, value){
		    var $input = $("<input>", {
           	    	id: $(this).attr('id'),
           	    	val: $(this).text(),
	            	type: "text"
		    });
		    $(this).replaceWith($input);
		});
	
		$(".selectable").each(function(index, value){
		    v = $(this).text();
		    var $input = $("<select>", {
           	    	id: $(this).attr('id')
		    });

		    var i = 0;

		    % for u in users:

		        var o = new Option("{{u['fullname']}}", "{{u['id']}}");
		    	$(o).html("{{u['fullname']}}");
		    	$input.append(o);
			if ($(this).attr('bid') == {{u['id']}})
			{
				$(o).attr("selected", true);
			}
			i++;

		    % end		    
		    $(this).replaceWith($input);

		});
	});
}

</script>

    <div class="container">

<!-- deal infos header -->

      <div class="row">
        <div class="col-lg-10 toppad" >
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">{{deal['description']}}</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"> <img alt="{{deal['site_name']}}" title="{{deal['site_name']}}" src="{{deal['site_pic']}}" class="img-circle img-responsive"> </div>
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <th>BDCID</th>
                        <th><span id='f_bdcid' class='editable'>{{deal['bdcid']}}</span></th>
                      </tr>
                      <tr>
                        <td>Site:</td>
                        <td><span id='f_site_name' class='editable'>{{deal['site_name']}}</span></td>
                      </tr>
                      <tr>
                        <td>Creator:</td>
                        <td><span id='f_creator_name' bid='{{deal['creator_id']}}' class='selectable'>{{deal['creator_name']}}</span></td>
                      </tr>
                      <tr>
                        <td>Validator:</td>
                        <td><span id='f_validator_name' bid='{{deal['validator_id']}}' class='selectable'>{{deal['validator_name']}}</span></td>
                      </tr>
		      <tr>
                        <td>State</td>
                        <td><span id='f_state' class='selectable'>{{deal['state']}}</span></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="panel-footer">
              <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
              <span class="pull-right">
                <a href="#" data-original-title="Edit this entry" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning" id="btn-edit"><i class="glyphicon glyphicon-edit"></i></a>
                <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
              </span>
            </div><!-- /panel-footer -->
          </div><!-- /panel panel-info -->
        </div><!-- /col-lg-10 -->
      </div><!-- /row -->

<!-- devis -->

      <div class="row">
        <div class="col-lg-10" >
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">DEVIS</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class=" col-md-10 col-lg-10 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <th>id</th>
                        <th>issuer</th>
                        <th>amount</th>
                        <th>date_received</th>
                        <th>state</th>
                      </tr>
		      % for d in devis:
                      <tr>
                        <td>{{d['id']}}</td>
                        <td>{{d['issuer']}}</td>
                        <td>{{d['amount']}}</td>
                        <td>{{d['d_received']}}</td>
                        <td>{{d['state']}}</td>
                      </tr>
		      % end
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="panel-footer">
            </div><!-- /panel-footer -->
          </div><!-- /panel panel-info -->
        </div><!-- /col-lg-11 -->
      </div><!-- /row -->




    </div><!-- /container -->
% include('foot.inc.tpl')
