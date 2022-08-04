// Hey, Welcome to Cadence! These are the cadence Sample Application tutorial programs.

pub contract Todolist {

    pub var totalList: UInt64

    pub resource ToDoList {

        pub var lists: {UInt64: List}

        init(){
            self.lists <- {}
        }

        destroy(){
            destroy self.lists
        }

        pub fun addList(task:String) {
            let list <- create List()
            let old <- self.lists[list.uuid] <- list
            destroy old
        }

        pub fun editList(id:UInt64, newTask:String){
            let oldList <- self.lists.insert(key:id, <- create List(task:newTask))
            destroy oldList
        }

        pub fun toggleComplete(id:UInt64){
            let oldList <- self.lists.insert(key:id, <- create List(completed: !completed))
            destroy oldList
        }

        pub fun deleteList(id:UInt64){
            let list <- self.lists.remove(key:id)
            destroy list
        }

        pub fun list(UInt64: id): ListStruct {
            let list <- self.lists.remove(key:id)!
            let listStruct = ListStruct(id:id, task:list.task)
            let oldList <- self.lists[key:id] <- list
            destroy oldList
            return listStruct
        }

        pub fun getAllLits(): [ListStruct] {
            var allList: [ListStruct] = []
            for key in self.lists.keys{
                allList.apend(self.lists[id: key])
            }
            return allList
        }
    }

    pub resource List {
        pub(set) let task: String
        pub(set) let completed: Bool

        init(task: String){
            self.task = task
            self.completed = false
        }
    }

    pub struct ListStruct {
        pub let id: UInt64
        pub var task: String
        pub var completed: Bool

        init(id:UInt64, task:String){
            self.id = id
            self.task = task
            self.completed = false
        }
    }

    pub fun createList(): @ToDoList {
        self.totalList = self.totalList + 1 as UInt64
        retrun <- create List()
    }

    pub fun deleteList(todoList: @ToDoList) {
        self.totalList = self.totalList > 0 ? self.totalList - 1 : 0
        destroy todoList
    }

    pub fun toggleComplete() {}

    init(){
        self.totalList = 0
    }
}