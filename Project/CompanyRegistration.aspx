<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CompanyRegistration.aspx.cs" Inherits="CompanyRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<!-- Plugins css start-->
	<link rel="stylesheet" type="text/css" href="../assets/css/animate.css" />
	<link rel="stylesheet" type="text/css" href="../assets/css/chartist.css" />
	<link rel="stylesheet" type="text/css" href="../assets/css/date-picker.css" />
	<link rel="stylesheet" type="text/css" href="../assets/css/prism.css" />
	<link rel="stylesheet" type="text/css" href="../assets/css/vector-map.css" />
	<!-- Plugins css Ends-->
	<link rel="icon" href="../assets/images/favicon.png" type="image/x-icon" />
	<link rel="shortcut icon" href="../assets/images/favicon.png" type="image/x-icon" />
	<title></title>
	<!-- Google font-->
	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet" />
	<!-- Font Awesome-->
	<link rel="stylesheet" type="text/css" href="../assets/css/fontawesome.css" />
	<!-- ico-font-->
	<link rel="stylesheet" type="text/css" href="../assets/css/icofont.css" />
	<!-- Themify icon-->
	<link rel="stylesheet" type="text/css" href="../assets/css/themify.css" />
	<!-- Flag icon-->
	<link rel="stylesheet" type="text/css" href="../assets/css/flag-icon.css" />
	<!-- Feather icon-->
	<link rel="stylesheet" type="text/css" href="../assets/css/feather-icon.css" />
	<!-- Plugins css start-->
	<!-- Plugins css Ends-->
	<!-- Bootstrap css-->
	<link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css" />
	<!-- App css-->
	<link rel="stylesheet" type="text/css" href="../assets/css/style.css" />
	<link id="color" rel="stylesheet" href="../assets/css/color-1.css" media="screen" />
	<!-- Responsive css-->
	<link rel="stylesheet" type="text/css" href="../assets/css/responsive.css" />
