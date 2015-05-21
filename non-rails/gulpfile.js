var gulp = require('gulp');
var amdOptimize = require('amd-optimize');
var concat = require('gulp-concat');
 
var chiasmPath = "chiasm/src/";
var bower = "bower_components/";

var options = {
  paths: {
    chiasm: chiasmPath + "chiasm",
    "chiasm-plugins": chiasmPath + "plugins",

    d3: bower + "d3/d3",
    model: bower + "model/dist/model",
    lodash: bower + "lodash/lodash",
    crossfilter: bower + "crossfilter/crossfilter",
    codemirror: bower + "codemirror",
    inlet: bower + "inlet/inlet"
  }
};
 
gulp.task('default', function () {

  return gulp.src("src/scripts/**/*.js")
    // Traces all modules and outputs them in the correct order.
    .pipe(amdOptimize("chiasmBundle", options))
    .pipe(concat("chiasmBundle.js"))
    .pipe(gulp.dest("../app/assets/javascripts/vis_engine/"));

});
