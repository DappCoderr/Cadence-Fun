// Hey, Welcome to Cadence! These are the cadence Sample Application tutorial programs.

pub contract ToDoList {

    pub struct List {
        pub let text: String
        pub var completed: Bool

        init(text: String){
            self.text = text
            self.completed = false
        }
    }

    pub var todos: [String]

    pub fun addItem(item: String) {
        self.todos.append(List(text:item))
    }

    pub fun toggleComplete(index: UInt64) {
        self.todos[index].completed = !self.todos[index].completed
    }
    
    pub fun getList(): [String] {
        return self.todos
    }

    init() {
        self.todos = []
    }
}