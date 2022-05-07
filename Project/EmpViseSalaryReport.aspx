<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmpViseSalaryReport.aspx.cs" Inherits="EmpViseSalaryReport" %>



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
								<h5>Employee Vise Salary Report</h5>

								<hr />
							</div>
							<div class="card-body">
								<div runat="server" id="salaryDiv" class="table-responsive">
									<div id="EmpDiv" runat="server">
										<table border="0">
											<div class="theme-form">

												<div class="mb-3 row">
													<label class="col-sm-2 col-form-label" for="inputPassword3">Employee Name</label>
													<div class="col-sm-6">
														<asp:DropDownList class="form-control" ID="DropDownList3" runat="server">
														</asp:DropDownList>
													</div>
												</div>

												<div class="mb-3 row" style="text-align: center">

													<div class="col-sm-9">
														<asp:Button ID="Button4" runat="server" Text="Search"
															class="btn btn-pill btn-outline-warning-2x btn-air-warning" OnClick="EmpSearchSalary" />
													</div>

												</div>
												<br />
											</div>
										</table>

										<div id="empsalary" runat="server">
											<asp:GridView ID="GridView5" runat="server" class="table table-bordered" PageSize="10" AllowPaging="True" DataKeyField="EID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="true" Width="100%" ItemStyle-BorderStyle="Solid">
												<Columns>
													<asp:BoundField HeaderText="Employee Name" DataField="Ename"></asp:BoundField>
													<asp:BoundField HeaderText="EID" DataField="EID"></asp:BoundField>
													<asp:BoundField HeaderText="Basic Salary" DataField="Basic"></asp:BoundField>
													<asp:BoundField HeaderText="Total Allowances" DataField="Allowances"></asp:BoundField>
													<asp:BoundField HeaderText="Total Deductions" DataField="Deductions"></asp:BoundField>
													<asp:BoundField HeaderText="EPF 8%" DataField="EPF8"></asp:BoundField>
													<asp:BoundField DataField="EPF12" HeaderText="EPF 12%" ItemStyle-Width="60" DataFormatString="{0:N2}"
														ItemStyle-HorizontalAlign="Center" />
													<asp:BoundField HeaderText="Net Salary" DataField="NetPay"></asp:BoundField>
													<asp:BoundField HeaderText="ETF 3%" DataField="ETF3"></asp:BoundField>
													<asp:BoundField HeaderText="Month" DataField="Month"></asp:BoundField>


												</Columns>
												<HeaderStyle CssClass="bg-primary" Font-Bold="True" BackColor="#ffffff" />

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
