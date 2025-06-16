# 🚀 Neovim Configuration

A clean and well-documented [LazyVim](https://github.com/LazyVim/LazyVim) configuration focused on AI-assisted development, productivity, and performance.

## ✨ Features

### 🤖 AI Integration
- **CodeCompanion**: AI-powered coding assistant with chat interface
- **GitHub Copilot**: Code completion and suggestions
- **MCPHub**: Model Context Protocol integration for external tools
- **History Management**: Persistent chat history with the codecompanion-history plugin

### 🎨 UI & Appearance
- **GitHub Dark Theme**: Clean, professional dark colorscheme
- **Enhanced Markdown**: Beautiful rendering for markdown files and AI chats
- **Todo Comments**: Highlighted TODO, FIXME, NOTE, and other comment annotations
- **Custom Icons**: Nerd Font icons throughout the interface

### ⚡ Productivity Tools
- **Multi-cursor Support**: Edit multiple locations simultaneously
- **Git Integration**: Enhanced git signs and status information
- **GitHub Integration**: Complete pull request and issue management with Octo.nvim
- **Image Clipboard**: Easy image pasting in markdown files
- **Smart Completion**: AI-enhanced completion with blink.cmp

### 🖥️ Neovide Support
- **Performance Optimized**: All animations disabled for better performance
- **Custom Keybindings**: System clipboard integration and zoom controls
- **Font Configuration**: JetBrainsMonoNL Nerd Font setup

## 🔧 Configuration Structure

```
lua/
├── config/
│   ├── autocmds.lua      # Auto commands (uses LazyVim defaults)
│   ├── keymaps.lua       # Key mappings (uses LazyVim defaults)
│   ├── lazy.lua          # Lazy.nvim bootstrap and configuration
│   └── options.lua       # Neovim options and settings
├── plugins/
│   ├── ai.lua            # AI tools and integrations
│   ├── colorscheme.lua   # Theme and colorscheme settings
│   ├── editor.lua        # Editor enhancement plugins
│   └── multicursors.lua  # Multiple cursor functionality
└── init.lua              # Main entry point with Neovide setup
```

## 📋 Key Bindings

### AI Assistant (`<leader>a`)
| Key | Description |
|-----|-------------|
| `<leader>aa` | Toggle AI chat |
| `<leader>ap` | AI prompt actions |
| `<leader>aq` | Quick AI chat |
| `<leader>ax` | Fix code with AI |
| `<leader>ae` | Explain code with AI |
| `<leader>ac` | Generate commit message |
| `<leader>ah` | View chat history |

### Multi-cursor (`<leader>m`)
| Key | Description |
|-----|-------------|
| `<leader>m` | Create multicursor selection |
| `<leader>ma` | Select all matches |

### GitHub Integration (`g`)
| Key | Description |
|-----|-------------|
| `gc` | Create pull request |
| `gC` | Create issue |
| `go` | Checkout pull request |
| `gl` | List PR commits |
| `gd` | Show PR diff |
| `gf` | Show PR changes |

### Neovide-specific
| Key | Description |
|-----|-------------|
| `<C-S-C>` | Copy to system clipboard |
| `<C-S-V>` | Paste from system clipboard |
| `<C-+>` | Zoom in |
| `<C-->` | Zoom out |
| `<C-0>` | Reset zoom |

## 🚀 Installation

1. **Prerequisites**:
   - Neovim 0.8+ 
   - Git
   - A Nerd Font (JetBrainsMonoNL recommended for Neovide)
   - GitHub Copilot subscription (for AI features)

2. **Clone the configuration**:
   ```bash
   git clone https://github.com/Radialarray/nvim-config ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```
   
   LazyVim will automatically install all plugins on first launch.

4. **Setup GitHub Copilot**:
   ```vim
   :Copilot auth
   ```

5. **Setup GitHub Integration** (optional for Octo.nvim):
   ```bash
   # Create a GitHub personal access token with repo permissions
   # at https://github.com/settings/tokens
   export GITHUB_TOKEN=your_token_here
   ```
   Or configure via gh CLI:
   ```bash
   gh auth login
   ```

## ⚙️ Customization

### Changing Colorscheme
Edit `lua/plugins/colorscheme.lua`:
```lua
{
  "LazyVim/LazyVim",
  opts = {
    colorscheme = "your_preferred_theme", -- Change this
  },
}
```

Available themes:
- `github_dark_default` (current)
- `github_light_default`
- `xcode`
- `material`

### Disabling AI Features
To disable AI features, set `enabled = false` in `lua/plugins/ai.lua`:
```lua
{
  "olimorris/codecompanion.nvim",
  enabled = false, -- Add this line
  -- ... rest of config
}
```

### Performance Tuning
The configuration is already optimized for performance:
- Snacks animations disabled
- Neovide animations disabled
- Lazy loading for most plugins

## 📁 Plugin Overview

### Core AI Stack
- **codecompanion.nvim**: Main AI interface
- **copilot.lua**: GitHub Copilot integration
- **mcphub.nvim**: External tool integration
- **render-markdown.nvim**: Enhanced markdown display

### Editor Enhancements
- **todo-comments.nvim**: Highlight and navigate TODO comments
- **gitsigns.nvim**: Git status in signs column
- **octo.nvim**: GitHub pull request and issue integration
- **multicursors.nvim**: Multiple cursor editing
- **img-clip.nvim**: Image clipboard integration

### UI & Themes
- **github-nvim-theme**: GitHub-inspired colorschemes
- **vim-colors-xcode**: Xcode-inspired themes  
- **material.nvim**: Material Design themes

## 🤝 Contributing

Feel free to submit issues and pull requests to improve this configuration.

## 📄 License

This configuration is licensed under the MIT License. See [LICENSE](LICENSE) for details.

---

Built with ❤️ using [LazyVim](https://lazyvim.github.io/)
