<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="Attendance" %>

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
							<h4>Attendance Marking Sheet</h4>
						</div>
						<div class="card-body">

							<div class="theme-form">

								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Employee ID</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="eid" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Start Date And Time</label>
									<div class="col-sm-9">
										<div class="input-group date" id="dt-minimum" data-target-input="nearest">
											<asp:TextBox runat="server" class="form-control datetimepicker-input digits" type="text" data-target="#dt-minimum" />
											<div class="input-group-text" data-target="#dt-minimum" data-toggle="datetimepicker"><i class="fa fa-calendar"></i></div>
										</div>
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Start Date And Time</label>
									<div class="col-sm-9">
										<div class="input-group date" id="dt-local" data-target-input="nearest">
											<input class="form-control datetimepicker-input digits" type="text" data-target="#dt-local">
											<div class="input-group-text" data-target="#dt-local" data-toggle="datetimepicker"><i class="fa fa-calendar"></i></div>
										</div>
									</div>
								</div>
							</div>
							<div class="card-footer">
								<button class="btn btn-primary">Submit</button>
								<button class="btn btn-secondary">Reset</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>

		<%--<footer class="footer">
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
		</footer>--%>
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
		<script src="../assets/js/datepicker/date-time-picker/moment.min.js"></script>
		<script src="../assets/js/datepicker/date-time-picker/tempusdominus-bootstrap-4.min.js"></script>
		<script src="../assets/js/datepicker/date-time-picker/datetimepicker.custom.js"></script>

		<!-- Plugins JS Ends-->
		<!-- Theme js-->
		<script src="../assets/js/script.js"></script>
		<!-- login js-->
		<!-- Plugin used-->
</asp:Content>

