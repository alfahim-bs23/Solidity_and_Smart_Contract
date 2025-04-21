### Basics
1. Basic data types: boolean,uint,int,address,bytes
2. Variable are just function calls.

3. Struct,string,arr,map need to be given the first two types when adding them to parameters of func.
* Calldata: temp variable that can't be modified
* Memory:temp variable that can be modified.
* Storage: permanent variable that can be modified.


2. Function visibily specifier
* public: visible externally and internally (creates a getter function for storage/state variables)
* private: only visible in the current contract
* external: only visible externally (only for functions) - i.e. can only be message-called (via this.func)
* internal: only visible internally(default)

3. 
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

4. Function: these types of function make changes in contract so they cost gas everytime they called.
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
5. View function: these types of function don't cost gas they called as they are not changing the contract.view function disallow modification,update of state.but you can read from them.
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
6. Pure function: these types of function don't cost gas and they disallow modification,update,reading of state.
```js
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage{
    function calc() public pure returns(uint256){
        return (1+1);
    }
}
```
7. If a gas calling func call a view,pure functiont then it will cost gas.

8. Static arr: 
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
9. Dynamic arr:
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

10. Struct
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

11. Struct 2
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

11. Map
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

12. Withdraw method
* Transfer: gas-limit:2300,return: None,Reverts on failure: Yes,Notes: simple safe but limited.
* Send: gas-limit:2300,return: Bool ,Reverts on failure: No,Notes: must manually check success.
* Call: gas-limit:no-limit,return: Bool,bytes ,Reverts on failure: No,Notes: Most flexible, recommended way now.