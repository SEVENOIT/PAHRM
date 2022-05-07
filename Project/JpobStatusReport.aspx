<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="JpobStatusReport.aspx.cs" Inherits="JpobStatusReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server" onload="initialize()">

	<div class="page-wrapper" id="pageWrapper" style="padding-left: 25%; padding-top: 8%">
		<br />


		<div class="page-body">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12">
						<div class="card">
							<div class="card-header pb-0">
								<h5>Rostering Reports</h5>
								<hr />
							</div>
							<div class="card-body">
								<div class="card-body">
									<div class="theme-form" runat="server">
										<div class="mb-3">
											<label class="col-form-label pt-0" for="exampleInputEmail1">Job Status</label>
											<asp:DropDownList class="form-control" ID="TextBox2" runat="server">
												<asp:ListItem Selected="True" Value=""></asp:ListItem>
												<asp:ListItem Value="Completed">Completed</asp:ListItem>
												<asp:ListItem Value="Not Completed">Not Completed</asp:ListItem>
											</asp:DropDownList>
										</div>
										<div class="mb-3">
											<label class="col-form-label pt-0" for="exampleInputEmail1">Start Date</label>
											<asp:TextBox class="form-control" type="date" ID="TextBox1" runat="server">
											</asp:TextBox>
										</div>
										<div class="mb-3">
											<label class="col-form-label pt-0" for="exampleInputEmail1">End Date</label>
											<asp:TextBox class="form-control" type="date" ID="TextBox3" runat="server">
											</asp:TextBox>
										</div>
										<div class="card-footer">
											<asp:Button ID="Button1" runat="server" Text="Search"
												class="btn btn-pill btn-outline-warning-2x btn-air-warning" OnClick="RosterSearch" />
										</div>
									</div>
								</div>

								<div id="Div4" runat="server" class="table-responsive">
									<asp:GridView ID="GridView7" runat="server" class="table table-bordered" PageSize="10" AllowPaging="True" DataKeyField="EID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#ffffff" GridLines="None" ShowFooter="true" Width="100%" ItemStyle-BorderStyle="Solid">
										<Columns>
											<asp:BoundField HeaderText="Roster ID" DataField="RosterID"></asp:BoundField>
											<asp:BoundField HeaderText="Employee ID" DataField="EID"></asp:BoundField>
											<asp:BoundField HeaderText="Employee Name" DataField="Ename"></asp:BoundField>
											<asp:BoundField HeaderText="Job Category" DataField="Job"></asp:BoundField>
											<asp:BoundField HeaderText="Location" DataField="JLocation"></asp:BoundField>
											<asp:BoundField HeaderText="Date" DataField="Roster_Cycle"></asp:BoundField>
											<asp:BoundField HeaderText="Status" DataField="JobStatus"></asp:BoundField>


										</Columns>

										<HeaderStyle CssClass="bg-primary" Font-Bold="True" BackColor="#ff6600" />
									</asp:GridView>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



		<%--		<footer class="footer footer-fix">
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
</asp:Content>
