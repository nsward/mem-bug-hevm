A minimal test to pinpoint a possible memory bug. Tokens.sol implements a "bad ERC20" with no return value from the `transfer` function, and TestTokens.t.sol emits events with the memory slot that the expected return value would have been copied to.

## Usage
Requires [dapptools](https://dapp.tools/) to run.

Clone and run `make test`. This should fail and print two events with the contents of a memory slot before and after making a call. The call attempts to overwrite the first 32 bytes of the call data (after the length) with an expected 32 byte return value, which is not received. I'm not actually sure what the expected behavior is here, but a similar test run against ganache-cli results in the memory left unaltered when an expected return value is not received, and the slot remains unchanged, still containing the beginning of the call data (the function signature + 12 zero bytes + the first 16 bytes of the `dst` address). Run against hevm, it looks like the 32 bytes of memory that are expected to be overwritten with the return data are removed when the return data is null. The memory slot actually contains the last 4 bytes of the `dst` address + the first 28 bytes of the `amt` (the second function argument). The actual memory deletion can be seen by running `make debug` and stepping through the bytecode.


