### Basics
1. Basic data types: boolean,uint,int,address,bytes
2. Variable are just function calls.

3. Struct,string,arr,map need to be given the first two types when adding them to parameters of func.
* Calldata: temp variable that can't be modified
* Memory:temp variable that can be modified.
* Storage: permanent variable that can be modified.


4. Function visibily specifier
* public: visible externally and internally (creates a getter function for storage/state variables)
* private: only visible in the current contract
* external: only visible externally (only for functions) - i.e. can only be message-called (via this.func)
* internal: only visible internally(default)

5. 
```js
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage{
    //these are called view function
    bool public isTrue=true;
    int256 public number=-1;//int can be negative
    uint256 public bigNum=333;//uint cant be nagative
    string public name="test name";
    bytes32 public myByte="test byte";//value will be in bytes.
    address public add=0xc43B4E51FB66a38Bcf675e1b0d9bCC454981caCc;

}
```

6. Function: these types of function make changes in contract so they cost gas everytime they called.
```js
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage{
    uint256 public number;
    function storeNumber(uint256 _number) public{
        number=_number;
    }
}
```
7. View function: these types of function don't cost gas they called as they are not changing the contract.view function disallow modification,update of state.but you can read from them.
```js
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage{
    uint256 public number;
    function retrive() public view returns(uint256){
        return number;
    }
}
```
8. Pure function: these types of function don't cost gas and they disallow modification,update,reading of state.
```js
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage{
    function calc() public pure returns(uint256){
        return (1+1);
    }
}
```
9. If a gas calling func call a view,pure functiont then it will cost gas.

10. Static arr: 
```js
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage{
    uint256[3] public arr;
    //can directly initiate it have to use func.
    function update(uint256 ind,uint256 val) public{
        require(ind < 3, "Index out of bounds");
        arr[ind]=val;
    }

    function show() public view returns(uint256[3] memory){
        return arr;
    }
}
```
11. Dynamic arr:
```js
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage{
    uint256[] public arr;
    function update(uint256 val) public{
        arr.push(val);
    }

    function show() public view returns(uint256[] memory){
        return arr;
    }
}
```

12. Struct
```js
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage{
    struct People{
        string name;
        uint256 age;
    }
    People public x=People({name:"fahim",age:333});
}
```

13. Struct 2
```js
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage{
    struct People{
        string name;
        uint256 age;
    }
    People[] public people;

    function add(string memory _name,uint256 _age) public{
        // people.push(People(_name,_age));
        // people.push(People({name:_name,age:_age}));
        People memory newPeople=People(_name,_age);
        people.push(newPeople);
    }

    function get(uint256 ind) public view returns(string memory,uint256){
        People memory p=people[ind];
        return (p.name,p.age);

    }
}
```

14. Map
```js
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage{
    
    mapping (string=>uint256) public mpp;

    function add(string calldata _name,uint256 _age) public{
        mpp[_name]=_age;
    }
}
```
15. Payable: The payable keyword marks a function or address as capable of receiving Ether.

16. msg.sender: msg is a global variable that have various methods available to it.
msg.sender means whom ever is currently interacting with the contract.

17. Withdraw method
* Transfer: gas-limit:2300,return: None,Reverts on failure: Yes,Notes: simple safe but limited.
* Send: gas-limit:2300,return: Bool ,Reverts on failure: No,Notes: must manually check success.
* Call: gas-limit:no-limit,return: Bool,bytes ,Reverts on failure: No,Notes: Most flexible, recommended way now.

18. Library: A library is like a helper contract. It contains reusable functions that can be called from other contracts.
* They cannot hold state (i.e., no storage variables).
* You can’t inherit from them or create instances.
* They're used to extend contracts or add utility functions (like math, string handling, etc.). 

19. Receive function: I send eth but didn't call any function.Ex: I just sent eth with metamask but didn't call any function.

20. Fallback function: I send eth but the function i called don't exixts.

21. The immutable keyword is used to declare a state variable that:
* Can only be assigned once, usually inside the constructor.
* Cannot be changed afterward.
* Is stored directly in the bytecode (like constant), which saves gas.

22. A modifier is like a gatekeeper or middleware for functions.It lets you:
* Add pre-checks before a function runs
* Reuse common logic (like access control)
* Keep your code DRY (Don’t Repeat Yourself)

23. Events: Events in Solidity are a way for your smart contract to log information that the outside world (like frontend apps or off-chain services) can listen to.
* Think of it like a console log, but on the blockchain.
* When an event is emitted, it gets stored in the transaction logs, which are:cheaper to store than actual contract storage.
You can use events in solidity as cheap form of storage.

24. Transfer(event): its an special event that will listen for any kinds of transfer events in you dApp.

25. Solidity functions that change state cannot return values to the caller in the context of a transaction.