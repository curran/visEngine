var gulp = require('gulp');
var amdOptimize = require('amd-optimize');
var concat = require('gulp-concat-sourcemap');
 
var chiasmPath = __dirname + "/chiasm/src/";
var plugins = chiasmPath + "plugins/";
var bower = __dirname + "/bower_components";

var options = {
  paths: {
    chiasm: chiasmPath + "chiasm",

    // TODO figure out a better way. It should not be required
    // to list out all of the plugins like this.
    // This should be automated.
    layout: plugins + "layout",
    computeLayout: plugins + "computeLayout",
    configEditor: plugins + "configEditor",
    csvLoader: plugins + "csvLoader",
    links: plugins + "links",
    reactivis: plugins + "reactivis",
    barChart: plugins + "barChart",
    lineChart: plugins + "lineChart",
    scatterPlot: plugins + "scatterPlot",
    colorScale: plugins + "colorScale",
    dummyVis: plugins + "dummyVis",
    d3: bower + "/d3/d3",
    model: bower + "/model/dist/model",
    lodash: bower + "/lodash/lodash",
    crossfilter: bower + "/crossfilter/crossfilter",
    codemirror: bower + "/codemirror",
    inlet: bower + "/inlet/inlet"
  }
};
 
gulp.task('default', function () {

  return gulp.src("src/scripts/**/*.js")
    // Traces all modules and outputs them in the correct order.
    .pipe(amdOptimize("chiasmBundle", options))
    .pipe(concat("index.js"))
    .pipe(gulp.dest("."));

});
