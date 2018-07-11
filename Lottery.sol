pragma solidity ^0.4.17;

contract Lottery {

    address public manager;
    address[] public players;

    constructor() public {
        address = msg.sender;
    }

    function enter() public payable {

        require(msg.value > .01 ether);

        players.push(msg.sender);
    }

    function pickWinner() public restricted {

        unit index = random() % players.length;
        players[index].transfer(this.balance);

        players = new address[](0);
        
    }

    modifier restricted() {
        require(msg.sender==manager);
        _;
    }

    function random() private view returns (uint) {

        return unit(sha3(block.difficulty, now, players));
    }

    function getPlayers public view return (address[]){

        return players;
    }
}
