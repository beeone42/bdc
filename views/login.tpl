% include('head.tpl', title='Page Title')
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12 text-center">

<form class="col-md-4 col-md-offset-4" action="/login" method="post">
    <div class="form-group">
        <input name="username" type="text" class="form-control input-lg" placeholder="Login">
    </div>
    <div class="form-group">
        <input name="password" type="password" class="form-control input-lg" placeholder="Password">
    </div>
    <div class="form-group">
        <button class="btn btn-primary btn-lg btn-block">Sign In</button>
    </div>
</form>

            </div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->
% include('foot.tpl')
