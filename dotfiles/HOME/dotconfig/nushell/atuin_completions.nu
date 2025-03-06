module completions {

  # Magical shell history
  export extern atuin [
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Manipulate shell history
  export extern "atuin history" [
    --help(-h)                # Print help
  ]

  # Begins a new command in the history
  export extern "atuin history start" [
    ...command: string
    --help(-h)                # Print help
  ]

  # Finishes a new command in the history (adds time, exit code)
  export extern "atuin history end" [
    id: string
    --exit(-e): string
    --duration(-d): string
    --help(-h)                # Print help
  ]

  def "nu-complete atuin history list reverse" [] {
    [ "true" "false" ]
  }

  # List all items in history
  export extern "atuin history list" [
    --cwd(-c)
    --session(-s)
    --human
    --cmd-only                # Show only the text of the command
    --print0                  # Terminate the output with a null, for better multiline support
    --reverse(-r): string@"nu-complete atuin history list reverse"
    --timezone: string        # Display the command time in another timezone other than the configured default
    --tz: string              # Display the command time in another timezone other than the configured default
    --format(-f): string      # Available variables: {command}, {directory}, {duration}, {user}, {host}, {exit} and {time}. Example: --format "{time} - [{duration}] - {directory}$\t{command}"
    --help(-h)                # Print help (see more with '--help')
  ]

  # Get the last command ran
  export extern "atuin history last" [
    --human
    --cmd-only                # Show only the text of the command
    --timezone: string        # Display the command time in another timezone other than the configured default
    --tz: string              # Display the command time in another timezone other than the configured default
    --format(-f): string      # Available variables: {command}, {directory}, {duration}, {user}, {host} and {time}. Example: --format "{time} - [{duration}] - {directory}$\t{command}"
    --help(-h)                # Print help (see more with '--help')
  ]

  export extern "atuin history init-store" [
    --help(-h)                # Print help
  ]

  # Delete history entries matching the configured exclusion filters
  export extern "atuin history prune" [
    --dry-run(-n)             # List matching history lines without performing the actual deletion
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin history help" [
  ]

  # Begins a new command in the history
  export extern "atuin history help start" [
  ]

  # Finishes a new command in the history (adds time, exit code)
  export extern "atuin history help end" [
  ]

  # List all items in history
  export extern "atuin history help list" [
  ]

  # Get the last command ran
  export extern "atuin history help last" [
  ]

  export extern "atuin history help init-store" [
  ]

  # Delete history entries matching the configured exclusion filters
  export extern "atuin history help prune" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin history help help" [
  ]

  # Import shell history from file
  export extern "atuin import" [
    --help(-h)                # Print help
  ]

  # Import history for the current shell
  export extern "atuin import auto" [
    --help(-h)                # Print help
  ]

  # Import history from the zsh history file
  export extern "atuin import zsh" [
    --help(-h)                # Print help
  ]

  # Import history from the zsh history file
  export extern "atuin import zsh-hist-db" [
    --help(-h)                # Print help
  ]

  # Import history from the bash history file
  export extern "atuin import bash" [
    --help(-h)                # Print help
  ]

  # Import history from the replxx history file
  export extern "atuin import replxx" [
    --help(-h)                # Print help
  ]

  # Import history from the resh history file
  export extern "atuin import resh" [
    --help(-h)                # Print help
  ]

  # Import history from the fish history file
  export extern "atuin import fish" [
    --help(-h)                # Print help
  ]

  # Import history from the nu history file
  export extern "atuin import nu" [
    --help(-h)                # Print help
  ]

  # Import history from the nu history file
  export extern "atuin import nu-hist-db" [
    --help(-h)                # Print help
  ]

  # Import history from xonsh json files
  export extern "atuin import xonsh" [
    --help(-h)                # Print help
  ]

  # Import history from xonsh sqlite db
  export extern "atuin import xonsh-sqlite" [
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin import help" [
  ]

  # Import history for the current shell
  export extern "atuin import help auto" [
  ]

  # Import history from the zsh history file
  export extern "atuin import help zsh" [
  ]

  # Import history from the zsh history file
  export extern "atuin import help zsh-hist-db" [
  ]

  # Import history from the bash history file
  export extern "atuin import help bash" [
  ]

  # Import history from the replxx history file
  export extern "atuin import help replxx" [
  ]

  # Import history from the resh history file
  export extern "atuin import help resh" [
  ]

  # Import history from the fish history file
  export extern "atuin import help fish" [
  ]

  # Import history from the nu history file
  export extern "atuin import help nu" [
  ]

  # Import history from the nu history file
  export extern "atuin import help nu-hist-db" [
  ]

  # Import history from xonsh json files
  export extern "atuin import help xonsh" [
  ]

  # Import history from xonsh sqlite db
  export extern "atuin import help xonsh-sqlite" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin import help help" [
  ]

  # Calculate statistics for your history
  export extern "atuin stats" [
    ...period: string         # Compute statistics for the specified period, leave blank for statistics since the beginning. See [this](https://docs.atuin.sh/reference/stats/) for more details
    --count(-c): string       # How many top commands to list
    --ngram-size(-n): string  # The number of consecutive commands to consider
    --help(-h)                # Print help
  ]

  def "nu-complete atuin search filter_mode" [] {
    [ "global" "host" "session" "directory" "workspace" ]
  }

  def "nu-complete atuin search search_mode" [] {
    [ "prefix" "full-text" "fuzzy" "skim" ]
  }

  def "nu-complete atuin search keymap_mode" [] {
    [ "emacs" "vim-normal" "vim-insert" "auto" ]
  }

  # Interactive history search
  export extern "atuin search" [
    --cwd(-c): string         # Filter search result by directory
    --exclude-cwd: string     # Exclude directory from results
    --exit(-e): string        # Filter search result by exit code
    --exclude-exit: string    # Exclude results with this exit code
    --before(-b): string      # Only include results added before this date
    --after: string           # Only include results after this date
    --limit: string           # How many entries to return at most
    --offset: string          # Offset from the start of the results
    --interactive(-i)         # Open interactive search UI
    --filter-mode: string@"nu-complete atuin search filter_mode" # Allow overriding filter mode over config
    --search-mode: string@"nu-complete atuin search search_mode" # Allow overriding search mode over config
    --shell-up-key-binding    # Marker argument used to inform atuin that it was invoked from a shell up-key binding (hidden from help to avoid confusion)
    --keymap-mode: string@"nu-complete atuin search keymap_mode" # Notify the keymap at the shell's side
    --human                   # Use human-readable formatting for time
    ...query: string
    --cmd-only                # Show only the text of the command
    --delete                  # Delete anything matching this query. Will not print out the match
    --delete-it-all           # Delete EVERYTHING!
    --reverse(-r)             # Reverse the order of results, oldest first
    --timezone: string        # Display the command time in another timezone other than the configured default
    --tz: string              # Display the command time in another timezone other than the configured default
    --format(-f): string      # Available variables: {command}, {directory}, {duration}, {user}, {host}, {time}, {exit} and {relativetime}. Example: --format "{time} - [{duration}] - {directory}$\t{command}"
    --inline-height: string   # Set the maximum number of lines Atuin's interface should take up
    --help(-h)                # Print help (see more with '--help')
  ]

  # Sync with the configured server
  export extern "atuin sync" [
    --force(-f)               # Force re-download everything
    --help(-h)                # Print help
  ]

  # Login to the configured server
  export extern "atuin login" [
    --username(-u): string
    --password(-p): string
    --key(-k): string         # The encryption key for your account
    --help(-h)                # Print help
  ]

  # Log out
  export extern "atuin logout" [
    --help(-h)                # Print help
  ]

  # Register with the configured server
  export extern "atuin register" [
    --username(-u): string
    --password(-p): string
    --email(-e): string
    --help(-h)                # Print help
  ]

  # Print the encryption key for transfer to another machine
  export extern "atuin key" [
    --base64                  # Switch to base64 output of the key
    --help(-h)                # Print help
  ]

  # Display the sync status
  export extern "atuin status" [
    --help(-h)                # Print help
  ]

  # Manage your sync account
  export extern "atuin account" [
    --help(-h)                # Print help
  ]

  # Login to the configured server
  export extern "atuin account login" [
    --username(-u): string
    --password(-p): string
    --key(-k): string         # The encryption key for your account
    --help(-h)                # Print help
  ]

  export extern "atuin account register" [
    --username(-u): string
    --password(-p): string
    --email(-e): string
    --help(-h)                # Print help
  ]

  # Log out
  export extern "atuin account logout" [
    --help(-h)                # Print help
  ]

  # Delete your account, and all synced data
  export extern "atuin account delete" [
    --help(-h)                # Print help
  ]

  # Change your password
  export extern "atuin account change-password" [
    --current-password(-c): string
    --new-password(-n): string
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin account help" [
  ]

  # Login to the configured server
  export extern "atuin account help login" [
  ]

  export extern "atuin account help register" [
  ]

  # Log out
  export extern "atuin account help logout" [
  ]

  # Delete your account, and all synced data
  export extern "atuin account help delete" [
  ]

  # Change your password
  export extern "atuin account help change-password" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin account help help" [
  ]

  # Get or set small key-value pairs
  export extern "atuin kv" [
    --help(-h)                # Print help
  ]

  export extern "atuin kv set" [
    --key(-k): string
    --namespace(-n): string
    value: string
    --help(-h)                # Print help
  ]

  export extern "atuin kv get" [
    key: string
    --namespace(-n): string
    --help(-h)                # Print help
  ]

  export extern "atuin kv list" [
    --namespace(-n): string
    --all-namespaces(-a)
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin kv help" [
  ]

  export extern "atuin kv help set" [
  ]

  export extern "atuin kv help get" [
  ]

  export extern "atuin kv help list" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin kv help help" [
  ]

  # Manage the atuin data store
  export extern "atuin store" [
    --help(-h)                # Print help
  ]

  # Print the current status of the record store
  export extern "atuin store status" [
    --help(-h)                # Print help
  ]

  # Rebuild a store (eg atuin store rebuild history)
  export extern "atuin store rebuild" [
    tag: string
    --help(-h)                # Print help
  ]

  # Re-encrypt the store with a new key (potential for data loss!)
  export extern "atuin store rekey" [
    key?: string              # The new key to use for encryption. Omit for a randomly-generated key
    --help(-h)                # Print help
  ]

  # Delete all records in the store that cannot be decrypted with the current key
  export extern "atuin store purge" [
    --help(-h)                # Print help
  ]

  # Verify that all records in the store can be decrypted with the current key
  export extern "atuin store verify" [
    --help(-h)                # Print help
  ]

  # Push all records to the remote sync server (one way sync)
  export extern "atuin store push" [
    --tag(-t): string         # The tag to push (eg, 'history'). Defaults to all tags
    --host: string            # The host to push, in the form of a UUID host ID. Defaults to the current host
    --force                   # Force push records This will override both host and tag, to be all hosts and all tags. First clear the remote store, then upload all of the local store
    --help(-h)                # Print help
  ]

  # Pull records from the remote sync server (one way sync)
  export extern "atuin store pull" [
    --tag(-t): string         # The tag to push (eg, 'history'). Defaults to all tags
    --force                   # Force push records This will first wipe the local store, and then download all records from the remote
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin store help" [
  ]

  # Print the current status of the record store
  export extern "atuin store help status" [
  ]

  # Rebuild a store (eg atuin store rebuild history)
  export extern "atuin store help rebuild" [
  ]

  # Re-encrypt the store with a new key (potential for data loss!)
  export extern "atuin store help rekey" [
  ]

  # Delete all records in the store that cannot be decrypted with the current key
  export extern "atuin store help purge" [
  ]

  # Verify that all records in the store can be decrypted with the current key
  export extern "atuin store help verify" [
  ]

  # Push all records to the remote sync server (one way sync)
  export extern "atuin store help push" [
  ]

  # Pull records from the remote sync server (one way sync)
  export extern "atuin store help pull" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin store help help" [
  ]

  # Manage your dotfiles with Atuin
  export extern "atuin dotfiles" [
    --help(-h)                # Print help
  ]

  # Manage shell aliases with Atuin
  export extern "atuin dotfiles alias" [
    --help(-h)                # Print help
  ]

  # Set an alias
  export extern "atuin dotfiles alias set" [
    name: string
    value: string
    --help(-h)                # Print help
  ]

  # Delete an alias
  export extern "atuin dotfiles alias delete" [
    name: string
    --help(-h)                # Print help
  ]

  # List all aliases
  export extern "atuin dotfiles alias list" [
    --help(-h)                # Print help
  ]

  # Delete all aliases
  export extern "atuin dotfiles alias clear" [
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin dotfiles alias help" [
  ]

  # Set an alias
  export extern "atuin dotfiles alias help set" [
  ]

  # Delete an alias
  export extern "atuin dotfiles alias help delete" [
  ]

  # List all aliases
  export extern "atuin dotfiles alias help list" [
  ]

  # Delete all aliases
  export extern "atuin dotfiles alias help clear" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin dotfiles alias help help" [
  ]

  # Manage shell and environment variables with Atuin
  export extern "atuin dotfiles var" [
    --help(-h)                # Print help
  ]

  # Set a variable
  export extern "atuin dotfiles var set" [
    name: string
    value: string
    --no-export(-n)
    --help(-h)                # Print help
  ]

  # Delete a variable
  export extern "atuin dotfiles var delete" [
    name: string
    --help(-h)                # Print help
  ]

  # List all variables
  export extern "atuin dotfiles var list" [
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin dotfiles var help" [
  ]

  # Set a variable
  export extern "atuin dotfiles var help set" [
  ]

  # Delete a variable
  export extern "atuin dotfiles var help delete" [
  ]

  # List all variables
  export extern "atuin dotfiles var help list" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin dotfiles var help help" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin dotfiles help" [
  ]

  # Manage shell aliases with Atuin
  export extern "atuin dotfiles help alias" [
  ]

  # Set an alias
  export extern "atuin dotfiles help alias set" [
  ]

  # Delete an alias
  export extern "atuin dotfiles help alias delete" [
  ]

  # List all aliases
  export extern "atuin dotfiles help alias list" [
  ]

  # Delete all aliases
  export extern "atuin dotfiles help alias clear" [
  ]

  # Manage shell and environment variables with Atuin
  export extern "atuin dotfiles help var" [
  ]

  # Set a variable
  export extern "atuin dotfiles help var set" [
  ]

  # Delete a variable
  export extern "atuin dotfiles help var delete" [
  ]

  # List all variables
  export extern "atuin dotfiles help var list" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin dotfiles help help" [
  ]

  def "nu-complete atuin init shell" [] {
    [ "zsh" "bash" "fish" "nu" "xonsh" ]
  }

  # Print Atuin's shell init script
  export extern "atuin init" [
    shell: string@"nu-complete atuin init shell"
    --disable-ctrl-r          # Disable the binding of CTRL-R to atuin
    --disable-up-arrow        # Disable the binding of the Up Arrow key to atuin
    --help(-h)                # Print help (see more with '--help')
  ]

  # Information about dotfiles locations and ENV vars
  export extern "atuin info" [
    --help(-h)                # Print help
  ]

  # Run the doctor to check for common issues
  export extern "atuin doctor" [
    --help(-h)                # Print help
  ]

  export extern "atuin daemon" [
    --help(-h)                # Print help
  ]

  # Print example configuration
  export extern "atuin default-config" [
    --help(-h)                # Print help
  ]

  # Start an atuin server
  export extern "atuin server" [
    --help(-h)                # Print help
  ]

  # Start the server
  export extern "atuin server start" [
    --host: string            # The host address to bind
    --port(-p): string        # The port to bind
    --help(-h)                # Print help
  ]

  # Print server example configuration
  export extern "atuin server default-config" [
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin server help" [
  ]

  # Start the server
  export extern "atuin server help start" [
  ]

  # Print server example configuration
  export extern "atuin server help default-config" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin server help help" [
  ]

  # Generate a UUID
  export extern "atuin uuid" [
    --help(-h)                # Print help
  ]

  export extern "atuin contributors" [
    --help(-h)                # Print help
  ]

  def "nu-complete atuin gen-completions shell" [] {
    [ "bash" "elvish" "fish" "nushell" "powershell" "zsh" ]
  }

  # Generate shell completions
  export extern "atuin gen-completions" [
    --shell(-s): string@"nu-complete atuin gen-completions shell" # Set the shell for generating completions
    --out-dir(-o): string     # Set the output directory
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin help" [
  ]

  # Manipulate shell history
  export extern "atuin help history" [
  ]

  # Begins a new command in the history
  export extern "atuin help history start" [
  ]

  # Finishes a new command in the history (adds time, exit code)
  export extern "atuin help history end" [
  ]

  # List all items in history
  export extern "atuin help history list" [
  ]

  # Get the last command ran
  export extern "atuin help history last" [
  ]

  export extern "atuin help history init-store" [
  ]

  # Delete history entries matching the configured exclusion filters
  export extern "atuin help history prune" [
  ]

  # Import shell history from file
  export extern "atuin help import" [
  ]

  # Import history for the current shell
  export extern "atuin help import auto" [
  ]

  # Import history from the zsh history file
  export extern "atuin help import zsh" [
  ]

  # Import history from the zsh history file
  export extern "atuin help import zsh-hist-db" [
  ]

  # Import history from the bash history file
  export extern "atuin help import bash" [
  ]

  # Import history from the replxx history file
  export extern "atuin help import replxx" [
  ]

  # Import history from the resh history file
  export extern "atuin help import resh" [
  ]

  # Import history from the fish history file
  export extern "atuin help import fish" [
  ]

  # Import history from the nu history file
  export extern "atuin help import nu" [
  ]

  # Import history from the nu history file
  export extern "atuin help import nu-hist-db" [
  ]

  # Import history from xonsh json files
  export extern "atuin help import xonsh" [
  ]

  # Import history from xonsh sqlite db
  export extern "atuin help import xonsh-sqlite" [
  ]

  # Calculate statistics for your history
  export extern "atuin help stats" [
  ]

  # Interactive history search
  export extern "atuin help search" [
  ]

  # Sync with the configured server
  export extern "atuin help sync" [
  ]

  # Login to the configured server
  export extern "atuin help login" [
  ]

  # Log out
  export extern "atuin help logout" [
  ]

  # Register with the configured server
  export extern "atuin help register" [
  ]

  # Print the encryption key for transfer to another machine
  export extern "atuin help key" [
  ]

  # Display the sync status
  export extern "atuin help status" [
  ]

  # Manage your sync account
  export extern "atuin help account" [
  ]

  # Login to the configured server
  export extern "atuin help account login" [
  ]

  export extern "atuin help account register" [
  ]

  # Log out
  export extern "atuin help account logout" [
  ]

  # Delete your account, and all synced data
  export extern "atuin help account delete" [
  ]

  # Change your password
  export extern "atuin help account change-password" [
  ]

  # Get or set small key-value pairs
  export extern "atuin help kv" [
  ]

  export extern "atuin help kv set" [
  ]

  export extern "atuin help kv get" [
  ]

  export extern "atuin help kv list" [
  ]

  # Manage the atuin data store
  export extern "atuin help store" [
  ]

  # Print the current status of the record store
  export extern "atuin help store status" [
  ]

  # Rebuild a store (eg atuin store rebuild history)
  export extern "atuin help store rebuild" [
  ]

  # Re-encrypt the store with a new key (potential for data loss!)
  export extern "atuin help store rekey" [
  ]

  # Delete all records in the store that cannot be decrypted with the current key
  export extern "atuin help store purge" [
  ]

  # Verify that all records in the store can be decrypted with the current key
  export extern "atuin help store verify" [
  ]

  # Push all records to the remote sync server (one way sync)
  export extern "atuin help store push" [
  ]

  # Pull records from the remote sync server (one way sync)
  export extern "atuin help store pull" [
  ]

  # Manage your dotfiles with Atuin
  export extern "atuin help dotfiles" [
  ]

  # Manage shell aliases with Atuin
  export extern "atuin help dotfiles alias" [
  ]

  # Set an alias
  export extern "atuin help dotfiles alias set" [
  ]

  # Delete an alias
  export extern "atuin help dotfiles alias delete" [
  ]

  # List all aliases
  export extern "atuin help dotfiles alias list" [
  ]

  # Delete all aliases
  export extern "atuin help dotfiles alias clear" [
  ]

  # Manage shell and environment variables with Atuin
  export extern "atuin help dotfiles var" [
  ]

  # Set a variable
  export extern "atuin help dotfiles var set" [
  ]

  # Delete a variable
  export extern "atuin help dotfiles var delete" [
  ]

  # List all variables
  export extern "atuin help dotfiles var list" [
  ]

  # Print Atuin's shell init script
  export extern "atuin help init" [
  ]

  # Information about dotfiles locations and ENV vars
  export extern "atuin help info" [
  ]

  # Run the doctor to check for common issues
  export extern "atuin help doctor" [
  ]

  export extern "atuin help daemon" [
  ]

  # Print example configuration
  export extern "atuin help default-config" [
  ]

  # Start an atuin server
  export extern "atuin help server" [
  ]

  # Start the server
  export extern "atuin help server start" [
  ]

  # Print server example configuration
  export extern "atuin help server default-config" [
  ]

  # Generate a UUID
  export extern "atuin help uuid" [
  ]

  export extern "atuin help contributors" [
  ]

  # Generate shell completions
  export extern "atuin help gen-completions" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "atuin help help" [
  ]

}

export use completions *
