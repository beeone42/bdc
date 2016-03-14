% include('head.inc.tpl', title='Page Title')
<div class="container">
      <div class="row">

        <div class="col-lg-10 toppad" >
   
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">{{deal['description']}}</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"> <img alt="{{deal['site_name']}}" src="{{deal['site_pic']}}" class="img-circle img-responsive"> </div>
                
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <th>BDCID</th>
                        <th>{{deal['bdcid']}}</th>
                      </tr>
                      <tr>
                        <td>Creator:</td>
                        <td>{{deal['creator_name']}}</td>
                      </tr>
                      <tr>
                        <td>Validator:</td>
                        <td>{{deal['validator_name']}}</td>
                      </tr>
		      <tr>
                        <td>State</td>
                        <td>{{deal['state']}}</td>
                      </tr>
                     
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
                 <div class="panel-footer">
                        <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
                        <span class="pull-right">
                            <a href="edit.html" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
                    </div>
            
          </div>
        </div>
      </div>
    </div>
% include('foot.inc.tpl')
