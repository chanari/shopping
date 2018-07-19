<%-- 
    Document   : admin2
    Created on : Jul 2, 2018, 11:01:35 AM
    Author     : Q.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<title>Dashboard | Melon - Flat &amp; Responsive Admin Template</title>

	<!--=== CSS ===-->

	<!-- Bootstrap -->
	<link href="resources/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

	<!-- jQuery UI -->
	<!--<link href="plugins/jquery-ui/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />-->
	<!--[if lt IE 9]>
		<link rel="stylesheet" type="text/css" href="plugins/jquery-ui/jquery.ui.1.10.2.ie.css"/>
	<![endif]-->

	<!-- Theme -->
	<link href="resources/admin/assets/css/main.css" rel="stylesheet" type="text/css" />
	<link href="resources/admin/assets/css/plugins.css" rel="stylesheet" type="text/css" />
	<link href="resources/admin/assets/css/responsive.css" rel="stylesheet" type="text/css" />
	<link href="resources/admin/assets/css/icons.css" rel="stylesheet" type="text/css" />

	<link rel="stylesheet" href="resources/admin/assets/css/fontawesome/font-awesome.min.css">
	<!--[if IE 7]>
		<link rel="stylesheet" href="assets/css/fontawesome/font-awesome-ie7.min.css">
	<![endif]-->

	<!--[if IE 8]>
		<link href="assets/css/ie8.css" rel="stylesheet" type="text/css" />
	<![endif]-->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>

	<!--=== JavaScript ===-->

	<script type="text/javascript" src="resources/admin/assets/js/libs/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="resources/admin/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>

	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/admin/assets/js/libs/lodash.compat.min.js"></script>

	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
		<script src="assets/js/libs/html5shiv.js"></script>
	<![endif]-->

	<!-- Smartphone Touch Events -->
	<script type="text/javascript" src="resources/admin/plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript" src="resources/admin/plugins/event.swipe/jquery.event.move.js"></script>
	<script type="text/javascript" src="resources/admin/plugins/event.swipe/jquery.event.swipe.js"></script>

	<!-- General -->
	<script type="text/javascript" src="resources/admin/assets/js/libs/breakpoints.js"></script>
	<script type="text/javascript" src="resources/admin/plugins/respond/respond.min.js"></script> <!-- Polyfill for min/max-width CSS3 Media Queries (only for IE8) -->
	<script type="text/javascript" src="resources/admin/plugins/cookie/jquery.cookie.min.js"></script>
	<script type="text/javascript" src="resources/admin/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="resources/admin/plugins/slimscroll/jquery.slimscroll.horizontal.min.js"></script>

	<!-- Page specific plugins -->
	<!-- Charts -->
	<!--[if lt IE 9]>
		<script type="text/javascript" src="plugins/flot/excanvas.min.js"></script>
	<![endif]-->
	<script type="text/javascript" src="resources/admin/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script type="text/javascript" src="resources/admin/plugins/flot/jquery.flot.min.js"></script>
	<script type="text/javascript" src="resources/admin/plugins/flot/jquery.flot.tooltip.min.js"></script>
	<script type="text/javascript" src="resources/admin/plugins/flot/jquery.flot.resize.min.js"></script>
	<script type="text/javascript" src="resources/admin/plugins/flot/jquery.flot.time.min.js"></script>
	<script type="text/javascript" src="resources/admin/plugins/flot/jquery.flot.growraf.min.js"></script>
	<script type="text/javascript" src="resources/admin/plugins/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

	<script type="text/javascript" src="resources/admin/plugins/daterangepicker/moment.min.js"></script>
	<script type="text/javascript" src="resources/admin/plugins/daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript" src="resources/admin/plugins/blockui/jquery.blockUI.min.js"></script>

	<script type="text/javascript" src="resources/admin/plugins/fullcalendar/fullcalendar.min.js"></script>

	<!-- Noty -->
	<script type="text/javascript" src="resources/admin/plugins/noty/jquery.noty.js"></script>
	<script type="text/javascript" src="resources/admin/plugins/noty/layouts/top.js"></script>
	<script type="text/javascript" src="resources/admin/plugins/noty/themes/default.js"></script>

	<!-- Forms -->
	<script type="text/javascript" src="resources/admin/plugins/uniform/jquery.uniform.min.js"></script>
	<script type="text/javascript" src="resources/admin/plugins/select2/select2.min.js"></script>

	<!-- App -->
	<script type="text/javascript" src="resources/admin/assets/js/app.js"></script>
	<script type="text/javascript" src="resources/admin/assets/js/plugins.js"></script>
	<script type="text/javascript" src="resources/admin/assets/js/plugins.form-components.js"></script>

	<script>
	$(document).ready(function(){
		"use strict";

		App.init(); // Init layout and core plugins
		Plugins.init(); // Init all plugins
		FormComponents.init(); // Init all form-specific plugins
	});
	</script>

	<!-- Demo JS -->
	<script type="text/javascript" src="resources/admin/assets/js/custom.js"></script>
	<script type="text/javascript" src="resources/admin/assets/js/demo/pages_calendar.js"></script>
	<script type="text/javascript" src="resources/admin/assets/js/demo/charts/chart_filled_blue.js"></script>
	<script type="text/javascript" src="resources/admin/assets/js/demo/charts/chart_simple.js"></script>
