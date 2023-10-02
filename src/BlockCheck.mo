import Task "Task";
import Blockchain "Blockchain";

module BlockCheck {
  type TaskList = [Task.Task];

  public type BlockCheck = {
    tasks : TaskList;
    blockchain : Blockchain.Blockchain;
  };

  public func init() : async BlockCheck {
    let emptyTaskList = [];
    let emptyBlockchain = await Blockchain.init();
    return { tasks = emptyTaskList; blockchain = emptyBlockchain };
  };

  public func addTask(blockcheck : BlockCheck, task : Task.Task) : async BlockCheck {
    let updatedTasks = Array.append(blockcheck.tasks, [task]);
    let updatedBlockchain = await Blockchain.addBlock(blockcheck.blockchain, task.timestamp);
    return { tasks = updatedTasks; blockchain = updatedBlockchain };
  };

  public func getTasks(blockcheck : BlockCheck) : async TaskList {
    return blockcheck.tasks;
  };
};
