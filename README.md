# Foundry UUPS Upgradeable Contracts

A Foundry UUPS Upgradeable Contracts Project that is part of Cyfrin Solidity Blockchain Course.

1. [ERC1967Proxy on Sepolia Testnet](https://sepolia.etherscan.io/address/0x42446Ea6C7337883911A5DdbA26e6B9Fb7B9876A#code)
2. [BoxV1 on Sepolia Testnet](https://sepolia.etherscan.io/address/0x73c1ba45b62aae713d3b7e2e875cbc53f6521937#code)
3. [BoxV2 on Sepolia Testnet](https://sepolia.etherscan.io/address/0xdF5F7907839DEc1cd2c8e9948c2d7B832C646Ff8#code)

### Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`

### Quickstart

```
git clone https://github.com/dannweeeee/foundry-upgrades-f23
cd foundry-upgrades-f23
forge build
```

## Usage

### Start a local node

```
make anvil
```

### Deploy

This will default to your local node. You need to have it running in another terminal in order for it to deploy.

```
make deploy
```

### Deploy - Other Network

[See below](#deployment-to-a-testnet-or-mainnet)

### Testing

```
forge test
```

#### Test Coverage

```
forge coverage
```

and for coverage based testing: 

```
forge coverage --report debug
```


## Deployment to a testnet or mainnet

1. Setup environment variables

You'll want to set your `SEPOLIA_RPC_URL` and `PRIVATE_KEY` as environment variables. You can add them to a `.env` file, similar to what you see in `.env.example`.

- `PRIVATE_KEY`: The private key of your account (like from [metamask](https://metamask.io/)). **NOTE:** FOR DEVELOPMENT, PLEASE USE A KEY THAT DOESN'T HAVE ANY REAL FUNDS ASSOCIATED WITH IT.
  - You can [learn how to export it here](https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-Export-an-Account-Private-Key).
- `SEPOLIA_RPC_URL`: This is url of the goerli testnet node you're working with. You can get setup with one for free from [Alchemy](https://alchemy.com/?a=673c802981)

Optionally, add your `ETHERSCAN_API_KEY` if you want to verify your contract on [Etherscan](https://etherscan.io/).

1. Get testnet ETH

Head over to [faucets.chain.link](https://faucets.chain.link/) and get some tesnet ETH. You should see the ETH show up in your metamask.

2. Deploy

```
make deploy ARGS="--network sepolia"
```

3. Upgrade

```
make upgrade  ARGS="--network sepolia"
```

#### Scripts

Instead of scripts, we can directly use the `cast` command to interact with the contract. 

For example, on Sepolia:

1. Call getNumber()

```
cast call 0x42446Ea6C7337883911A5DdbA26e6B9Fb7B9876A "getNumber()" --rpc-url $SEPOLIA_RPC_URL
```

2. Send setNumnber()

```
cast send 0x42446Ea6C7337883911A5DdbA26e6B9Fb7B9876A "setNumber(uint256)" 77 --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY
```

3. Call getNumber() again

```
cast call 0x42446Ea6C7337883911A5DdbA26e6B9Fb7B9876A "getNumber()" --rpc-url $SEPOLIA_RPC_URL
```

4. Convert Hex to Dec

```
cast --to-base 0x000000000000000000000000000000000000000000000000000000000000004d dec
```



### Estimate gas

You can estimate how much gas things cost by running:

```
forge snapshot
```

And you'll see and output file called `.gas-snapshot`


## Formatting


To run code formatting:
```
forge fmt
```