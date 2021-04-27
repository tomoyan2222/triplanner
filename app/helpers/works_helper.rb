module WorksHelper
    def session_manager
        session[:manager] = true
    end

    def manager_logined
        if session[:manager]
        else
            redirect_to works_login_path
        end
    end

    def manager_sign_out
        session[:manager] = false
    end

    def region_json
        File.open("#{Rails.public_path}/json/area.json") do |j|
            @json_str = JSON.load(j)
            @str_param = {}
            @json_str.each do |str|
                @str_param.store(str["name"], str["id"])
            end
        end
    end

    def upload_thumbnail(a, b)
        File.open("public/spot_thumbnail/#{a}", 'wb') do |f|
            f.write(b.read)
        end
    end

    def upload_image(a, b)
        File.open("public/spot_images/#{a}", 'wb') do |f|
            f.write(b.read)
        end
    end
end
