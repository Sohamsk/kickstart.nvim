local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

local function get_comment_prefix()
  local commentstring = vim.bo.commentstring
  if commentstring == '' then
    return '# ' -- Default to `#` if no commentstring is set
  end
  return commentstring:match '^(.*)%%s' or '# '
end

ls.add_snippets('all', {
  s('note', {
    t(get_comment_prefix() .. ' NOTE: '),
  }),
})

ls.add_snippets('go', {
  s('eh', fmt('if {} != nil {{{}}}', { i(1, 'err'), i(0) })),
})
