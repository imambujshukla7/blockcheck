import Task "Task";
import Time "Time";

actor {
  public func testTask() : async () {
    testTaskCreation();
  };

  private func testTaskCreation() : async () {
    let taskDescription = "Sample Task";
    let timestamp = Time.fromMilliseconds(1633194000000); 

    let task = { description = taskDescription; timestamp = timestamp };

    assert(task.description == taskDescription, "Task creation: Description mismatch");
    assert(task.timestamp == timestamp, "Task creation: Timestamp mismatch");
  };
};
