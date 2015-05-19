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
        "chiasm-plugins/scatterPlot"], function (Chiasm) {
  return Chiasm;
});
