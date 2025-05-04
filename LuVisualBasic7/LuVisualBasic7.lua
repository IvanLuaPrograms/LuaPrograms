function showMenu()
    print("==== LuVisualBasic7 ====")
    print("1. Run a script (.lvb file)")
    print("2. Exit")
end
function runScript(filename)
    -- Check if the file has the correct .lvb extension
    if filename:match("%.lvb$") then
        local file, err = loadfile(filename)
        if file then
            print("Running script: " .. filename)
            -- Execute the script
            local success, exec_err = pcall(file)
            if not success then
                print("Error during script execution: " .. exec_err)
            end
        else
            print("Error opening the file: " .. err)
        end
    else
        print("The file does not have the correct extension (.lvb).")
    end
end
while true do
    showMenu()
    io.write("Choose an option: ")
    local choice = tonumber(io.read()) -- Read user choice

    if choice == 1 then
        io.write("Enter the path to the .lvb file: ")
        local filename = io.read() -- Read the file path
        runScript(filename)
    elseif choice == 2 then
        print("Exiting the program...")
        break
    else
        print("Invalid choice. Please try again.")
    end

    print() -- Blank line for better readability
end
