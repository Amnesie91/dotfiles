return {
    {
        "saghen/blink.cmp",
        optional = true,
        dependencies = { "zbirenbaum/copilot.lua" },
        opts = {
          sources = {
            default = { "lsp", "path", "snippets", "buffer", "copilot" },
            providers = {
              copilot = {
                name = "copilot",
                module = "blink-cmp-copilot",
                score_offset = 100,
                async = true,
              },
            },
          },
        },
  }
}
