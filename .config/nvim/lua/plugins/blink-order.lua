return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      providers = {
        snippets = {
          min_keyword_length = 2,
          score_offset = 9,
        },
        lsp = {
          min_keyword_length = 2,
          score_offset = 3,
        },
        path = {
          min_keyword_length = 2,
          score_offset = 2,
        },
        buffer = {
          min_keyword_length = 3,
          score_offset = 1,
        },
      },
    },
  },
}
