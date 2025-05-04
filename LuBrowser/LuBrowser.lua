function read_file(filename)
    local file = io.open(filename, "r")
    if not file then
        return nil, "Error: Unable to open the file"
    end
    local content = file:read("*all")
    file:close()
    return content
end

function parse_luasite(content)
    local title, content_text = content:match("Title:%s*(.-)\nContent:%s*(.-)\n----")
    if title and content_text then
        return title, content_text
    else
        return nil, "Error: Invalid format or missing Title/Content"
    end
end

function display_luasite(title, content_text)
    os.execute(clear)
    print("Title: " .. title)
    print("\nContent:\n" .. content_text)
end

function open_luasite(file_path)
    local content, error = read_file(file_path)
    if not content then
        print(error)
        return
    end

    local title, content_text = parse_luasite(content)
    if not title then
        print(content_text)
        return
    end

    display_luasite(title, content_text)
end

print("Enter the path to the .s file: ")
local file_path = io.read()

open_luasite(file_path)