<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CompanyLeaveEntitlement.aspx.cs" Inherits="CompanyLeaveEntitlement" %>

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

										<h4 style="text-align: center">Leave Entitlement</h4>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table class="table table-bordered">
												<tr>
													<td style="border: none;"></td>
													<td colspan="5" style="font-weight: bold;text-align:center;">Leave Allocation In Hours</td>

												</tr>
												<tr>
													<td style="font-weight: bold;">Employeement Type</td>
													<td style="font-weight: bold;">Casual</td>
													<td style="font-weight: bold;">Annual</td>
													<td style="font-weight: bold;">Sick</td>
													<td style="font-weight: bold;">Maternity</td>
													<td style="font-weight: bold;"> NoPay</td>
												</tr>
												<tr>
													<td style="text-align: left;font-weight: bold;">Full-time</td>
													<td>
														<asp:TextBox ID="F1" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="F2" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="F3" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="F4" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="F5" runat="server" Text="0"></asp:TextBox></td>

												</tr>
												<tr>
													<td style="font-weight: bold;text-align: left">Part-time</td>
													<td>
														<asp:TextBox ID="P1" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="P2" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="P3" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="P4" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="P5" runat="server" Text="0"></asp:TextBox></td>

												</tr>
												<tr>
													<td style="font-weight: bold;text-align: left">Casual</td>
													<td>
														<asp:TextBox ID="C1" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="C2" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="C3" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="C4" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="C5" runat="server" Text="0"></asp:TextBox></td>

												</tr>
												<tr>
													<td style="font-weight: bold;text-align: left">Fixed term</td>
													<td>
														<asp:TextBox ID="Fix1" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="Fix2" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="Fix3" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="Fix4" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="Fix5" runat="server" Text="0"></asp:TextBox></td>

												</tr>
												<tr>
													<td style="font-weight: bold;text-align: left">Shiftworkers</td>
													<td>
														<asp:TextBox ID="S1" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="S2" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="S3" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="S4" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="S5" runat="server" Text="0"></asp:TextBox></td>

												</tr>
												<tr>
													<td style="font-weight: bold;text-align: left">Daily hire and weekly hire</td>
													<td>
														<asp:TextBox ID="D1" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="D2" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="D3" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="D4" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="D5" runat="server" Text="0"></asp:TextBox></td>

												</tr>
												<tr>
													<td style="font-weight: bold;text-align: left">Apprentices and trainees</td>
													<td>
														<asp:TextBox ID="A1" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="A2" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="A3" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="A4" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="A5" runat="server" Text="0"></asp:TextBox></td>

												</tr>
												<tr>
													<td style="font-weight: bold;text-align: left">Outworkers</td>
													<td>
														<asp:TextBox ID="O1" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="O2" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="O3" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="O4" runat="server" Text="0"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="O5" runat="server" Text="0"></asp:TextBox></td>

												</tr>
											</table>
										</div>
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

</body>
</html>




