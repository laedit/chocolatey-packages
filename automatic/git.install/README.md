# <img src="https://cdn.jsdelivr.net/gh/chocolatey-community/chocolatey-packages@10a8d98b2f320b565fa5349a4352e79666db71ff/icons/git.svg" width="48" height="48"/> [git.install](https://chocolatey.org/packages/git.install)


Git for Windows focuses on offering a lightweight, native set of tools that bring the full feature set of the Git SCM to Windows while providing appropriate user interfaces for experienced Git users and novices alike.

## Features

* **Git BASH**: Git for Windows provides a BASH emulation used to run Git from the command line. *NIX users should feel right at home, as the BASH emulation behaves just like the "git" command in LINUX and UNIX environments.
* **Git GUI**: As Windows users commonly expect graphical user interfaces, Git for Windows also provides the Git GUI, a powerful alternative to Git BASH, offering a graphical version of just about every Git command line function, as well as comprehensive visual diff tools.
* **Shell Integration**: Simply right-click on a folder in Windows Explorer to access the BASH or GUI.

## Package parameters

- `/GitOnlyOnPath` - Puts gitinstall\cmd on path. This is also done by default if no package parameters are set.
- `/GitAndUnixToolsOnPath` - Puts gitinstall\bin on path. This setting will override `/GitOnlyOnPath`.
- `/NoAutoCrlf` - Ensure _'Checkout as is, commit as is'_. This setting **only affects new installs**, it will not override an existing `.gitconfig`.
- `/WindowsTerminal` - Makes `vim` use the regular Windows terminal instead of MinTTY terminal.
- `/NoShellIntegration` - Disables open GUI and open shell integration ( _"Git GUI Here"_ and _"Git Bash Here"_ entries in context menus).
- `/NoGuiHereIntegration` - Disables open GUI shell integration ( _"Git GUI Here"_ entry in context menus).
- `/NoShellHereIntegration` - Disables open git bash shell integration ( _"Git Bash Here"_ entry in context menus)
- `/NoCredentialManager` - Disable _Git Credential Manager_ by adding `$Env:GCM_VALIDATE='false'` user environment variable.
- `/NoGitLfs` - Disable Git LFS installation.
- `/SChannel` - Configure Git to use the Windows native SSL/TLS implementation (SChannel) instead of OpenSSL. This aligns Git HTTPS behavior with other Windows applications and system components and increases manageability in enterprise environments.

Example: `choco install git.install --params "/GitAndUnixToolsOnPath /NoGitLfs /SChannel /NoAutoCrlf"`

## Notes

- The package uses default install options minus cheetah integration and desktop icons. Cheetah prevents a good upgrade scenario, so it has been removed.

