return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add          = { text = "│" },
      change       = { text = "│" },
      delete       = { text = "_" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    current_line_blame = false, -- can enable inline blame if you want
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      -- Keymaps
      local map = function(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      map("n", "]c", function()
        if vim.wo.diff then return "]c" end
        vim.schedule(function() gs.next_hunk() end)
        return "<Ignore>"
      end, "Next Hunk")

      map("n", "[c", function()
        if vim.wo.diff then return "[c" end
        vim.schedule(function() gs.prev_hunk() end)
        return "<Ignore>"
      end, "Prev Hunk")

      map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
      map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
      map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
      map("n", "<leader>hb", gs.toggle_current_line_blame, "Toggle Blame")
    end,
  },
}
