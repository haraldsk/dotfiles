ROOT_DIR := $(PWD)

OS := $(shell uname)
ARCH := $(shell uname -m)

SCRIPTS := $(ROOT_DIR)/scripts
STAMPS := $(ROOT_DIR)/.stamps

DOT_CONFIG := $(HOME)/.config
BIN := $(HOME)/bin

DIRS := $(HOME)/src/github  $(BIN) $(DOT_CONFIG) $(STAMPS) $(STAMPS)/scripts
DOTFILES := $(shell ls src)
PREDEF_DOTFILES := $(addprefix $(HOME)/.,$(DOTFILES))


ifeq ($(shell uname -p),arm)
BREW_PATH := /opt/homebrew
else
BREW_PATH := /usr/local
endif

BREW := $(BREW_PATH)/bin/brew

BREW_CELLAR := $(BREW_PATH)/Cellar/
BREW_CASK_ROOM := $(BREW_PATH)/Caskroom/
ifeq ($(shell uname -p),arm)
BREW_TAPS_PATH := $(BREW_PATH)/Library/Taps
else
BREW_TAPS_PATH := $(BREW_PATH)/Homebrew/Library/Taps
endif

BREW_TAPS := \
	github/homebrew-gh \
	goles/homebrew-battery \
	homebrew/homebrew-cask-fonts \
	homeport/homebrew-tap \
	koekeishiya/homebrew-formulae \
	teamookla/homebrew-speedtest

PREDEF_BREW_TAPS := $(addprefix $(BREW_TAPS_PATH)/,$(BREW_TAPS))

BREW_FORMULAS := \
	ack \
	argocd \
	aspell \
	awscli \
	autoconf \
	azure-cli \
	bat \
	battery \
	bash \
	bash-completion \
	cdk8s \
	cmake \
	cookiecutter \
	coreutils \
	diffutils \
	docker-compose \
	dyff \
	fd \
	fzf \
	gh \
	git \
	github-markdown-toc \
	gnupg \
	go \
	gource \
	grpcurl \
	helm \
	highlight \
	httpie \
	ipcalc \
	istioctl \
	yabai \
	jq \
	k3d \
	k9s \
	kind \
	kubectx \
	kubernetes-cli \
	kustomize \
	libpq \
	make \
	mysql-client \
	node \
	opa \
	openssl@1.1 \
	openssl@3 \
	pkg-config \
	pstree \
	pwgen \
	readline \
	reattach-to-user-namespace \
	ripgrep \
	ruby \
	skhd \
	spark \
	speedtest \
	sqlite \
	teller \
	terraform \
	terraform-docs \
	terramate \
	tflint \
	the_silver_searcher \
	tig \
	tmux \
	tmuxinator \
	tree \
	up \
	watch \
	wget \
	yamllint \
	yq \
	xz \
	zlib \
	zoxide

