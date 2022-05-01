<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JobApplication.aspx.cs" Inherits="JobApplication" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="viho admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
	<meta name="keywords" content="admin template, viho admin template, dashboard template, flat admin template, responsive admin template, web app">
	<meta name="author" content="pixelstrap">
	<link rel="icon" href="../assets/images/favicon.png" type="image/x-icon">
	<link rel="shortcut icon" href="../assets/images/favicon.png" type="image/x-icon">
	<title>viho - Premium Admin Template</title>
	<!-- Google font-->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
	<!-- Font Awesome-->
	<link rel="stylesheet" type="text/css" href="../assets/css/fontawesome.css">
	<!-- ico-font-->
	<link rel="stylesheet" type="text/css" href="../assets/css/icofont.css">
	<!-- Themify icon-->
	<link rel="stylesheet" type="text/css" href="../assets/css/themify.css">
	<!-- Flag icon-->
	<link rel="stylesheet" type="text/css" href="../assets/css/flag-icon.css">
	<!-- Feather icon-->
	<link rel="stylesheet" type="text/css" href="../assets/css/feather-icon.css">
	<!-- Plugins css start-->
	<link rel="stylesheet" type="text/css" href="../assets/css/animate.css">
	<link rel="stylesheet" type="text/css" href="../assets/css/owlcarousel.css">
	<!-- Plugins css Ends-->
	<!-- Bootstrap css-->
	<link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css">
	<!-- App css-->
	<link rel="stylesheet" type="text/css" href="../assets/css/style.css">
	<link id="color" rel="stylesheet" href="../assets/css/color-1.css" media="screen">
	<!-- Responsive css-->
	<link rel="stylesheet" type="text/css" href="../assets/css/responsive.css">
	<style>
		.label {
			vertical-align: top;
			color: black;
			font-size: 35px;
			font-family: Verdana;
		}
	</style>
