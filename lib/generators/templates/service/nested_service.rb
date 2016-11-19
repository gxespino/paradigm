class <%= @path[0].camelcase %>::<%= @path[1].camelcase %>Service
  include Service

  def call
    # add service logic here
  end

  private

  # keep the #call method readable by extracting private methods
end
