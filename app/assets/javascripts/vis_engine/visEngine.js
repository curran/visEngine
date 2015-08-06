// This "chiasm" package contains a constructor function that
// includes core Chiasm plugins.
var Chiasm = require("chiasm");

// This is the Chiasm plugin that loads the data from the VisEngine API.
var visEngineDataLoader = require("./visEngineDataLoader");

// This is the Chiasm instance that will be constructed,
// and will have the VisEngine--specific data loading plugin available.
var chiasm;

// This function returns the singleton Chiasm instance,
// which gets constructed only the first time this function is called.
module.exports = {
  chiasmInit: function (container){
    if (!chiasm) {
      chiasm = Chiasm(container);

      // Expose the plugin to configurations on this Chiasm instance.
      chiasm.plugins.visEngineDataLoader = visEngineDataLoader;
    }
    return chiasm;
  }
};
