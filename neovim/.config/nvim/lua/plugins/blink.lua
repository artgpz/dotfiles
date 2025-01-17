return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      trigger = {
        show_on_insert_on_trigger_character = false,
        show_on_accept_on_trigger_character = false,
      },
    },
  },
  -- allows extending the providers array elsewhere in your config
  -- without having to redefine it
  opts_extend = { "sources.default" },
}
