<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PaySlip.aspx.cs" Inherits="PaySlip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<div class="page-wrapper" id="pageWrapper">
		<!-- Page Header Start-->

		<!-- Page Sidebar Ends-->
		<br />
		<div class="page-body" style="padding-left: 25%; padding-top: 10%">
			<!-- Container-fluid starts-->

			<div class="col-sm-12">
				<div class="card">
					<div class="card-header pb-0">
						<h5><asp:Label runat="server" ID="heading"  ></asp:Label></h5>
						 
					</div>
					<div class="card-body">

						<div class="theme-form">
							<h5>Employee Details</h5>
							<hr />
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Employee ID</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox4" ReadOnly="true" runat="server" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Employee EPF Number</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox24" ReadOnly="true" runat="server" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Name</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox6" ReadOnly="true" runat="server" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Designation</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox25" ReadOnly="true" runat="server" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Email</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox23" ReadOnly="true" runat="server" type="text" />
								</div>
							</div>
							<h5>Bank Details</h5>
							<hr />
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Full Name</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox7" runat="server" ReadOnly="true" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Account Number</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox18" runat="server" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Bank Name</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox19" runat="server" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Branch</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox20" runat="server" type="text" />
								</div>
							</div>
							<h5>Work Details</h5>
							<hr />
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Working Days</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox2" runat="server" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Worked Days</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox3" runat="server" type="text" />
								</div>
							</div>

							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Working Hours</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox13" runat="server" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Worked Hours</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox14" runat="server" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Total OT Hours</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox16" runat="server" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Total NoPay Hours</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox17" runat="server" type="text" />
								</div>
							</div>
							<h5>Earnings</h5>
							<hr />
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Basic Salary</label>
								<div class="col-sm-9">
									<asp:Label ID="Label39" runat="server" Text="Rs."></asp:Label>

									<asp:TextBox class="form-control" ID="TextBox5" runat="server" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Salary For PAYE</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox27" runat="server" type="text" />
								</div>
							</div>

							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Allowance</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox9" runat="server" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Total OT Amount</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox10" runat="server" />
								</div>
							</div>

							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Public Holiday Allowances</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox15" runat="server" />
								</div>
							</div>
							<hr />

							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Gross Pay</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox1" runat="server" />
								</div>
							</div>
							<hr />
							<h5>Deductions</h5>
							<hr />
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">NoPay Amount</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox8" runat="server" />
								</div>
							</div>

							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Tax Deduction</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox11" ReadOnly="true" runat="server" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Salary Advance</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox26" ReadOnly="true" runat="server" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">EPF -</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox22" ReadOnly="true" runat="server" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Total Deductions</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox21" runat="server" ReadOnly="true" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Net Pay</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox12" runat="server" ReadOnly="true" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">EPF -</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox28" runat="server" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">ETF -</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox29" runat="server" type="text" />
								</div>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<button class="btn btn-primary">Pay</button>
						<button class="btn btn-secondary">Reset</button>
					</div>
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

