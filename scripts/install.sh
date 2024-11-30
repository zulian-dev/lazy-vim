#!/bin/bash

profile="~/.zshrc"

# Função para exibir mensagens com cores
info() {
	echo -e "\033[1;34m$1\033[0m"
}

error() {
	echo -e "\033[1;31m$1\033[0m"
}

# Atualizando o macOS e instalando ferramentas básicas
info "Atualizando o sistema e instalando ferramentas essenciais..."
sudo softwareupdate --install --all

# Instalando o Homebrew, se não estiver instalado
if ! command -v brew &>/dev/null; then
	info "Homebrew não encontrado. Instalando..."
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
		error "Erro ao instalar o Homebrew."
		exit 1
	}
else
	info "Homebrew já está instalado."
fi

# Atualizando o Homebrew
info "Atualizando o Homebrew..."
brew update

###############################################################################

# Instalando Neovim
info "Instalando Neovim..."
brew install neovim || {
	error "Erro ao instalar o Neovim."
	exit 1
}

###############################################################################

# Instalando asdf
info "Instalando asdf..."
brew install asdf || {
	error "Erro ao instalar asdf."
	exit 1
}

# Configurando o asdf no shell
if ! grep -q "asdf.sh" ~/.zshrc; then
	info "Adicionando asdf ao Zsh..."
	echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >>$profile
	echo -e "\n. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash" >>$profile

	source $profile
fi

###############################################################################

# Instalando nvm
info "Instalando nvm..."
brew install nvm || {
	error "Erro ao instalar nvm."
	exit 1
}

# Configurando o nvm no shell
if ! grep -q ".nvm" $profile; then
	info "Configurando nvm no Zsh..."
	mkdir ~/.nvm
	echo -e "\nexport NVM_DIR=\"$HOME/.nvm\""
	echo -e "\n. $(brew --prefix nvm)/nvm.sh" >>$profile
	echo -e "\n. $(brew --prefix nvm)/etc/bash_completion.d/nvm" >>$profile

	source $profile
fi

###############################################################################

# Instalando o terminal Kitty
info "Instalando o terminal Kitty..."
brew install --cask kitty || {
	error "Erro ao instalar o terminal Kitty."
	exit 1
}

info "Instalação concluída! 🎉"
