module Blockchain {
  type Blockchain = [Time];

  public func init() : async Blockchain {
    return [];
  };

  public func addBlock(blockchain : Blockchain, timestamp : Time) : async Blockchain {
    return Array.append(blockchain, [timestamp]);
  };
};
