// SPDX-License-Identifier: MIT
pragma solidity >=0.8.20;

import "@fhenixprotocol/contracts/FHE.sol";

contract FhenixResearchStorage {
    euint32 private encryptedCounter;
    address public owner;

    event EncryptedDataStored(address indexed caller);

    constructor() {
        owner = msg.sender;
        encryptedCounter = FHE.asEuint32(0);
    }

    function addEncrypted(inEuint32 calldata inVal) public {
        euint32 val = FHE.asEuint32(inVal);
        encryptedCounter = encryptedCounter + val;
        emit EncryptedDataStored(msg.sender);
    }
}
