return {
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup({
        line_mapping = "<leader>/", -- normal mode
        operator_mapping = "<leader>/", -- When visual mode text is selected
        comment_chunk_text_object = "<leader>/", -- What is this??
      })
    end,
  },
}
