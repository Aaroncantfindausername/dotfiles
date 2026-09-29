if true then
  return {}
end
return {
  "mfussenegger/nvim-dap",
    -- stylua: ignore
    config = function(_, opts)
      require("dap").setup(opts)
      require("dap").defaults.fallback.exception_breakpoints({"Warning","Error", "Exception"})
    end,
}
