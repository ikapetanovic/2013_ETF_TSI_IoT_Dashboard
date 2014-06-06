function loadTemperature(tile, div) {
	var lastTemperatureValue, indicatorColor;
	$(document).ready(function() {
		$.get('Service/TemperatureService.php', function(data, status) {
			lastTemperatureValue = data, indicatorColor;
			if (lastTemperatureValue >= -10 && lastTemperatureValue <= 15)
				indicatorColor = '#0000FF';
			else if (lastTemperatureValue > 15 && lastTemperatureValue <= 50)
				indicatorColor = '#FF0000';
			var htmlString = '<div id="chartContainerTemperature"><div id="gaugeTemperature"></div></div>';
			$('#Temperature').append(htmlString);
			$('#gaugeTemperature').dxLinearGauge({
				geometry: { orientation: 'vertical' },
				scale: {
					startValue: -10,
					endValue: 50,
					majorTick: { tickInterval: 10 },
					minorTick: {
						visible: true,
						tickInterval: 1
					},
					label: {
						customizeText: function (arg) {
							return arg.valueText + ' &degC';
						}
					}
				},
				rangeContainer: {
					backgroundColor: 'none',
					ranges: [
						{ startValue: -10, endValue: 15, color: '#0000FF' },
						{ startValue: 15, endValue: 50, color: '#FF0000' }
					]
				},
				valueIndicator: {
					color: indicatorColor
				},
				value: lastTemperatureValue,
				subvalueIndicator: {
					type: 'textcloud',
					text: {
						customizeText: function (arg) {
							return arg.valueText + ' &deg;C';
						}
					},
					color: indicatorColor,
					offset: -50
				},
				subvalues: lastTemperatureValue
			});
		});
	});
}