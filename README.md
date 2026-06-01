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