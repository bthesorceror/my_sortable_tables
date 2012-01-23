require "my_sortable_tables/version"

module MySortableTables
  
  module SortableController

    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        helper_method :sort_column, :sort_direction
      end
    end

    module InstanceMethods
      
      def self.sortable_columns(*columns)
        @@sortable_columns = columns
      end
  
      def sort_column
        @@sortable_columns.include?(params[:sort]) ? params[:sort] : @@sortable_columns.first if @@sortable_columns
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
      end

    end

  end

end
