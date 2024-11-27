// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Handshake {
    event HandshakeInitiated(address indexed initiator, address indexed recipient, bytes publicKeyInitiator);
    event HandshakeAccepted(address indexed initiator, address indexed recipient, bytes publicKeyRecipient);

    struct HandshakeInfo {
        bytes publicKeyInitiator;
        bool initiated;
    }

    mapping(address => mapping(address => HandshakeInfo)) public handshakes;

    function initiateHandshake(address _recipient, bytes calldata _publicKeyInitiator) external {
        require(_recipient != msg.sender, "Cannot initiate handshake with oneself.");
        handshakes[msg.sender][_recipient] = HandshakeInfo({
            publicKeyInitiator: _publicKeyInitiator,
            initiated: true
        });
        emit HandshakeInitiated(msg.sender, _recipient, _publicKeyInitiator);
    }

    function acceptHandshake(address _initiator, bytes calldata _publicKeyRecipient) external {
        require(handshakes[_initiator][msg.sender].initiated, "Handshake not initiated.");
        emit HandshakeAccepted(_initiator, msg.sender, _publicKeyRecipient);
        delete handshakes[_initiator][msg.sender];
    }
}
