# Quasar Development Container

This repository contains a complete VS Code DevContainer configuration for Quasar Framework development. It provides a consistent, reproducible development environment with all necessary tools and extensions pre-configured.

## 🚀 Quick Start

### Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running
- [VS Code](https://code.visualstudio.com/) with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

### Setup Instructions

1. **Clone or create your Quasar project**
   ```bash
   # For new projects
   npm create quasar@latest my-quasar-app
   cd my-quasar-app
   
   # For existing projects
   cd your-existing-quasar-project
   ```

2. **Add DevContainer configuration**
   
   Create the following directory structure in your project root:
   ```
   .devcontainer/
   └── devcontainer.json
   
   .vscode/
   ├── settings.json
   ├── launch.json
   └── extensions.json
   ```

3. **Copy the configuration files**
   
   Use the provided configuration files from this repository and place them in the appropriate directories.

4. **Update launch.json**
   
   In `.vscode/launch.json`, replace `"your-package-name"` with the actual `name` property from your `package.json` file:
   ```json
   "sourceMapPathOverrides": {
     "webpack://YOUR_ACTUAL_PACKAGE_NAME/./src/*": "${webRoot}/*"
   }
   ```

5. **Open in DevContainer**
   
   - Open your project in VS Code
   - Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
   - Type "Dev Containers: Reopen in Container"
   - Select the command and wait for the container to build

## 📦 What's Included

### Development Environment
- **Node.js 20** on Debian Bullseye
- **Quasar CLI** installed globally
- **Git** and **GitHub CLI** pre-configured
- **npm/yarn** package managers

### VS Code Extensions
The container automatically installs these essential extensions:

#### Vue.js & Quasar
- **Vue.volar** - Vue Language Features
- **Vue.vscode-typescript-vue-plugin** - TypeScript support for Vue
- **abdelaziz18003.quasar-snippets** - Quasar-specific code snippets

#### Code Quality & Formatting
- **ESLint** - JavaScript/TypeScript linting
- **Prettier** - Code formatting
- **EditorConfig** - Consistent coding styles

#### Development Tools
- **GitLens** - Enhanced Git capabilities
- **Path IntelliSense** - Autocomplete for file paths
- **npm IntelliSense** - Autocomplete for npm modules
- **Import Cost** - Display import sizes
- **Error Lens** - Inline error highlighting

#### HTML/CSS Support
- **Auto Rename Tag** - Automatic HTML tag renaming
- **Auto Close Tag** - Automatic HTML tag closing
- **Tailwind CSS** - Tailwind CSS IntelliSense

### Pre-configured Settings
- **Format on save** enabled
- **ESLint integration** for Vue, JavaScript, and TypeScript files
- **Bracket pair colorization** and guides
- **Vue file associations** and Emmet support
- **TypeScript configuration** optimized for Quasar
- **Search exclusions** for build directories

## 🛠️ Usage

### Starting Development

Once the container is running:

1. **Install dependencies** (if not already done):
   ```bash
   npm install
   # or
   yarn install
   ```

2. **Start the development server**:
   ```bash
   npm run dev
   # or
   yarn dev
   # or
   quasar dev
   ```

3. **Access your application**:
   - The dev server will be available at `http://localhost:8080`
   - VS Code will automatically forward the port and notify you

### Available Ports

The container automatically forwards these ports:
- **8080** - Quasar development server (SPA mode)
- **8081** - Alternative development port
- **9000** - Quasar SSR server
- **9001** - Alternative SSR port
- **9090** - Additional development port

### Debugging

The container includes debugging configurations for:

1. **Chrome Debugging**:
   - Press `F5` or go to Run and Debug panel
   - Select "Quasar App: Chrome" configuration
   - Make sure your dev server is running first

2. **SSR Debugging**:
   - Use "Quasar SSR: Chrome" configuration
   - Requires SSR mode to be running

3. **Build Process Debugging**:
   - Use "Quasar Build Process" configuration
   - Debug the Quasar CLI build process directly

### Common Commands

```bash
# Development server
quasar dev

# Build for production
quasar build

# Add Quasar mode (PWA, SSR, etc.)
quasar mode add pwa

# Add Quasar plugin
quasar ext add @quasar/testing-unit-vitest

# Lint your code
npm run lint

# Format your code
npm run format
```

## 🔧 Customization

### Adding More Extensions

Edit `.devcontainer/devcontainer.json` and add extension IDs to the `extensions` array:

```json
"extensions": [
  "existing.extensions",
  "your.new-extension"
]
```

### Modifying Settings

Update `.vscode/settings.json` to customize VS Code behavior:

```json
{
  "editor.fontSize": 14,
  "workbench.colorTheme": "Dark+ (default dark)"
}
```

### Port Configuration

Modify port forwarding in `.devcontainer/devcontainer.json`:

```json
"forwardPorts": [8080, 3000, 8000],
"portsAttributes": {
  "3000": {
    "label": "Custom Server"
  }
}
```

## 🐛 Troubleshooting

### Container Won't Start
- Ensure Docker Desktop is running
- Check Docker has enough resources allocated
- Try rebuilding: "Dev Containers: Rebuild Container"

### Extensions Not Installing
- Rebuild the container
- Check internet connection
- Manually install extensions after container starts

### Port Already in Use
- Check if another service is using port 8080
- Modify `forwardPorts` in devcontainer.json
- Use `quasar dev --port 3000` to use different port

### Performance Issues
- Increase Docker Desktop memory allocation
- Close unnecessary VS Code windows
- Use `.dockerignore` to exclude large directories

### Debugging Not Working
- Ensure source maps are enabled in your Quasar config
- Check that the package name in launch.json matches your package.json
- Restart the debugging session after making changes

## 📁 Project Structure

```
your-quasar-project/
├── .devcontainer/
│   └── devcontainer.json          # DevContainer configuration
├── .vscode/
│   ├── settings.json              # VS Code workspace settings
│   ├── launch.json                # Debugging configurations
│   └── extensions.json            # Recommended extensions
├── src/                           # Your Quasar application code
├── public/                        # Static assets
├── quasar.config.js              # Quasar configuration
├── package.json                   # Project dependencies
└── README.md                      # This file
```

## 🤝 Contributing

Feel free to submit issues and enhancement requests! When contributing:

1. Fork the repository
2. Create your feature branch
3. Test your changes thoroughly
4. Submit a pull request with a clear description

## 📚 Additional Resources

- [Quasar Framework Documentation](https://quasar.dev/)
- [VS Code DevContainer Documentation](https://code.visualstudio.com/docs/devcontainers/containers)
- [Docker Documentation](https://docs.docker.com/)
- [Vue.js Documentation](https://vuejs.org/)

## 📄 License

This DevContainer configuration is provided as-is under the MIT License. See your project's license for application code licensing.

---

**Happy coding with Quasar! 🎉**