</head>
<body>
	<form id="form1" runat="server">

		<div class="page-wrapper" id="pageWrapper">
			<div class="main-header-right row m-0">
				<br />
				<div class="page-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-12">
								<br />
								<div class="card">
									<div class="card-header pb-0">
										<div class="alert alert-warning dark alert-dismissible fade show" role="alert">
											<strong>Warning!</strong> To register you need an One Time Password(OTP).
                      <button class="btn-close" type="button" data-bs-dismiss="alert" aria-label="Close"></button>
										</div>

										 <h4 style="text-align:center">Company Registration Form</h4>
									</div>
									<div class="card-body">
										<form class="theme-form">
											<h5>Company Info</h5>
											<hr />
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">Enter OneTime Password</label>
												<div class="col-sm-9">
													<asp:TextBox ID="TextBox6" class="form-control" runat="server" ToolTip="Enter password that provided on purchasing" AutoPostBack="true"></asp:TextBox>
												</div>
											</div>
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">Membership</label>
												<div class="col-sm-9">
													<asp:TextBox class="form-control" id="TextBox8" readonly="true" runat="server" type="text" />
												</div>
											</div>
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">Employer ID</label>
												<div class="col-sm-9">
													<asp:TextBox class="form-control" id="TextBox1" readonly="true" runat="server" type="text" />
												</div>
											</div>
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">Company Name</label>
												<div class="col-sm-9">
													<asp:TextBox class="form-control" id="TextBox2" readonly="true" runat="server" type="text" />
												</div>
											</div>
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">Company Registration Number</label>
												<div class="col-sm-9">
													<asp:TextBox class="form-control" id="TextBox7a" runat="server" readonly="true" type="text" />
												</div>
											</div>
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">Employee Count</label>
												<div class="col-sm-9">
													<asp:TextBox class="form-control" id="TextBox24" runat="server"  readonly="true" type="text" />
												</div>
											</div>
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">Start Date</label>
												<div class="col-sm-9">
													<asp:TextBox class="form-control" id="TextBox16" runat="server"  readonly="true" type="text" />
												</div>
											</div>
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">Country</label>
												<div class="col-sm-9">
													<asp:DropDownList class="form-control" ID="TextBox3" runat="server"  onchange="visible(this)">

														<asp:ListItem Selected="True" Value=""></asp:ListItem>
														<asp:ListItem Selected="False" Value="Australia">Australia</asp:ListItem>
														<asp:ListItem Selected="False" Value="Sri Lanka">Sri Lanka</asp:ListItem>

													</asp:DropDownList>
												</div>
											</div>
											<h5>Contact Information</h5>
											<hr />
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">Contact Number</label>
												<div class="col-sm-9">
													<asp:TextBox class="form-control" id="TextBox5" runat="server" type="text" />
												</div>
											</div>
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">Company Email</label>
												<div class="col-sm-9">
													<asp:TextBox class="form-control" id="TextBox14" runat="server" type="text" />
												</div>
											</div>
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">Admin Email</label>
												<div class="col-sm-9">
													<asp:TextBox class="form-control" id="TextBox15" runat="server" type="text" />
												</div>
											</div>
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">Finance Manager Email</label>
												<div class="col-sm-9">
													<asp:TextBox class="form-control" id="TextBox12" runat="server" type="text" />
												</div>
											</div>
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">HR Email</label>
												<div class="col-sm-9">
													<asp:TextBox class="form-control" id="TextBox10" runat="server" type="text" />
												</div>
											</div>
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">Address</label>
												<div class="col-sm-9">
													<asp:TextBox class="form-control" id="TextBox11" runat="server" type="text" />
												</div>
											</div>
											<h5>Job Contract</h5>
											<hr />
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">Describe Your business</label>
												<div class="col-sm-9">
													<asp:TextBox class="form-control" id="DropDownList2" maxlength="500" runat="server" rows="2" />
												</div>
											</div>
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">What industry you belong to</label>
												<div class="col-sm-9">
													<asp:TextBox class="form-control" id="DropDownList1" maxlength="500" runat="server" rows="2" />
												</div>
											</div>
											<h5>Leave Managment</h5>
											<hr />
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">Add Leave Entitlements</label>
												<div class="col-sm-9">
													<asp:Button ID="Button3" runat="server" Text="Add"
														class="btn btn-pill btn-light btn-air-light" OnClick="Button3_Click" />
												</div>
											</div>
											<h5>Payroll Managment</h5>
											<hr />
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">Working Days</label>
												<div class="col-sm-9">
													<asp:TextBox class="form-control" id="TextBox19" runat="server" type="text" />
												</div>
											</div>
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">Add Common Allowances</label>
												<div class="col-sm-9">
													<asp:Button ID="Button1" runat="server" Text="Add"
														class="btn btn-pill btn-light btn-air-light" />
												</div>
											</div>
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">Upload Job Contract Letter</label>
												<div class="col-sm-9">
													<asp:FileUpload ID="FileUpload1"
														runat="server" class="form-control"  ></asp:FileUpload>
												</div>
											</div>
											<h5>Preffered Password</h5>
											<hr />
											<div class="mb-3 row">
												<label class="col-sm-3 col-form-label" for="inputPassword3">Password</label>
												<div class="col-sm-9">
													<asp:TextBox class="form-control" id="TextBox4" runat="server" type="text" />
												</div>
											</div>
											<div class="card-footer">
												<button class="btn btn-primary">Submit</button>
												<button class="btn btn-secondary">Reset</button>
											</div>
										</form>
									</div>
								</div>
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
		</div>


	</form>
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
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyD8VU71ys-VMU-TQsqVkwYKjgyCi0iDRco&libraries=places"></script>
	<script type="text/javascript">
		google.maps.event.addDomListener(window, 'load', function () {

			var places = new google.maps.places.Autocomplete(document.getElementById('<%=TextBox11.ClientID %>'));

			google.maps.event.addListener(places, 'place_changed', function () {
				var place = places.getPlace();

				document.getElementById('<%=TextBox11.ClientID %>').value = place.formatted_address;



			});
		});
	</script>
</body>
</html>

