--- @sync entry
local function entry(st, job)
  -- find FIXME
  local is_find = false
  local cursor = cx.active.current.cursor + 1
  local total = #cx.active.current.files
  for i = cursor, math.min(total, cursor + 127) do
    if cx.active.current.files[i]:found() ~= nil then
      is_find = true
      break
    end
  end
  if not is_find and cursor ~= 1 then
    for i = cursor - 1, math.max(1, cursor - 128), -1 do
      if cx.active.current.files[i]:found() ~= nil then
        is_find = true
        break
      end
    end
  end
  -- visual
  local is_visual = cx.active.mode.is_visual
  -- select
  local is_select = #cx.active.selected >= 1
  -- filter FIXME
  local is_filter = false
  -- search
  local is_search = cx.active.current.cwd.is_search
  if is_find or is_visual or is_select or is_filter or is_search then
    ya.emit("escape", {})
  else
    ya.emit("quit", {})
  end
end

return { entry = entry }
