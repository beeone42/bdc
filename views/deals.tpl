% include('head.inc.tpl', title='Page Title')
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
		    	Deals
			<a href="/deal/0" data-original-title="Add a deal" data-toggle="tooltip" type="button" class="pull-right btn btn-sm btn-success" id="btn-plus"><i class="glyphicon glyphicon-plus"></i></a>
		    </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> Deals
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">

<table id="tdeals" class="display" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th>Id</th>
      <th>Site</th> 
      <th>BDCID</th>
      <th>Descr</th>
      <th>Creator</th> 
      <th>State</th>
   </tr>
  </thead>

  <tbody>
  </tbody>

  <tfoot>
      <th>Id</th>
      <th>Site</th> 
      <th>BDCID</th>
      <th>Descr</th>
      <th>Creator</th> 
      <th>State</th>
  </tfoot>
</table>

<script>

function callback()
{
    $("#tdeals").DataTable({
	ajax: {
	    url: ('{{did}}' == '') ? "/api/deals" : "/api/deals/" + '{{did}}',
	    type: "GET"
	},
	serverSide: false,
	columns: [
	    { data: "id",
              	    "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
	                $(nTd).html("<a href='/deal/"+oData.id+"'>" + oData.id + "</a>");
		    }
	    },
	    { data: "site_name" },
	    { data: "bdcid",
	            "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
	                $(nTd).html("<a href='/deal/"+oData.id+"'>" + oData.bdcid + "</a>");
		    }
	    },
	    { data: "description" },
	    { data: "creator_name" },
	    { data: "state" }
	]
    });
}

</script>

                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

% include('foot.inc.tpl')
