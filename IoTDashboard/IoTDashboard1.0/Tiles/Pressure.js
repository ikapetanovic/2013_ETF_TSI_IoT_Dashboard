function loadPressure(tile, div) {
	var lastPressureValue, indicatorColor;
	$(document).ready(function() {
		$.get("Service/PressureService.php", function(data, status) {
			lastPressureValue = data;
			if (lastPressureValue >= 90 && lastPressureValue <= 100) {
				indicatorColor = '#1A1AFF';
			} else if (lastPressureValue > 100 && lastPressureValue <= 102) {
				indicatorColor = '#1AFF1A';
			} else if (lastPressureValue > 102 && lastPressureValue <= 110) {
				indicatorColor = '#FF1A1A';
			}
			var htmlString = '<div id="chartContainerPressure"><div id="gaugePressure"></div></div>';
			$('#Pressure').append(htmlString);
			$('#gaugePressure').dxCircularGauge({
				scale: {
					startValue: 90,
					endValue: 110,
					majorTick: { tickInterval: 2 },
					minorTick: {
						visible: true,
						tickInterval: 1
					},
					label: {
						customizeText: function (arg) {
							return arg.valueText + ' kPa';
						}
					}
				},
				rangeContainer: {
					backgroundColor: 'none',
					ranges: [
						{ startValue: 90, endValue: 100, color: '#1A1AFF' },
						{ startValue: 100, endValue: 102, color: '#1AFF1A' },
						{ startValue: 102, endValue: 110, color: '#FF1A1A' }
					]
				},
				subvalues: lastPressureValue,
				subvalueIndicator: {
					type: 'textcloud',
					text: {
						customizeText: function (arg) {
							return arg.valueText + ' kPa';
						}
					},
					color: indicatorColor,
					offset: 75
				},
				value: lastPressureValue
			});
		});
	});
}