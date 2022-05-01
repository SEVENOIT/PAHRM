<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="EmployeeInterviews.aspx.cs" Inherits="EmployeeInterviews" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



	<div class="page-body" style="padding-left: 25%; padding-top: 10%">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<div class="card">
						<div class="card-header pb-0">
							<h5>New Applicant List</h5>
						</div>
						<div class="card-body">
							<div runat="server" class="table-responsive">

								<div class="table-responsive">
									<asp:GridView ID="GridView1" runat="server" PageSize="10" DataKeyField="TEID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" ItemStyle-BorderStyle="Solid" OnRowCommand="Grid_RowCommand" class="table table-bordered">
										<Columns>


											<asp:TemplateField HeaderText="Temp Employee ID" ItemStyle-Width="150">
												<ItemTemplate>
													<asp:Label ID="TEID" runat="server" Text='<%# Eval("TEID") %>' DataField="TEID" />
												</ItemTemplate>
											</asp:TemplateField>
											<asp:BoundField HeaderText="Vacancy ID " DataField="VID"></asp:BoundField>
											<asp:BoundField HeaderText="Employee Name" DataField="Ename"></asp:BoundField>

											<asp:BoundField HeaderText="Status" DataField="Status"></asp:BoundField>

											<asp:TemplateField HeaderText="View Application (Step 1) ">
												<ItemTemplate>
													<asp:Button Text="View" runat="server" class="btn btn-outline-info btn-sm" CommandName="View1" CommandArgument="<%# Container.DataItemIndex %>" Enabled='<%# Eval("Status").ToString() == "Pending" ? true : false %>' />
												</ItemTemplate>
											</asp:TemplateField>
											<asp:TemplateField HeaderText="View Applicant Info (Step 2) ">
												<ItemTemplate>
													<asp:Button Text="View" runat="server" class="btn btn-outline-info btn-sm" CommandName="View2" CommandArgument="<%# Container.DataItemIndex %>" Enabled='<%# Eval("Status").ToString() == "Employee Filled The Form" ? true : false %>' />
												</ItemTemplate>
											</asp:TemplateField>

											<asp:TemplateField HeaderText="Final Decision (Step 3)">
												<ItemTemplate>
													<asp:Button Text="Accept" runat="server" class="btn btn-outline-primary btn-sm" CommandName="View3" CommandArgument="<%# Container.DataItemIndex %>" />
													<br />
													<br />
													<asp:Button Text="Reject" runat="server" class="btn btn-outline-danger btn-sm" CommandName="View4" CommandArgument="<%# Container.DataItemIndex %>" />
												</ItemTemplate>
											</asp:TemplateField>
										</Columns>

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
</asp:Content>

