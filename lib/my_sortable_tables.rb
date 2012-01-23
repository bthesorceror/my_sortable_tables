require "my_sortable_tables/version"

module MySortableTables

  module SortableController

    def self.included(base)
      base.send(:include, InstanceMethods)
      base.extend(ClassMethods)
      base.class_eval do
        helper_method :sort_column, :sort_direction
        class << self
          attr_accessor :sort_columns
        end
        helper SortableHelper
      end
    end

    module SortableHelper
      def sortable(column, title = nil)
        title ||= column.titleize
        new_params = {}
        css_class = column == sort_column ? "current_column #{sort_direction}" : nil
        new_params[:direction] = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
        new_params[:sort] = column
        new_params[:search] = params[:search] if params[:search] && !params[:search].empty?
        link_to title, new_params, {:class => css_class}
      end
    end

    module ClassMethods
      def sortable_columns(*columns)
        self.sort_columns = columns
      end
    end

    module InstanceMethods
      def sort_column
        self.class.sort_columns.include?(params[:sort]) ? params[:sort] : self.class.sort_columns.first if self.class.sort_columns
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
      end

    end

  end

end
