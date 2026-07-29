{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    ### GUI Editors ###
    zed-editor # Editor.
    jetbrains.rust-rover # Rust Editor..
    jetbrains.rider # .NET Editor.
    unityhub # Unity Editor.
    obsidian # Markdown Editor.

    ### CLI Editors ###
    tmux # Multiplexer.
    vim # Editor.
    neovim # Editor.
    tree-sitter # Language Parser.

    ### CLI Navigation ###
    fzf # Fuzzy Find.
    yazi # File Explorer TUI.
    poppler # Yazi PDF Preview.
    jq # Yazi JSON Preview.
    ripgrep # Yazi File Search.
    fd # Yazi Directory Search.
    zoxide # Yazi Search History.

    ### AI Tools ###
    opencode
    codex

    ### Languages ###
    # Nix
    nixd
    nixfmt
    # C/C++
    gcc
    gnumake
    cmake
    gdb
    # Rust
    rustup
    # Python
    uv
    ruff
    python314
    pyright
    # Lua
    luajitPackages.lua-lsp
    stylua
    # JS/HTML/CSS
    nodejs_22
    prettierd

    ### Misc ###
    curl
    wget
  ];
}
