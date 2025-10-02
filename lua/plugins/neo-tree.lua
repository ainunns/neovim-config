return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          -- Show hidden files (dotfiles)
          hide_dotfiles = false,
          -- Hide gitignored files to reduce noise (overridden by always_show*)
          hide_gitignored = true,
          -- Do not show other filtered items (keep them hidden)
          visible = false,
          -- Always hide the .git directory anywhere
          never_show = { ".git" },
          -- Always show any .env* files, even if ignored or hidden
          always_show = { "dist", "in" },
          always_show_by_pattern = {
            ".env*",
          },
        },
      },
    },
  },
}
