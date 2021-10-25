// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import {SafeMath} from "./SafeMath.sol";
import {BaseToken} from "./BaseToken.sol";

contract MintableToken is BaseToken {
    using SafeMath for uint;

    event OnMint(address indexed to, uint tokens);

    function Mint(address to, uint tokens) restrictToOwner public {
        _balances[to] = _balances[to].add(tokens);
        _totalSupply = _totalSupply.add(tokens);

        emit OnMint(to, tokens);
    }
}