BREW_FORMULAS_PATHS := $(addprefix $(BREW_CELLAR),$(BREW_FORMULAS))
UNIVERSAL_CTAGS := $(BREW_TAPS_PATH)/universal-ctags/homebrew-universal-ctags
BREW_CASKS := \
	1password \
	1password-cli \
	alacritty \
	copyq \
	docker \
	drawio \
	fanny \
	figma \
	font-input \
	font-inter \
	font-3270-nerd-font \
	font-agave-nerd-font \
	font-anonymice-nerd-font \
	font-arimo-nerd-font \
	font-aurulent-nerd-font \
	font-bigblue-terminal-nerd-font \
	font-bitstream-vera-sans-mono-nerd-font \
	font-blex-mono-nerd-font \
	font-caskaydia-cove-nerd-font \
	font-code-new-roman-nerd-font \
	font-cousine-nerd-font \
	font-daddy-time-mono-nerd-font \
	font-dejavu-sans-mono-nerd-font \
	font-droid-sans-mono-nerd-font \
	font-fantasque-sans-mono-nerd-font \
	font-fira-code-nerd-font \
	font-fira-mono-nerd-font \
	font-go-mono-nerd-font \
	font-gohufont-nerd-font \
	font-hack-nerd-font \
	font-hasklug-nerd-font \
	font-heavy-data-nerd-font \
	font-hurmit-nerd-font \
	font-im-writing-nerd-font \
	font-inconsolata-go-nerd-font \
	font-inconsolata-lgc-nerd-font \
	font-inconsolata-nerd-font \
	font-iosevka-nerd-font \
	font-jetbrains-mono-nerd-font \
	font-lekton-nerd-font \
	font-liberation-nerd-font \
	font-lilex-nerd-font \
	font-meslo-lg-nerd-font \
	font-monofur-nerd-font \
	font-monoid-nerd-font \
	font-mononoki-nerd-font \
	font-mplus-nerd-font \
	font-noto-nerd-font \
	font-open-dyslexic-nerd-font \
	font-overpass-nerd-font \
	font-profont-nerd-font \
	font-proggy-clean-tt-nerd-font \
	font-roboto-mono-nerd-font \
	font-sauce-code-pro-nerd-font \
	font-shure-tech-mono-nerd-font \
	font-space-mono-nerd-font \
	font-symbols-only-nerd-font \
	font-terminess-ttf-nerd-font \
	font-tinos-nerd-font \
	font-ubuntu-mono-nerd-font \
	font-ubuntu-nerd-font \
	font-victor-mono-nerd-font \
	google-drive \
	google-chrome \
	keybase \
	iterm2 \
	meld \
	messenger \
	microsoft-teams \
	slack \
	spotify \
	telegram-desktop \
	yt-music \
	zoom

BREW_CASKS_PATHS := $(addprefix $(BREW_CASK_ROOM),$(BREW_CASKS))

