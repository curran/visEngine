// This file triggers AMDOptimize to include Chiasm and all its plugins
// into the single output file that will be integrated into the Rails asset pipeline.
define(["chiasm",
        "barChart",
        "colorScale",
        "computeLayout",
        "configEditor",
        "crossfilter",
        "csvLoader",
        "dummyVis",
        "layout",
        "lineChart",
        "links",
        "reactivis",
        "scatterPlot"], function (Chiasm) {
  return Chiasm;
});
