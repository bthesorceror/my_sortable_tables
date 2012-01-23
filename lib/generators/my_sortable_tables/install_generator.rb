module MySortableTables
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def copy_images
      copy_file("assets/images/up_arrow.gif",   "public/images/up_arrow.gif")
      copy_file("assets/images/down_arrow.gif", "public/images/down_arrow.gif")
    end

  end
end
