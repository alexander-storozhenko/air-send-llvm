module Commands
    module Init
        macro properties
            property folder_commands : Folder | Nil
            property user_commands : User | Nil
            property content_commands : Content | Nil
            property main_commands : Main | Nil
        end

        macro initialize_commands
            @folder_commands = Folder.new
            @user_commands = User.new
            @content_commands = Content.new
            @main_commands = Main.new
        end
    end
end
