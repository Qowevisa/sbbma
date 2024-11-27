const Message = artifacts.require("Message");
const Handshake = artifacts.require("Handshake");

module.exports = function(deployer) {
  deployer.deploy(Message);
  deployer.deploy(Handshake);
};
