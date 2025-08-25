# Neovim AI Configuration
A LazyVim-based Neovim configuration focused on AI-assisted development with GitHub Copilot, CodeCompanion, and MCPHub integration.

ALWAYS reference these instructions first and only fall back to search or bash commands when you encounter unexpected information that conflicts with this documentation.

## Working Effectively

### Prerequisites and Setup
**VERSION COMPATIBILITY WARNING**: This configuration includes CodeCompanion.nvim which requires Neovim 0.11+. 

Installation options:
- **For Neovim 0.11+**: Full functionality including CodeCompanion AI features
- **For Neovim 0.9.x/0.10.x**: Most features work, but CodeCompanion will fail to load

Install required dependencies:
- Install Neovim and Git: `sudo apt-get update && sudo apt-get install -y neovim git`
- Check version: `nvim --version`
- **If using Neovim < 0.11**: Expect CodeCompanion errors during first launch (see troubleshooting)
- Install a Nerd Font (JetBrainsMonoNL recommended for optimal display)

### Installation and Initial Setup
Bootstrap the configuration (NEVER CANCEL - plugin installation takes 5-10 minutes):
- Clone configuration: `git clone https://github.com/Radialarray/nvim-config ~/.config/nvim`
- Launch Neovim: `nvim` -- LazyVim automatically installs all plugins on first launch
- WAIT FOR COMPLETION: First launch takes 5-10 minutes for plugin installation. Set timeout to 15+ minutes.
- Setup GitHub Copilot: `:Copilot auth` (requires GitHub Copilot subscription)
- Optional GitHub Integration: Set `GITHUB_TOKEN` environment variable or run `gh auth login`

### Testing and Validation
Validate the configuration works correctly:

**Basic Configuration Test:**
- Test loading: `nvim --headless -c "echo 'Config loaded successfully'" -c "qall"`
- Should exit cleanly with the success message

**Plugin Installation (First Time Setup):**
- Launch Neovim normally: `nvim` 
- WAIT FOR COMPLETION: First launch takes 5-10 minutes for plugin installation. Set timeout to 15+ minutes.
- **Expected behavior**: LazyVim shows plugin installation progress, may show CodeCompanion errors on Neovim < 0.11 (this is normal)
- Exit with `:q` once installation completes

**Feature Validation:**
- **GitHub Copilot**: Open any code file and verify suggestions appear as you type
- **AI Features (if CodeCompanion loaded)**: Press `<leader>aa` to toggle CodeCompanion chat
- **Basic Editing**: Test syntax highlighting, file navigation, and basic commands work
- **Formatting**: Run `stylua --check .` (install with `cargo install stylua --features=lua54`)

**Automated Health Check:**
- `nvim --headless -c "checkhealth" -c "sleep 2" -c "qall"` (basic health diagnostics)

**File Editing Test:**
- Create test file: `echo 'print("Hello World")' > /tmp/test.lua`
- Edit with nvim: `nvim --headless /tmp/test.lua -c "write" -c "qall"`
- Should save without errors and show file written confirmation

### Key Features and Usage
- **AI Chat Interface**: `<leader>aa` - Toggle CodeCompanion chat window
- **Quick AI Actions**: `<leader>ap` - Prompt actions menu  
- **Code Explanation**: `<leader>ae` - Explain selected code
- **Code Fixing**: `<leader>ax` - Fix code issues
- **Commit Generation**: `<leader>ac` - Generate commit messages
- **Chat History**: `<leader>ah` - View previous AI conversations
- **Multi-cursor**: `<leader>m` - Multi-cursor operations
- **GitHub Integration**: `g` prefix for GitHub PR/issue management

## Configuration Structure

### Directory Layout
```
lua/
├── config/
│   ├── autocmds.lua      # Auto commands (uses LazyVim defaults)
│   ├── keymaps.lua       # Custom key mappings and AI shortcuts
│   ├── lazy.lua          # Lazy.nvim plugin manager bootstrap
│   └── options.lua       # Neovim options and performance settings
├── plugins/
│   ├── ai.lua            # AI tools: Copilot, CodeCompanion, MCPHub
│   ├── autocomplete.lua  # Completion engine configuration
│   ├── colorscheme.lua   # Theme and appearance settings
│   ├── editor.lua        # Editor enhancement plugins
│   └── multicursors.lua  # Multiple cursor functionality
└── init.lua              # Main entry point with Neovide optimizations
```

### Core Components
- **LazyVim Base**: Built on LazyVim framework for reliability and defaults
- **AI Integration**: GitHub Copilot + CodeCompanion + MCPHub for comprehensive AI assistance
- **Plugin Management**: lazy.nvim handles all plugin installation and updates
- **GUI Support**: Optimized for Neovide with performance tweaks and custom keybindings

## Development Workflow

### Making Changes
Follow these steps when modifying the configuration:
- Always test configuration loading: `nvim --headless -c "echo 'Test'" -c "qall"`
- Format Lua code: `stylua .` (automatically formats all .lua files)
- Check formatting: `stylua --check .`
- Test specific plugins by loading and using their features
- Verify AI features work after changes to ai.lua

