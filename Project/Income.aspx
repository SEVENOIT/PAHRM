<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Income.aspx.cs" Inherits="Income" %>

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
							<h5>Company Income</h5>
							<span>Add income expences</span>
						</div>

						<div class="card-body">
							<div class="row row-cols-sm-3 theme-form mt-3 form-bottom">
								<div class="mb-3 d-flex">
									<h6>Income name</h6>
								</div>
								<div class="mb-3 d-flex">
									<h6>Amount(in Rupees)</h6>
								</div>
								<div class="mb-3 d-flex">
									<h6>Type</h6>
								</div>
							</div>
							<div class="row row-cols-sm-3 theme-form mt-3 form-bottom">
								<div class="mb-3 d-flex">
									<asp:TextBox runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
								</div>
								<div class="mb-3 d-flex">
									<asp:TextBox runat="server" CssClass="form-control" ID="inputUnlabelPassword" placeholder=""></asp:TextBox>
								</div>
								<div class="mb-3 d-flex">
									<asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control">

										<asp:ListItem Selected="True" Value=""></asp:ListItem>
										<asp:ListItem Value="Sales">Sales</asp:ListItem>
										<asp:ListItem Value="Operating Income">Operating Income</asp:ListItem>
										<asp:ListItem Value="Exceptional Income">Exceptional Income</asp:ListItem>
										<asp:ListItem Value="Other Income">Other Income</asp:ListItem>

									</asp:DropDownList>
								</div>
							</div>
							<div class="row row-cols-sm-3 theme-form mt-3 form-bottom">
								<div class="mb-3 d-flex">
									<asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
								</div>
								<div class="mb-3 d-flex">
									<asp:TextBox runat="server" CssClass="form-control" ID="TextBox1"></asp:TextBox>
								</div>
								<div class="mb-3 d-flex">
									<asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">

										<asp:ListItem Selected="True" Value=""></asp:ListItem>
										<asp:ListItem Value="Sales">Sales</asp:ListItem>
										<asp:ListItem Value="Operating Income">Operating Income</asp:ListItem>
										<asp:ListItem Value="Exceptional Income">Exceptional Income</asp:ListItem>
										<asp:ListItem Value="Other Income">Other Income</asp:ListItem>


									</asp:DropDownList>
								</div>
							</div>
							<div class="row row-cols-sm-3 theme-form mt-3 form-bottom">
								<div class="mb-3 d-flex">
									<asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
								</div>
								<div class="mb-3 d-flex">
									<asp:TextBox runat="server" CssClass="form-control" ID="TextBox2"></asp:TextBox>
								</div>
								<div class="mb-3 d-flex">
									<asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control">

										<asp:ListItem Selected="True" Value=""></asp:ListItem>
										<asp:ListItem Value="Sales">Sales</asp:ListItem>
										<asp:ListItem Value="Operating Income">Operating Income</asp:ListItem>
										<asp:ListItem Value="Exceptional Income">Exceptional Income</asp:ListItem>
										<asp:ListItem Value="Other Income">Other Income</asp:ListItem>


									</asp:DropDownList>
								</div>
							</div>
							<div class="row row-cols-sm-3 theme-form mt-3 form-bottom">
								<div class="mb-3 d-flex">
									<asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
								</div>
								<div class="mb-3 d-flex">
									<asp:TextBox runat="server" CssClass="form-control" ID="TextBox3"></asp:TextBox>
								</div>
								<div class="mb-3 d-flex">
									<asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control">

									<asp:ListItem Selected="True" Value=""></asp:ListItem>
										<asp:ListItem Value="Sales">Sales</asp:ListItem>
										<asp:ListItem Value="Operating Income">Operating Income</asp:ListItem>
										<asp:ListItem Value="Exceptional Income">Exceptional Income</asp:ListItem>
										<asp:ListItem Value="Other Income">Other Income</asp:ListItem>


									</asp:DropDownList>
								</div>
							</div>
							<div class="col-xxl-4 mb-3 d-flex">
								<button class="btn btn-primary">Add</button>
							</div>
						</div>


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

