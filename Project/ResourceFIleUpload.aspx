<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ResourceFIleUpload.aspx.cs" Inherits="ResourceFIleUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<div class="page-wrapper" id="pageWrapper" style="padding-left: 22%; padding-top: 10%">
		<!-- Page Header Start-->

		<!-- Page Sidebar Ends-->
		<br />
		<div class="page-body">
			<!-- Container-fluid starts-->
			<div class="container-fluid">
				<div class="row">
					
					<div class="col-xl-12 col-md-12 box-col-12">
						<div class="file-content">
							<div class="card">
								<div class="card-header">
									<div class="media">
										<%--<form class="form-inline" action="#" method="get">
											<div class="form-group d-flex mb-0">
												<i class="fa fa-search"></i>
												<input class="form-control-plaintext" type="text" placeholder="Search...">
											</div>
										</form>--%>
										<div class="media-body text-end">
											<%--<form class="d-inline-flex" action="#" method="POST" enctype="multipart/form-data" name="myForm">
												<div class="btn btn-primary" onclick="getFile()"><i data-feather="plus-square"></i>Add New</div>
												<div style="height: 0px; width: 0px; overflow: hidden;">
													<input id="upfile" type="file" onchange="sub(this)">
												</div>
											</form>--%><div class="btn btn-outline-primary ms-2">
												<i data-feather="upload"></i>Upload
												<asp:FileUpload ID="FileUpload1"
													runat="server"></asp:FileUpload>
												<asp:Button runat="server" ID="Button4" Text="Upload" OnClick="Button4_Click" />
											</div>
											<%--/div>
											<div class="btn btn-outline-primary ms-2"><i data-feather="upload"></i>Upload  </div>
										</div>--%>
										</div>
									</div>
									<br />
									<div class="card-body file-manager">
										<h4>Resource Files</h4>

										<div runat="server" id="employee" class="table-responsive">

											<asp:GridView ID="GridView2" runat="server" PageSize="10" DataKeyField="CID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" ItemStyle-BorderStyle="Solid" class="display">
												<Columns>
													<%--<asp:BoundField HeaderText="Employee ID" DataField="EId" ID="EId"></asp:BoundField>--%>

													<asp:BoundField HeaderText="Document Name" DataField="Name"></asp:BoundField>
													<asp:BoundField HeaderText="Document Type" DataField="ContentType"></asp:BoundField>

													<asp:TemplateField>
														<ItemTemplate>
															<asp:LinkButton ID="lnkDownload" Text="Download" runat="server" OnClick="DownloadFile"></asp:LinkButton>
														</ItemTemplate>
													</asp:TemplateField>
													<asp:TemplateField>
														<ItemTemplate>
															<asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" OnClick="DeleteFile" />
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



									<%--<ul class="files">
										<li class="file-box">
											<div class="file-top"><i class="fa fa-file-image-o txt-primary"></i><i class="fa fa-ellipsis-v f-14 ellips"></i></div>
											<div class="file-bottom">
												<h6>Logo.psd </h6>
												<p class="mb-1">2.0 MB</p>
												<p><b>last open : </b>1 hour ago</p>
											</div>
										</li>
										<li class="file-box">
											<div class="file-top"><i class="fa fa-file-archive-o txt-secondary"></i><i class="fa fa-ellipsis-v f-14 ellips"></i></div>
											<div class="file-bottom">
												<h6>Project.zip </h6>
												<p class="mb-1">1.90 GB</p>
												<p><b>last open : </b>1 hour ago</p>
											</div>
										</li>
										<li class="file-box">
											<div class="file-top"><i class="fa fa-file-excel-o txt-success"></i><i class="fa fa-ellipsis-v f-14 ellips"></i></div>
											<div class="file-bottom">
												<h6>Backend.xls</h6>
												<p class="mb-1">2.00 GB</p>
												<p><b>last open : </b>1 hour ago</p>
											</div>
										</li>
										<li class="file-box">
											<div class="file-top"><i class="fa fa-file-text-o txt-info"></i><i class="fa fa-ellipsis-v f-14 ellips"></i></div>
											<div class="file-bottom">
												<h6>requirements.txt </h6>
												<p class="mb-1">0.90 KB</p>
												<p><b>last open : </b>1 hour ago</p>
											</div>
										</li>
									</ul>
									<h5 class="mt-4">Folders</h5>
									<ul class="folder">
										<li class="folder-box">
											<div class="media">
												<i class="fa fa-file-archive-o f-36 txt-warning"></i>
												<div class="media-body ms-3">
													<h6 class="mb-0">Endless admin</h6>
													<p>204 files, 50mb</p>
												</div>
											</div>
										</li>
										<li class="folder-box">
											<div class="media">
												<i class="fa fa-folder f-36 txt-warning"></i>
												<div class="media-body ms-3">
													<h6 class="mb-0">Endless admin</h6>
													<p>101 files, 10mb</p>
												</div>
											</div>
										</li>
										<li class="folder-box">
											<div class="media">
												<i class="fa fa-file-archive-o f-36 txt-warning"></i>
												<div class="media-body ms-3">
													<h6 class="mb-0">Endless admin</h6>
													<p>25 files, 2mb</p>
												</div>
											</div>
										</li>
										<li class="folder-box">
											<div class="media">
												<i class="fa fa-folder f-36 txt-warning"></i>
												<div class="media-body ms-3">
													<h6 class="mb-0">Endless admin</h6>
													<p>108 files, 5mb</p>
												</div>
											</div>
										</li>
									</ul>
									<h5 class="mt-4">Files</h5>
									<ul class="files">
										<li class="file-box">
											<div class="file-top"><i class="fa fa-file-archive-o txt-secondary"></i><i class="fa fa-ellipsis-v f-14 ellips"></i></div>
											<div class="file-bottom">
												<h6>Project.zip </h6>
												<p class="mb-1">1.90 GB</p>
												<p><b>last open : </b>1 hour ago</p>
											</div>
										</li>
										<li class="file-box">
											<div class="file-top"><i class="fa fa-file-excel-o txt-success"></i><i class="fa fa-ellipsis-v f-14 ellips"></i></div>
											<div class="file-bottom">
												<h6>Backend.xls</h6>
												<p class="mb-1">2.00 GB</p>
												<p><b>last open : </b>1 hour ago</p>
											</div>
										</li>
										<li class="file-box">
											<div class="file-top"><i class="fa fa-file-text-o txt-info"></i><i class="fa fa-ellipsis-v f-14 ellips"></i></div>
											<div class="file-bottom">
												<h6>requirements.txt </h6>
												<p class="mb-1">0.90 KB</p>
												<p><b>last open : </b>1 hour ago</p>
											</div>
										</li>
										<li class="file-box">
											<div class="file-top"><i class="fa fa-file-text-o txt-primary"></i><i class="fa fa-ellipsis-v f-14 ellips"></i></div>
											<div class="file-bottom">
												<h6>Logo.psd </h6>
												<p class="mb-1">2.0 MB</p>
												<p><b>last open : </b>1 hour ago</p>
											</div>
										</li>
									</ul>--%>
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


