return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            'nvim-neotest/neotest-jest'
        },
        config = function()
            local neotest = require("neotest")
            neotest.setup({
                adapters = {
                    require('neotest-jest')({
                        jestCommand = "npm run test --",
                        jestConfigFile = "jest.config.js",
                        env = { CI = true },
                        cwd = function(path)
                            return vim.fn.getcwd()
                        end,
                    }),
                }
            })

            vim.keymap.set("n", "<leader>to", function()
                neotest.run.run()
            end)

            vim.keymap.set("n", "<leader>tf", function()
                neotest.run.run(vim.fn.expand("%"))
            end)
        end,
    },
}