</head>

<body>

	<!-- Header -->
	<header class="header navbar navbar-fixed-top" role="banner">
		<!-- Top Navigation Bar -->
		<div class="container">

			<!-- Only visible on smartphones, menu toggle -->
			<ul class="nav navbar-nav">
				<li class="nav-toggle"><a href="javascript:void(0);" title=""><i class="icon-reorder"></i></a></li>
			</ul>

			<!-- Logo -->
			<a class="navbar-brand" href="<c:url value="/admin-page"/>">
				<img src="resources/admin/assets/img/logo.png" alt="logo" />
				<strong>Admin</strong> Page
			</a>
			<!-- /logo -->

			<!-- Sidebar Toggler -->
			<a href="#" class="toggle-sidebar bs-tooltip" data-placement="bottom" data-original-title="Toggle navigation">
				<i class="icon-reorder"></i>
			</a>
			<!-- /Sidebar Toggler -->

			<!-- Top Left Menu -->
			<ul class="nav navbar-nav navbar-left hidden-xs hidden-sm">
				<li>
					<a href="<c:url value="/home"/>">
						Go back HomePage
					</a>
				</li>
				
			</ul>
			<!-- /Top Left Menu -->

			<!-- Top Right Menu -->
			<ul class="nav navbar-nav navbar-right">
				<!-- Notifications -->
				

				<!-- Tasks -->
				

				<!-- Messages -->
				
						

				<!-- .row .row-bg Toggler -->
				

				<!-- Project Switcher Button -->
				

				<!-- User Login Dropdown -->
				<li class="dropdown user">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<!--<img alt="" src="assets/img/avatar1_small.jpg" />-->
						<i class="icon-male"></i>
						<span class="username">${first}</span>
						<i class="icon-caret-down small"></i>
					</a>
					<ul class="dropdown-menu">
						<li><a href="pages_user_profile.html"><i class="icon-user"></i> My Profile</a></li>
						<li><a href="pages_calendar.html"><i class="icon-calendar"></i> My Calendar</a></li>
						<li><a href="#"><i class="icon-tasks"></i> My Tasks</a></li>
						<li class="divider"></li>
						<li><a href="login.html"><i class="icon-key"></i> Log Out</a></li>
					</ul>
				</li>
				<!-- /user login dropdown -->
			</ul>
			<!-- /Top Right Menu -->
		</div>
		<!-- /top navigation bar -->

		<!--=== Project Switcher ===-->
		<div id="project-switcher" class="container project-switcher">
			<div id="scrollbar">
				<div class="handle"></div>
			</div>

			<div id="frame">
				<ul class="project-list">
					<li>
						<a href="javascript:void(0);">
							<span class="image"><i class="icon-desktop"></i></span>
							<span class="title">Lorem ipsum dolor</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<span class="image"><i class="icon-compass"></i></span>
							<span class="title">Dolor sit invidunt</span>
						</a>
					</li>
					<li class="current">
						<a href="javascript:void(0);">
							<span class="image"><i class="icon-male"></i></span>
							<span class="title">Consetetur sadipscing elitr</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<span class="image"><i class="icon-thumbs-up"></i></span>
							<span class="title">Sed diam nonumy</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<span class="image"><i class="icon-female"></i></span>
							<span class="title">At vero eos et</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<span class="image"><i class="icon-beaker"></i></span>
							<span class="title">Sed diam voluptua</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<span class="image"><i class="icon-desktop"></i></span>
							<span class="title">Lorem ipsum dolor</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<span class="image"><i class="icon-compass"></i></span>
							<span class="title">Dolor sit invidunt</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<span class="image"><i class="icon-male"></i></span>
							<span class="title">Consetetur sadipscing elitr</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<span class="image"><i class="icon-thumbs-up"></i></span>
							<span class="title">Sed diam nonumy</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<span class="image"><i class="icon-female"></i></span>
							<span class="title">At vero eos et</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<span class="image"><i class="icon-beaker"></i></span>
							<span class="title">Sed diam voluptua</span>
						</a>
					</li>
				</ul>
			</div> <!-- /#frame -->
		</div> <!-- /#project-switcher -->
	</header> <!-- /.header -->

	<div id="container">
		<div id="sidebar" class="sidebar-fixed">
			<div id="sidebar-content">

				<!-- Search Input -->

				<!-- Search Results -->
				<div class="sidebar-search-results">

					<i class="icon-remove close"></i>
					<!-- Documents -->
					<div class="title">
						Documents
					</div>
					<ul class="notifications">
						<li>
							<a href="javascript:void(0);">
								<div class="col-left">
									<span class="label label-info"><i class="icon-file-text"></i></span>
								</div>
								<div class="col-right with-margin">
									<span class="message"><strong>John Doe</strong> received $1.527,32</span>
									<span class="time">finances.xls</span>
								</div>
							</a>
						</li>
						<li>
							<a href="javascript:void(0);">
								<div class="col-left">
									<span class="label label-success"><i class="icon-file-text"></i></span>
								</div>
								<div class="col-right with-margin">
									<span class="message">My name is <strong>John Doe</strong> ...</span>
									<span class="time">briefing.docx</span>
								</div>
							</a>
						</li>
					</ul>
					<!-- /Documents -->
					<!-- Persons -->
					<div class="title">
						Persons
					</div>
					<ul class="notifications">
						<li>
							<a href="javascript:void(0);">
								<div class="col-left">
									<span class="label label-danger"><i class="icon-female"></i></span>
								</div>
								<div class="col-right with-margin">
									<span class="message">Jane <strong>Doe</strong></span>
									<span class="time">21 years old</span>
								</div>
							</a>
						</li>
					</ul>
				</div> <!-- /.sidebar-search-results -->

				<!--=== Navigation ===-->
				<ul id="nav">
					<li class="current">
						<a href="<c:url value="/admin-page"/>">
							<i class="icon-dashboard"></i>
							Dashboard
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<i class="icon-table"></i>
							Manager
						</a>
						<ul class="sub-menu">
							<li>
                                                            <a href="<c:url value="/tablep"/>">
								<i class="icon-angle-right"></i>
								Product Table
								</a>
							</li>
							<li>
								<a href="<c:url value="/tableu"/>">
                                                                    <i class="icon-angle-right"></i>
                                                                    User Table
								</a>
							</li>
                                                        <li>
								<a href="<c:url value="/tableo"/>">
                                                                    <i class="icon-angle-right"></i>
                                                                    Order Table
								</a>
							</li>
						</ul>
					</li>
