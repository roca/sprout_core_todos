# ===========================================================================
# Project:   Todos
# Copyright: ©2011 My Company, Inc.
# ===========================================================================

# Add initial buildfile information here
config :all, :required => :sproutcore

proxy "/tasks", :to => "localhost:3001"