SCRIPT_CONFIGS_STAMPS := $(patsubst %.sh,$(STAMPS)/%.stamp,$(wildcard scripts/*.sh))

GEMS := # \
	# github-linguist

PYENV_DIR := $(HOME)/.pyenv
PYENV := $(PYENV_DIR)/bin/pyenv
PYENV_VERSIONS := $(PYENV_DIR)/versions
PYTHON_2_MINOR := 2.7
PYTHON_3_MINOR := 3.9

PYTHON_2 := $(PYTHON_2_MINOR).18
PYTHON_3 := $(PYTHON_3_MINOR).13

PYTHON_2_DIR := $(PYENV_VERSIONS)/$(PYTHON_2)
PYTHON_3_DIR := $(PYENV_VERSIONS)/$(PYTHON_3)

PYTHON_DIRS := $(PYTHON_2_DIR) $(PYTHON_3_DIR)

PYTHON_2_NEOVIM_LIB := $(PYENV_VERSIONS)/neovim2/lib/python$(PYTHON_2_MINOR)/site-packages/neovim
PYTHON_3_NEOVIM_LIB := $(PYENV_VERSIONS)/neovim3/lib/python$(PYTHON_3_MINOR)/site-packages/neovim

POETRY_HOME := $(HOME)/.poetry

install: \
	$(HOME)/src/github \
	$(PREDEF_BREW_TAPS) \
	$(BREW_FORMULAS_PATHS) \
	$(UNIVERSAL_CTAGS) \
	$(BREW_CASKS_PATHS) \
	base16-shell \
	$(BREW_CELLAR)/neovim \
	$(PREDEF_DOTFILES) \
	$(DOT_CONFIG)/nvim \
	xcode \
	scripts \
	$(HOME)/bin \
	bash_profile \
	google-cloud-sdk \
	google-cloud-sdk-gke-gcloud-auth-plugin \
	node \
	nvm \
	sdkman \
	script-config \
	$(PYENV) \
	$(HOME)/.goenv \
	$(HOME)/.tfenv \
	$(POETRY_HOME) \
	$(HOME)/.docker/cli-plugins/docker-lock \
	$(GEMS)

script-config: $(SCRIPT_CONFIGS_STAMPS)
$(STAMPS)/scripts/%.stamp: $(SCRIPTS)/%.sh |$(STAMPS)/scripts
	$<
	touch $@

brew: $(BREW)
$(BREW): |/Library/Developer/CommandLineTools
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew-update: |$(BREW)
	$(BREW) update

$(PREDEF_BREW_TAPS): |$(BREW)
	$(BREW) tap $(shell echo $@ | sed -e "s|$(BREW_TAPS_PATH)/\(.*\)/homebrew-\(.*\)|\1/\2|")

brew-install: |$(BREW_FORMULAS_PATHS) $(UNIVERSAL_CTAGS) $(BREW_CASKS_PATHS)

$(BREW_FORMULAS_PATHS): |$(BREW) $(PREDEF_BREW_TAPS)
	$(BREW) install $(patsubst .%,%,$(notdir $@))

$(UNIVERSAL_CTAGS):
	$(BREW) install --HEAD universal-ctags/universal-ctags/universal-ctags

$(BREW_CASKS_PATHS): |$(BREW)
	$(BREW) install --cask $(patsubst .%,%,$(notdir $@))

gem-install: $(GEMS)
$(GEMS): |$(BREW_FORMULAS_PATHS)
	sudo gem install $@

dotfiles: |$(PREDEF_DOTFILES)
$(PREDEF_DOTFILES):
	ln -Fsv $(PWD)/src/$(patsubst .%,%,$(notdir $@)) $@

scripts: $(HOME)/scripts
$(HOME)/scripts:
	ln -Fsv $(PWD)/src/$(patsubst .%,%,$(notdir $@)) $@

bash_profile: $(HOME)/.bash_profile
$(HOME)/.bash_profile: |$(HOME)/.bash_profile_mac
	ln -Fsv $(HOME)/.bash_profile_mac $@

nvim-config: $(DOT_CONFIG)/nvim
$(DOT_CONFIG)/nvim: |$(DOT_CONFIG)
	ln -Fsv $(PWD)/src/$(patsubst .%,%,$(notdir $@)) $@

xcode: |/Library/Developer/CommandLineTools
/Library/Developer/CommandLineTools:
	xcode-select --install

$(PYENV_VERSIONS)/gcp-sdk: $(PYTHON_3_DIR) |$(PYENV)
	$(PYENV) virtualenv -f $(PYTHON_3) $(notdir $@)

google-cloud-sdk: |$(HOME)/.google-cloud-sdk
$(HOME)/.google-cloud-sdk: $(PYENV_VERSIONS)/gcp-sdk
	curl https://sdk.cloud.google.com > google-cloud-install.sh
	CLOUDSDK_PYTHON=`$(PYENV) prefix gcp-sdk`/bin/python bash google-cloud-install.sh --disable-prompts
	mv $(HOME)/google-cloud-sdk $(HOME)/.google-cloud-sdk
	rm google-cloud-install.sh

google-cloud-sdk-gke-gcloud-auth-plugin: |$(HOME)/.google-cloud-sdk/bin/gke-gcloud-auth-plugin
(HOME)/.google-cloud-sdk/bin/gke-gcloud-auth-plugin: |$(HOME)/.google-cloud-sdk $(HOME)/.bash_profile
	CLOUDSDK_CORE_DISABLE_PROMPTS=1 gcloud components install gke-gcloud-auth-plugin

sdkman: |$(HOME)/.sdkman
$(HOME)/.sdkman:
	curl -s "https://get.sdkman.io" | bash

base16-shell: |$(HOME)/.config/base16-shell
$(HOME)/.config/base16-shell: |$(DOT_CONFIG)
	mkdir -p $@
	(set -e; \
	cd $@; \
	git init; \
	git remote add origin https://github.com/chriskempson/base16-shell.git; \
	git fetch origin; \
	git checkout -b master --track origin/master; \
	git reset origin/master)

# input-font: $(HOME)/Library/Fonts/Input_Fonts
# $(HOME)/Library/Fonts/Input_Fonts:
# 	mkdir -p $(dir $@)
# 	mkdir -p tmp
# 	curl "https://input.fontbureau.com/build/?fontSelection=whole&a=0&g=0&i=0&l=0&zero=0&asterisk=0&braces=0&preset=default&line-height=1.2&accept=I+do&email=" > tmp/Input-Font.zip
# 	unzip tmp/Input-Font.zip -d tmp
# 	mv tmp/Input_Fonts $(dir $@)
# 	rm -rf tmp

nvm: |$(HOME)/.nvm
$(HOME)/.nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
	source $(HOME)/.nvm/nvm.sh && nvm alias default system

node: |$(HOME)/.nvm/alias/default
$(HOME)/.nvm/alias/default: |$(HOME)/.nvm
	source $(HOME)/.nvm/nvm.sh && nvm alias default system

$(BREW_CELLAR)/neovim: $(PYTHON_3_NEOVIM_LIB) | $(HOME)/.vimrc_background $(BREW)
	$(BREW) install neovim

pyenv: $(PYENV)
$(PYENV): |/usr/bin/curl
	curl https://pyenv.run | bash

$(PYTHON_DIRS): |$(PYENV)
	$(PYENV) install $(notdir $@)

# $(PYENV_VERSIONS)/neovim2: $(PYTHON_2_DIR) |$(PYENV)
# 	$(PYENV) virtualenv $(PYTHON_2) $(notdir $@)

$(PYENV_VERSIONS)/neovim3: $(PYTHON_3_DIR) |$(PYENV)
	$(PYENV) virtualenv $(PYTHON_3) $(notdir $@)

# $(PYTHON_2_NEOVIM_LIB): $(PYENV_VERSIONS)/neovim2
# 	PATH="$(PYENV_VERSIONS)/neovim2/bin:$$PATH" pip install --upgrade pip
# 	PATH="$(PYENV_VERSIONS)/neovim2/bin:$$PATH" pip install neovim

$(PYTHON_3_NEOVIM_LIB): $(PYENV_VERSIONS)/neovim3
	PATH="$(PYENV_VERSIONS)/neovim3/bin:$$PATH" pip install --upgrade pip
	PATH="$(PYENV_VERSIONS)/neovim3/bin:$$PATH" pip install neovim

goenv: $(HOME)/.goenv
$(HOME)/.goenv: |$(BREW_CELLAR)git $(HOME)/.bash_profile
	git clone https://github.com/syndbg/goenv.git $@

tfenv: $(HOME)/.tfenv
$(HOME)/.tfenv: |$(BREW_CELLAR)git $(HOME)/.bash_profile
	git clone https://github.com/tfutils/tfenv.git $@

$(PYENV_VERSIONS)/poetry: $(PYTHON_3_DIR) |$(PYENV)
	$(PYENV) virtualenv $(PYTHON_3) $(notdir $@)

poetry: $(POETRY_HOME)
$(POETRY_HOME): $(PYENV_VERSIONS)/poetry
	PATH="$(PYENV_VERSIONS)/poetry/bin:$$PATH" curl -sSL https://install.python-poetry.org | POETRY_HOME=$(POETRY_HOME) python3 -

DOCKER_LOCK_VERSION := 0.8.10
docker-lock: $(HOME)/.docker/cli-plugins/docker-lock
$(HOME)/.docker/cli-plugins/docker-lock:
	mkdir -p "$(HOME)/.docker/cli-plugins"
	curl -fsSL "https://github.com/safe-waters/docker-lock/releases/download/v$(DOCKER_LOCK_VERSION)/docker-lock_$(DOCKER_LOCK_VERSION)_$(OS)_$(ARCH).tar.gz" | tar -xz -C "$(HOME)/.docker/cli-plugins" "docker-lock"
	chmod +x "$(HOME)/.docker/cli-plugins/docker-lock"

dirs: $(DIRS)
$(DIRS):
	mkdir -p $@

submodules: $(HOME)/.vim/bundle/Vundle.vim
$(HOME)/.vim/bundle/Vundle.vim: |$(BREW_CELLAR)git
	git submdule update --init

.PHONY: \
	base16-shell \
	brew \
	brew-install \
	brew-tap \
	brew-update \
	brew-update \
	dirs??\
	docker-lock \
	dotfiles \
	input-font \
	install \
	neovim \
	node \
	nvm \
	nvim-config \
	script-config \
	xcode