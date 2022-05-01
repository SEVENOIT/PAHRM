﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OfflineRecruiting.aspx.cs" Inherits="OfflineRecruiting" %>

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
							<h4>Employee Registration Form</h4>
							<span>Using the <a href="#">card</a> component, you can extend the default collapse behavior to create an accordion.</span>
						</div>
						<div class="card-body">

							<div class="theme-form">
								<h5>Personal Info</h5>
								<hr />
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Company ID</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="cid" ReadOnly="true" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Employee ID</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="eid" ReadOnly="true" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Name</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="name"  runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Date of Birth</label>
									<div class="col-sm-9">
										<asp:TextBox ID="dob" runat="server" class="datepicker-here form-control digits" type="text" data-language="en" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Gender</label>
									<div class="col-sm-9">
										<asp:DropDownList ID="gender" runat="server" class="form-control">

											<asp:ListItem Selected="True" Value=""></asp:ListItem>
											<asp:ListItem Value="Male">Male</asp:ListItem>
											<asp:ListItem Value="Female">Female</asp:ListItem>
											<asp:ListItem Value="Not specify">Not specify</asp:ListItem>


										</asp:DropDownList>
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Country</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="country" runat="server" ReadOnly="true" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Language</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="lang" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Marital status</label>
									<div class="col-sm-9">
										<asp:DropDownList ID="marital" runat="server" class="form-control">

											<asp:ListItem Selected="True" Value=""></asp:ListItem>
											<asp:ListItem Value="single">Single</asp:ListItem>
											<asp:ListItem Value="married">Married</asp:ListItem>
											<asp:ListItem Value="Widowed">widowed</asp:ListItem>
											<asp:ListItem Value="Other">Other</asp:ListItem>

										</asp:DropDownList>
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Visa Status</label>
									<div class="col-sm-9">
										<asp:DropDownList ID="visa" runat="server" class="form-control" onchange="other(this)">
											<asp:ListItem Selected="True" Value=""></asp:ListItem>

											<asp:ListItem Value="Citizen">Citizen</asp:ListItem>
											<asp:ListItem Value="Permanent Resident">Permanent Resident</asp:ListItem>
											<asp:ListItem Value="In A valid Working Visa">In A valid Working Visa</asp:ListItem>
											<asp:ListItem Value="Student Visa">Student Visa</asp:ListItem>
											<asp:ListItem Value="Other">Other</asp:ListItem>

										</asp:DropDownList>
									</div>
								</div>
								<div class="mb-3 row" style="visibility: hidden" id="Label22a">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Give Other Reasons</label>
									<div id="TextBox20a" class="col-sm-9" style="visibility: hidden">
										<asp:TextBox ID="otherr" ClientIDMode="Static" runat="server" class="form-control"></asp:TextBox>
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">ID Number/Drivers License Number</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="nic" runat="server" type="text" />
									</div>
								</div>
								<h5>Contact Information</h5>
								<hr />
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Pesonal Mobile Number</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="tel" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Email</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="email" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Address</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="address" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Emergency Contact Number</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="rtel" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Relation Name</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="rname" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Relationship</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="relation" runat="server" type="text" />
									</div>
								</div>
								<h5>Education and Qualifications</h5>
								<hr />
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Highest qualification</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="hq" MaxLength="500" runat="server" Rows="2" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Other Qualifications</label>
									<div class="col-sm-9">
										<textarea class="form-control" id="otherQ" maxlength="500" runat="server" rows="3" />
									</div>
								</div>
								<h5>Health and Specific Requrements</h5>
								<hr />
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Blood Group</label>
									<div class="col-sm-9">
										<asp:DropDownList ID="blood" runat="server" class="form-control">

											<asp:ListItem Selected="True" Value=""></asp:ListItem>
											<asp:ListItem Value="A+">A+</asp:ListItem>
											<asp:ListItem Value="B+">B+</asp:ListItem>
											<asp:ListItem Value="O+">O+</asp:ListItem>
											<asp:ListItem Value="AB+">AB+</asp:ListItem>
											<asp:ListItem Value="A-">A-</asp:ListItem>
											<asp:ListItem Value="B-">B-</asp:ListItem>
											<asp:ListItem Value="O-">O-</asp:ListItem>
											<asp:ListItem Value="AB-">AB-</asp:ListItem>


										</asp:DropDownList>
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Special Requrements</label>
									<div class="col-sm-9">
										<textarea class="form-control" id="specialreq" runat="server" maxlength="500" rows="2" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Other Requrements</label>
									<div class="col-sm-9">
										<textarea class="form-control" id="Text5" maxlength="500" runat="server" rows="3" />
									</div>
								</div>
								<h5>Job Contract</h5>
								<hr />
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Designation</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="desig" ReadOnly="true" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Working Experiance</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="experiance" ReadOnly="true" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Salary</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="salary" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Hourly Salary Rate</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="hourly" runat="server" ReadOnly="true" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Employeement Type Type</label>
									<div class="col-sm-9">
										<asp:DropDownList ID="TextBox1" runat="server" class="form-control"></asp:DropDownList>
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Contract Type</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="ctype" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Available Days</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="availble" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Upload Resume</label>
									<div class="col-sm-9">
										<asp:FileUpload ID="FileUpload1"
											runat="server" CssClass="uploadBtn" class="form-control"></asp:FileUpload>
									</div>
								</div>
								<h5>Payment Details</h5>
								<hr />
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Full Name</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="Text1" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Account Number</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="Text2" runat="server" type="text" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Bank Name</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="Text3" runat="server" type="text" />
									</div>

								</div>
								<div class="mb-3 row">
									<label class="col-sm-3 col-form-label" for="inputPassword3">Branch</label>
									<div class="col-sm-9">
										<asp:TextBox class="form-control" ID="Text4" runat="server" type="text" />
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
		<div class="card-footer">
			<asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-primary" />

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