### Common File Locations
- **AI Configuration**: `lua/plugins/ai.lua` - All AI-related plugin configs
- **Keybindings**: `lua/config/keymaps.lua` - Custom key mappings
- **Options**: `lua/config/options.lua` - Neovim settings and performance tweaks
- **Main Entry**: `init.lua` - Neovide GUI optimizations and bootstrap
- **Plugin Bootstrap**: `lua/config/lazy.lua` - Plugin manager initialization

### Validation Requirements
ALWAYS test these scenarios after making changes:

**Configuration Integrity:**
- `nvim --headless -c "echo 'Test'" -c "qall"` - Must exit cleanly
- `stylua --check .` - Code formatting must be valid
- Configuration should load without Lua errors

**Essential User Workflows:**
- **File Editing**: Open a file, make changes, save successfully
- **Plugin Functionality**: Launch nvim and verify no plugin errors in startup
- **GitHub Copilot**: Open a code file, start typing, verify autosuggestions appear (if authenticated)
- **AI Chat (when available)**: Press `<leader>aa`, verify chat interface opens
- **Multi-cursor**: Press `<leader>m` and verify multi-cursor menu appears

**Post-Change Validation:**
- After modifying AI plugins: Test that `<leader>a` keybindings still work
- After keybinding changes: Test the specific changed keybindings work as expected
- After core config changes: Run full startup test by launching nvim and checking for errors

## Performance and Timing

### Expected Operation Times
- **Configuration Loading**: Instant for subsequent launches after initial setup
- **First-time Plugin Installation**: 5-10 minutes (NEVER CANCEL - set timeout to 15+ minutes)
  - Shows progress with plugin names like [LazyVim] clone, [copilot.lua] clone, etc.
  - May show CodeCompanion compatibility errors on Neovim < 0.11 (expected behavior)
- **Plugin Updates**: 2-5 minutes when running `:Lazy sync`
- **Stylua Formatting**: Under 1 second for entire codebase
- **Basic Validation Commands**: Under 2 seconds each

### Neovide-Specific Optimizations
When running with Neovide GUI:
- All animations disabled for optimal performance
- Custom zoom controls: `<C-+>`, `<C-->`, `<C-0>`
- System clipboard integration: `<C-S-C>`, `<C-S-V>`
- JetBrainsMonoNL Nerd Font configured by default

## Troubleshooting

### Common Issues
- **CodeCompanion fails to load**: Requires Neovim 0.11+. Error: "CodeCompanion.nvim requires Neovim 0.11+"
  - **Workaround for older Neovim**: Edit `lua/plugins/ai.lua` and add `enabled = false` to the codecompanion.nvim plugin config
  - **Full fix**: Install Neovim 0.11+ from nightly builds or compile from source
  - **Alternative**: Use only GitHub Copilot features (copilot.lua works with 0.9.x)
- **Plugin installation fails**: Ensure internet connectivity and wait full 10 minutes
- **Mason registry fails**: Common during first install, usually resolves on retry
- **Copilot not working**: Run `:Copilot auth` and sign in to GitHub
- **AI chat not responding**: Verify GitHub Copilot subscription is active and CodeCompanion is loaded
- **Formatting errors**: Install stylua: `cargo install stylua --features=lua54`

### Validation Commands
Quick health checks:
- `nvim --version` - Verify Neovim 0.8+
- `nvim --headless -c "checkhealth" -c "qall"` - Run health diagnostics
- `stylua --version` - Verify formatter availability
- `:Copilot status` - Check Copilot authentication (within nvim)

## Repository Information
This is a configuration-only repository with no build scripts or test files. The "testing" process involves:
- Loading the configuration successfully
- Verifying plugin installation
- Validating AI features work
- Ensuring code formatting compliance

### Repository Contents
```
/home/runner/work/nvim-config/nvim-config/
├── .gitignore               # Git ignore patterns
├── .neoconf.json           # Neodev and Lua LSP configuration  
├── LICENSE                 # MIT license
├── README.md               # User documentation and setup guide
├── init.lua                # Main entry point, Neovide optimizations
├── lazy-lock.json          # Locked plugin versions
├── lazyvim.json           # LazyVim configuration metadata
├── stylua.toml            # Lua code formatting rules
└── lua/
    ├── config/
    │   ├── autocmds.lua    # Auto commands (LazyVim defaults)
    │   ├── keymaps.lua     # Custom key mappings and AI shortcuts
    │   ├── lazy.lua        # Plugin manager bootstrap
    │   └── options.lua     # Neovim options and performance settings
    └── plugins/
        ├── ai.lua          # AI tools: Copilot, CodeCompanion, MCPHub
        ├── autocomplete.lua # Completion engine (blink.cmp)
        ├── colorscheme.lua  # Themes and appearance
        ├── editor.lua       # Editor enhancement plugins
        └── multicursors.lua # Multiple cursor functionality
```

Always make minimal changes and test thoroughly with the validation scenarios above.