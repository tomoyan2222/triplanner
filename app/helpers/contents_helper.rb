module ContentsHelper
    def area_list(id)
        @json_str.select do |str|
            str["region"] == id
        end
    end
end
