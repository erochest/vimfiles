
local M = {}

-- Get the name of the current branch. Returns nil if not.
local function get_git_branch()
  local handle = io.popen("git branch --show-current", "r")
  if handle == nil then
    return nil
  end
  return handle:read("*l")
end

-- If branch_name starts with "b-CODE-NNNNN-", return the Ns as the ticket number.
-- Otherwise, returns the branch name.
local function get_ticket_label(branch_name)
  local i, _, code = branch_name.find(branch_name, "b\\-CODE\\-(%d+)\\-")
  if i == 1 then
    return code
  end
  return branch_name
end

-- TODO: This doesn't seem to work.
function M.branch_ticket()
  return get_ticket_label(get_git_branch())
end

return M
