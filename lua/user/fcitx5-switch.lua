if vim.fn.executable("fcitx5-remote") == 1 then
    local normal_im = "keyboard-us" -- check with `fcitx5-remote -n`

    local function switch_to_english()
        vim.fn.jobstart({ "fcitx5-remote", "-s", normal_im }, { detach = true })
    end

    local fcitx_group = vim.api.nvim_create_augroup("FcitxAsync", { clear = true })

    vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave" }, {
        group = fcitx_group,
        pattern = "*",
        callback = switch_to_english,
    })
end
