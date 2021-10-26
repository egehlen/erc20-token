// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import {MintableToken} from "./MintableToken.sol";

contract EHGToken is MintableToken {
    string public constant name = "Enzo's Token :)";
    string public constant symbol = "OZNE";
    uint8 public constant decimals = 18;
}
