module ApplicationHelper
    def bootstrap_class_for(flash_type)
        case flash_type
          when "success"
            "alert-success"
          when "error"
            "alert-danger"
          when "alert"
            "alert-warning"
          when "notice"
            "alert-info"
          else
            flash_type.to_s
          end
        end

        def welcome_text(id)
            if id.nil?
                'Guest'
            else
                username = !User.find(id).blank? ? User.find(id).username : 'Guest'
            end
        end
end
