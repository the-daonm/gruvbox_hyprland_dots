return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true, -- Show hidden files in the files picker
          },
          explorer = {
            hidden = true, -- Show hidden files in the explorer
          },
          grep = {
            hidden = true, -- Show hidden files in grep
          },
          grep_word = {
            hidden = true, -- Show hidden files in grep_word
          },
          grep_buffers = {
            hidden = true, -- Show hidden files in grep_buffers
          },
        },
      },
      explorer = {
        hidden = true, -- Show hidden files in the explorer
      },
    },
  },
}
