<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PublishJobVacancy.aspx.cs" Inherits="PublishJobVacancy" %>

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
							<h5>New Job Publish</h5>
						</div>
						<div class="card-body">
							<div class="theme-form">

								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Company ID</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="TextBox5" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Company Name</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="TextBox9" runat="server" type="text" />
									</div>
								</div>


								<%--<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Special Document</label>
									<div class="col-sm-9">
										<asp:FileUpload ID="FileUpload1"
											runat="server" CssClass="form-control"></asp:FileUpload>
									</div>
								</div>--%>

								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Job Title</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="TextBox6" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Description</label>
									<div class="col-sm-9">
										<asp:TextBox runat="server" ID="TextBox23" class="form-control" MaxLength="500" TextMode="MultiLine" Rows="5" />

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
								<%--<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Roster Cycle</label>
									<div class="col-sm-9">
										<asp:TextBox class="datepicker-here form-control digits" ID="Calander" runat="server" type="text" />
									</div>
								</div>--%>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Position</label>
									<div class="col-sm-9">
										<div class="input-group clockpicker">
											<asp:TextBox ID="TextBox7" runat="server" class="form-control"></asp:TextBox>
										</div>
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Employeement Type</label>
									<div class="col-sm-9">
										<div class="input-group clockpicker">
											<asp:DropDownList ID="TextBox1" runat="server" class="form-control"></asp:DropDownList>
										</div>
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Contract Type</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="TextBox8" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Working Hours</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="TextBox10" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Special Requrements</label>
									<div class="col-sm-9">
										<asp:TextBox runat="server" ID="TextBox2" MaxLength="500" TextMode="MultiLine" Rows="5" class="form-control" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Skills</label>
									<div class="col-sm-9">
										<asp:TextBox MaxLength="500" TextMode="MultiLine" Rows="2" class="form-control" ID="TextBox3" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Requred Working Experiance</label>
									<div class="col-sm-9">
										<asp:TextBox MaxLength="500" TextMode="MultiLine" Rows="2" class="form-control" ID="TextBox4" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Requred Education</label>
									<div class="col-sm-9">
										<asp:TextBox MaxLength="500" TextMode="MultiLine" Rows="2" class="form-control" ID="TextBox11" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Typical Salary (Rs.)</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="TextBox12" runat="server" type="text" />
									</div>

								</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-primary" />

				</div>
			</div>
		</div>
 


<%--	<footer class="footer">
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
	<script src="../assets/js/datepicker/date-picker/datepicker.js"></script>
	<script src="../assets/js/datepicker/date-picker/datepicker.en.js"></script>
	<script src="../assets/js/datepicker/date-picker/datepicker.custom.js"></script>
	<!-- Plugins JS Ends-->
	<!-- Theme js-->
	<script src="../assets/js/script.js"></script>
	<!-- login js-->
	<!-- Plugin used-->
</asp:Content>

