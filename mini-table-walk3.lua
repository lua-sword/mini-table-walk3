
return function(t, fields, istop)
	assert(type(fields)=="table", "argument #2 is not a table")
	local r = t

	local max = #fields
	if istop then
		if istop<0 then
			max = math.max(0, max+istop+1)
		else
			max = math.min(max, istop)
		end
	end
	for i=1,max do
		if not pcall(function() r = r[fields[i]] end) then
			return nil
		end
	end
	return r
end