</head>
<body class="landing-wrraper">
	<form runat="server">
		<!-- tap on top starts-->
		<div class="tap-top"><i data-feather="chevrons-up"></i></div>
		<!-- tap on tap ends-->
		<!-- page-wrapper Start-->
		<div class="page-wrapper landing-page">
			<!-- Page Body Start-->
			<!-- header start-->
			<header class="landing-header">
				<div class="custom-container">
					<div class="row">
						<div class="col-12">
							<nav class="navbar navbar-light p-0" id="navbar-example2">
								<a class="navbar-brand" href="javascript:void(0)">
									<img class="img-fluid" src="../assets/images/logo/logo.png" alt=""></a>
								<ul class="landing-menu nav nav-pills">
									<li class="nav-item menu-back">back<i class="fa fa-angle-right"></i></li>
									<li class="nav-item"><a class="nav-link" href="#home">Home</a></li>
									<li class="nav-item"><a class="nav-link" href="#demo">Demo</a></li>
									<li class="nav-item"><a class="nav-link" href="https://pixelstrap.freshdesk.com/support/home" target="_blank">Support</a></li>
									<li class="nav-item">
										<form class="form-inline" target="_blank" action="https://docs.google.com/forms/d/e/1FAIpQLSe6hKUXw_By-pg7yabL0FxoTM02ZPTxoXy8PE3yboRuUCuyeA/viewform">
											<button class="nav-link">Hire Us</button>
										</form>
									</li>
									<li class="nav-item"><a class="nav-link" href="https://docs.pixelstrap.com/viho/document/" target="_blank">Document</a></li>
								</ul>
								<div class="buy-block">
									<a class="btn-landing" href="https://themeforest.net/user/pixelstrap/portfolio" target="_blank">Purchase</a>
									<div class="toggle-menu"><i class="fa fa-bars"></i></div>
								</div>
							</nav>
						</div>
					</div>
				</div>
			</header>
			<br />
			<br />
			<br />
			<br />
			<br />


			<div class="page-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-20" style="width: 100%;">
							<div class="card">
								<br />
								<br />
								<br />
								<br />

								<asp:Label ID="job" runat="server" class="label" Font-Bold="true"></asp:Label>
								<br />
								<hr />
								<div class="card-body">
									<table style="width: 100%;">

										<tr>
											<td>
												<table style="width: 100%; float: left;">


													<tr>
														<td style="vertical-align: top;">
															<asp:Label ID="Label8" runat="server" Text="Job Title"></asp:Label>

														</td>
														<td>

															<asp:TextBox ID="TextBox2" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>


														</td>

													</tr>
													<tr>
														<td>

															<asp:Label ID="Label9" runat="server" Text="Description"></asp:Label>

														</td>
														<td>

															<asp:TextBox runat="server" ID="TextBox23" class="form-control" ReadOnly="true" MaxLength="500" TextMode="MultiLine" Rows="5" />


														</td>

													</tr>
													<tr>
														<td>Location</td>
														<td>
															<asp:TextBox type="text" ReadOnly="true" ID="txtLocation" runat="server" class="form-control" /></td>
													</tr>


													<tr>
														<td style="vertical-align: top;">
															<asp:Label ID="Label10" runat="server" Text="Position"></asp:Label>

														</td>
														<td>

															<asp:TextBox ID="TextBox7" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>


														</td>

													</tr>
													<tr>
														<td style="vertical-align: top;">
															<asp:Label ID="Label3" runat="server" Text="Employement Type"></asp:Label>

														</td>
														<td>

															<asp:TextBox ID="TextBox3" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>


														</td>

													</tr>
													<tr>
														<td style="vertical-align: top;">
															<asp:Label ID="Label11" runat="server" Text="Contract Type"></asp:Label>

														</td>
														<td>

															<asp:TextBox ID="TextBox8" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>


														</td>

													</tr>
													<tr>
														<td style="vertical-align: top;">
															<asp:Label ID="Label13" runat="server" Text="Special Requrements"></asp:Label>

														</td>
														<td>

															<asp:TextBox runat="server" ID="TextBox4" ReadOnly="true" class="form-control" MaxLength="500" TextMode="MultiLine" Rows="5" />


														</td>

													</tr>
													<tr>
														<td style="vertical-align: top;">
															<asp:Label ID="Label14" runat="server" Text="Skills"></asp:Label>

														</td>
														<td>

															<asp:TextBox runat="server" ID="TextBox5" ReadOnly="true" class="form-control" MaxLength="500" TextMode="MultiLine" Rows="5" />


														</td>

													</tr>
													<tr>
														<td style="vertical-align: top;">
															<asp:Label ID="Label4" runat="server" Text="Requred Working Experiance"></asp:Label>

														</td>
														<td>

															<asp:TextBox ID="TextBox9" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>


														</td>

													</tr>
													<tr>
														<td style="vertical-align: top;">
															<asp:Label ID="Label15" runat="server" Text="Requred Education"></asp:Label>

														</td>
														<td>

															<asp:TextBox ID="TextBox11" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>


														</td>

													</tr>
													<tr>
														<td style="vertical-align: top;">
															<asp:Label ID="Label16" runat="server" Text="Typical Salary"></asp:Label>

														</td>
														<td>

															<asp:TextBox ID="TextBox12" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>


														</td>

													</tr>

												</table>
											</td>

											<td style="padding-left: 50px; vertical-align: top; margin: 10px;">
												<table style="border-collapse: collapse; width: 100%;">
													<tr>
														<td colspan="2" style="vertical-align: top;">
															<asp:Label ID="Label5" runat="server" Text="Fill out the below form " Font-Bold="true"></asp:Label>
															<hr />

														</td>


													</tr>
													<tr>
														<td style="vertical-align: top;">
															<asp:Label ID="Label2" runat="server" Text="Applicant Name"></asp:Label>

														</td>
														<td>

															<asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>


														</td>

													</tr>
													<tr>
														<td style="vertical-align: top;">
															<asp:Label ID="Label6" runat="server" Text="Applicant Email"></asp:Label>

														</td>
														<td>

															<asp:TextBox ID="TextBox13" runat="server" class="form-control"></asp:TextBox>


														</td>

													</tr>
													<tr>
														<td style="vertical-align: top;">
															<asp:Label ID="Label18" runat="server" Text="Brief Introduction About Applicant"></asp:Label>

														</td>
														<td>

															<asp:TextBox runat="server" ID="TextBox17" class="form-control" placeholder="Skills And Requarements" MaxLength="500" TextMode="MultiLine" Rows="5" />


														</td>

													</tr>
													<tr>
														<td style="vertical-align: top;">
															<asp:Label ID="Label19" runat="server" Text=" Working Experiance"></asp:Label>

														</td>
														<td>

															<asp:TextBox runat="server" ID="TextBox6" class="form-control" MaxLength="500" TextMode="MultiLine" Rows="2" />


														</td>

													</tr>
													<tr>
														<td style="vertical-align: top;">
															<asp:Label ID="Label20" runat="server" Text="Education"></asp:Label>

														</td>
														<td>

															<asp:TextBox runat="server" ID="TextBox10" class="form-control" MaxLength="500" TextMode="MultiLine" Rows="2" />


														</td>

													</tr>
													<tr>
														<td style="vertical-align: top;">
															<asp:Label ID="Label21" runat="server" Text="Salary Expectation"></asp:Label>

														</td>
														<td>

															<asp:TextBox ID="TextBox20" runat="server" class="form-control"></asp:TextBox>


														</td>

													</tr>
													<tr>
														<td style="vertical-align: top;">

															<asp:Label ID="Label24" runat="server" Text="Upload Resume"></asp:Label>


														</td>
														<td>

															<asp:FileUpload ID="FileUpload1"
																runat="server" class="form-control"></asp:FileUpload>

															<br />
															<br />

														</td>

													</tr>
													<tr>
														<td style="float: right">
															<asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-pill btn-light btn-air-light" />
															<br />
															<br />
															<br />
														</td>
													</tr>

												</table>
											</td>

										</tr>

									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- header end-->
		<!--home section start-->

		<!--home section end-->
		<!--demo section start-->

		<!--demo section end-->
		<!--frameworks start-->

		<!--frameworks end-->
		<!--unic-cards start-->

		<!--unic-cards end-->
		<!--ecommerce pages start-->




		<div class="sub-footer">
			<div class="custom-container">
				<div class="row">
					<div class="col-md-6 col-sm-2">
						<div class="footer-contain">
							<img class="img-fluid" src="../assets/images/logo/logo.png" alt="">
						</div>
					</div>
					<div class="col-md-6 col-sm-10">
						<div class="footer-contain">
							<p class="mb-0">Copyright 2021-22 © viho All rights reserved.                       </p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--footer end-->
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
	<script src="../assets/js/owlcarousel/owl.carousel.js"></script>
	<script src="../assets/js/owlcarousel/owl-custom.js"></script>
	<script src="../assets/js/landing_sticky.js"></script>
	<script src="../assets/js/landing.js"></script>
	<script src="../assets/js/jarallax_libs/libs.min.js"></script>
	<!-- Plugins JS Ends-->
	<!-- Theme js-->
	<script src="../assets/js/script.js"></script>
	<!-- login js-->
	<!-- Plugin used-->
</body>
</html>



