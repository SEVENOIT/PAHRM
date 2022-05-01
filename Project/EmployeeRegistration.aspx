<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmployeeRegistration.aspx.cs" Inherits="EmployeeRegistration" %>

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
	<style>
		hr.lineDash {
			border-top: 1px dashed red;
		}

		hr.lineSolid {
			border: 1px solid #24695c;
		}
	</style>
</head>
<body>
	<form id="form1" runat="server">

		<!-- Loader starts-->
		
				<!-- Page Sidebar Ends-->
				<br />


				<div class="page-body">
					<div class="col-sm-12">
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
											<asp:TextBox class="form-control" id="cid" readonly="true" runat="server" type="text" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Templorary ID</label>
										<div class="col-sm-9">
											<asp:TextBox class="form-control" id="tid" readonly="true" runat="server" type="text" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Name</label>
										<div class="col-sm-9">
											<asp:TextBox class="form-control" id="name" readonly="true" runat="server" type="text" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Date of Birth</label>
										<div class="col-sm-9">
											<asp:TextBox id="dob" runat="server" class="datepicker-here form-control digits" type="text" data-language="en" />
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
											<asp:TextBox class="form-control" id="country" runat="server" readonly="true" type="text" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Language</label>
										<div class="col-sm-9">
											<asp:TextBox class="form-control" id="lang" runat="server" type="text" />
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
											<asp:TextBox class="form-control" id="nic" runat="server" type="text" />
										</div>
									</div>
									<h5>Contact Information</h5>
									<hr />
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Pesonal Mobile Number</label>
										<div class="col-sm-9">
											<asp:TextBox class="form-control" id="tel" runat="server" type="text" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Email</label>
										<div class="col-sm-9">
											<asp:TextBox class="form-control" id="email" runat="server" type="text" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Address</label>
										<div class="col-sm-9">
											<asp:TextBox class="form-control" id="address" runat="server" type="text" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Emergency Contact Number</label>
										<div class="col-sm-9">
											<asp:TextBox class="form-control" id="rtel" runat="server" type="text" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Relation Name</label>
										<div class="col-sm-9">
											<asp:TextBox class="form-control" id="rname" runat="server" type="text" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Relationship</label>
										<div class="col-sm-9">
											<asp:TextBox class="form-control" id="relation" runat="server" type="text" />
										</div>
									</div>
									<h5>Education and Qualifications</h5>
									<hr />
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Highest qualification</label>
										<div class="col-sm-9">
											<asp:TextBox class="form-control" id="hq" maxlength="500" runat="server" rows="2" />
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
											<asp:TextBox class="form-control" id="desig" readonly="true" runat="server" type="text" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Working Experiance</label>
										<div class="col-sm-9">
											<asp:TextBox class="form-control" id="experiance" readonly="true" runat="server" type="text" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Salary</label>
										<div class="col-sm-9">
											<asp:TextBox class="form-control" id="salary" readonly="true" runat="server" type="text" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Hourly Salary Rate</label>
										<div class="col-sm-9">
											<asp:TextBox class="form-control" id="hourly" runat="server" readonly="true" type="text" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Employeement Type Type</label>
										<div class="col-sm-9">
											<asp:TextBox class="form-control" id="TextBox1" runat="server" readonly="true" type="text" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Contract Type</label>
										<div class="col-sm-9">
											<asp:TextBox class="form-control" id="ctype" runat="server" type="text" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Available Days</label>
										<div class="col-sm-9">
											<asp:TextBox class="form-control" id="availble" runat="server" type="text" />
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
											<asp:TextBox class="form-control" id="Text1" runat="server" type="text" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Account Number</label>
										<div class="col-sm-9">
											<asp:TextBox class="form-control" id="Text2" runat="server" type="text" />
										</div>
									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Bank Name</label>
										<div class="col-sm-9">
											<asp:TextBox class="form-control" id="Text3" runat="server" type="text" />
										</div>

									</div>
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label" for="inputPassword3">Branch</label>
										<div class="col-sm-9">
											<asp:TextBox class="form-control" id="Text4" runat="server" type="text" />
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
	<!-- SPlugin used-->
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyD8VU71ys-VMU-TQsqVkwYKjgyCi0iDRco&libraries=places"></script>
	<script type="text/javascript">
		google.maps.event.addDomListener(window, 'load', function () {

			var places = new google.maps.places.Autocomplete(document.getElementById('<%=address.ClientID %>'));

			google.maps.event.addListener(places, 'place_changed', function () {
				var place = places.getPlace();

				document.getElementById('<%=address.ClientID %>').value = place.formatted_address;



			});
		});
	</script>
	<script type="text/javascript">
		function other(ddl) {

			if (ddl.value == "Other") {
                /*document.getElementById('TextBox20a').style.display = "";
                document.getElementById('Label22a').style.display = "";*/

				document.getElementById('TextBox20a').style.visibility = "visible";

				document.getElementById('Label22a').style.visibility = "visible";


			}
			else {
                /*document.getElementById('TextBox20a').style.display = 'none';
                document.getElementById('Label22a').style.display = 'none';*/

				document.getElementById('TextBox20a').style.visibility = "hidden";

				document.getElementById('Label22a').style.visibility = "hidden";

			}
		}

		<%--function days(ddl) {

			if (ddl.value == "Casual") {


				document.getElementById('<%=availble.ClientID %>').style.visibility = "visible";

				document.getElementById('<%=Label19.ClientID %>').style.visibility = "visible";


			}
			else {
				document.getElementById('<%=availble.ClientID %>').style.visibility = "hidden";

				document.getElementById('<%=Label19.ClientID %>').style.visibility = "hidden";

			}
		}--%>
	</script>
</body>
</html>



