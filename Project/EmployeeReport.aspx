<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeReport.aspx.cs" Inherits="EmployeeReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server" onload="initialize()">
	<div class="page-wrapper" id="pageWrapper" style="padding-left: 25%; padding-top: 10%">
		<!-- Page Sidebar Ends-->
		<br />

		<div class="page-body">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12">
						<div class="card">
							<div class="card-header pb-0">
								<h5 style="align-content: center">Employee Report</h5>
							</div>
							<div class="card-body">
								<div runat="server" id="employee" class="table-responsive">
									<div>
										<asp:GridView ID="GridView2" runat="server" PageSize="10" DataKeyField="EID" AutoGenerateColumns="False" CellPadding="4"  GridLines="None" Width="100%" ItemStyle-BorderStyle="Solid" OnRowCommand="Grid_RowCommand" class="display">
											<Columns>
												<%--<asp:BoundField HeaderText="Employee ID" DataField="EId" ID="EId"></asp:BoundField>--%>
												<asp:TemplateField HeaderText="Employee ID" ItemStyle-Width="150">
													<ItemTemplate>
														<asp:Label ID="EID" runat="server" Text='<%# Eval("EID") %>' DataField="EId" />
													</ItemTemplate>
												</asp:TemplateField>
												<asp:BoundField HeaderText="Name" DataField="Ename"></asp:BoundField>
												<asp:BoundField HeaderText="Date Of Birth" DataField="DOB"></asp:BoundField>

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
	</div>

	<footer class="footer footer-fix">
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
