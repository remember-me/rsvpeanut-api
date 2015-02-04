module ValidatePresenceOf
  class Matcher
    def initialize(attribute)
      @attribute = attribute 
    end
    
    def matches?(model)
      @model = model
      model.valid?
      model.errors.has_key?(@attribute)
    end
    
    def validate_presence_of(attribute)
      Matcher.new(attribute)
    end
    
    def negative_failure_message
      "#{@model.class} validated"
    end
  end
end