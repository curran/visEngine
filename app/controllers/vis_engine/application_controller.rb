module VisEngine
  class ApplicationController < ActionController::Base

    def reduce_data

      # This is the ID of the data set metadata stored in the Chorus database.
      dataset_id = params[:dataset_id]

      # This is the number of rows to fetch in the random sample returned.
      # There should only be one table returned (a single sample set).
      num_samples = params[:num_samples]

      # TODO extract connection details from the Chorus metadata database.

      # TODO query an Alpine REST API that fetches the random sample
      # passing in method, dataset_id, and num_samples
      # The implementation should assume defaults for random sampling parameters,
      # e.g. use uniform distribution, use replacement, etc.

      # Possibly use https://github.com/jnunemaker/httparty to make the REST request.

      # This string is temporarily hard-coded, in anticipation of the 
      # REST API for random sampling.
      # This will be parsed by https://github.com/curran/dsv-dataset
      resultFromAlpine = <<-FOO
{ "dsvString":"sepal_length,sepal_width,petal_length,petal_width,class\\n5.1,3.5,1.4,0.2,setosa\\n4.9,3.0,1.4,0.2,setosa\\n4.7,3.2,1.3,0.2,setosa\\n4.6,3.1,1.5,0.2,setosa\\n5.0,3.6,1.4,0.2,setosa\\n5.4,3.9,1.7,0.4,setosa\\n4.6,3.4,1.4,0.3,setosa\\n5.0,3.4,1.5,0.2,setosa\\n4.4,2.9,1.4,0.2,setosa\\n4.9,3.1,1.5,0.1,setosa\\n5.4,3.7,1.5,0.2,setosa\\n4.8,3.4,1.6,0.2,setosa\\n4.8,3.0,1.4,0.1,setosa\\n4.3,3.0,1.1,0.1,setosa\\n5.8,4.0,1.2,0.2,setosa\\n5.7,4.4,1.5,0.4,setosa\\n5.4,3.9,1.3,0.4,setosa\\n5.1,3.5,1.4,0.3,setosa\\n5.7,3.8,1.7,0.3,setosa\\n5.1,3.8,1.5,0.3,setosa\\n5.4,3.4,1.7,0.2,setosa\\n5.1,3.7,1.5,0.4,setosa\\n4.6,3.6,1.0,0.2,setosa\\n5.1,3.3,1.7,0.5,setosa\\n4.8,3.4,1.9,0.2,setosa\\n5.0,3.0,1.6,0.2,setosa\\n5.0,3.4,1.6,0.4,setosa\\n5.2,3.5,1.5,0.2,setosa\\n5.2,3.4,1.4,0.2,setosa\\n4.7,3.2,1.6,0.2,setosa\\n4.8,3.1,1.6,0.2,setosa\\n5.4,3.4,1.5,0.4,setosa\\n5.2,4.1,1.5,0.1,setosa\\n5.5,4.2,1.4,0.2,setosa\\n4.9,3.1,1.5,0.1,setosa\\n5.0,3.2,1.2,0.2,setosa\\n5.5,3.5,1.3,0.2,setosa\\n4.9,3.1,1.5,0.1,setosa\\n4.4,3.0,1.3,0.2,setosa\\n5.1,3.4,1.5,0.2,setosa\\n5.0,3.5,1.3,0.3,setosa\\n4.5,2.3,1.3,0.3,setosa\\n4.4,3.2,1.3,0.2,setosa\\n5.0,3.5,1.6,0.6,setosa\\n5.1,3.8,1.9,0.4,setosa\\n4.8,3.0,1.4,0.3,setosa\\n5.1,3.8,1.6,0.2,setosa\\n4.6,3.2,1.4,0.2,setosa\\n5.3,3.7,1.5,0.2,setosa\\n5.0,3.3,1.4,0.2,setosa\\n7.0,3.2,4.7,1.4,versicolor\\n6.4,3.2,4.5,1.5,versicolor\\n6.9,3.1,4.9,1.5,versicolor\\n5.5,2.3,4.0,1.3,versicolor\\n6.5,2.8,4.6,1.5,versicolor\\n5.7,2.8,4.5,1.3,versicolor\\n6.3,3.3,4.7,1.6,versicolor\\n4.9,2.4,3.3,1.0,versicolor\\n6.6,2.9,4.6,1.3,versicolor\\n5.2,2.7,3.9,1.4,versicolor\\n5.0,2.0,3.5,1.0,versicolor\\n5.9,3.0,4.2,1.5,versicolor\\n6.0,2.2,4.0,1.0,versicolor\\n6.1,2.9,4.7,1.4,versicolor\\n5.6,2.9,3.6,1.3,versicolor\\n6.7,3.1,4.4,1.4,versicolor\\n5.6,3.0,4.5,1.5,versicolor\\n5.8,2.7,4.1,1.0,versicolor\\n6.2,2.2,4.5,1.5,versicolor\\n5.6,2.5,3.9,1.1,versicolor\\n5.9,3.2,4.8,1.8,versicolor\\n6.1,2.8,4.0,1.3,versicolor\\n6.3,2.5,4.9,1.5,versicolor\\n6.1,2.8,4.7,1.2,versicolor\\n6.4,2.9,4.3,1.3,versicolor\\n6.6,3.0,4.4,1.4,versicolor\\n6.8,2.8,4.8,1.4,versicolor\\n6.7,3.0,5.0,1.7,versicolor\\n6.0,2.9,4.5,1.5,versicolor\\n5.7,2.6,3.5,1.0,versicolor\\n5.8,2.7,3.9,1.2,versicolor\\n6.0,2.7,5.1,1.6,versicolor\\n5.4,3.0,4.5,1.5,versicolor\\n6.0,3.4,4.5,1.6,versicolor\\n6.7,3.1,4.7,1.5,versicolor\\n6.3,2.3,4.4,1.3,versicolor\\n5.6,3.0,4.1,1.3,versicolor\\n5.5,2.5,4.0,1.3,versicolor\\n5.5,2.6,4.4,1.2,versicolor\\n6.1,3.0,4.6,1.4,versicolor\\n5.8,2.6,4.0,1.2,versicolor\\n5.0,2.3,3.3,1.0,versicolor\\n5.6,2.7,4.2,1.3,versicolor\\n5.7,3.0,4.2,1.2,versicolor\\n5.7,2.9,4.2,1.3,versicolor\\n6.2,2.9,4.3,1.3,versicolor\\n5.1,2.5,3.0,1.1,versicolor\\n5.7,2.8,4.1,1.3,versicolor\\n6.3,3.3,6.0,2.5,virginica\\n5.8,2.7,5.1,1.9,virginica\\n7.1,3.0,5.9,2.1,virginica\\n6.3,2.9,5.6,1.8,virginica\\n6.5,3.0,5.8,2.2,virginica\\n7.6,3.0,6.6,2.1,virginica\\n4.9,2.5,4.5,1.7,virginica\\n7.3,2.9,6.3,1.8,virginica\\n6.7,2.5,5.8,1.8,virginica\\n7.2,3.6,6.1,2.5,virginica\\n6.5,3.2,5.1,2.0,virginica\\n6.4,2.7,5.3,1.9,virginica\\n6.8,3.0,5.5,2.1,virginica\\n5.7,2.5,5.0,2.0,virginica\\n5.8,2.8,5.1,2.4,virginica\\n6.4,3.2,5.3,2.3,virginica\\n6.5,3.0,5.5,1.8,virginica\\n7.7,3.8,6.7,2.2,virginica\\n7.7,2.6,6.9,2.3,virginica\\n6.0,2.2,5.0,1.5,virginica\\n6.9,3.2,5.7,2.3,virginica\\n5.6,2.8,4.9,2.0,virginica\\n7.7,2.8,6.7,2.0,virginica\\n6.3,2.7,4.9,1.8,virginica\\n6.7,3.3,5.7,2.1,virginica\\n7.2,3.2,6.0,1.8,virginica\\n6.2,2.8,4.8,1.8,virginica\\n6.1,3.0,4.9,1.8,virginica\\n6.4,2.8,5.6,2.1,virginica\\n7.2,3.0,5.8,1.6,virginica\\n7.4,2.8,6.1,1.9,virginica\\n7.9,3.8,6.4,2.0,virginica\\n6.4,2.8,5.6,2.2,virginica\\n6.3,2.8,5.1,1.5,virginica\\n6.1,2.6,5.6,1.4,virginica\\n7.7,3.0,6.1,2.3,virginica\\n6.3,3.4,5.6,2.4,virginica\\n6.4,3.1,5.5,1.8,virginica\\n6.0,3.0,4.8,1.8,virginica\\n6.9,3.1,5.4,2.1,virginica\\n6.7,3.1,5.6,2.4,virginica\\n6.9,3.1,5.1,2.3,virginica\\n5.8,2.7,5.1,1.9,virginica\\n6.8,3.2,5.9,2.3,virginica\\n6.7,3.3,5.7,2.5,virginica\\n6.7,3.0,5.2,2.3,virginica\\n6.3,2.5,5.0,1.9,virginica\\n6.5,3.0,5.2,2.0,virginica\\n6.2,3.4,5.4,2.3,virginica\\n5.9,3.0,5.1,1.8,virginica",
  "metadata":{
    "delimiter": ",",
    "columns": [
      { "name": "sepal_length", "type": "number" },
      { "name": "sepal_width",  "type": "number" },
      { "name": "petal_length", "type": "number" },
      { "name": "petal_width",  "type": "number" },
      { "name": "class",        "type": "string" }
    ]
  }
}
FOO

#// This metadata object specifies the delimiter and column types.
#// This could be loaded from a .json file.

      # Render the resulting table as JSON,
      # passing the resulting JSON string from the Alpine REST API as-is
      render json: resultFromAlpine

#      This is old experimental code that invokes Spark Jobserver.
#      options = params[:options] 
#
#      # This connects to a local Spark-Jobserver to run the
#      # data reduction service. See
#      # https://github.com/spark-jobserver/spark-jobserver
#      uri = URI('http://localhost:8090/jobs')
#      params = {
#        'appName' => 'DataReduction',
#        'classPath' => 'visEditor.DataReductionJob',
#        'sync' => 'true'
#      }
#      uri.query = URI.encode_www_form(params)
#      req = Net::HTTP::Post.new(uri)
#
#      req.body = "{ \"options\": " + options + "}"
#      puts options
#
#      # Invoke Spark-Jobserver with synchronous HTTP POST.
#      res = Net::HTTP.start(uri.host, uri.port) {|http| http.request(req) }
#
#      # Pass through the results to the client.
#      render body: res.body #, content_type: "application/json"
    end
  end
end
