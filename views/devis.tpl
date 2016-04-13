% include('head.inc.tpl', title='Page Title')

<script>
var g_deal_id = '{{did}}'
var g_devis_id = '{{deid}}'

var g_devis_states = [];
% for d in devis_states:
  g_devis_states.push('{{d}}');
% end

var g_contractors = {};
% for u in contractors:
  g_contractors[{{u['id']}}] = '{{u['enterprise']}} ({{u['contact_name']}})';
% end

</script>
<script src="/static/js/devis.js"></script>

    <div class="container">

<!-- contractor infos header -->

      <div class="row">
        <div class="col-lg-10 toppad" >
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">
% if deid > 0:
	      	{{devis['description']}} - {{devis['issuer']}}
% else:
		New devis for {{devis['description']}}
% end
	      </h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class=" col-md-12 col-lg-12 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <th>Issuer</th>
                        <th><span id='f_contractor' bid='{{devis['contractor_id']}}' class='selectable contractor'>{{devis['issuer']}} ({{devis['contact_name']}})</span></th>
                      </tr>
                      <tr>
                        <td>Amount</td>
                        <td><span id='f_amount' class='editable'>{{devis['amount']}}</span></td>
                      </tr>
                      <tr>
                        <td>Date Received</td>
                        <td><span id='f_date_received' class='editable'>{{devis['d_received']}}</span></td>
                      </tr>
                      <tr>
                        <td>State</td>
                        <td><span id='f_state' bid='{{devis['state']}}' class='selectable devis_state'>{{devis['state']}}</span></td>
                      </tr>

                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="panel-footer">
	      <a href="/deal/{{did}}" data-original-title="Back to deals" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-arrow-left"></i></a>
              <span class="pull-right">
                <a href="#" data-original-title="Update this entry" data-toggle="tooltip" type="button" class="btn btn-sm btn-success" id="btn-valid" style="display: none;"><i class="glyphicon glyphicon-ok"></i></a>
                <a href="#" data-original-title="Edit this entry" data-toggle="tooltip" type="button" class="btn btn-sm btn-info" id="btn-edit"><i class="glyphicon glyphicon-edit"></i></a>
              </span>
            </div><!-- /panel-footer -->
          </div><!-- /panel panel-info -->
        </div><!-- /col-lg-10 -->
      </div><!-- /row -->

    </div><!-- /container -->
% include('foot.inc.tpl')
