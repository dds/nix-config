HOME_MANAGER_CHANNEL  =  nixpkgs-unstable
HOME_MANAGER_CONFIG   =  config/home.nix

all: install

build:
	nix build -f "channel:$(HOME_MANAGER_CHANNEL)" home-manager \
		--argstr confPath "$(HOME_MANAGER_CONFIG)" \
		--keep-going

test: build
	result/bin/home-manager -n -v -f "$(HOME_MANAGER_CONFIG)" switch

install: build test
	result/bin/home-manager switch -f "$(HOME_MANAGER_CONFIG)"
