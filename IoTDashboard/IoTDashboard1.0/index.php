<!DOCTYPE html>
<html>
	<head>
		<title>IoT Dashboard 1.0</title>
		<link rel="icon" href="IoTDashboard.ico" type="image/x-icon">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/droptiles.css?v=14">
		<link rel="stylesheet" type="text/css" href="css/Widget.css">
	</head>
	<body>
		<div id="body" class="unselectable">
			<div id="navbar" class="navbar navbar-fixed-top navbar-inverse">
				<div class="navbar-inner">
					<div class="container">
						<div class="nav-collapse collapse">
							<ul class="nav">
								<li class="active"><a class="brand" href="?"><img id="avatar" src="img/IoTDashboard.gif"/>IoT Dashboard 1.0</a></li>
								<li><a class="active" href="?"><i class="icon-white icon-th-large"></i>Home</a></li>
							</ul>
							<ul class="nav pull-right">
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-white icon-tint"></i>Theme<b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li><a href="#" onclick="ui.switchTheme('theme-MetroBloom')">Bloom</a></li>
										<li><a href="#" onclick="ui.switchTheme('theme-MetroBlue')">Blue</a></li>
										<li><a href="#" onclick="ui.switchTheme('theme-MetroBrown')">Brown</a></li>
										<li><a href="#" onclick="ui.switchTheme('theme-MetroGray')">Gray</a></li>
										<li><a href="#" onclick="ui.switchTheme('theme-MetroGreen')">Green</a></li>
										<li><a href="#" onclick="ui.switchTheme('theme-MetroPurple')">Purple</a></li>
										<li><a href="#" onclick="ui.switchTheme('theme-MetroWater')">Water</a></li>
									</ul>
								</li>
                            </ul>
						</div>
					</div>
				</div>
			</div>
			<div id="content" style="visibility: hidden">
				<div id="metro-sections-container" class="metro">
					<div class="metro-sections" data-bind="foreach: sections">
						<div class="metro-section" data-bind="sortable: { data: tiles }">
							<div data-bind="attr: { id: uniqueId, 'class': tileClasses }">
								<a class="metro-tile-link">
									<span class="tile-label" data-bind="html: label">Label</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
        </div>
	</body>
    <!--
		If you change any of the below javascript files, make sure you run the Combine.bat
		file in the /js folder to generate the CombinedDashboard.js file again. And then don't
		forget to update the ?v=14#. Otherwise user's will have cached copies in their browser
		and won't get the newly deployed file.
	-->
	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.10.2.custom.min.js"></script>
	<script type="text/javascript" src="js/jQueryEnhancement.js"></script>
	<script type="text/javascript" src="js/jQuery.MouseWheel.js"></script>
	<script type="text/javascript" src="js/jquery.kinetic.js"></script>
	<script type="text/javascript" src="js/Knockout-2.1.0.js"></script>
	<script type="text/javascript" src="js/ChartJS/knockout-3.0.0.js"></script>
	<script type="text/javascript" src="js/knockout.sortable.js"></script>
	<script type="text/javascript" src="js/cookie.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/Underscore.js"></script>
	<script type="text/javascript" src="js/jQuery.hashchange.js"></script>
	<script type="text/javascript" src="js/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript" src="js/User.js"></script>
	<script type="text/javascript" src="js/ChartJS/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="js/ChartJS/globalize.min.js"></script>
	<script type="text/javascript" src="js/ChartJS/dx.chartjs.js"></script>
	<script type="text/javascript">
		window.currentUser = new User({
			firstName: "None",
			lastName: "Anonymous",
			photo: "img/User No-Frame.png",
			isAnonymous: true
		});
	</script>
	<!-- Copyright 2012 Omar AL Zabir -->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<!--
		If you change any of the below javascript files, make sure you run the Combine.bat
		file in the /js folder to generate the CombinedDashboard.js file again. And then don't
		forget to update the ?v=14#. Otherwise user's will have cached copies in their browser
		and won't get the newly deployed file.
	-->
    <script type="text/javascript" src="js/TheCore.js?v=14"></script>
    <script type="text/javascript" src="tiles/tiles.js?v=14"></script>
    <script type="text/javascript" src="js/Dashboard.js?v=14"></script>
	<script type="text/javascript">
		window.profileData = null;
		$(document).ready(function(){});
	</script>
	<script type="text/ecmascript">
		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', 'UA-33406100-1']);
		_gaq.push(['_trackPageview']);
		(function(){
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		})();
	</script>
</html>