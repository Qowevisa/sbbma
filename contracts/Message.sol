// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Message {
    event MessageSent(address indexed from, address indexed to, bytes message, bytes iv, bytes authTag);

    struct MessageInfo {
        bytes message;
        bytes iv;
        bytes authTag;
    }

    mapping(address => MessageInfo[]) private messages;

    function sendMessage(address _to, bytes calldata _message, bytes calldata iv, bytes calldata authTag) public {
        MessageInfo memory newMessage = MessageInfo({
            message: _message,
            iv: iv,
            authTag: authTag
        });
        messages[_to].push(newMessage);
        emit MessageSent(msg.sender, _to, _message, iv, authTag);
    }

    function getMyMessages() public view returns (MessageInfo[] memory) {
        return messages[msg.sender];
    }
}
