% include('head.inc.tpl', title='Page Title')

<script>

var g_deal_states = [];
% for d in deal_states:
  g_deal_states.push('{{d}}');
% end

var g_users = {};
% for u in users:
  g_users[{{u['id']}}] = '{{u['fullname']}}';
% end

var g_sites = {};
var g_sites_pic = {};
% for s in sites:
  g_sites[{{s['id']}}] = '{{s['name']}}';
  g_sites_pic[{{s['id']}}] = '{{s['pic']}}';
% end

var g_deal_id = '{{did}}'

</script>
<script src="/static/js/deal.js"></script>

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
                <div class="col-md-3 col-lg-3 " align="center"> <img alt="{{deal['site_name']}}" title="{{deal['site_name']}}" src="{{deal['site_pic']}}" id='site_pic' class="img-circle img-responsive"> </div>
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <th>BDCID</th>
                        <th><span id='f_bdcid' class='editable'>{{deal['bdcid']}}</span></th>
                      </tr>
                      <tr>
                        <td>Description</td>
                        <td><span id='f_description' class='editable'>{{deal['description']}}</span></td>
                      </tr>
                      <tr>
                        <td>Site:</td>
                        <td><span id='f_site_name' bid='{{deal['site_id']}}' class='selectable site'>{{deal['site_name']}}</span></td>
                      </tr>
                      <tr>
                        <td>Creator:</td>
                        <td><span id='f_creator_name' bid='{{deal['creator_id']}}' class='selectable user'>{{deal['creator_name']}}</span></td>
                      </tr>
                      <tr>
                        <td>Validator:</td>
                        <td><span id='f_validator_name' bid='{{deal['validator_id']}}' class='selectable user'>{{deal['validator_name']}}</span></td>
                      </tr>
		      <tr>
                        <td>State</td>
                        <td><span id='f_state' class='selectable deal_state'>{{deal['state']}}</span></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="panel-footer">
	      <a href="/deals" data-original-title="Back to deals" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-arrow-left"></i></a>
              <span class="pull-right">
                <a href="#" data-original-title="Update this entry" data-toggle="tooltip" type="button" class="btn btn-sm btn-success" id="btn-valid" style="display: none;"><i class="glyphicon glyphicon-ok"></i></a>
                <a href="#" data-original-title="Edit this entry" data-toggle="tooltip" type="button" class="btn btn-sm btn-info" id="btn-edit"><i class="glyphicon glyphicon-edit"></i></a>
              </span>
            </div><!-- /panel-footer -->
          </div><!-- /panel panel-info -->
        </div><!-- /col-lg-10 -->
      </div><!-- /row -->

% if did > 0:

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

% end


    </div><!-- /container -->
% include('foot.inc.tpl')
