import Utils "Utils";
import Time "Time";

actor {
  public func testUtils() : async () {
    testGetCurrentTimestamp();
  };

  private func testGetCurrentTimestamp() : async () {
    let currentTimestamp = await Utils.getCurrentTimestamp();
    let now = Time.now();

    assert(Time.toMilliseconds(currentTimestamp) - Time.toMilliseconds(now) < 1000, "GetCurrentTimestamp: Unexpected timestamp");

  };
};