<!--					<li>
						<a href="javascript:void(0);">
							<i class="icon-edit"></i>
							Form Elements
						</a>
						<ul class="sub-menu">
							<li>
								<a href="form_components.html">
								<i class="icon-angle-right"></i>
								Form Components
								</a>
							</li>
							<li>
								<a href="form_layouts.html">
								<i class="icon-angle-right"></i>
								Form Layouts
								</a>
							</li>
							<li>
								<a href="form_validation.html">
								<i class="icon-angle-right"></i>
								Form Validation
								</a>
							</li>
						</ul>
					</li>-->
					
                                </ul>	
					
				
				<!-- /Navigation -->
				

				<div class="sidebar-widget align-center">
					<div class="btn-group" data-toggle="buttons" id="theme-switcher">
						<label class="btn active">
							<input type="radio" name="theme-switcher" data-theme="bright"><i class="icon-sun"></i> Bright
						</label>
						<label class="btn">
							<input type="radio" name="theme-switcher" data-theme="dark"><i class="icon-moon"></i> Dark
						</label>
					</div>
				</div>

			</div>
			<div id="divider" class="resizeable"></div>
		</div>
		<!-- /Sidebar -->

		<div id="content">
			<div class="container">
				<!-- Breadcrumbs line -->
				<div class="crumbs">
					<ul id="breadcrumbs" class="breadcrumb">
						<li>
							<i class="icon-home"></i>
							<a href="<c:url value="/admin-page"/>">Dashboard</a>
						</li>
						
					</ul>

					
				</div>
				<!-- /Breadcrumbs line -->

				<!--=== Page Header ===-->
				<div class="page-header">
					<div class="page-title">
						<h3>Dashboard</h3>
						<span>Hi, ${first}!</span>
					</div>

					<!-- Page Stats -->
					<!-- /Page Stats -->
				</div>
				<!-- /Page Header -->

				<!--=== Page Content ===-->
				<!--=== Statboxes ===-->
				<div class="row row-bg"> <!-- .row-bg -->
					<div class="col-sm-6 col-md-3">
						<div class="statbox widget box box-shadow">
							<div class="widget-content">
								<div class="visual cyan">
									<div class="statbox-sparkline">30,20,15,30,22,25,26,30,27</div>
								</div>
								<div class="title">Clients</div>
								<div class="value">${countu}</div>
                                                                <a class="more" href="<c:url value="/tableu"/>">View More <i class="pull-right icon-angle-right"></i></a>
							</div>
						</div> <!-- /.smallstat -->
					</div> <!-- /.col-md-3 -->

					<div class="col-sm-6 col-md-3">
						<div class="statbox widget box box-shadow">
							<div class="widget-content">
								<div class="visual green">
									<div class="statbox-sparkline">20,30,30,29,22,15,20,30,32</div>
								</div>
								<div class="title">Products</div>
								<div class="value">${countp}</div>
								<a class="more" href="<c:url value="/tablep"/>">View More <i class="pull-right icon-angle-right"></i></a>
							</div>
						</div> <!-- /.smallstat -->
					</div> <!-- /.col-md-3 -->

					<div class="col-sm-6 col-md-3 hidden-xs">
						<div class="statbox widget box box-shadow">
							<div class="widget-content">
								<div class="visual yellow">
									<i class="icon-dollar"></i>
								</div>
								<div class="title">Total Profit</div>
								<div class="value">$${sum}</div>
								<a class="more" href="<c:url value="/tableo"/>">View More <i class="pull-right icon-angle-right"></i></a>
							</div>
						</div> <!-- /.smallstat -->
					</div> <!-- /.col-md-3 -->

					
				</div> <!-- /.row -->
				<!-- /Statboxes -->

				<!--=== Blue Chart ===-->
				 <!-- /.row -->
				<!-- /Blue Chart -->

				<div class="row">
					<!--=== Sin/Cos Chart ===-->
