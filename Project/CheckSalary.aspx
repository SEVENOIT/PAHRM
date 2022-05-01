<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CheckSalary.aspx.cs" Inherits="CheckSalary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<div class="page-wrapper" id="pageWrapper">
		<!-- Page Header Start-->

		<!-- Page Sidebar Ends-->
		<br />
		<div class="page-body" style="padding-left: 25%; padding-top: 10%">
			<!-- Container-fluid starts-->

			<div class="col-xl-12">
				<div class="card">
					<div class="card-header pb-0">
						<h5>Salary Sheet</h5>
					</div>
					<div class="card-body">
						<div class="theme-form">
							<div class="mb-3 row">

								<asp:Label ID="Label2" class="col-sm-3 col-form-label" runat="server" Text="Company ID"></asp:Label>
								<div class="col-sm-9">
									<asp:TextBox ID="TextBox1" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
								</div>
							</div>

							<div class="mb-3 row">
								<asp:Label ID="Label4" class="col-sm-3 col-form-label" runat="server" Text="Company Name"></asp:Label>

								<div class="col-sm-9">
									<asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
								</div>
							</div>
							<div class="mb-3 row">
								<asp:Label class="col-sm-3 col-form-label" ID="Label6" runat="server" Text="Company Address"></asp:Label>

								<div class="col-sm-9">
									<asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>

								</div>
							</div>
							<div class="mb-3 row">

								<asp:Label ID="Label3" class="col-sm-3 col-form-label" runat="server" Text="Month"></asp:Label>

								<div class="col-sm-9">

									<asp:DropDownList ID="ddlMonthNames" runat="server" CssClass="form-control">
									</asp:DropDownList>

								</div>
							</div>

							<div class="mb-3 row">
								<asp:Label ID="sdate1" class="col-sm-3 col-form-label" runat="server" Text="Start Date"></asp:Label>

								<div class="col-sm-9">
									<asp:TextBox type="date" ID="sdate" runat="server" CssClass="form-control"></asp:TextBox>

								</div>
							</div>
							<div class="mb-3 row">

								<asp:Label ID="edate1" class="col-sm-3 col-form-label" runat="server" Text="End Date"></asp:Label>
								<div class="col-sm-9">
									<asp:TextBox type="date" ID="edate" runat="server" CssClass="form-control"></asp:TextBox>
								</div>
							</div>
							<br />
							<div class="col-sm-5">
								<asp:Button ID="Button1" runat="server" Text="Search"
									CssClass="btn btn-primary" OnClick="Search" />
							</div>

						</div>
						<div runat="server" id="div1">
							<div>
								<asp:GridView ID="Grid" runat="server" PageSize="10" DataKeyField="EID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" ItemStyle-BorderStyle="Solid" CssClass="grid">
									<Columns>
										<%--<asp:BoundField HeaderText="Employee ID" DataField="EId" ID="EId"></asp:BoundField>--%>
										<asp:TemplateField HeaderText="Employee ID" ItemStyle-Width="150">
											<ItemTemplate>
												<asp:Label ID="EID" runat="server" Text='<%# Eval("EID") %>' DataField="EId" />
											</ItemTemplate>
										</asp:TemplateField>
										<asp:BoundField HeaderText="Employee Name" DataField="Ename"></asp:BoundField>
										<asp:BoundField HeaderText="Net Pay" DataField="NetPay"></asp:BoundField>
										<asp:BoundField HeaderText="EPF" DataField="EPF8"></asp:BoundField>
										<asp:BoundField HeaderText="ETF" DataField="ETF3"></asp:BoundField>
										<asp:BoundField HeaderText="Full Name" DataField="FullName"></asp:BoundField>
										<asp:BoundField HeaderText="Account Number" DataField="AccountNumber"></asp:BoundField>
										<asp:BoundField HeaderText="Bank Name" DataField="BankName"></asp:BoundField>
										<asp:BoundField HeaderText="Branch" DataField="Branck"></asp:BoundField>

									</Columns>
									<FooterStyle Font-Bold="True" ForeColor="Black" CssClass="color1" />
									<SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Black" />
									<%--<PagerStyle CssClass="color1" ForeColor="#ffffff" HorizontalAlign="Center" ="NumericPages"/>--%>
									<AlternatingRowStyle CssClass="color1" ForeColor="Black" />
									<RowStyle ForeColor="Black" />
									<HeaderStyle CssClass="color1" Font-Bold="True" ForeColor="Black" />
								</asp:GridView>
								<%--	<br />
										<asp:Button ID="btnExport" runat="server" Text="Pay Now" OnClick="PayNow" />

										<br />--%>
							</div>

							<div>
								<asp:Label ID="lblresult" runat="server"></asp:Label>
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

