var Model = require("model-js");
var dsvDataset = require("dsv-dataset");

module.exports = function (){

  var model = Model({
    publicProperties: ["dataset_id"],
    dataset_id: Model.None
  });

  model.when("dataset_id", function (dataset_id){
    if(dataset_id !== Model.None){

      // TODO include dataset id in the API call
      //console.log(dataset_id);

      $.get("/vis_engine/reduce_data", function (response){
        var dataset = dsvDataset.parse(response);
        model.data = dataset.data;
        console.log("Fdsafdsafdsa");
        console.log(dataset.data);
      });
    }
  });
  return model;
};