<!--					<div class="col-md-6">
						<div class="widget box">
							<div class="widget-header">
								
								<div class="widget">
							<div class="widget-header">
								<h4><i class="icon-reorder"></i> Feeds</h4>
								<div class="toolbar no-padding">
									<div class="btn-group">
										<span class="btn btn-xs widget-collapse"><i class="icon-angle-down"></i></span>
										<span class="btn btn-xs widget-refresh"><i class="icon-refresh"></i></span>
									</div>
								</div>
							</div>
							<div class="widget-content">
								<div class="tabbable tabbable-custom">
									<ul class="nav nav-tabs">
										<li class="active"><a href="#tab_feed_1" data-toggle="tab">System</a></li>
										<li><a href="#tab_feed_2" data-toggle="tab">Activities</a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane active" id="tab_feed_1">
											<div class="scroller" data-height="290px" data-always-visible="1" data-rail-visible="0">
												<ul class="feeds clearfix">
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-success">
																		<i class="icon-bell"></i>
																	</div>
																</div>
																<div class="content-col2">
																	<div class="desc">You have 2 puzzles to solve.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">
																Just now
															</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-success"><i class="icon-plus"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">New user registered.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">20 mins ago</div>
														</div>  /.col2 
													</li>
													<li class="hoverable">
														<a href="javascript:void(0);">
															<div class="col1">
																<div class="content">
																	<div class="content-col1">
																		<div class="label label-info"><i class="icon-bullhorn"></i></div>
																	</div>
																	<div class="content-col2">
																		<div class="desc">New items are in queue.</div>
																	</div>
																</div>
															</div>  /.col1 
															<div class="col2">
																<div class="date">25 mins ago</div>
															</div>  /.col2 
														</a>
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-danger"><i class="icon-warning-sign"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">High CPU load on cluster #2. <span class="label label-danger label-mini">Fix it <i class="icon-share-alt"></i></span></div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">30 mins ago</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-warning"><i class="icon-bolt"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">Disk space to 85% full.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">45 mins ago</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-success"><i class="icon-plus"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">New user registered.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">1 hour ago</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-default"><i class="icon-time"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">Time successfully synced.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">1.5 hours ago</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-info"><i class="icon-bullhorn"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">Download finished.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">1.8 hours ago</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-success"><i class="icon-plus"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">New order received.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">2 hours ago</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-info"><i class="icon-bullhorn"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">Download finished.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">3 hours ago</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-success"><i class="icon-plus"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">New order received.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">5 hours ago</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-info"><i class="icon-bullhorn"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">Download finished.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">5.5 hours ago</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-success"><i class="icon-plus"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">New order received.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">7 hours ago</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-info"><i class="icon-bullhorn"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">Download finished.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">16 hours ago</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-success"><i class="icon-plus"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">New order received.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">20 hours ago</div>
														</div>  /.col2 
													</li>
												</ul>  /.feeds 
											</div>  /.scroller 
										</div>  /#tab_feed_1 

										<div class="tab-pane" id="tab_feed_2">
											<div class="scroller" data-height="290px" data-always-visible="1" data-rail-visible="0">
												<ul class="feeds clearfix">
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-success"><i class="icon-plus"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">New user registered.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">1 min ago</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-success"><i class="icon-plus"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">New user registered.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">5 mins ago</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-info"><i class="icon-plus"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">New order received.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">10 mins ago</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-success"><i class="icon-plus"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">New user registered.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">20 mins ago</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-info"><i class="icon-plus"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">New order received.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">30 mins ago</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-success"><i class="icon-plus"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">New user registered.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">40 mins ago</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-info"><i class="icon-plus"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">New order received.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">50 mins ago</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-success"><i class="icon-plus"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">New user registered.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">1 hour ago</div>
														</div>  /.col2 
													</li>
													<li>
														<div class="col1">
															<div class="content">
																<div class="content-col1">
																	<div class="label label-info"><i class="icon-plus"></i></div>
																</div>
																<div class="content-col2">
																	<div class="desc">New order received.</div>
																</div>
															</div>
														</div>  /.col1 
														<div class="col2">
															<div class="date">1.5 hours ago</div>
														</div>  /.col2 
													</li>
												</ul>  /.feeds 
											</div>  /.scroller 
										</div>  /#tab_feed_1 
									</div>  /.tab-content 
								</div>  /.tabbable tabbable-custom
							</div>  /.widget-content 
						</div>  /.widget .box 
					</div>  /.col-md-6 
					 /Feeds (with Tabs) 
						</div>
					</div>  /.col-md-6 -->
					<!-- /Sin/Cos Chart -->

					<!--=== Static Table ===-->
					<div class="col-md-6">
						<div class="widget box">
							<div class="widget-header">
								<h4><i class="icon-reorder"></i> New Users</h4>
								<div class="toolbar no-padding">
									<div class="btn-group">
										<span class="btn btn-xs widget-collapse"><i class="icon-angle-down"></i></span>
									</div>
								</div>
							</div>
							<div class="widget-content no-padding">
								<table class="table table-striped table-checkable table-hover">
									<thead>
										<tr>
											
											<th class="hidden-xs">First Name</th>
											<th>Last Name</th>
                                                                                        <th>Email</th>
											<th>Status</th>
											
										</tr>
									</thead>
									<tbody>
                                                                            <c:forEach var="u" items="${top}">
                                                                                <tr>
											
											<td class="hidden-xs">${u.firstname}</td>
											<td>${u.lastname}</td>
                                                                                        <td>${u.email}</td>
											<td><span class="label label-success">Approved</span></td>
											
										</tr>
                                                                            </c:forEach>
									</tbody>
								</table>
								 <!-- /.row -->
							</div> <!-- /.widget-content -->
						</div> <!-- /.widget -->
					</div>
                                        <div class="col-md-6">
						<div class="widget box">
							<div class="widget-header">
								<h4><i class="icon-reorder"></i> Recent Ordered</h4>
								<div class="toolbar no-padding">
									<div class="btn-group">
										<span class="btn btn-xs widget-collapse"><i class="icon-angle-down"></i></span>
									</div>
								</div>
							</div>
							<div class="widget-content no-padding">
								<table class="table table-striped table-checkable table-hover">
									<thead>
										<tr>
											
											<th class="hidden-xs">Order Time</th>
											<th>Email</th>
                                                                                        
											<th>Status</th>
											
										</tr>
									</thead>
									<tbody>
                                                                            <c:forEach var="u" items="${top3}">
                                                                                <tr>
											
											<td class="hidden-xs">${u.orderDate}</td>
											<td>${u.userEntity.email}</td>
                                                                                        
											<td><span class="label label-success">Shipped</span></td>
											
										
                                                                            </c:forEach>
                                                                            
                                                                                        
									</tbody>
								</table>
								 <!-- /.row -->
							</div> <!-- /.widget-content -->
						</div> <!-- /.widget -->
					</div><!-- /.col-md-6 -->
					<!-- /Static Table -->
				</div> <!-- /.row -->

				
			<!-- /.container -->

		</div>
	</div>

</body>
</html>
