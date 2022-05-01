<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LeaveFormList.aspx.cs" Inherits="LeaveFormList" %>


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
								<h5 style="align-content: center">Leave Requests</h5>
							</div>
							<div class="card-body">
								<div runat="server" id="employee" class="table-responsive">
									<div>
										<asp:GridView ID="GridView1" runat="server" PageSize="10" DataKeyField="EID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" ItemStyle-BorderStyle="Solid" OnRowCommand="Grid_RowCommand" CssClass="display">
											<Columns>
												<%--<asp:BoundField HeaderText="Employee ID" DataField="EId" ID="EId"></asp:BoundField>--%>
												<asp:BoundField HeaderText="LeaveID" DataField="LID"></asp:BoundField>

												<asp:TemplateField HeaderText="Employee ID" ItemStyle-Width="150">
													<ItemTemplate>
														<asp:Label ID="EID" runat="server" Text='<%# Eval("EID") %>' DataField="EId" />
													</ItemTemplate>
												</asp:TemplateField>
												<asp:BoundField HeaderText="Date of leave" DataField="Date"></asp:BoundField>
												<asp:BoundField HeaderText="Number of days" DataField="NumberOfDays"></asp:BoundField>
												<asp:BoundField HeaderText="Status" DataField="Status"></asp:BoundField>

												<asp:TemplateField HeaderText="View">
													<ItemTemplate>
														<asp:Button Text="View" runat="server" CssClass="btn btn-pill btn-secondary" CommandName="View" CommandArgument="<%# Container.DataItemIndex %>" Enabled='<%# Eval("Status").ToString() == "Pending" ? true : false %>' />
													</ItemTemplate>
												</asp:TemplateField>
												<asp:TemplateField HeaderText="">
													<ItemTemplate>
														<asp:Button Text="Delete" runat="server" CssClass="btn btn-pill btn-danger" CommandName="View" CommandArgument="<%# Container.DataItemIndex %>" Enabled='<%# Eval("Status").ToString() == "Approved" ? true : false %>' />
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



				<footer class="footer footer-fix">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-6 footer-copyright">
								<p class="mb-0">Copyright 2021-22 © viho All rights reserved.</p>
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
		</div>

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



