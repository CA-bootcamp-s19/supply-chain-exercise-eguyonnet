pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SupplyChain.sol";

contract TestSupplyChain {

    SupplyChain sc;
    address buyer = 0x929b1b54a8446f35672D0A00DC1A74C6eE21662d;


    // Test for failing conditions in this contracts
    // test that every modifier is working
    function testAddItem() public {
        sc = SupplyChain(DeployedAddresses.SupplyChain());
        bool result = sc.addItem("Chaise", 2000000);
        Assert.isTrue(result, "Item not added properly");
        
        uint state;
        (, , , state, , ) = sc.fetchItem(0);

        Assert.equal(state, 0, "State should be Forsale");
    }


    // buyItem
    // test for failure if user does not send enough funds
    // test for purchasing an item that is not for Sale
    function testBuyItemFailure() public {
        // For instance check ship item
        sc.buyItem(O); // {from : buyer, value: 300, }
    }


    // shipItem
    // test for calls that are made by not the seller
    // test for trying to ship an item that is not marked Sold
    function testShipItemFailure() public {
        // For instance check ship item
        sc.shipItem(0);
    }

    // receiveItem
    // test calling the function from an address that is not the buyer
    // test calling the function on an item not marked Shipped
    function testReceiveItemFailure() public {
        // For instance check ship item
        sc.receiveItem(0);
    }

}
