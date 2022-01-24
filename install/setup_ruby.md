# Set up Ruby

## Set up a virtual environment

1. Install rbenv

```
brew install rbenv
```

2. Set up rbenv in your shell (Should be already set up in `.zsh/.rbenv`

```
rbenv init
```

3. Verify that rbenv is properly set up using this
   [rbenv-doctor](https://github.com/rbenv/rbenv-installer/blob/main/bin/rbenv-doctor) script:

```
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash
```

4. Restart your shell

## Install Ruby versions

```
# list latest stable versions:
rbenv install -l

# list all local versions:
rbenv install -L

# install a Ruby version:
rbenv install 2.0.0-p247
```

-   Change the Ruby version

```
rbenv global 2.0.0-p247
```

## Set up a language server for nvim

-   Install coc-solargraph

```
gem install solargraph
```
