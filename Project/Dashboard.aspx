<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<style type="text/css">
		
		#map_canvas {
			height: 100%
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server" onload="initialize()">

	<div class="page-wrapper" id="pageWrapper" style="padding-left: 25%; padding-top: 8%">
		<!-- Page Header Start-->

		<!-- Page Sidebar Ends-->
		<br />
		<div class="page-body">
			<!-- Container-fluid starts-->
			<div class="container-fluid dashboard-default-sec">
				<div class="row">
					<div class="col-xl-6 box-col-12 des-xl-100">
						<div class="row">

							<div class="col-xl-6 col-md-3 col-sm-6 box-col-3 des-xl-25 rate-sec">
								<div class="card income-card card-primary">
									<div class="card-body text-center">
										<div class="round-box">
											<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 448.057 448.057" style="enable-background: new 0 0 448.057 448.057;" xml:space="preserve">
												<g>
													<g>
														<path d="M404.562,7.468c-0.021-0.017-0.041-0.034-0.062-0.051c-13.577-11.314-33.755-9.479-45.069,4.099                                            c-0.017,0.02-0.034,0.041-0.051,0.062l-135.36,162.56L88.66,11.577C77.35-2.031,57.149-3.894,43.54,7.417                                            c-13.608,11.311-15.471,31.512-4.16,45.12l129.6,155.52h-40.96c-17.673,0-32,14.327-32,32s14.327,32,32,32h64v144                                            c0,17.673,14.327,32,32,32c17.673,0,32-14.327,32-32v-180.48l152.64-183.04C419.974,38.96,418.139,18.782,404.562,7.468z"></path>
													</g>
												</g>
												<g>
													<g>
														<path d="M320.02,208.057h-16c-17.673,0-32,14.327-32,32s14.327,32,32,32h16c17.673,0,32-14.327,32-32                                            S337.694,208.057,320.02,208.057z"></path>
													</g>
												</g>
											</svg>
										</div>
										<h5>8,50,49</h5>
										<p>Our Annual Income</p>
										<a class="btn-arrow arrow-primary" href="javascript:void(0)"><i class="toprightarrow-primary fa fa-arrow-up me-2"></i>95.54% </a>
										<div class="parrten">
											<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 448.057 448.057" style="enable-background: new 0 0 448.057 448.057;" xml:space="preserve">
												<g>
													<g>
														<path d="M404.562,7.468c-0.021-0.017-0.041-0.034-0.062-0.051c-13.577-11.314-33.755-9.479-45.069,4.099                                            c-0.017,0.02-0.034,0.041-0.051,0.062l-135.36,162.56L88.66,11.577C77.35-2.031,57.149-3.894,43.54,7.417                                            c-13.608,11.311-15.471,31.512-4.16,45.12l129.6,155.52h-40.96c-17.673,0-32,14.327-32,32s14.327,32,32,32h64v144                                            c0,17.673,14.327,32,32,32c17.673,0,32-14.327,32-32v-180.48l152.64-183.04C419.974,38.96,418.139,18.782,404.562,7.468z"></path>
													</g>
												</g>
												<g>
													<g>
														<path d="M320.02,208.057h-16c-17.673,0-32,14.327-32,32s14.327,32,32,32h16c17.673,0,32-14.327,32-32                                            S337.694,208.057,320.02,208.057z"></path>
													</g>
												</g>
											</svg>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-6 col-md-3 col-sm-6 box-col-3 des-xl-25 rate-sec">
								<div class="card income-card card-secondary">
									<div class="card-body text-center">
										<div class="round-box">
											<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background: new 0 0 512 512;" xml:space="preserve">
												<g>
													<g>
														<path d="M256,0C114.615,0,0,114.615,0,256s114.615,256,256,256s256-114.615,256-256S397.385,0,256,0z M96,100.16                                            c50.315,35.939,80.124,94.008,80,155.84c0.151,61.839-29.664,119.919-80,155.84C11.45,325.148,11.45,186.851,96,100.16z M256,480                                            c-49.143,0.007-96.907-16.252-135.84-46.24C175.636,391.51,208.14,325.732,208,256c0.077-69.709-32.489-135.434-88-177.6                                            c80.1-61.905,191.9-61.905,272,0c-98.174,75.276-116.737,215.885-41.461,314.059c11.944,15.577,25.884,29.517,41.461,41.461                                            C353.003,463.884,305.179,480.088,256,480z M416,412v-0.16c-86.068-61.18-106.244-180.548-45.064-266.616                                            c12.395-17.437,27.627-32.669,45.064-45.064C500.654,186.871,500.654,325.289,416,412z"></path>
													</g>
												</g>
											</svg>
										</div>
										<h5>2,03,59</h5>
										<p>our Annual losses</p>
										<a class="btn-arrow arrow-secondary" href="javascript:void(0)"><i class="toprightarrow-secondary fa fa-arrow-up me-2"></i>90.54% </a>
										<div class="parrten">
											<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background: new 0 0 512 512;" xml:space="preserve">
												<g>
													<g>
														<path d="M256,0C114.615,0,0,114.615,0,256s114.615,256,256,256s256-114.615,256-256S397.385,0,256,0z M96,100.16                                            c50.315,35.939,80.124,94.008,80,155.84c0.151,61.839-29.664,119.919-80,155.84C11.45,325.148,11.45,186.851,96,100.16z M256,480                                            c-49.143,0.007-96.907-16.252-135.84-46.24C175.636,391.51,208.14,325.732,208,256c0.077-69.709-32.489-135.434-88-177.6                                            c80.1-61.905,191.9-61.905,272,0c-98.174,75.276-116.737,215.885-41.461,314.059c11.944,15.577,25.884,29.517,41.461,41.461                                            C353.003,463.884,305.179,480.088,256,480z M416,412v-0.16c-86.068-61.18-106.244-180.548-45.064-266.616                                            c12.395-17.437,27.627-32.669,45.064-45.064C500.654,186.871,500.654,325.289,416,412z"></path>
													</g>
												</g>
											</svg>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-6 col-md-3 col-sm-6 box-col-3 des-xl-25 rate-sec">
								<div class="card income-card card-primary">
									<div class="card-body text-center">
										<div class="round-box">
											<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 448.057 448.057" style="enable-background: new 0 0 448.057 448.057;" xml:space="preserve">
												<g>
													<g>
														<path d="M404.562,7.468c-0.021-0.017-0.041-0.034-0.062-0.051c-13.577-11.314-33.755-9.479-45.069,4.099                                            c-0.017,0.02-0.034,0.041-0.051,0.062l-135.36,162.56L88.66,11.577C77.35-2.031,57.149-3.894,43.54,7.417                                            c-13.608,11.311-15.471,31.512-4.16,45.12l129.6,155.52h-40.96c-17.673,0-32,14.327-32,32s14.327,32,32,32h64v144                                            c0,17.673,14.327,32,32,32c17.673,0,32-14.327,32-32v-180.48l152.64-183.04C419.974,38.96,418.139,18.782,404.562,7.468z"></path>
													</g>
												</g>
												<g>
													<g>
														<path d="M320.02,208.057h-16c-17.673,0-32,14.327-32,32s14.327,32,32,32h16c17.673,0,32-14.327,32-32                                            S337.694,208.057,320.02,208.057z"></path>
													</g>
												</g>
											</svg>
										</div>
										<h5>
											<asp:Label ID="emp" runat="server"></asp:Label>
										<p>Total Employee Count</p>
										<div class="parrten">
											<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 448.057 448.057" style="enable-background: new 0 0 448.057 448.057;" xml:space="preserve">
												<g>
													<g>
														<path d="M404.562,7.468c-0.021-0.017-0.041-0.034-0.062-0.051c-13.577-11.314-33.755-9.479-45.069,4.099                                            c-0.017,0.02-0.034,0.041-0.051,0.062l-135.36,162.56L88.66,11.577C77.35-2.031,57.149-3.894,43.54,7.417                                            c-13.608,11.311-15.471,31.512-4.16,45.12l129.6,155.52h-40.96c-17.673,0-32,14.327-32,32s14.327,32,32,32h64v144                                            c0,17.673,14.327,32,32,32c17.673,0,32-14.327,32-32v-180.48l152.64-183.04C419.974,38.96,418.139,18.782,404.562,7.468z"></path>
													</g>
												</g>
												<g>
													<g>
														<path d="M320.02,208.057h-16c-17.673,0-32,14.327-32,32s14.327,32,32,32h16c17.673,0,32-14.327,32-32                                            S337.694,208.057,320.02,208.057z"></path>
													</g>
												</g>
											</svg>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-6 col-md-3 col-sm-6 box-col-3 des-xl-25 rate-sec">
								<div class="card income-card card-secondary">
									<div class="card-body text-center">
										<div class="round-box">
											<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background: new 0 0 512 512;" xml:space="preserve">
												<g>
													<g>
														<path d="M256,0C114.615,0,0,114.615,0,256s114.615,256,256,256s256-114.615,256-256S397.385,0,256,0z M96,100.16                                            c50.315,35.939,80.124,94.008,80,155.84c0.151,61.839-29.664,119.919-80,155.84C11.45,325.148,11.45,186.851,96,100.16z M256,480                                            c-49.143,0.007-96.907-16.252-135.84-46.24C175.636,391.51,208.14,325.732,208,256c0.077-69.709-32.489-135.434-88-177.6                                            c80.1-61.905,191.9-61.905,272,0c-98.174,75.276-116.737,215.885-41.461,314.059c11.944,15.577,25.884,29.517,41.461,41.461                                            C353.003,463.884,305.179,480.088,256,480z M416,412v-0.16c-86.068-61.18-106.244-180.548-45.064-266.616                                            c12.395-17.437,27.627-32.669,45.064-45.064C500.654,186.871,500.654,325.289,416,412z"></path>
													</g>
												</g>
											</svg>
										</div>
										<h5>
											<asp:Label ID="att" runat="server"></asp:Label></h5>
										<p>New Applications</p>
										<div class="parrten">
											<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background: new 0 0 512 512;" xml:space="preserve">
												<g>
													<g>
														<path d="M256,0C114.615,0,0,114.615,0,256s114.615,256,256,256s256-114.615,256-256S397.385,0,256,0z M96,100.16                                            c50.315,35.939,80.124,94.008,80,155.84c0.151,61.839-29.664,119.919-80,155.84C11.45,325.148,11.45,186.851,96,100.16z M256,480                                            c-49.143,0.007-96.907-16.252-135.84-46.24C175.636,391.51,208.14,325.732,208,256c0.077-69.709-32.489-135.434-88-177.6                                            c80.1-61.905,191.9-61.905,272,0c-98.174,75.276-116.737,215.885-41.461,314.059c11.944,15.577,25.884,29.517,41.461,41.461                                            C353.003,463.884,305.179,480.088,256,480z M416,412v-0.16c-86.068-61.18-106.244-180.548-45.064-266.616                                            c12.395-17.437,27.627-32.669,45.064-45.064C500.654,186.871,500.654,325.289,416,412z"></path>
													</g>
												</g>
											</svg>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-6 col-md-3 col-sm-6 box-col-3 des-xl-25 rate-sec">
								<div class="card income-card card-primary">
									<div class="card-body text-center">
										<div class="round-box">
											<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 448.057 448.057" style="enable-background: new 0 0 448.057 448.057;" xml:space="preserve">
												<g>
													<g>
														<path d="M404.562,7.468c-0.021-0.017-0.041-0.034-0.062-0.051c-13.577-11.314-33.755-9.479-45.069,4.099                                            c-0.017,0.02-0.034,0.041-0.051,0.062l-135.36,162.56L88.66,11.577C77.35-2.031,57.149-3.894,43.54,7.417                                            c-13.608,11.311-15.471,31.512-4.16,45.12l129.6,155.52h-40.96c-17.673,0-32,14.327-32,32s14.327,32,32,32h64v144                                            c0,17.673,14.327,32,32,32c17.673,0,32-14.327,32-32v-180.48l152.64-183.04C419.974,38.96,418.139,18.782,404.562,7.468z"></path>
													</g>
												</g>
												<g>
													<g>
														<path d="M320.02,208.057h-16c-17.673,0-32,14.327-32,32s14.327,32,32,32h16c17.673,0,32-14.327,32-32                                            S337.694,208.057,320.02,208.057z"></path>
													</g>
												</g>
											</svg>
										</div>
										<h5>
											<asp:Label ID="att1" runat="server"></asp:Label></h5>
										<p>Today Attendance</p>
										<a class="btn-arrow arrow-primary" href="javascript:void(0)"><i class="toprightarrow-primary fa fa-arrow-up me-2"></i>
											<asp:Label ID="att2" runat="server"></asp:Label>% </a>
										<div class="parrten">
											<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 448.057 448.057" style="enable-background: new 0 0 448.057 448.057;" xml:space="preserve">
												<g>
													<g>
														<path d="M404.562,7.468c-0.021-0.017-0.041-0.034-0.062-0.051c-13.577-11.314-33.755-9.479-45.069,4.099                                            c-0.017,0.02-0.034,0.041-0.051,0.062l-135.36,162.56L88.66,11.577C77.35-2.031,57.149-3.894,43.54,7.417                                            c-13.608,11.311-15.471,31.512-4.16,45.12l129.6,155.52h-40.96c-17.673,0-32,14.327-32,32s14.327,32,32,32h64v144                                            c0,17.673,14.327,32,32,32c17.673,0,32-14.327,32-32v-180.48l152.64-183.04C419.974,38.96,418.139,18.782,404.562,7.468z"></path>
													</g>
												</g>
												<g>
													<g>
														<path d="M320.02,208.057h-16c-17.673,0-32,14.327-32,32s14.327,32,32,32h16c17.673,0,32-14.327,32-32                                            S337.694,208.057,320.02,208.057z"></path>
													</g>
												</g>
											</svg>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-6 col-md-3 col-sm-6 box-col-3 des-xl-25 rate-sec">
								<div class="card income-card card-secondary">
									<div class="card-body text-center">
										<div class="round-box">
											<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background: new 0 0 512 512;" xml:space="preserve">
												<g>
													<g>
														<path d="M256,0C114.615,0,0,114.615,0,256s114.615,256,256,256s256-114.615,256-256S397.385,0,256,0z M96,100.16                                            c50.315,35.939,80.124,94.008,80,155.84c0.151,61.839-29.664,119.919-80,155.84C11.45,325.148,11.45,186.851,96,100.16z M256,480                                            c-49.143,0.007-96.907-16.252-135.84-46.24C175.636,391.51,208.14,325.732,208,256c0.077-69.709-32.489-135.434-88-177.6                                            c80.1-61.905,191.9-61.905,272,0c-98.174,75.276-116.737,215.885-41.461,314.059c11.944,15.577,25.884,29.517,41.461,41.461                                            C353.003,463.884,305.179,480.088,256,480z M416,412v-0.16c-86.068-61.18-106.244-180.548-45.064-266.616                                            c12.395-17.437,27.627-32.669,45.064-45.064C500.654,186.871,500.654,325.289,416,412z"></path>
													</g>
												</g>
											</svg>
										</div>
										<h5>
											<asp:Label ID="leave1" runat="server"></asp:Label></h5>
										<p>On Leave</p>
										<a class="btn-arrow arrow-secondary" href="javascript:void(0)"><i class="toprightarrow-secondary fa fa-arrow-up me-2"></i>
											<asp:Label ID="leave2" runat="server"></asp:Label>% </a>
										<div class="parrten">
											<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background: new 0 0 512 512;" xml:space="preserve">
												<g>
													<g>
														<path d="M256,0C114.615,0,0,114.615,0,256s114.615,256,256,256s256-114.615,256-256S397.385,0,256,0z M96,100.16                                            c50.315,35.939,80.124,94.008,80,155.84c0.151,61.839-29.664,119.919-80,155.84C11.45,325.148,11.45,186.851,96,100.16z M256,480                                            c-49.143,0.007-96.907-16.252-135.84-46.24C175.636,391.51,208.14,325.732,208,256c0.077-69.709-32.489-135.434-88-177.6                                            c80.1-61.905,191.9-61.905,272,0c-98.174,75.276-116.737,215.885-41.461,314.059c11.944,15.577,25.884,29.517,41.461,41.461                                            C353.003,463.884,305.179,480.088,256,480z M416,412v-0.16c-86.068-61.18-106.244-180.548-45.064-266.616                                            c12.395-17.437,27.627-32.669,45.064-45.064C500.654,186.871,500.654,325.289,416,412z"></path>
													</g>
												</g>
											</svg>
										</div>
									</div>
								</div>
							</div>

							<div class="col-xl-6 col-md-5 col-sm-6 box-col-3 des-xl-25 rate-sec">
								<div class="card income-card card-primary">
									<div class="card-body text-center">
										<div class="round-box">
											<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 448.057 448.057" style="enable-background: new 0 0 448.057 448.057;" xml:space="preserve">
												<g>
													<g>
														<path d="M404.562,7.468c-0.021-0.017-0.041-0.034-0.062-0.051c-13.577-11.314-33.755-9.479-45.069,4.099                                            c-0.017,0.02-0.034,0.041-0.051,0.062l-135.36,162.56L88.66,11.577C77.35-2.031,57.149-3.894,43.54,7.417                                            c-13.608,11.311-15.471,31.512-4.16,45.12l129.6,155.52h-40.96c-17.673,0-32,14.327-32,32s14.327,32,32,32h64v144                                            c0,17.673,14.327,32,32,32c17.673,0,32-14.327,32-32v-180.48l152.64-183.04C419.974,38.96,418.139,18.782,404.562,7.468z"></path>
													</g>
												</g>
												<g>
													<g>
														<path d="M320.02,208.057h-16c-17.673,0-32,14.327-32,32s14.327,32,32,32h16c17.673,0,32-14.327,32-32                                            S337.694,208.057,320.02,208.057z"></path>
													</g>
												</g>
											</svg>
										</div>
										<h5>
											<asp:Label ID="rosterT" runat="server"></asp:Label></h5>
										<p>Today Allocated Rosters</p>
										<a class="btn-arrow arrow-primary" href="javascript:void(0)">
											<asp:Label ID="r1" runat="server"></asp:Label></a>
										<p><i class="fa fa-check"></i>Completed</p>
										<a class="btn-arrow arrow-primary" href="javascript:void(0)">
											<asp:Label ID="r2" runat="server"></asp:Label></a>
										<p><i class="fa fa-times"></i>Not Completed</p>
										<div class="parrten">
											<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 448.057 448.057" style="enable-background: new 0 0 448.057 448.057;" xml:space="preserve">
												<g>
													<g>
														<path d="M404.562,7.468c-0.021-0.017-0.041-0.034-0.062-0.051c-13.577-11.314-33.755-9.479-45.069,4.099                                            c-0.017,0.02-0.034,0.041-0.051,0.062l-135.36,162.56L88.66,11.577C77.35-2.031,57.149-3.894,43.54,7.417                                            c-13.608,11.311-15.471,31.512-4.16,45.12l129.6,155.52h-40.96c-17.673,0-32,14.327-32,32s14.327,32,32,32h64v144                                            c0,17.673,14.327,32,32,32c17.673,0,32-14.327,32-32v-180.48l152.64-183.04C419.974,38.96,418.139,18.782,404.562,7.468z"></path>
													</g>
												</g>
												<g>
													<g>
														<path d="M320.02,208.057h-16c-17.673,0-32,14.327-32,32s14.327,32,32,32h16c17.673,0,32-14.327,32-32                                            S337.694,208.057,320.02,208.057z"></path>
													</g>
												</g>
											</svg>
										</div>
									</div>
								</div>
							</div>


						</div>
					</div>
					<div class="col-xl-6 box-col-12 des-xl-100 dashboard-sec">
						<div class="row">

							<div class="col-xl-10 col-50 box-col-6 des-xl-50">
								<div class="card latest-update-sec">
									<div class="card-header">
										<div class="header-top d-sm-flex align-items-center">
											<h5>Latest activity</h5>
											<div class="center-content">
												<ul class="week-date">
													<li class="font-primary">Today</li>
												</ul>
											</div>

										</div>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table class="table table-bordernone">
												<tbody>
													<tr>
														<td>
															<div class="media">
																<svg enable-background="new 0 0 512 512" viewbox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
																	<g>
																		<path d="m512 390v-390h-512v390h241v32h-15c-41.355 0-75 33.645-75 75v15h210v-15c0-41.355-33.645-75-75-75h-15v-32zm-226 62c19.556 0 36.239 12.539 42.43 30h-144.86c6.191-17.461 22.874-30 42.43-30zm-256-92v-330h452v330c-12.164 0-438.947 0-452 0z"></path>
																		<path d="m136 180c24.813 0 45-20.187 45-45s-20.187-45-45-45-45 20.187-45 45 20.187 45 45 45zm0-60c8.271 0 15 6.729 15 15s-6.729 15-15 15-15-6.729-15-15 6.729-15 15-15z"></path>
																		<path d="m184.568 197.848c-28.678-24.39-60.953-16.827-61.054-16.833-35.639 5.799-62.514 38.985-62.514 77.196v41.789h150v-45c0-22.034-9.634-42.865-26.432-57.152zm-3.568 72.152h-90v-11.789c0-23.666 16.049-44.122 37.332-47.584 13.509-2.198 26.578 1.38 36.801 10.074 10.083 8.577 15.867 21.078 15.867 34.299z"></path>
																		<path d="m241 270h120v30h-120z"></path>
																		<path d="m241 210h210v30h-210z"></path>
																		<path d="m241 150h210v30h-210z"></path>
																		<path d="m331 90h120v30h-120z"></path>
																		<path d="m241 90h60v30h-60z"></path>
																		<path d="m391 270h60v30h-60z"></path>
																	</g>
																</svg>
																<div class="media-body">
																	<span>Employee Recruitment</span>
																	<p>
																		<asp:Label ID="a1" runat="server">No New Recuitments</asp:Label>

																		<asp:Label ID="a2" runat="server"></asp:Label>
																	</p>
																</div>
															</div>
														</td>

													</tr>
													<tr>
														<td>
															<div class="media">
																<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewbox="0 0 512.001 512.001" style="enable-background: new 0 0 512.001 512.001;" xml:space="preserve">
																	<g>
																		<g>
																			<path d="M506.35,80.699c-7.57-7.589-19.834-7.609-27.43-0.052L331.662,227.31l-42.557-42.557c-7.577-7.57-19.846-7.577-27.423,0                                                      L89.076,357.36c-7.577,7.57-7.577,19.853,0,27.423c3.782,3.788,8.747,5.682,13.712,5.682c4.958,0,9.93-1.894,13.711-5.682                                                      l158.895-158.888l42.531,42.524c7.57,7.57,19.808,7.577,27.397,0.032l160.97-160.323                                                      C513.881,100.571,513.907,88.288,506.35,80.699z"></path>
																		</g>
																	</g>
																	<g>
																		<g>
																			<path d="M491.96,449.94H38.788V42.667c0-10.712-8.682-19.394-19.394-19.394S0,31.955,0,42.667v426.667                                                      c0,10.712,8.682,19.394,19.394,19.394H491.96c10.712,0,19.394-8.682,19.394-19.394C511.354,458.622,502.672,449.94,491.96,449.94z                                                      "></path>
																		</g>
																	</g>
																	<g>
																		<g>
																			<path d="M492.606,74.344H347.152c-10.712,0-19.394,8.682-19.394,19.394s8.682,19.394,19.394,19.394h126.061v126.067                                                      c0,10.705,8.682,19.394,19.394,19.394S512,249.904,512,239.192V93.738C512,83.026,503.318,74.344,492.606,74.344z"></path>
																		</g>
																	</g>
																</svg>
																<div class="media-body">
																	<span>Employee Shift Managment</span><br />
																	<p>
																		<asp:Label ID="start" runat="server"></asp:Label>
																	</p>
																	<p>
																		<asp:Label ID="end" runat="server"></asp:Label>
																	</p>
																</div>
															</div>
														</td>

													</tr>
													<tr>
														<td>
															<div class="media">
																<svg enable-background="new 0 0 512 512" viewbox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
																	<path d="m362 91v-60h-212v60h-150v390h512c0-16.889 0-372.29 0-390zm-182-30h152v30h-152zm302 390h-452v-202.844l90 36v46.844h90v-30h92v30h90v-46.844l90-36zm-302-150h-30v-60h30zm152-60h30v60h-30c0-7.259 0-52.693 0-60zm150-25.156-90 36v-40.844h-90v60h-92v-60h-90v40.844l-90-36c0-14.163 0-84.634 0-94.844h452z"></path>
																</svg>
																<div class="media-body">
																	<span>Rostering</span>
																	<p>
																		<asp:Label ID="rosterE" runat="server"></asp:Label>
																		Completed Roster at
																			<asp:Label ID="rosterL" runat="server"></asp:Label>
																	</p>
																</div>
															</div>
														</td>

													</tr>



												</tbody>
											</table>
										</div>
									</div>
								</div>

							</div>

							<div class="row">

								<div class="col-xl-10 col-50 box-col-6 des-xl-50">
									<div class="card latest-update-sec">
										<div class="card-header">
											<div class="header-top d-sm-flex align-items-center">
												<h5>Tracking activity</h5>
												<div class="center-content">
													<ul class="week-date">
														<li class="font-primary">Today</li>
													</ul>
												</div>

											</div>
										</div>
										<div class="card-body">
											<div class="table-responsive">
												<table class="table table-bordernone">
													<tbody>
														<tr>
															<td>
																<div class="media" id='map_canvas' style="width: 100%; height: 100%">
																	
																	 
																</div>
															</td>

														</tr>
														
														



													</tbody>
												</table>
											</div>
										</div>
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
							<div class="pull-right mb-0"><img class="img-fluid" src="../assets/images/pharm3.png" alt="" width="60" height="30"></div>
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
			<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD8VU71ys-VMU-TQsqVkwYKjgyCi0iDRco&sensor=false">
			</script>
			<script type="text/javascript">
		function initialize() {
			var markers = JSON.parse('<%=ConvertDataTabletoString() %>');
			var mapOptions = {
				center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
				zoom: 8,
				mapTypeId: google.maps.MapTypeId.ROADMAP
				//  marker:true
			};
			var infoWindow = new google.maps.InfoWindow();
			var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
			for (i = 0; i < markers.length; i++) {
				var data = markers[i]
				var myLatlng = new google.maps.LatLng(data.lat, data.lng);
				var marker = new google.maps.Marker({
					position: myLatlng,
					map: map,
					title: data.title
				});
				(function (marker, data) {

					// Attaching a click event to the current marker
					google.maps.event.addListener(marker, "click", function (e) {
						infoWindow.setContent(data.Job);
						infoWindow.open(map, marker);
					});
				})(marker, data);
			}
		}
			</script>
</asp:Content>

