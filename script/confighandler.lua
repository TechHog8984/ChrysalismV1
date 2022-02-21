local tostring2 = (assert(loadstring(game:HttpGet'https://raw.githubusercontent.com/TechHog8984/ChrysalismV1/main/script/tostring2.lua'), 'failed to get tostring2')());

assert(isfile, 'isfile not found.');
assert(loadfile, 'loadfile not found.');
assert(writefile, 'writefile not found.');


local find = string.find;
local gmatch = string.gmatch;
local function GetConfig(path)
	local Config = {};
	if isfile(path) then
		Config = loadfile(path)();
	else
		if find(path, '/') then
			local currentpath = '';
			for x in gmatch(path, '([^/]+)/') do
				makefolder(currentpath .. '/' .. x);
				currentpath ..= '/' .. x;
			end;
		end;
		writefile(path, 'return{}');
	end;

	return setmetatable(Config, {
		__newindex = function(self, index, value)
			rawset(self, index, value);
			writefile(path, 'return' .. tostring2(self));
		end,
	});
end;

return GetConfig;