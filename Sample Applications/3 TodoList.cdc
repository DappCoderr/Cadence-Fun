// Hey, Welcome to Cadence! These are the cadence Sample Application tutorial programs.


// Simple contract to build the todo-List dapp, Create, Delete, Edit Toggle the List.
pub contract ToDoList {

    // public variable who keeps count of total List created
    pub var totatListCount: UInt64

    //Here Struct is used to return the task of respective List, with it's ID.
    // Can't use resource here, as resource is present at one location at a time
    pub struct Template {

        // public variable the template id
        pub let id: UInt64
        // public variable holds the task of List
        pub let task: String
        // public variable who keeps track of the boolean value
        pub let completed: Bool

        //every time we define variable then we have to initialize the variable into the init() function.
        init(id: UInt64, task: String, completed: Bool) {
            self.id = id
            self.task = task 
            self.completed = completed
        }
    }

    //Cadence is resource oriented langaunge.
    //which means it make it easy to work with digital assets. 
    //A resource can be present at one location at a tiem.
    pub resource Task {

        pub var task: String
        pub var completed: Bool

        init(task: String, isComplete: Bool){
            self.task = task
            self.completed = isComplete
        }
    }


    //Defining List as a resource
    //List holds all the Task for a single person.
    //Anyone can create multiple list and add multiple task to it.
    pub resource List {

        //Defining the dictionary of type resource, which holds all the task
        pub var ownerTask: @{UInt64: Task}

        init(){
            self.ownerTask <- {}
        }

        // Add Task Function to create the task into the list
        pub fun addTask(task: String) {
            var task <- create Task(task: task, isComplete: false)
            var oldTask <- self.ownerTask[task.uuid] <- task
            destroy oldTask
        }

        // Edit Task funciton to edit the task 
        pub fun editTask(id: UInt64, newTask: String, isComplete: Bool) {
            var oldTask <- self.ownerTask.insert(key:id, <- create Task(task: newTask, isComplete: isComplete))
            destroy oldTask
        }

        // Delete function to delete the deleta the task you have created
        pub fun deleteTask(id: UInt64) {
            var task <- self.ownerTask.remove(key: id)
            destroy task
        }

        destroy(){
            destroy self.ownerTask
        }
    }

    // public function to create List
    pub fun createlist() {
        self.totatListCount = self.totatListCount + 1
        var list <- create List()
        destroy list
    }

    // public function to delete List
    pub fun deleteList(list: @List){
        self.totatListCount = self.totatListCount > 0 ? self.totatListCount + 1 as UInt64 : 0
        destroy list
    }

    // contract initilization
    init(){
        self.totatListCount = 0 as UInt64
    }
}