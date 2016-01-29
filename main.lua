-- Fri 19:13 Jan 29 开始写Lua版字节码反编译器
local print = print
local require = require

local parse     = require 'parse'
local decompile = require 'decompile'


-- main
local f = arg and arg[1]
if f then
    local fc = io.open(f, 'rb'):read('a')
    local ok, res = pcall(parse, fc)
    if ok then
        return decompile(res)
    else
        return print(res)
    end
else
    return print([[usage: lua <file>]])
end
