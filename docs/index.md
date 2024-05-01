# Solidity API

## Lock

### unlockTime

```solidity
uint256 unlockTime
```

### owner

```solidity
address payable owner
```

### Withdrawal

```solidity
event Withdrawal(uint256 amount, uint256 when)
```

### timeLockInThePast

```solidity
error timeLockInThePast()
```

### lockTimeNotElapsedYet

```solidity
error lockTimeNotElapsedYet()
```

### notOwner

```solidity
error notOwner()
```

### constructor

```solidity
constructor(uint256 _unlockTime) public payable
```

constructor

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| _unlockTime | uint256 | unlock time for this contract |

### withdraw

```solidity
function withdraw() public
```

allow owner to whitdraw funds after time lock elapsed

