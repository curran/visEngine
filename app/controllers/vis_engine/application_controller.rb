module VisEngine
  class ApplicationController < ActionController::Base

    def reduce_data

      puts "here in get_random_sample"

      # For now we just want a random sample
      method = "randomSample"

      # This is the ID of the data set metadata stored in the Chorus database.
      dataset_id = params[:dataset_id]

      # This is the number of rows to fetch in the random sample returned.
      # There should only be one table returned (a single sample set).
      num_samples = params[:num_samples]

      # TODO query an Alpine REST API that fetches the random sample
      # passing in method, dataset_id, and num_samples
      # The implementation should assume defaults for random sampling parameters,
      # e.g. use uniform distribution, use replacement, etc.

      # Possibly use https://github.com/jnunemaker/httparty to make the REST request.
      resultFromAlpine = '[{"x":2},{"x":3},{"x":4}]'

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
