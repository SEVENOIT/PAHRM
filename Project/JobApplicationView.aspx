<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="JobApplicationView.aspx.cs" Inherits="JobApplicationView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server" onload="initialize()">

	<div class="page-wrapper" id="pageWrapper" style="padding-left: 25%; padding-top: 8%">

		<br />


		<div class="page-body">
			<div class="container-fluid">
				<div class="row">
					<div class="col-20" style="width: 100%;">
						<div class="card">
							<div class="card-header pb-0">
								<h5 style="align-content: center">Applicant Resume</h5>
							</div>
							
							<div class="card-body">
								<table style="width: 100%;">

									<tr>
										<td>
											<table style="width: 100%; float: left;">


												<tr>
													<td style="vertical-align: top;">
														<asp:Label ID="Label8" runat="server" Text="Job Title"></asp:Label>

													</td>
													<td>

														<asp:TextBox ID="TextBox2" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>


													</td>

												</tr>
												<tr>
													<td>

														<asp:Label ID="Label9" runat="server" Text="Description"></asp:Label>

													</td>
													<td>

														<asp:TextBox runat="server" ReadOnly="true" ID="TextBox23" class="form-control" MaxLength="500" TextMode="MultiLine" Rows="5" />


													</td>

												</tr>
												<tr>
													<td>Location</td>
													<td>
														<asp:TextBox type="text" ReadOnly="true" ID="txtLocation" runat="server" class="form-control" /></td>
												</tr>


												<tr>
													<td style="vertical-align: top;">
														<asp:Label ID="Label10" runat="server" Text="Position"></asp:Label>

													</td>
													<td>

														<asp:TextBox ID="TextBox7" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>


													</td>

												</tr>
												<tr>
													<td style="vertical-align: top;">
														<asp:Label ID="Label3" runat="server" Text="Employement Type"></asp:Label>

													</td>
													<td>

														<asp:TextBox ID="TextBox3" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>


													</td>

												</tr>
												<tr>
													<td style="vertical-align: top;">
														<asp:Label ID="Label11" runat="server" Text="Contract Type"></asp:Label>

													</td>
													<td>

														<asp:TextBox ID="TextBox8" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>


													</td>

												</tr>
												<tr>
													<td style="vertical-align: top;">
														<asp:Label ID="Label13" runat="server" Text="Special Requrements"></asp:Label>

													</td>
													<td>

														<asp:TextBox runat="server" ID="TextBox4" ReadOnly="true" class="form-control" MaxLength="500" TextMode="MultiLine" Rows="5" />


													</td>

												</tr>
												<tr>
													<td style="vertical-align: top;">
														<asp:Label ID="Label14" runat="server" Text="Skills"></asp:Label>

													</td>
													<td>

														<asp:TextBox runat="server" ID="TextBox5" ReadOnly="true" class="form-control" MaxLength="500" TextMode="MultiLine" Rows="5" />


													</td>

												</tr>
												<tr>
													<td style="vertical-align: top;">
														<asp:Label ID="Label4" runat="server" Text="Requred Working Experiance"></asp:Label>

													</td>
													<td>

														<asp:TextBox ID="TextBox9" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>


													</td>

												</tr>
												<tr>
													<td style="vertical-align: top;">
														<asp:Label ID="Label15" runat="server" Text="Requred Education"></asp:Label>

													</td>
													<td>

														<asp:TextBox ID="TextBox11" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>


													</td>

												</tr>
												<tr>
													<td style="vertical-align: top;">
														<asp:Label ID="Label16" runat="server" Text="Typical Salary"></asp:Label>

													</td>
													<td>

														<asp:TextBox ID="TextBox12" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>


													</td>

												</tr>

											</table>
										</td>

										<td style="padding-left: 50px; vertical-align: top; margin: 10px;">
											<table style="border-collapse: collapse; width: 100%;">

												<tr>
													<td style="vertical-align: top;">
														<asp:Label ID="Label1" runat="server" Text="Vacancy Number"></asp:Label>

													</td>
													<td>

														<asp:TextBox ID="TextBox14" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>


													</td>

												</tr>
												<tr>
													<td style="vertical-align: top;">
														<asp:Label ID="Label7" runat="server" Text="Temp ID"></asp:Label>

													</td>
													<td>

														<asp:TextBox ID="TextBox15" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>


													</td>

												</tr>
												<tr>
													<td style="vertical-align: top;">
														<asp:Label ID="Label2" runat="server" Text="Applicant Name"></asp:Label>

													</td>
													<td>

														<asp:TextBox ID="TextBox1" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>


													</td>

												</tr>
												<tr>
													<td style="vertical-align: top;">
														<asp:Label ID="Label6" runat="server" Text="Applicant Email"></asp:Label>

													</td>
													<td>

														<asp:TextBox ID="TextBox13" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>


													</td>

												</tr>
												<tr>
													<td style="vertical-align: top;">
														<asp:Label ID="Label18" runat="server" Text="Brief Introduction About Applicant"></asp:Label>

													</td>
													<td>

														<asp:TextBox runat="server" ReadOnly="true" ID="TextBox17" class="form-control" placeholder="Skills And Requarements" MaxLength="500" TextMode="MultiLine" Rows="5" />


													</td>

												</tr>
												<tr>
													<td style="vertical-align: top;">
														<asp:Label ID="Label19" runat="server" Text=" Working Experiance"></asp:Label>

													</td>
													<td>

														<asp:TextBox runat="server" ReadOnly="true" ID="TextBox6" class="form-control" MaxLength="500" TextMode="MultiLine" Rows="2" />


													</td>

												</tr>
												<tr>
													<td style="vertical-align: top;">
														<asp:Label ID="Label20" runat="server" Text="Education"></asp:Label>

													</td>
													<td>

														<asp:TextBox runat="server" ReadOnly="true" ID="TextBox10" class="form-control" MaxLength="500" TextMode="MultiLine" Rows="2" />


													</td>

												</tr>
												<tr>
													<td style="vertical-align: top;">
														<asp:Label ID="Label21" runat="server" Text="Salary Expectation"></asp:Label>

													</td>
													<td>

														<asp:TextBox ID="TextBox20" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>


													</td>

												</tr>

												<tr>
													<td style="vertical-align: top;">

														<asp:Label ID="Label24" runat="server" Text="Resume"></asp:Label>


													</td>
													<td>



														<br />
														<br />

													</td>

												</tr>

												<tr>
													<td style="float: right">
														<asp:Button ID="Button1" runat="server" Text="Approve And Send Link" CssClass="btn btn-pill btn-light btn-air-light" OnClick="Button1_Click" />
														<br />
														<br />
														<asp:Button ID="Button2" runat="server" Text="Reject" CssClass="btn btn-pill btn-light btn-air-light" OnClick="Button2_Click" />
														
													</td>
												</tr>

											</table>
										</td>

									</tr>

								</table>
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
	<!-- SPlugin used-->


</asp:Content>
