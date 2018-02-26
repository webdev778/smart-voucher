pragma solidity ^0.4.16;

import './IERC20.sol';
import './SafeMath.sol';

contract SmartVoucher is IERC20 {
    
    using SafeMath for uint256;
    //public variables
    string public constant symbol="SEV"; 
    string public constant name="SEV"; 
    uint8 public constant decimals=18;
    uint256 public tokenPrice = 1;
    address public _owner;
    //totalsupplyoftoken 
    uint public totalSupply = 10000000000 * 10 ** uint(decimals);
    uint256 ethPrice = 1350;
    
    //map the addresses
    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;
    //create token function = check
    modifier onlyOwner {
        require(msg.sender == _owner);
        _;
    }

    function SmartVoucher() {
        _owner = msg.sender;
        balances[_owner] = totalSupply;
    }
    
    function buyTokens(address buyer,address retailer,uint256 value) returns (uint256 amount) {
        require(value > 0);
        value = value.mul(10 ** uint(decimals));
        amount = calcToken(value);
        require(balanceOf(_owner) >= amount); 
        balances[_owner] = balances[_owner].sub(amount);
        balances[buyer] = balances[buyer].add(amount * 8 / 10);
        balances[retailer] = balances[retailer].add(amount * 1 / 10);
        balances[_owner] = balances[_owner].add(amount * 1 / 10);
        return amount * 8 / 10;
    }
    
    function setPrice(uint256 value){
        tokenPrice = value;
    }
    
    function setEthPrice(uint256 value){
        ethPrice = value;
        
    }
    function calcToken(uint256 value) returns(uint256 amount){
         amount =  value.div(tokenPrice);
         return amount;
    }
    function balanceOf(address _owner) constant returns(uint256 balance) {
        return balances[_owner];
    }
    
    function transfer(address _to, uint256 _value) returns(bool success) {
        
        //require is the same as an if statement = checks 
        require(balances[msg.sender] >= _value && _value > 0 );
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
        
        //updating the spenders balance 
        balances[_from] = balances[_from].sub(_value); 
        balances[_to] = balances[_to].add(_value); 
        Transfer(_from, _to, _value); 
        return true;
    }
     function approve(address _spender, uint256 _value) returns(bool success) {
        
        //if above require is true,approve the spending 
        allowed[msg.sender][_spender] = _value; 
        Approval(msg.sender, _spender, _value); 
        return true;
    }

    function allowance(address _owner, address _spender) constant returns(uint256 remaining) {
        
        return allowed[_owner][_spender];
    }
    
    event Transfer(address indexed_from, address indexed_to, uint256 _value);
    event Approval(address indexed_owner, address indexed_spender, uint256 _value);
    
}