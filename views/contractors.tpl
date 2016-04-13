% include('head.inc.tpl', title='Page Title')
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
		    	Contractors
			<a href="/contractor/0" data-original-title="Add a contractor" data-toggle="tooltip" type="button" class="pull-right btn btn-sm btn-success" id="btn-plus"><i class="glyphicon glyphicon-plus"></i></a>
		    </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> Contractors
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">

<table id="tcontractors" class="display" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th>Id</th>
      <th>Enterprise</th>
      <th>Contact Name</th>
      <th>Contact Tel</th>
      <th>Contact Mail</th>
   </tr>
  </thead>

  <tbody>
  </tbody>

  <tfoot>
      <th>Id</th>
      <th>Enterprise</th>
      <th>Contact Name</th>
      <th>Contact Tel</th>
      <th>Contact Mail</th>
  </tfoot>
</table>

<script>

function callback()
{
    $("#tcontractors").DataTable({
	ajax: {
	    url: "/api/contractors",
	    type: "GET"
	},
	serverSide: false,
	columns: [
	    { data: "id",
              	    "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
	                $(nTd).html("<a href='/contractor/"+oData.id+"'>" + oData.id + "</a>");
		    }
	    },
	    { data: "enterprise",
	            "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
	                $(nTd).html("<a href='/contractor/"+oData.id+"'>" + oData.enterprise + "</a>");
		    }
	    },
	    { data: "contact_name" },
	    { data: "contact_tel" },
	    { data: "contact_mail" }
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
