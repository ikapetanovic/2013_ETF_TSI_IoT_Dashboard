window.DefaultTiles = [
    {
        name :"Section1",
        tiles: [
			{ id: "Temperature", name: "Temperature" },
			{ id: "Pressure", name: "Pressure" }
        ]
    },
	{
        name :"Section2",
        tiles: [
			{ id: "Humidity", name: "Humidity" },
			{ id: "GasConcentration", name: "GasConcentration" }
        ]
    }
];

window.DefaultTiles = _.map(window.DefaultTiles, function (section) {
    return "" + section.name + "~" + (_.map(section.tiles, function (tile) {
        return "" + tile.id + "," + tile.name;
    })).join(".");
}).join("|");

window.TileBuilders = {

    Temperature: function (uniqueId) {
        return {
			uniqueId: uniqueId,
            name: "Temperature",
			label: "Temperature (&degC)",
			size: "tile-double tile-double-vertical",
            color: "bg-color-white",
            appUrl: "Tiles/History/TemperatureHistory.html",
			scriptSrc: ["Tiles/Temperature.js"],
			initFunc: "loadTemperature"
        };
    },
	
	Pressure: function (uniqueId) {
        return {
			uniqueId: uniqueId,
            name: "Presure",
			label: "Pressure (kPa)",
			size: "tile-triple tile-double-vertical",
            color: "bg-color-white",
            appUrl: "Tiles/History/PressureHistory.html",
			scriptSrc: ["Tiles/Pressure.js"],
			initFunc: "loadPressure"
        };
    },
	
	Humidity: function (uniqueId) {
        return {
			uniqueId: uniqueId,
            name: "Humidity",
			label: "Humidity (%)",
			size: "tile-triple tile-double-vertical",
            color: "bg-color-white",
            appUrl: "Tiles/History/HumidityHistory.html",
			scriptSrc: ["Tiles/Humidity.js"],
			initFunc: "loadHumidity"
        };
    },
	
	GasConcentration: function (uniqueId) {
        return {
			uniqueId: uniqueId,
            name: "GasConcentration",
			label: "Gas Concentration (%)",
			size: "tile-triple tile-double-vertical",
            color: "bg-color-white",
            appUrl: "Tiles/History/GasConcentrationHistory.html",
			scriptSrc: ["Tiles/GasConcentration.js"],
			initFunc: "loadGasConcentration"
        };
    }
	
};