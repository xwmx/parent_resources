module ActionController
  module ParentResources
    def self.included(base) # :nodoc:
      base.extend ClassMethods
    end
    
    protected
      def parent_id(parent)
        request.path_parameters["#{ parent }_id"]
      end
  
      def parent_type
        self.class.parents.detect { |parent| parent_id(parent) }
      end
  
      def parent_class
        parent_type && parent_type.to_s.classify.constantize
      end
  
      def parent_object
        parent_class && parent_class.find_by_id(parent_id(parent_type))
      end

    module ClassMethods
      attr_reader :parents
        
      protected
        def parent_resources(*parents)
          @parents = parents
        end
    end
  end
end