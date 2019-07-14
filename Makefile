export DAPP_SOLC_VERSION=0.5.6
export SOLC_FLAGS=--optimize
all    :; dapp build
clean  :; dapp clean
test   :; dapp test
deploy :; dapp create BrokenErc20
debug  :; hevm interactive
