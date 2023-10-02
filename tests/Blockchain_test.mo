import Blockchain "Blockchain";
import Time "Time";

actor {
  public func testBlockchain() : async () {
    testBlockchainInitialization();
    testAddBlock();
  };

  private func testBlockchainInitialization() : async () {
    let blockchain = await Blockchain.init();
    assert(Array.length(blockchain) == 0, "Blockchain initialization: Unexpected length");
  };

  private func testAddBlock() : async () {
    let blockchain = await Blockchain.init();
    let timestamp1 = Time.fromMilliseconds(1633194000000); 
    let timestamp2 = Time.fromMilliseconds(1633200000000); 

    let updatedBlockchain = await Blockchain.addBlock(blockchain, timestamp1);
    assert(Array.length(updatedBlockchain) == 1, "Add block: Unexpected blockchain length");

    let updatedBlockchain2 = await Blockchain.addBlock(updatedBlockchain, timestamp2);
    assert(Array.length(updatedBlockchain2) == 2, "Add block: Unexpected blockchain length after second block");
  };
};
