<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="CompanyContract.aspx.cs" Inherits="CompanyContract" %>

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
						<h4>Employeer Contract</h4>
						<span>Using the <a href="#">card</a> component, you can extend the default collapse behavior to create an accordion.</span>
					</div>
					<div class="card-body">

						<div>
							<asp:Table runat="server">

								<asp:TableRow>
									<asp:TableCell CssClass="ImgCell">
					 
					<img src="assets/images/contract.png" alt="fsdf" width="600"   />				

									</asp:TableCell>
									<asp:TableCell >
										<div class="theme-form">
											 

													<p>
														This is contract This is contract This is contract This is contract This is contract
									<br />
														This is contract This is contract This is contract This is contract This is contract<br />
														This is contract This is contract This is contract This is contract This is contract<br />
														This is contract This is contract This is contract This is contract This is contract
									<br />
														This is contract This is contract This is contract This is contract This is contract
									<br />
														This is contract This is contract This is contract This is contract This is contract
									<br />
														This is contract This is contract This is contract This is contract This is contract
									<br />
														This is contract This is contract This is contract This is contract This is contract<br />
														This is contract This is contract This is contract This is contract This is contract
									<br />
														This is contract This is contract This is contract This is contract This is contract
									<br />
														This is contract This is contract This is contract This is contract This is contract
									<br />
														This is contract This is contract This is contract This is contract This is contract
									<br />
														This is contract This is contract This is contract This is contract This is contract
									<br />
													</p>
													<div class="card-footer">
														<asp:CheckBox  ID="ck" runat="server"   OnCheckedChanged="Unnamed_CheckedChanged" AutoPostBack="true" /> <label>I agree</label><br />
														<asp:Button ID="Button1" runat="server" Text="Next" CssClass="btn btn-primary"  Enabled="false" OnClick="Button1_Click" />

													</div>
													<br />
													<br />

												</div>
										 

									</asp:TableCell>
								</asp:TableRow>




							</asp:Table>
							<br />
							<br />
 
						</div>

					</div>

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


</body>
</html>



