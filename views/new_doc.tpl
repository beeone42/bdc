% include('head.inc.tpl', title='Page Title')

    <div class="container">
      <div class="row">

        <div class="col-lg-10 toppad" >
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">New Doc for {{devis['description']}} - {{devis['issuer']}}</h3>
	    </div>
	    <div class="panel-body">

<form action="/docs/{{did}}/{{deid}}/0" method="post" enctype="multipart/form-data">

              <div class="row">
                <div class=" col-md-12 col-lg-12 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <th>Type</th>
                        <th>  <select width='200px' name='doc_type'>
% for d in docs_types:
                          <option value='{{d}}'>{{d}}</option>
% end
			</select></th>
                      </tr>
                      <tr>
                        <th>File</th>
                        <td><input type='file' name='upload'></td>
                      </tr>
                      <tr>
                        <th>&nbsp;</th>
                        <td><input type='submit'></td>
                      </tr>
		    </tbody>
		  </table>
		</div>
	      </div><!-- /row -->

</form>

	    </div><!-- /panel-body -->
	  </div><!-- /panel panel-info -->
      </div><!-- /row -->
    </div><!-- /container -->

% include('foot.inc.tpl')
