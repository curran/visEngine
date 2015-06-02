// This file triggers AMDOptimize to include Chiasm and all its plugins
// into the single output file that will be integrated into the Rails asset pipeline.
define(["chiasm",
        "chiasm-plugins/barChart",
        "chiasm-plugins/colorScale",
        "chiasm-plugins/computeLayout",
        "chiasm-plugins/configEditor",
        "chiasm-plugins/crossfilter",
        "chiasm-plugins/csvLoader",
        "chiasm-plugins/dummyVis",
        "chiasm-plugins/layout",
        "chiasm-plugins/lineChart",
        "chiasm-plugins/links",
        "chiasm-plugins/reactivis",
        "chiasm-plugins/scatterPlot"], function (Chiasm, barChart, colorScale, computeLayout, configEditor, crossfilter, csvLoader, dummyVis, layout, lineChart, links, reactivis, scatterPlot){
  return function (container){
    var chiasm = Chiasm(container);

    chiasm.plugins.barChart = barChart;
    chiasm.plugins.colorScale = colorScale;
    chiasm.plugins.computeLayout = computeLayout;
    chiasm.plugins.configEditor = configEditor;
    chiasm.plugins.crossfilter = crossfilter;
    chiasm.plugins.csvLoader = csvLoader;
    chiasm.plugins.dummyVis = dummyVis;
    chiasm.plugins.layout = layout;
    chiasm.plugins.lineChart = lineChart;
    chiasm.plugins.links = links;
    chiasm.plugins.scatterPlot = scatterPlot;

    return chiasm;
  }
});
