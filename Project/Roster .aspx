<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Roster .aspx.cs" Inherits="Roster_" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<div class="page-wrapper" id="pageWrapper">
		<!-- Page Header Start-->

		<!-- Page Sidebar Ends-->
		<br />
		<div class="page-body" style="padding-left: 25%; padding-top: 10%">
			<!-- Container-fluid starts-->
			<div class="container-fluid dashboard-default-sec">
				<div class="col-xl-12">
					<div class="card">
						<div class="card-header pb-0">
							<h5>Roster</h5>
						</div>
						<div class="card-body">
							<div class="theme-form">

								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Company ID</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="TextBox1" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Job</label>
									<div class="col-sm-9">
										<asp:DropDownList class="form-control" ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"  AutoPostBack="true" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Employee ID</label>
									<div class="col-sm-9">
										<asp:DropDownList class="form-control" ID="DropDownList1" runat="server" OnSelectedIndexChanged="TextBox1_TextChanged" AutoPostBack="true" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Employee Name</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="TextBox4" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Location</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="txtLocation" runat="server" type="text" />
									</div>
								</div>
								<asp:HiddenField ID="txtLatitude" runat="server" />
								<asp:HiddenField ID="txtLongitude" runat="server" />
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Special Document</label>
									<div class="col-sm-9">
										<asp:FileUpload ID="FileUpload1"
											runat="server" CssClass="form-control"></asp:FileUpload>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Special Instructions</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="MyBox" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Contact Person</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="TextBox5" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Roster Cycle</label>
									<div class="col-sm-9">
										<asp:TextBox class="datepicker-here form-control digits" ID="Calander" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Start Time</label>
									<div class="col-sm-9">
										<div class="input-group clockpicker">
											<asp:TextBox class="form-control" runat="server" ID="TextBox2" type="text" value="00:00" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
										</div>
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">End Time</label>
									<div class="col-sm-9">
										<div class="input-group clockpicker">
											<asp:TextBox class="form-control" runat="server" ID="TextBox3" type="text" value="00:00" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<asp:Button CssClass="btn btn-primary" runat="server" OnClick="Button1_Click" Text="Send"  />
				</div>
			</div>
		</div>
	</div>


	<footer class="footer">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6 footer-copyright">
					<p class="mb-0">Copyright 2021-22 © viho All rights reserved.</p>
				</div>
				<div class="col-md-6">
					<p class="pull-right mb-0">Hand crafted & made with <i class="fa fa-heart font-secondary"></i></p>
				</div>
			</div>
		</div>
	</footer>
	<!-- latest jquery-->
	<script src="../assets/js/jquery-3.5.1.min.js"></script>
	<!-- feather icon js-->
	<script src="../assets/js/icons/feather-icon/feather.min.js"></script>
	<script src="../assets/js/icons/feather-icon/feather-icon.js"></script>
	<!-- Sidebar jquery-->
	<script src="../assets/js/sidebar-menu.js"></script>
	<script src="../assets/js/config.js"></script>
	<!-- Bootstrap js-->
	<script src="../assets/js/bootstrap/popper.min.js"></script>
	<script src="../assets/js/bootstrap/bootstrap.min.js"></script>
	<!-- Plugins JS start-->
	<script src="../assets/js/chart/chartist/chartist.js"></script>
	<script src="../assets/js/chart/chartist/chartist-plugin-tooltip.js"></script>
	<script src="../assets/js/chart/knob/knob.min.js"></script>
	<script src="../assets/js/chart/knob/knob-chart.js"></script>
	<script src="../assets/js/chart/apex-chart/apex-chart.js"></script>
	<script src="../assets/js/chart/apex-chart/stock-prices.js"></script>
	<script src="../assets/js/prism/prism.min.js"></script>
	<script src="../assets/js/clipboard/clipboard.min.js"></script>
	<script src="../assets/js/counter/jquery.waypoints.min.js"></script>
	<script src="../assets/js/counter/jquery.counterup.min.js"></script>
	<script src="../assets/js/counter/counter-custom.js"></script>
	<script src="../assets/js/custom-card/custom-card.js"></script>
	<script src="../assets/js/notify/bootstrap-notify.min.js"></script>
	<script src="../assets/js/vector-map/jquery-jvectormap-2.0.2.min.js"></script>
	<script src="../assets/js/vector-map/map/jquery-jvectormap-world-mill-en.js"></script>
	<script src="../assets/js/vector-map/map/jquery-jvectormap-us-aea-en.js"></script>
	<script src="../assets/js/vector-map/map/jquery-jvectormap-uk-mill-en.js"></script>
	<script src="../assets/js/vector-map/map/jquery-jvectormap-au-mill.js"></script>
	<script src="../assets/js/vector-map/map/jquery-jvectormap-chicago-mill-en.js"></script>
	<script src="../assets/js/vector-map/map/jquery-jvectormap-in-mill.js"></script>
	<script src="../assets/js/vector-map/map/jquery-jvectormap-asia-mill.js"></script>
	<script src="../assets/js/dashboard/default.js"></script>
	<script src="../assets/js/notify/index.js"></script>
	<script src="../assets/js/datepicker/date-picker/datepicker.js"></script>
	<script src="../assets/js/datepicker/date-picker/datepicker.en.js"></script>
	<script src="../assets/js/datepicker/date-picker/datepicker.custom.js"></script>
	<!-- Plugins JS Ends-->
	<!-- Theme js-->
	<script src="../assets/js/script.js"></script>
	<!-- login js-->
	<!-- Plugin used-->
</asp:Content>

