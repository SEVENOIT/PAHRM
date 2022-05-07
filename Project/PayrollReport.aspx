<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="PayrollReport.aspx.cs" Inherits="PayrollReport" %>


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
								<h5>Payroll Report</h5>
								<br />

								<asp:Button runat="server" class="btn btn-pill btn-outline-primary-2x btn-air-primary" Text="EPF/ETF Report" OnClick="EPFETF" />
								<asp:Button runat="server" class="btn btn-pill btn-outline-secondary-2x btn-air-secondary" Text="Net Salary Report" OnClick="NetSalary" />
								<asp:Button runat="server" class="btn btn-pill btn-outline-info-2x btn-air-info" Text="Employee Vise Report" OnClick="EmpSearch" />

								<br />
								<hr />
							</div>
							<div class="card-body">
								<div runat="server" id="salaryDiv" class="table-responsive">

									<div id="netSalaryDiv" runat="server" class="table-responsive">

										<asp:GridView ID="Netsalary" runat="server" PageSize="10" AllowPaging="True" DataKeyField="EID" AutoGenerateColumns="False" GridLines="None" class="table table-bordered">
											<Columns>
												<asp:BoundField HeaderText="Employee Name" DataField="Ename"></asp:BoundField>
												<asp:BoundField HeaderText="EID" DataField="EID"></asp:BoundField>
												<asp:BoundField HeaderText="Basic Salary" DataField="Basic"></asp:BoundField>
												<asp:BoundField HeaderText="No Pay" DataField="NopayDays"></asp:BoundField>
												<asp:BoundField HeaderText="EPF Liable Salary" DataField="Basic"></asp:BoundField>
												<asp:BoundField HeaderText="EPF 8%" DataField="EPF8"></asp:BoundField>
												<asp:BoundField HeaderText="Total Deductions" DataField="Deductions"></asp:BoundField>
												<asp:BoundField HeaderText="Allowances" DataField="Allowances"></asp:BoundField>
												<asp:BoundField HeaderText="Net Salary" DataField="NetPay"></asp:BoundField>
												<asp:BoundField DataField="EPF12" HeaderText="EPF 12%" ItemStyle-Width="60" DataFormatString="{0:N2}"
													ItemStyle-HorizontalAlign="Center" />
												<asp:BoundField HeaderText="ETF 3%" DataField="ETF3"></asp:BoundField>


											</Columns>
											<HeaderStyle CssClass="bg-primary" Font-Bold="True" />

										</asp:GridView>
									</div>

									<div id="epfetfDiv" runat="server" class="table-responsive">
										<asp:Label ID="Label11" runat="server" class="label font" Text="EPF ETF Report" Font-Bold="true"></asp:Label>
										<table border="0">
											<div class="theme-form">

												<div class="mb-3 row">
													<label class="col-sm-2 col-form-label" for="inputPassword3">Month</label>
													<div class="col-sm-6">
														<asp:DropDownList class="form-control" ID="ddlMonthNames" runat="server">
														</asp:DropDownList>
													</div>
												</div>

												<div class="mb-3 row" style="text-align: center">

													<div class="col-sm-9">
														<asp:Button ID="Button2" runat="server" Text="Search"
															class="btn btn-pill btn-outline-warning-2x btn-air-warning" Height="40px" Width="100px" OnClick="FullEPFETF" />
													</div>

												</div>
												<br />
										</table>
										<div id="epfetfSearchDiv" runat="server" class="table-responsive">
											<asp:GridView ID="EpfEtf" runat="server" class="table table-bordered" PageSize="10" AllowPaging="True" DataKeyField="EID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="true" Width="100%" ItemStyle-BorderStyle="Solid">
												<Columns>
													<asp:BoundField HeaderText="Employee Name" DataField="Ename"></asp:BoundField>
													<asp:BoundField HeaderText="EID" DataField="EID"></asp:BoundField>
													<asp:BoundField HeaderText="EPF 8%" DataField="EPF8"></asp:BoundField>
													<asp:BoundField DataField="EPF12" HeaderText="EPF 12%" ItemStyle-Width="60" DataFormatString="{0:N2}"
														ItemStyle-HorizontalAlign="Center" />
													<asp:BoundField HeaderText="ETF 3%" DataField="ETF3"></asp:BoundField>
													<asp:BoundField HeaderText="Month" DataField="Month"></asp:BoundField>


												</Columns>

												<HeaderStyle CssClass="bg-primary" Font-Bold="True" BackColor="#ffffff" />

											</asp:GridView>
										</div>
									</div>

									<div id="EmpDiv" runat="server">
										<asp:Label ID="Label13" runat="server" class="label font" Text="Employee Vise Salary Report" Font-Bold="true"></asp:Label>
										<table border="0">

											<tr>
												<td align="right">

													<asp:Label ID="Label14" runat="server" Text="Employee Name"></asp:Label>

												</td>
												<td align="left">

													<asp:DropDownList ID="DropDownList3" runat="server" Width="91.5%" CssClass="Textbox">
													</asp:DropDownList>
												</td>


											</tr>
											<tr>
												<td colspan="2">
													<asp:Button ID="Button4" runat="server" Text="Search"
														CssClass="button button1" Height="40px" Width="100px" OnClick="EmpSearchSalary" />
												</td>
											</tr>

										</table>
										<div id="empsalary" runat="server">
											<asp:GridView ID="GridView5" runat="server" class="table table-bordered" PageSize="10" AllowPaging="True" DataKeyField="EID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="true" Width="100%" ItemStyle-BorderStyle="Solid">
												<Columns>
													<asp:BoundField HeaderText="Employee Name" DataField="Ename"></asp:BoundField>
													<asp:BoundField HeaderText="EID" DataField="EID"></asp:BoundField>
													<asp:BoundField HeaderText="Basic Salary" DataField="Basic"></asp:BoundField>
													<asp:BoundField HeaderText="No Pay" DataField="NopayDays"></asp:BoundField>
													<asp:BoundField HeaderText="EPF Liable Salary" DataField="Basic"></asp:BoundField>
													<asp:BoundField HeaderText="EPF 8%" DataField="EPF8"></asp:BoundField>
													<asp:BoundField HeaderText="Total Deductions" DataField="Deductions"></asp:BoundField>
													<asp:BoundField HeaderText="Allowances" DataField="Allowances"></asp:BoundField>
													<asp:BoundField HeaderText="Net Salary" DataField="NetPay"></asp:BoundField>
													<asp:BoundField DataField="EPF12" HeaderText="EPF 12%" ItemStyle-Width="60" DataFormatString="{0:N2}"
														ItemStyle-HorizontalAlign="Center" />
													<asp:BoundField HeaderText="ETF 3%" DataField="ETF3"></asp:BoundField>


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
