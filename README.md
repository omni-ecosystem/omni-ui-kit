# omni-ui-kit

Terminal styling primitives for omni ecosystem: colors, UI components, and animations. This is intended to be used *together* with other TUI apps as a base for UI handling, not run individually. The following commands are for testing purposes only.

## Installation

Run the install script to clone the repository to `~/.omni-ecosystem/omni-ui-kit`:

```bash
curl -fsSL https://raw.githubusercontent.com/omni-ecosystem/omni-ui-kit/refs/heads/main/install.sh | bash
```

The script will create the installation directory if needed. Running it again will update an existing installation. To remove, run `./uninstall.sh` from the installation directory.

## Usage

```bash
source omni-ui-kit/index.sh
```

Or load individual modules:

```bash
source omni-ui-kit/colors.sh      # just colors
source omni-ui-kit/ui.sh          # colors + UI components
source omni-ui-kit/animations.sh  # colors + loading spinner
```

`ui.sh` and `animations.sh` auto-source `colors.sh` if needed.

## Colors

### Variables

| Variable | Value |
|----------|-------|
| `RED`, `GREEN`, `BLUE`, `WHITE` | Basic colors |
| `BRIGHT_RED`, `BRIGHT_GREEN`, `BRIGHT_YELLOW` | Bright variants |
| `BRIGHT_BLUE`, `BRIGHT_PURPLE`, `BRIGHT_CYAN`, `BRIGHT_WHITE` | Bright variants |
| `BOLD`, `ITALIC`, `DIM` | Text styles |
| `NC` | Reset / no color |

### Functions

```bash
print_color "$BRIGHT_CYAN" "colored text"
```

## UI Components

```bash
print_header "TITLE"          # Bold title with underline
print_separator               # Horizontal rule (optional color arg)
print_success "it worked"     # [success] green
print_error "it broke"        # [error] red
print_warning "watch out"     # [warning] yellow
print_info "fyi"              # [info] white
print_step "doing thing"      # → blue
print_warning_box             # Boxed warning banner
wait_for_enter                # "Press Enter to continue..." prompt
get_terminal_width            # Returns width (clamped 60-120)
```

## Animations

```bash
show_loading "Loading config" 3   # Braille spinner for 3 seconds
show_loading "Quick task"         # Default: 2 seconds
```

## File structure

```
omni-ui-kit/
  index.sh       — loads all modules
  colors.sh      — color variables + print_color
  ui.sh          — headers, messages, separators
  animations.sh  — loading spinner
```
