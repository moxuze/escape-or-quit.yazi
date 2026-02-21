--- @sync entry
local function entry(st, job)
  ya.dbg(job.args)
  local escape_opts = {
    all = job.args.escape_all,
    find = job.args.escape_find,
    visual = job.args.escape_visual,
    select = job.args.escape_select,
    filter = job.args.escape_filter,
    search = job.args.escape_search,
  }
  local quit_opts = {
    code = job.args.quit_code,
    no_cwd_file = job.args.quit_no_cwd_file,
  }

  local no_escape_opts = true
  for k, v in pairs(escape_opts) do
    if v then
      no_escape_opts = false
      break
    end
  end

  local escape_detect_modes = {
    find = no_escape_opts or escape_opts.all or escape_opts.find,
    visual = no_escape_opts or escape_opts.all or escape_opts.visual,
    select = no_escape_opts or escape_opts.all or escape_opts.select,
    filter = no_escape_opts or escape_opts.all or escape_opts.filter,
    search = no_escape_opts or escape_opts.all or escape_opts.search,
  }
  local find_mode = escape_detect_modes.find and cx.active.finder ~= nil
  local visual_mode = escape_detect_modes.visual and cx.active.mode.is_visual
  local select_mode = escape_detect_modes.select and #cx.active.selected >= 1
  local filter_mode = escape_detect_modes.filter and cx.active.current.files.filter
  local search_mode = escape_detect_modes.search and cx.active.current.cwd.is_search

  if find_mode or visual_mode or select_mode or filter_mode or search_mode then
    ya.emit("escape", escape_opts)
  else
    ya.emit("quit", quit_opts)
  end
end

return { entry = entry }
