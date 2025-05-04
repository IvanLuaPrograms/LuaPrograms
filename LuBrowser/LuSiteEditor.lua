function read_file(filename)
    local file = io.open(filename, "r")
    if not file then
        return nil, "Error: Unable to open the file"
    end
    local content = file:read("*all")
    file:close()
    return content
end
function save_file(filename, content)
    local file = io.open(filename, "w")
    if not file then
        return "Error: Unable to save the file"
    end
    file:write(content)
    file:close()
    return "File saved successfully"
end
function edit_site(filename)
    local content, error = read_file(filename)
    if not content then
        print("File does not exist. Creating a new site.")
        content = "Title: \nContent: \n----\n"
    end
    print("Current file content:")
    print(content)
    print("\nEnter the new Title: ")
    local title = io.read()
    print("Enter the new Content: ")
    local content_text = io.read()
    print("Enter additional content (after '----'), or press Enter to skip:")
    local additional_content = io.read()
    local new_content = "Title: " .. title .. "\nContent: " .. content_text .. "\n----\n" .. additional_content
    local result = save_file(filename, new_content)
    print(result)
end
function main()
    print("Enter the name of the .s file: ")
    local filename = io.read()

    edit_site(filename)
end
main()
