module VisEngine
  class Engine < ::Rails::Engine
    isolate_namespace VisEngine

    ## Serve static assets in the 'public' directory through the engine.
    #initializer 'static assets' do |app|
    #  app.middleware.insert_before(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public")
    #end
  end
end
