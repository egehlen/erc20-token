// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import {SafeMath} from "./SafeMath.sol";
import {Ownable} from "./Ownable.sol";
import {ERC20} from "./ERC20.sol";

contract BaseToken is Ownable, ERC20 {
    using SafeMath for uint;

    uint internal _totalSupply;
    mapping(address => uint) internal _balances;
    mapping(address => mapping(address => uint)) internal _allowed;

    function totalSupply() public override view returns(uint) {
        return _totalSupply;
    }

    function balanceOf(address tokenOwner) public override view returns (uint balance) {
        return _balances[tokenOwner];
    }

    function transfer(address to, uint tokens) public override returns (bool success) {
        require(_balances[msg.sender] >= tokens);
        require(to != address(0));

        _balances[msg.sender] = _balances[msg.sender].sub(tokens);
        _balances[to] = _balances[to].add(tokens);

        emit Transfer(msg.sender, to, tokens);

        return true;
    }

    function approve(address spender, uint tokens) public override returns (bool success) {
        _allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
    
    function allowance(address tokenOwner, address spender) public override view returns (uint remaining) {
        return _allowed[tokenOwner][spender];
    }

    function transferFrom(address from, address to, uint tokens) public override returns (bool success) {
        require(_allowed[from][msg.sender] >= tokens);
        require(_balances[from] >= tokens);
        require(to != address(0));

        _balances[from] = _balances[from].sub(tokens);
        _balances[to] = _balances[to].add(tokens);
        _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(tokens);

        emit Transfer(from, to, tokens);

        return true;
    }
}