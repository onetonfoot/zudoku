import { observable } from "mobx"

class Todo {
    id = Math.random()
    @observable title = "Hello M8 hello"
    @observable finished = false
}

export default Todo;