<h1 align="center">⌨️ 🦾 Zsh Copilot (without Codex)</h1>

<p align="center">
    AI in the command line.
</p>

<p align="center">
    <img src='https://github.com/tom-doerr/bins/raw/main/zsh_codex/zc4.gif'>
    <p align="center">
        You just need to write a comment or variable name and the AI will write the corresponding code.
    </p>
</p>


## What is it?

This is a ZSH plugin that transforms descriptions of command line tasks to Bash syntax using open-sourced machine translation model that was a winner of a NeurIPS 2020's challenge (https://github.com/magnumresearchgroup/magnum-nlc2cmd). Unlike alternatives, the plugin does not require access to OpenAI Codex, and therefore is completely free. 

## How do I install it?

First, create conda environment from bash_translator.yml:
```
conda env create --file bash_translator.yml
```


### Manual Installation
1. Install the OpenAI package.
```
pip3 install openai
```

2. Download the ZSH plugin.

```
    $ git clone https://github.com/tom-doerr/zsh_codex.git ~/.oh-my-zsh/custom/plugins/zsh_codex 
```

3. Add the following to your `.zshrc` file.

Using oh-my-zsh:
```
    plugins=(zsh_codex)
    bindkey '^X' create_completion
```
Without oh-my-zsh:
```
    # in your/custom/path you need to have a "plugins" folder and in there you clone the repository as zsh_codex
    export ZSH_CUSTOM="your/custom/path"
    source "$ZSH_CUSTOM/plugins/zsh_codex/zsh_codex.plugin.zsh"
    bindkey '^X' create_completion
```

4. Create a file called `openaiapirc` in `~/.config` with your ORGANIZATION_ID and SECRET_KEY.

```
[openai]
organization_id = ...
secret_key = ...
```

5. Run `zsh`, start typing and complete it using `^X`!

### Fig Installation

<a href="https://fig.io/plugins/other/zsh_codex_tom-doerr" target="_blank"><img src="https://fig.io/badges/install-with-fig.svg" /></a>

## Troubleshooting 

### Unhandled ZLE widget 'create_completion'

```
zsh-syntax-highlighting: unhandled ZLE widget 'create_completion'
zsh-syntax-highlighting: (This is sometimes caused by doing `bindkey <keys> create_completion` without creating the 'create_completion' widget with `zle -N` or `zle -C`.)
```

Add the line 
```
zle -N create_completion
```
before you call `bindkey` but after loading the plugin (`plugins=(zsh_codex)`).

### Already exists and is not an empty directory
```
fatal: destination path '~.oh-my-zsh/custom/plugins'
```
Try to download the ZSH plugin again.
```
git clone https://github.com/tom-doerr/zsh_codex.git ~/.oh-my-zsh/custom/plugins/zsh_codex
```
---
<p align="center">
    <a href="https://www.buymeacoffee.com/TomDoerr" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>
</p>

## More usage examples
<p align="center">
    <img src='https://github.com/tom-doerr/bins/raw/main/zsh_codex/update_insert/all.gif'>
    <p align="center">
    </p>
</p>

-------------------------------------------------------------------

[Fish Version](https://github.com/tom-doerr/codex.fish)

[Traffic Statistics](https://tom-doerr.github.io/github_repo_stats_data/tom-doerr/zsh_codex/latest-report/report.html)




## How it works

1. On keybind "^X" current terminal prompt is parsed into string 
2. String gets piped into Python file
3. The model gets a string as input and infers a bash command with highest likelihood as output
4. The terminal prompt gets replaced with the inferred command

# Steps
- [ ] install miniconda with 3.9.7 py
- [ ] make a env running with this conda version
- [ ] install every package manually 
- [ ] next steps

# Notes
- Instead of using spacy==2.3.0 in requirements I was doing:
    - https://stackoverflow.com/a/71882460/14606987
torch==1.6.0
torchtext==0.4.0
torchvision==0.7.0 --> was all removed and instead  pip install torch torchvision
