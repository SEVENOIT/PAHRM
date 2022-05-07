<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="RosteringReport.aspx.cs" Inherits="RosteringReport" %>

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
								<br />
								<asp:Button runat="server" class="btn btn-pill btn-outline-primary-2x btn-air-primary" Text="Today" vOnClick="Today" />
								<asp:Button runat="server" class="btn btn-pill btn-outline-secondary-2x btn-air-secondary" Text="Search Rosters" OnClick="SearchRoster" />
								<br />
								<hr />
							</div>
							<div class="card-body">
								<div runat="server" id="rosterDiv">

									<div id="today" runat="server">
										<asp:GridView ID="TodayGrid" runat="server" PageSize="10" AllowPaging="True" DataKeyField="EID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="true" Width="100%" ItemStyle-BorderStyle="Solid">
											<Columns>
												<asp:BoundField HeaderText="Roster ID" DataField="RosterID"></asp:BoundField>
												<asp:BoundField HeaderText="Employee ID" DataField="EID"></asp:BoundField>
												<asp:BoundField HeaderText="Employee Name" DataField="Ename"></asp:BoundField>
												<asp:BoundField HeaderText="Job Category" DataField="Job"></asp:BoundField>
												<asp:BoundField HeaderText="Location" DataField="JLocation"></asp:BoundField>
												<asp:BoundField HeaderText="Status" DataField="JobStatus"></asp:BoundField>


											</Columns>
											<FooterStyle Font-Bold="True" BorderStyle="None" CssClass="color1" />
											<SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
											<%--<PagerStyle CssClass="color1" ForeColor="#ffffff" HorizontalAlign="Center" ="NumericPages"/>--%>
											<AlternatingRowStyle CssClass="color1" ForeColor="#ffffff" />
											<RowStyle CssClass="color2" />
											<HeaderStyle CssClass="color1" Font-Bold="True" BackColor="#ff6600" />
										</asp:GridView>
									</div>

									<div id="searchRosterDiv" runat="server">
										<asp:Label ID="Label2" runat="server" class="label font" Text="Search Roster" Font-Bold="true"></asp:Label>
										<table border="0" style="align-content: center;">

											<tr>
												<td>

													<asp:Label ID="Label4" runat="server" Text="Job Category"></asp:Label>

												</td>
												<td>
													<asp:DropDownList ID="DropDownList1" runat="server" class="form-control">
													</asp:DropDownList>

												</td>

											</tr>
											<tr>
												<td>

													<asp:Label ID="Label15" runat="server" Text="Job Status"></asp:Label>

												</td>
												<td>
													<asp:DropDownList ID="TextBox2" runat="server" class="form-control">
														<asp:ListItem Selected="True" Value=""></asp:ListItem>
														<asp:ListItem Value="Completed">Completed</asp:ListItem>
														<asp:ListItem Value="Not Completed">Not Completed</asp:ListItem>
													</asp:DropDownList>

												</td>

											</tr>
											<tr>
												<td>

													<asp:Label ID="Label16" runat="server" Text="Start Date"></asp:Label>

												</td>
												<td>

													<asp:TextBox type="date" ID="TextBox1" runat="server" class="form-control"></asp:TextBox>


												</td>

											</tr>
											<tr>
												<td>

													<asp:Label ID="Label17" runat="server" Text="End Date"></asp:Label>

												</td>
												<td>

													<asp:TextBox type="date" ID="TextBox3" runat="server" class="form-control"></asp:TextBox>



												</td>




											</tr>

											<tr>
												<td>
													<br />
												</td>
												<td>
													<br />
													<asp:Button ID="Button5" runat="server" Text="Search"
														class="btn btn-pill btn-outline-warning-2x btn-air-warning" OnClick="RosterSearch" />
												</td>
											</tr>

										</table>
										<br />
										<br />
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


			</div>
		</div>

		<%--<footer class="footer footer-fix">
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
