ROOT_DIR := $(PWD)


OS := $(shell uname)
ARCH := $(shell uname -m)

SCRIPTS := $(ROOT_DIR)/scripts
STAMPS := $(ROOT_DIR)/.stamps

DOT_CONFIG := $(HOME)/.config
DOT_CONFIG_FILES :=  $(shell ls src/config)
PREDEF_DOT_CONFIG_FILES := $(addprefix $(DOT_CONFIG)/,$(DOT_CONFIG_FILES))
BIN := $(HOME)/bin

DIRS := $(HOME)/src/github.com $(BIN) $(DOT_CONFIG) $(STAMPS) $(STAMPS)/scripts
DOT_FILES := $(shell ls src)
PREDEF_DOT_FILES := $(addprefix $(HOME)/.,$(DOT_FILES))

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
	azure/homebrew-kubelogin \
	felixkratz/homebrew-formulae \
	github/homebrew-gh \
	goles/homebrew-battery \
	hashicorp/homebrew-tap \
	homeport/homebrew-tap \
	incu6us/homebrew-tap \
	koekeishiya/homebrew-formulae \
	teamookla/homebrew-speedtest

PREDEF_BREW_TAPS := $(addprefix $(BREW_TAPS_PATH)/,$(BREW_TAPS))

BREW_FORMULAS := \
	ack \
	ansible \
	aspell \
	actionlint \
	awscli \
	autoconf \
	azure-cli \
	bat \
	battery \
	bash \
	bash-completion \
	btop \
	cdk8s \
	cmake \
	cookiecutter \
	coreutils \
	cosign \
	direnv \
	delve \
	diffutils \
	docker-compose \
	dyff \
	eza \
	fd \
	fzf \
	gh \
	git \
	git-credential-oauth \
	github-markdown-toc \
	gnupg \
	go \
	golangci-lint \
	golines \
	gofumpt \
	goimports-reviser \
	gource \
	grep \
	gradle \
	grpcurl \
	helm \
	highlight \
	httpie \
	ipcalc \
	infracost \
	jq \
	k3d \
	k9s \
	kind \
	krew \
	kubebuilder \
	kubie \
	kubelogin \
	kubernetes-cli \
	kustomize \
	libpq \
	nowplaying-cli \
	make \
	mysql-client \
	node \
	opa \
	openssh \
	openssl@1.1 \
	openssl@3 \
	pkg-config \
	pnpm \
	pre-commit \
	protobuf \
	pstree \
	pwgen \
	readline \
	reattach-to-user-namespace \
	ripgrep \
	rust \
	skhd \
	shellcheck \
	spark \
	speedtest \
	sqlite \
	starship \
	switchaudio-osx \
	teller \
	terraform \
	terraform-docs \
	terramate \
	tflint \
	tldr \
	thefuck \
	the_silver_searcher \
	tig \
	tmux \
	tmuxinator \
	tree \
	up \
	vale \
	vault \
	watch \
	wget \
	xz \
	yamllint \
	yarn \
	yq \
	zlib \
	zoxide \
	zsh \
	zsh-autosuggestions \
	zsh-autocomplete \
	zsh-completions

# needed for latest vault version
# hashicorp/tap/vault

BREW_FORMULAS_PATHS := $(addprefix $(BREW_CELLAR),$(BREW_FORMULAS))
UNIVERSAL_CTAGS := $(BREW_TAPS_PATH)/universal-ctags/homebrew-universal-ctags

BREW_CASKS := \
	1password-cli \
	copyq \
	docker \
	fanny \
	font-input \
	font-inter \
	font-3270-nerd-font \
	font-agave-nerd-font \
	font-anonymice-nerd-font \
	font-arimo-nerd-font \
	font-aurulent-sans-mono-nerd-font \
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
	font-sf-mono \
	font-sf-pro \
	font-shure-tech-mono-nerd-font \
	font-space-mono-nerd-font \
	font-symbols-only-nerd-font \
	font-terminess-ttf-nerd-font \
	font-tinos-nerd-font \
	font-ubuntu-mono-nerd-font \
	font-ubuntu-nerd-font \
	font-victor-mono-nerd-font \
	karabiner-elements \
	kubecontext \
	meld \
	orbstack \
	sf-symbols

