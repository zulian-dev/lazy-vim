#!/bin/bash

profile="~/.zshrc"

gitFolder="~/Documents/git/"

gitConfigs="https://github.com/zulian-dev/Configurations"

# Função para exibir mensagens com cores
info() {
	echo -e "\033[1;34m$1\033[0m"
}

error() {
	echo -e "\033[1;31m$1\033[0m"
}

install() {
	tool=$1
	info "Instalando $1..."
	brew install $1 || {
		error "Erro ao instalar $1."
		exit 1
	}
}

###############################################################################
if [ -f "$profile" ]; then
  echo "O arquivo $profile já existe."
else
  echo "Criando o arquivo $profile..."
  touch "$profile"
  echo "Arquivo $profile criado com sucesso."
fi


# Atualizando o macOS e instalando ferramentas básicas
info "Atualizando o sistema e instalando ferramentas essenciais..."
sudo softwareupdate --install --all

###############################################################################

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

install "curl"
install "git"

###############################################################################

info "Copiando as configurações do git"
info $gitConfigs

# Cria a pasta para baixar as configurações
mkdir -p $gitFolder

# Baixa as configurações
git clone $gitConfigs $gitFolder/Configurations

info "Configuração copiadas!"


###############################################################################

install "neovim"

# Cria link simbolicos
ln -s ~/Documents/git/Configurations/nvim ~/.config/nvim

###############################################################################

# Instalando o terminal Kitty
info "Instalando o terminal Kitty..."
brew install --cask kitty || {
	error "Erro ao instalar o terminal Kitty."
	exit 1
}

###############################################################################

# Instalando asdf

install "asdf"

# Configurando o asdf no shell
if ! grep -q "asdf.sh" ~/.zshrc; then
	info "Adicionando asdf ao Zsh..."
	echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> $profile
	echo -e "\n. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash" >> $profile
	
	source $profile
fi

###############################################################################

# Instalando nvm

install "nvm"

# Configurando o nvm no shell
if ! grep -q ".nvm" $profile; then
	info "Configurando nvm no Zsh..."
	mkdir ~/.nvm
	echo -e "\nexport NVM_DIR=\"$HOME/.nvm\""
	echo -e "\n. $(brew --prefix nvm)/nvm.sh" >>$profile
	echo -e "\n. $(brew --prefix nvm)/etc/bash_completion.d/nvm" >>$profile

	source $profile
	
	nvm install 18
fi

###############################################################################

# Instalando o Docker
info "Instalando o Docker..."
brew install --cask docker || {
  error "Erro ao instalar o Docker."
  exit 1
}

# Inicializando o Docker
info "Iniciando o Docker..."
open -a Docker || {
  error "Erro ao iniciar o Docker."
  exit 1
}

###############################################################################

info "Instalação concluída! 🎉"
