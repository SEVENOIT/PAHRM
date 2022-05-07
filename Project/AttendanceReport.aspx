<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AttendanceReport.aspx.cs" Inherits="AttendanceReport" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<div class="page-wrapper" id="pageWrapper" style="padding-left: 25%; padding-top: 10%">
		<!-- Page Sidebar Ends-->
		<br />

		<div class="page-body">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12">
						<div class="card">
							<div class="card-header pb-0">
								<h5>Employee vise Attendance Report</h5>
								 
								<hr />
							</div>
							<div class="card-body">
								<div runat="server" id="attendance">

									<div id="custom" runat="server">
										<table border="0">

											<tr>
												<td>
													<asp:Label ID="Label10" runat="server" Text="Employee Name"></asp:Label>
												</td>
												<td>
													<asp:DropDownList ID="DropDownList2" runat="server" class="form-control" >
													</asp:DropDownList>
												</td>
											</tr>
											<tr>
												<td>
													<asp:Label ID="Label7" runat="server" Text="Start Date"></asp:Label>
												</td>
												<td>
													<asp:TextBox type="text" ID="start" runat="server" data-language="en" class="datepicker-here form-control digits"></asp:TextBox>
												</td>
											</tr>
											<tr>
												<td>
													<asp:Label ID="Label8" runat="server" Text="End Date"></asp:Label>
												</td>
												<td>
													<asp:TextBox type="text" ID="end" runat="server" data-language="en" class="datepicker-here form-control digits"></asp:TextBox>

												</td>
											</tr>
											<tr>
												<td>
													<br />
												</td>
												<td colspan="2">
													<br />
													<asp:Button ID="Button1" runat="server" Text="Search"
														class="btn btn-pill btn-outline-warning-2x btn-air-warning" OnClick="EmpAttendance" />
												</td>
											</tr>

										</table>
									</div>
									<br />
									<br />
									<div id="Attendancecustom" runat="server" class="table-responsive">

										<asp:GridView ID="GridView4" runat="server" class="table table-bordered" PageSize="25" AllowPaging="True" DataKeyField="EID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="true" Width="100%" ItemStyle-BorderStyle="Solid" OnPageIndexChanging="grdView_PageIndexChanging">
											<Columns>

												<asp:BoundField HeaderText="Attendance ID" DataField="AID"></asp:BoundField>
												<asp:BoundField HeaderText="Employee ID" DataField="EID"></asp:BoundField>
												<asp:BoundField HeaderText="Employee Name" DataField="Ename"></asp:BoundField>
												<asp:BoundField HeaderText="Start Time" DataField="StartDateTime"></asp:BoundField>
												<asp:BoundField HeaderText="End Time" DataField="EndDateTime"></asp:BoundField>

											</Columns>
											<HeaderStyle CssClass="bg-primary" Font-Bold="True" BackColor="#ffffff" />

										</asp:GridView>
										<br />
										<br />

									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			

<%--			<footer class="footer footer-fix">
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
			</footer>--%>
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