BREW_CASKS_PATHS := $(addprefix $(BREW_CASK_ROOM),$(BREW_CASKS))

KUBECTL := $(BREW_PATH)/bin/kubectl

KREW_PATH := $(HOME)/.krew
KREW_STORE := $(KREW_PATH)/store/

KREW_PLUGINS := \
	access-matrix \
	colorize-applied \
	community-images \
	ctx \
	cost \
	neat  \
	images \
	kurt \
	kyverno \
	mtail \
	ns \
	viewnode \
	resource-capacity

KREW_PLUGINS_PATHS := $(addprefix $(KREW_STORE),$(KREW_PLUGINS))

SCRIPT_CONFIGS_STAMPS := $(patsubst %.sh,$(STAMPS)/%.stamp,$(wildcard scripts/*.sh))

GEMS := # \
	# github-linguist

PYENV_DIR := $(HOME)/.pyenv
PYENV := $(PYENV_DIR)/bin/pyenv
PYENV_VERSIONS := $(PYENV_DIR)/versions

PYTHON_3_MINOR := 3.14

PYTHON_3 := $(PYTHON_3_MINOR).0

PYTHON_3_DIR := $(PYENV_VERSIONS)/$(PYTHON_3)

PYTHON_DIRS := $(PYTHON_3_DIR)

PYTHON_3_NEOVIM_LIB := $(PYENV_VERSIONS)/neovim3/lib/python$(PYTHON_3_MINOR)/site-packages/neovim

POETRY_HOME := $(HOME)/.poetry

install: \
	$(HOME)/src/github.com \
	$(PREDEF_BREW_TAPS) \
	$(BREW_FORMULAS_PATHS) \
	$(UNIVERSAL_CTAGS) \
	$(BREW_CASKS_PATHS) \
	$(BREW_CELLAR)/neovim \
	$(PREDEF_DOT_FILES) \
	$(PREDEF_DOT_CONFIG_FILES) \
	xcode \
	scripts \
	$(HOME)/bin \
	bash_profile \
	zshrc \
	google-cloud-sdk \
	node \
	nvm \
	sdkman \
	script-config \
	$(KREW_PLUGINS_PATHS) \
	$(PYENV) \
	$(HOME)/.zcomet/bin \
	$(HOME)/.goenv \
	$(HOME)/.tfenv \
	$(POETRY_HOME) \
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

$(KREW_PLUGINS_PATHS): |$(BREW_FORMULAS_PATHS)
	$(KUBECTL) krew install $(patsubst .%,%,$(notdir $@))

krew-install: |$(KREW_PLUGINS_PATHS)

$(UNIVERSAL_CTAGS):
	$(BREW) install --HEAD universal-ctags/universal-ctags/universal-ctags

$(BREW_CASKS_PATHS): |$(BREW)
	$(BREW) install --cask $(patsubst .%,%,$(notdir $@))

gem-install: $(GEMS)
$(GEMS): |$(BREW_FORMULAS_PATHS)
	sudo gem install $@

dot-files: |$(PREDEF_DOT_FILES)
$(PREDEF_DOT_FILES):
	ln -Fsv $(PWD)/src/$(patsubst .%,%,$(notdir $@)) $@

scripts: $(HOME)/scripts
$(HOME)/scripts:
	ln -Fsv $(PWD)/src/$(patsubst .%,%,$(notdir $@)) $@

bash_profile: $(HOME)/.bash_profile
$(HOME)/.bash_profile: |$(HOME)/.bash_profile_mac
	ln -Fsv $(HOME)/.bash_profile_mac $@

zshrc: $(HOME)/.zshrc $(HOME)/.zcomet/bin
$(HOME)/.zshrc: |$(HOME)/.zshrc_mac
	ln -Fsv $(HOME)/.zshrc_mac $@


dot-config-files: |$(PREDEF_DOT_CONFIG_FILES)
$(PREDEF_DOT_CONFIG_FILES):
	ln -Fsv $(PWD)/src/config/$(patsubst .%,%,$(notdir $@)) $@

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
(HOME)/.google-cloud-sdk/bin/gke-gcloud-auth-plugin: |$(HOME)/.google-cloud-sdk $(HOME)/.bash_profile $(HOME)/.zshrc
	CLOUDSDK_CORE_DISABLE_PROMPTS=1 gcloud components install gke-gcloud-auth-plugin

sdkman: |$(HOME)/.sdkman
$(HOME)/.sdkman:
	curl -s "https://get.sdkman.io" | bash

nvm: |$(HOME)/.nvm
$(HOME)/.nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
	source $(HOME)/.nvm/nvm.sh && nvm alias default system

node: |$(HOME)/.nvm/alias/default
$(HOME)/.nvm/alias/default: |$(HOME)/.nvm
	source $(HOME)/.nvm/nvm.sh && nvm alias default system

$(BREW_CELLAR)/neovim: $(PYTHON_3_NEOVIM_LIB) | $(BREW)
	$(BREW) install neovim

pyenv: $(PYENV)
$(PYENV): |/usr/bin/curl
	curl https://pyenv.run | bash

$(PYTHON_DIRS): |$(PYENV)
	# https://github.com/pyenv/pyenv/wiki/Common-build-problems#1-openssl-is-installed-to-an-uncommon-location
	# https://github.com/python-poetry/poetry/issues/7695#issuecomment-1480617455
	CONFIGURE_OPTS="-with-openssl=$(BREW_PATH)/opt/openssl" $(PYENV) install $(notdir $@)


$(PYENV_VERSIONS)/neovim3: $(PYTHON_3_DIR) |$(PYENV)
	$(PYENV) virtualenv $(PYTHON_3) $(notdir $@)

$(PYTHON_3_NEOVIM_LIB): $(PYENV_VERSIONS)/neovim3
	PATH="$(PYENV_VERSIONS)/neovim3/bin:$$PATH" pip install --upgrade pip
	PATH="$(PYENV_VERSIONS)/neovim3/bin:$$PATH" pip install neovim

zcomet: $(HOME)/.zcomet/bin
$(HOME)/.zcomet/bin:
	git clone https://github.com/agkozak/zcomet.git $@

goenv: $(HOME)/.goenv
$(HOME)/.goenv: |$(BREW_CELLAR)git $(HOME)/.bash_profile $(HOME)/.zshrc
	git clone https://github.com/syndbg/goenv.git $@

tfenv: $(HOME)/.tfenv
$(HOME)/.tfenv: |$(BREW_CELLAR)git $(HOME)/.bash_profile $(HOME)/.zshrc
	git clone https://github.com/tfutils/tfenv.git $@

$(PYENV_VERSIONS)/poetry: $(PYTHON_3_DIR) |$(PYENV)
	$(PYENV) virtualenv $(PYTHON_3) $(notdir $@)

poetry: $(POETRY_HOME)
$(POETRY_HOME): $(PYENV_VERSIONS)/poetry
	# Need to use correct virtualenv for this to work
	PATH="$(PYENV_VERSIONS)/poetry/bin:$$PATH" curl -sSL https://install.python-poetry.org | POETRY_HOME=$(POETRY_HOME) python3 -

dirs: $(DIRS)
$(DIRS):
	mkdir -p $@

.PHONY: \
	brew \
	brew-install \
	brew-tap \
	brew-update \
	brew-update \
	dirs \
	dot-files \
	dot-config-files \
	input-font \
	install \
	neovim \
	node \
	nvm \
	krew-install \
	script-config \
	xcode
