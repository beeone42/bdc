% include('head.inc.tpl', title='Page Title')

<script>
var g_contractor_id = '{{cid}}'
</script>
<script src="/static/js/contractor.js"></script>

    <div class="container">

<!-- contractor infos header -->

      <div class="row">
        <div class="col-lg-10 toppad" >
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">{{contractor['enterprise']}}</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class=" col-md-12 col-lg-12 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <th>Enterprise</th>
                        <th><span id='f_enterprise' class='editable'>{{contractor['enterprise']}}</span></th>
                      </tr>
                      <tr>
                        <td>Contact Name</td>
                        <td><span id='f_contact_name' class='editable'>{{contractor['contact_name']}}</span></td>
                      </tr>
                      <tr>
                        <td>Contact Tel</td>
                        <td><span id='f_contact_tel' class='editable'>{{contractor['contact_tel']}}</span></td>
                      </tr>
                      <tr>
                        <td>Contact Mail</td>
                        <td><span id='f_contact_mail' class='editable'>{{contractor['contact_mail']}}</span></td>
                      </tr>

                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="panel-footer">
	      <a href="/contractors" data-original-title="Back to deals" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-arrow-left"></i></a>
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
