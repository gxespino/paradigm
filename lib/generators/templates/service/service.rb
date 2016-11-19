class <%= file_name.camelcase %>Service
  include Service

  def call
    # add service logic here
  end

  private

  # keep the #call method readable by extracting private methods
end
