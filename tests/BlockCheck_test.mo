import BlockCheck "BlockCheck";
import Task "Task";
import Blockchain "Blockchain";
import Time "Time";

actor {
  public func testBlockCheck() : async () {
    testBlockCheckInitialization();
    testAddTask();
    testGetTasks();
  };

  private func testBlockCheckInitialization() : async () {
    let blockCheck = await BlockCheck.init();
    assert(Array.length(blockCheck.tasks) == 0, "BlockCheck initialization: Unexpected task list length");
    assert(Array.length(blockCheck.blockchain) == 0, "BlockCheck initialization: Unexpected blockchain length");
  };

  private func testAddTask() : async () {
    let blockCheck = await BlockCheck.init();
    let taskDescription = "Sample Task";
    let timestamp = Time.fromMilliseconds(1633194000000); 

    let task = { description = taskDescription; timestamp = timestamp };
    let updatedBlockCheck = await BlockCheck.addTask(blockCheck, task);

    assert(Array.length(updatedBlockCheck.tasks) == 1, "Add task: Unexpected task list length");
    assert(Array.length(updatedBlockCheck.blockchain) == 1, "Add task: Unexpected blockchain length");
  };

  private func testGetTasks() : async () {
    let blockCheck = await BlockCheck.init();
    let taskDescription = "Sample Task";
    let timestamp = Time.fromMilliseconds(1633194000000); 
    let task = { description = taskDescription; timestamp = timestamp };
    let updatedBlockCheck = await BlockCheck.addTask(blockCheck, task);

    let tasks = await BlockCheck.getTasks(updatedBlockCheck);
    assert(Array.length(tasks) == 1, "Get tasks: Unexpected task list length");
    assert(tasks[0].description == taskDescription, "Get tasks: Task description mismatch");
  };
};
