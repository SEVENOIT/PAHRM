<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AllocateWorkLocation.aspx.cs" Inherits="AllocateWorkLocation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server" onload="initialize()">

	<div class="page-wrapper" id="pageWrapper" style="padding-left: 25%; padding-top: 8%">

		<br />


		<div class="page-body">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-header pb-0">
						<h4>Allocate Employee Work Locations </h4>
					</div>
					<div class="card-body">

						<div class="theme-form">

							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Company ID</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox1" runat="server" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Job</label>
								<div class="col-sm-9">
									<asp:DropDownList class="form-control" ID="DropDownList2" runat="server" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Employee ID</label>
								<div class="col-sm-9">
									<asp:DropDownList class="form-control" ID="DropDownList1" runat="server" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Employee Name</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="TextBox4" runat="server" type="text" />
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Location</label>
								<div class="col-sm-9">
									<asp:TextBox class="form-control" ID="txtLocation" runat="server" type="text" />
								</div>
							</div>
							<asp:HiddenField ID="txtLatitude" runat="server" />
							<asp:HiddenField ID="txtLongitude" runat="server" />
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">Start Time</label>
								<div class="col-sm-9">
									<div class="input-group clockpicker">
										<asp:TextBox class="form-control" runat="server" ID="TextBox2" type="text" value="00:00" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
									</div>
								</div>
							</div>
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label" for="inputPassword3">End Time</label>
								<div class="col-sm-9">
									<div class="input-group clockpicker">
										<asp:TextBox class="form-control" runat="server" ID="TextBox3" type="text" value="00:00" /><span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<button class="btn btn-primary" type="button">Send</button>
					</div>
				</div>


			</div>
		</div>
	</div>
	<%--<footer class="footer">
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
	<script type="text/javascript">
		function other(ddl) {

			if (ddl.value == "Other") {
                /*document.getElementById('TextBox20a').style.display = "";
                document.getElementById('Label22a').style.display = "";*/

				document.getElementById('TextBox20a').style.visibility = "visible";

				document.getElementById('Label22a').style.visibility = "visible";


			}
			else {
                /*document.getElementById('TextBox20a').style.display = 'none';
                document.getElementById('Label22a').style.display = 'none';*/

				document.getElementById('TextBox20a').style.visibility = "hidden";

				document.getElementById('Label22a').style.visibility = "hidden";

			}
		}

	</script>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyD8VU71ys-VMU-TQsqVkwYKjgyCi0iDRco&libraries=places"></script>
	<script type="text/javascript">
		google.maps.event.addDomListener(window, 'load', function () {

			var places = new google.maps.places.Autocomplete(document.getElementById('<%=txtLocation.ClientID %>'));

			google.maps.event.addListener(places, 'place_changed', function () {
				var place = places.getPlace();

				document.getElementById('<%=txtLocation.ClientID %>').value = place.formatted_address;
				document.getElementById('<%=txtLatitude.ClientID %>').value = place.geometry.location.lat();
				document.getElementById('<%=txtLongitude.ClientID %>').value = place.geometry.location.lng();


			});
		});
	</script>
	<script src="../assets/js/time-picker/jquery-clockpicker.min.js"></script>
	<script src="../assets/js/time-picker/highlight.min.js"></script>
	<script src="../assets/js/time-picker/clockpicker.js"></script>
</asp:Content>
