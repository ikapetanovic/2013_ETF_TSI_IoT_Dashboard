function loadHumidity(tile, div) {
	var lastHumidityValue, indicatorColor = '#75A3FF';
	$(document).ready(function() {
		$.get("Service/HumidityService.php", function(data, status) {
			lastHumidityValue = data * 100;
			var htmlString = '<div id="chartContainerHumidity"><div id="gaugeHumidity"></div></div>';
			$('#Humidity').append(htmlString);
			$('#gaugeHumidity').dxCircularGauge({
				scale: {
					startValue: 0,
					endValue: 100,
					majorTick: { tickInterval: 10 },
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
						{ startValue: 0, endValue: 20, color: '#D1E0FF' },
						{ startValue: 20, endValue: 40, color: '#C2D6FF' },
						{ startValue: 40, endValue: 60, color: '#B2CCFF' },
						{ startValue: 60, endValue: 80, color: '#94B8FF' },
						{ startValue: 80, endValue: 100, color: '#75A3FF' }
					]
				},
				subvalues: lastHumidityValue,
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
				value: lastHumidityValue
			});
		});
	});
}