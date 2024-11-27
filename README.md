# Secure Blockchain-Based Messaging Application Backend

This repository contains the **Solidity smart contracts** powering the decentralized messaging application. The contracts are deployed on the Ethereum blockchain to enable secure key exchange and encrypted message storage.

## Contracts

1. **Handshake.sol**
   - Facilitates Elliptic-Curve Diffie-Hellman (ECDH) key exchange using the `secp521r1` curve.
   - Creates unique public keys for secure communication.

2. **Message.sol**
   - Stores encrypted messages on-chain.
   - Messages are encrypted on the front-end using AES-256-GCM with keys derived from ECDH via SHA-256.

## Prerequisites

- Node.js (v20 or higher)
- Truffle for contract deployment
- Ganache for local Ethereum development environment

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Qowevisa/sbbma
   cd sbbma
   ```

2. Start Ganache
   ```bash
   ganache --fork
   ```

3. Launch truffle suit for compiling the contracts
   ```bash
   truffle migrate --network development
   ```

4. Jump into truffle console
   ```bash
   truffle console --network development
   ```

## Usage

- Use Handshake contract to exchange keys.
- Use Message contract to exchange messages.
