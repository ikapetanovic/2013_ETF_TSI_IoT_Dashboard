function loadGasConcentration(tile, div) {
	var lastGasConcentrationValue, indicatorColor = '#B1A600';
	$(document).ready(function() {
		$.get("Service/GasConcentrationService.php", function(data, status) {
			lastGasConcentrationValue = data * 100;
			var htmlString = '<div id="chartContainerGasConcentration"><div id="gaugeGasConcentration"></div></div>';
			$('#GasConcentration').append(htmlString);
			$('#gaugeGasConcentration').dxCircularGauge({
				geometry: {
					startAngle: 180,
					endAngle: 0
				},
				scale: {
					startValue: 0,
					endValue: 100,
					majorTick: { tickInterval: 25 },
					minorTick: {
						visible: true,
						tickInterval: 5
					},
					label: {
						customizeText: function (arg) {
							return arg.valueText + ' %';
						}
					}
				},
				rangeContainer: {
					backgroundColor: 'none',
					ranges: [
						{ startValue: 0, endValue: 50, color: '#FFD900' },
						{ startValue: 50, endValue: 100, color: '#B1A600' }
					]
				},
				subvalues: lastGasConcentrationValue,
				subvalueIndicator: {
					type: 'textcloud',
					text: {
						customizeText: function (arg) {
							return arg.valueText + ' %';
						}
					},
					color: indicatorColor,
					offset: 75
				},
				value: lastGasConcentrationValue
			});
		});
	});
}