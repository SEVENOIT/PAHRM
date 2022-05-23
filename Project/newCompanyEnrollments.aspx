﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newCompanyEnrollments.aspx.cs" Inherits="newCompanyEnrollments" %>
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
	<link rel="stylesheet" type="text/css" href="../assets/css/date-picker.css">
	<link rel="stylesheet" type="text/css" href="../assets/css/owlcarousel.css">
	<link rel="stylesheet" type="text/css" href="../assets/css/prism.css">
	<link rel="stylesheet" type="text/css" href="../assets/css/whether-icon.css">
	<!-- Plugins css Ends-->
	<!-- Bootstrap css-->
	<link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css">
	<!-- App css-->
	<link rel="stylesheet" type="text/css" href="../assets/css/style.css">
	<link id="color" rel="stylesheet" href="../assets/css/color-1.css" media="screen">
	<!-- Responsive css-->
	<link rel="stylesheet" type="text/css" href="../assets/css/responsive.css">
</head>
<body>
	<!-- Loader starts-->
	<div class="loader-wrapper">
		<div class="theme-loader">
			<div class="loader-p"></div>
		</div>
	</div>
	<!-- Loader ends-->
	<!-- page-wrapper Start-->
	<div class="page-wrapper" id="pageWrapper">
		<!-- Page Header Start-->
		<div class="page-main-header">
			<div class="main-header-right row m-0">
				<div class="main-header-left">
					<div class="sidebar-main-title">
						<%--<img class="img-fluid" src="../assets/images/pharm3.png" alt="" width="60" height="30"></a>--%>
						<img class="img-60 rounded-circle" src="../assets/images/pharm3.png" alt="">
					</div>
					<div class="sidebar-user text-center">
						<h4><b>
							<asp:Label ID="company" class="h6 txt-primary f-w-700" runat="server" Text="Superadmin Panel"></asp:Label></b></h4>
					</div>

				</div>
				<div class="left-menu-header col">
					<ul>
						<li>
							<form class="form-inline search-form">
								<div class="search-bg">
									<i class="fa fa-search"></i>
									<input class="form-control-plaintext" placeholder="Search here.....">
								</div>
							</form>
							<span class="d-sm-none mobile-search search-bg"><i class="fa fa-search"></i></span>
						</li>
					</ul>
				</div>
				<div class="nav-right col pull-right right-menu p-0">
					<ul class="nav-menus">
						<li><a class="text-dark" href="#!" onclick="javascript:toggleFullScreen()"><i data-feather="maximize"></i></a></li>
						<li class="onhover-dropdown">
							<div class="bookmark-box"><i data-feather="star"></i></div>
							<div class="bookmark-dropdown onhover-show-div">
								<div class="form-group mb-0">
									<div class="input-group">
										<div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-search"></i></span></div>
										<input class="form-control" type="text" placeholder="Search for bookmark...">
									</div>
								</div>
								<ul class="m-t-5">
									<li class="add-to-bookmark"><i class="bookmark-icon" data-feather="inbox"></i>Email<span class="pull-right"><i data-feather="star"></i></span></li>
									<li class="add-to-bookmark"><i class="bookmark-icon" data-feather="message-square"></i>Chat<span class="pull-right"><i data-feather="star"></i></span></li>
									<li class="add-to-bookmark"><i class="bookmark-icon" data-feather="command"></i>Feather Icon<span class="pull-right"><i data-feather="star"></i></span></li>
									<li class="add-to-bookmark"><i class="bookmark-icon" data-feather="airplay"></i>Widgets<span class="pull-right"><i data-feather="star">   </i></span></li>
								</ul>
							</div>
						</li>
						<li class="onhover-dropdown">
							<div class="notification-box"><i data-feather="bell"></i><span class="dot-animated"></span></div>
							<ul class="notification-dropdown onhover-show-div">
								<li>
									<p class="f-w-700 mb-0">You have 3 Notifications<span class="pull-right badge badge-primary badge-pill">4</span></p>
								</li>
								<li class="noti-primary">
									<div class="media">
										<span class="notification-bg bg-light-primary"><i data-feather="activity"></i></span>
										<div class="media-body">
											<p>Delivery processing </p>
											<span>10 minutes ago</span>
										</div>
									</div>
								</li>
								<li class="noti-secondary">
									<div class="media">
										<span class="notification-bg bg-light-secondary"><i data-feather="check-circle"></i></span>
										<div class="media-body">
											<p>Order Complete</p>
											<span>1 hour ago</span>
										</div>
									</div>
								</li>
								<li class="noti-success">
									<div class="media">
										<span class="notification-bg bg-light-success"><i data-feather="file-text"></i></span>
										<div class="media-body">
											<p>Tickets Generated</p>
											<span>3 hour ago</span>
										</div>
									</div>
								</li>
								<li class="noti-danger">
									<div class="media">
										<span class="notification-bg bg-light-danger"><i data-feather="user-check"></i></span>
										<div class="media-body">
											<p>Delivery Complete</p>
											<span>6 hour ago</span>
										</div>
									</div>
								</li>
							</ul>
						</li>
						<li>
							<div class="mode"><i class="fa fa-moon-o"></i></div>
						</li>
						<li class="onhover-dropdown"><i data-feather="message-square"></i>
							<ul class="chat-dropdown onhover-show-div">
								<li>
									<div class="media">
										<img class="img-fluid rounded-circle me-3" src="../assets/images/user/4.jpg" alt="">
										<div class="media-body">
											<span>Ain Chavez</span>
											<p class="f-12 light-font">Lorem Ipsum is simply dummy...</p>
										</div>
										<p class="f-12">32 mins ago</p>
									</div>
								</li>
								<li>
									<div class="media">
										<img class="img-fluid rounded-circle me-3" src="../assets/images/user/1.jpg" alt="">
										<div class="media-body">
											<span>Erica Hughes</span>
											<p class="f-12 light-font">Lorem Ipsum is simply dummy...</p>
										</div>
										<p class="f-12">58 mins ago</p>
									</div>
								</li>
								<li>
									<div class="media">
										<img class="img-fluid rounded-circle me-3" src="../assets/images/user/2.jpg" alt="">
										<div class="media-body">
											<span>Kori Thomas</span>
											<p class="f-12 light-font">Lorem Ipsum is simply dummy...</p>
										</div>
										<p class="f-12">1 hr ago</p>
									</div>
								</li>
								<li class="text-center"><a class="f-w-700" href="javascript:void(0)">See All     </a></li>
							</ul>
						</li>
						<li class="onhover-dropdown p-0">
							<button class="btn btn-primary-light" type="button"><a href="login_two.html"><i data-feather="log-out"></i>Log out</a></button>
						</li>
					</ul>
				</div>
				<div class="d-lg-none mobile-toggle pull-right w-auto"><i data-feather="more-horizontal"></i></div>
			</div>
		</div>
		<!-- Page Header Ends                              -->
		<!-- Page Body Start-->
		<form runat="server">
			<div class="page-body-wrapper horizontal-menu">
				<!-- Page Sidebar Start-->
				<header class="main-nav">

					<nav>
						<div class="main-navbar">
							<div class="left-arrow" id="left-arrow"><i data-feather="arrow-left"></i></div>
							<div id="mainnav">
								<ul class="nav-menu custom-scrollbar" style="padding-top: 20%; height: 500px;">

									<li class="sidebar-main-title">
										<div>
											<h6>Dashboard</h6>
										</div>
									</li>
									<li class="dropdown">
										<a class="nav-link menu-title" href="javascript:void(0)">
											<h6><i data-feather="map-pin"></i><span>Employer Tracking</span></h6>
										</a>
										<ul class="nav-submenu menu-content">
											<li>
												<asp:Button ID="newApplications" runat="server" class="btn btn-outline-light  txt-dark" Style="margin: 10px;" Text="New Applications" /></li>
											<li>
												<asp:Button ID="allCompanies" runat="server" class="btn btn-outline-light txt-dark" Style="margin: 10px; text-align: left;" Text="View Companies" /></li>

											<%--<li>
												<asp:Button ID="onBoarding" runat="server" class="btn btn-outline-light txt-dark" Style="margin: 10px; text-align: left;" /></li>
											<li>
												<asp:Button ID="allowances" runat="server" class="btn btn-outline-light txt-dark" Style="margin: 10px; text-align: left;" /></li>
											<li>
												<asp:Button ID="LMS" runat="server" class="btn btn-outline-light txt-dark" Style="margin: 10px;" /></li>--%>
										</ul>
									</li>
								</ul>
							</div>
						</div>
					</nav>

				</header>
				<!-- Page Sidebar Ends-->

				<div class="page-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-12">
								<br />
								<div class="card">
									<div class="card-header pb-0">
										<h5 style="align-content: center"></h5>
									</div>
									<div class="card-body">
										<div runat="server" id="employee" class="table-responsive">
											<div>
												<asp:GridView ID="GridView2" runat="server" PageSize="10" DataKeyField="TrackID" AutoGenerateColumns="False" CellPadding="4" GridLines="None" Width="100%" ItemStyle-BorderStyle="Solid" OnRowCommand="Grid_RowCommand" class="display">
													<Columns>
														<%--<asp:BoundField HeaderText="Employee ID" DataField="EId" ID="EId"></asp:BoundField>--%>
														<asp:TemplateField HeaderText="Track ID" ItemStyle-Width="150">
															<ItemTemplate>
																<asp:Label ID="TrackID" runat="server" Text='<%# Eval("TrackID") %>' DataField="TrackID" />
															</ItemTemplate>
														</asp:TemplateField>
														<asp:BoundField HeaderText="Company Name" DataField="CompanyName"></asp:BoundField>
														<asp:BoundField HeaderText="Email" DataField="Email"></asp:BoundField>
														<asp:BoundField HeaderText="Start Date" DataField="StartDate"></asp:BoundField>

														<asp:TemplateField HeaderText="View">
															<ItemTemplate>
																<asp:Button Text="View" runat="server" class="btn btn-outline-primary btn-sm" CommandName="View" CommandArgument="<%# Container.DataItemIndex %>" />
															</ItemTemplate>
														</asp:TemplateField>


													</Columns>
													<HeaderStyle CssClass="bg-primary" Font-Bold="True" BackColor="#ffffff" />

												</asp:GridView>
												<%--	<br />
										<asp:Button ID="btnExport" runat="server" Text="Pay Now" OnClick="PayNow" />

										<br />--%>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<!-- footer start-->
				<footer class="footer">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-6 footer-copyright">
								<p class="mb-0">Copyright 2022 ©SevenOIT All rights reserved.</p>
							</div>
							<div class="col-md-6">
								<div class="pull-right mb-0">
									<img class="img-fluid" src="../assets/images/pharm3.png" alt="" width="60" height="30">
								</div>
							</div>
						</div>
					</div>
				</footer>
			</div>
		</form>
	</div>
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
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD8VU71ys-VMU-TQsqVkwYKjgyCi0iDRco&sensor=false">
	</script>
</body>
</html>




