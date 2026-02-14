pragma solidity 0.7.0;

import "./IERC20.sol";
import "./IMintableToken.sol";
import "./IDividends.sol";
import "./SafeMath.sol";

contract Token is IERC20, IMintableToken, IDividends {
  // ------------------------------------------ //
  // ----- BEGIN: DO NOT EDIT THIS SECTION ---- //
  // ------------------------------------------ //
  using SafeMath for uint256;
  uint256 public totalSupply;
  uint256 public decimals = 18;
  string public name = "Test token";
  string public symbol = "TEST";
  mapping (address => uint256) public balanceOf;
  // ------------------------------------------ //
  // ----- END: DO NOT EDIT THIS SECTION ------ //  
  // ------------------------------------------ //

  mapping(address => mapping(address => uint256)) public allowances;
  address[] internal addresses;

  function allowance(address owner, address spender) external view override returns (uint256) {
    // revert();
    return allowances[owner][spender];
  }

  function transfer(address to, uint256 value) external override returns (bool) {
   // revert();
   require( balanceOf[msg.sender] > value, "Insufficient balance");
   balanceOf[msg.sender] -= value;
   balanceOf[to] += value;
  }

  function approve(address spender, uint256 value) external override returns (bool) {
    // revert();
    allowances[msg.sender][spender] = value;
  }

  function transferFrom(address from, address to, uint256 value) external override returns (bool) {
    // revert(); //L42
    require(allowances[from][msg.sender] >= value, "Insufficient allowance");
    allowances[from][msg.sender] -= value;
    balanceOf[from] -= value;
    balanceOf[to] += value;
  }

  // IMintableToken

  function mint() external payable override {
   // revert();
    require(msg.value >  0, "missed mint value");
    balanceOf[msg.sender] +=  msg.value;
    totalSupply += msg.value;
    addresses.push(msg.sender);
  }

  function burn(address payable dest) external override {
    //revert();
    require(balanceOf[msg.sender] > 0, "Insufficient balance");
    uint256 _amount = balanceOf[msg.sender];
    dest.transfer(_amount);
    addresses.push(dest);
  }

  // IDividends

  function getNumTokenHolders() external view override returns (uint256) {
    //revert(); // L69
    uint256 holders = 0;
    for (uint i = 0; i < addresses.length; i++) {
      if (balanceOf[msg.sender] > 0) {
        holders++;   
      }
    }
    return holders;
  }

  function getTokenHolder(uint256 index) external view override returns (address) {
   // revert();
   
  }

  function recordDividend() external payable override {
    revert();
  }

  function getWithdrawableDividend(address payee) external view override returns (uint256) {
    revert();
  }

  function withdrawDividend(address payable dest) external override {
    revert();
  }
}
