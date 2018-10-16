export HOME_MANAGER_CHANNEL  =  nixpkgs-unstable
export HOME_MANAGER_CONFIG   =  config/home.nix

all: install

build:
	nix build -f "channel:$(HOME_MANAGER_CHANNEL)" home-manager --keep-going

test: build
	result/bin/home-manager -n switch

install: build test
	result/bin/home-manager switch
	@echo "Home generation:   $$(result/bin/home-manager generations | head -1)"
