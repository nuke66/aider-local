# Aider AI setup

Set up Aider and connect to LM Studio to run open source models

## Related Aider doco:

[https://aider.chat/docs/install.html](https://aider.chat/docs/install.html)
[https://aider.chat/docs/llms/lm-studio.html](https://aider.chat/docs/llms/lm-studio.html)

## Prerequisites:

- python v3.12
- uv
- LM Studio with developer mode enabled (Setttings -> Developer -> Developer mode: ON )

## Install project

Clone the project:
TBD

Open PowerShell and run the following:

```
# Set up uv project
uv sync

# set up using uv (needs python v12)
uv tool install --force --python python3.12 --with pip aider-chat@latest

uv run aider-install

# check aider is running
aider --version

# set up variables for LM Studio connection
setx   LM_STUDIO_API_KEY dummy-api-key
setx   LM_STUDIO_API_BASE http://localhost:1234/v1

# - OR - 

# if setx doesn't work set it up for just this session (lost after you close the session)
$env:LM_STUDIO_API_KEY = "dummy-api-key"
$env:LM_STUDIO_API_BASE = "http://localhost:1234/v1"

```

After this you many need to set up this in your path

> C:\Users\Sladelocal\bin

or you can run this in powershell

> $env:Path += ";$env:USERPROFILElocal\bin"


Run aider specifying the model running in LM Studio

```
aider --model lm_studio/<your-model-name>

# example
aider --model lm_studio/gemma-4-26b-a4b
```

## Use Aider on any project (not this repo)

Aider always works on the **current directory** (and its git repo). This setup repo only holds your LM Studio connection settings.

**Option A — one-time install (recommended)**

From this repo, install shared config and a launcher into your user profile:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-user-config.ps1
```

Then from **any** project folder:

```powershell
cd D:\Dev\my-other-app
lm-aider
```

That runs `aider` with `%USERPROFILE%\.aider\aider.env` for models/API keys, while editing files in `my-other-app`.

**Option B — home `.env` only**

Copy your LM Studio settings to `%USERPROFILE%\.env` (see [Aider dotenv docs](https://aider.chat/docs/config/dotenv.html)). Aider loads that from every directory; per-project `.env` in a git repo can override it.

```powershell
# after copying settings to ~\.env
cd D:\Dev\my-other-app
aider
```

Edit `%USERPROFILE%\.aider\aider.env` (or `~\.env`) when you change models in LM Studio — you do not need a `.env` in each project.