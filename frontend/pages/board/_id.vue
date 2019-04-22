<template>

  <v-layout row justify-left fill-height wrap>

    <v-flex xs3 lg3 mx-2 v-for="(list, key) in lists" :key="key">
      <v-layout column wrap>
        <v-sheet color="grey lighten-2 mb-3" min-height="600">
          <v-sheet class="header pa-2 my-2 mx-2 mb-auto align-center justify-center d-flex">
            {{list.name}}
          </v-sheet>
          <draggable class="task-group" v-model="list.tasks" group="tasks" @change="updateTask($event, list.id)">
            <div class='task-list-item' v-for="task in list.tasks" :key="task.name">
              <v-card @click.stop="openDialog(task.name, task.desc)" color="blue darken-3" class="white--text cards mt-2 mx-2">
                <v-card-title primary-title>
                  <div>
                    <div>{{ task.name }}</div>
                    <br/>
                    <span>{{ task.desc }}</span>
                  </div>
                </v-card-title>
              </v-card>
            </div>
          </draggable>

          <v-card color="yellow darken-4" class="new-task-header pa-2 my-2 mx-2 mb-auto align-center justify-center d-flex cards" @click="newTask()">
           + New Task
          </v-card>

        </v-sheet>
      </v-layout>
    </v-flex>

    <v-flex xs3 lg3 mx-2 >
      <v-layout column wrap>
        <v-sheet color="grey lighten-2 mb-3" max-height="200">
          <v-card class="header pa-2 my-2 mx-2 mb-auto align-center justify-center d-flex cards" @click="newList()">
           + New List
          </v-card>
        </v-sheet>
      </v-layout>
    </v-flex>

    <v-dialog v-model="dialog" max-width="500px">
      <v-card>
        <v-card-title class="headline">
          <span>{{dialog_title}}</span>
          <v-spacer></v-spacer>
        </v-card-title>
        <v-card-text>
          {{dialog_body}}
        </v-card-text>
        <v-card-actions>
          <v-btn color="primary" flat @click="dialog=false">Close</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <v-dialog v-model="new_list" max-width="500px">
      <v-card>
        <v-card-title class="headline">
          <span>New Task List</span>
          <v-spacer></v-spacer>
        </v-card-title>
        <v-card-text>
          TODO FORM
        </v-card-text>
        <v-card-actions>
          <v-btn color="primary" flat @click="new_list=false">Close</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <v-dialog v-model="new_task" max-width="500px">
      <v-card>
        <v-card-title class="headline">
          <span>New Task</span>
          <v-spacer></v-spacer>
        </v-card-title>
        <v-card-text>
          TODO FORM
        </v-card-text>
        <v-card-actions>
          <v-btn color="primary" flat @click="new_task=false">Close</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

  </v-layout>



</template>

<script>
import {UPDATE_TITLE} from '~/store/mutation_names.js'
import getLists from '~/gql/get_lists.gql'
import updateTask from '~/gql/push_tasks_new_id.gql'

export default {
  mounted: function() {
    this.$store.commit(UPDATE_TITLE, "Todo Board NAME HERE")
    //console.log(this.$nuxt.$route.params.id)
  },
  data() {
    return {
      lists: {},
      board_id: this.$nuxt.$route.params.id,
      list1: [],
      list2: [],
      dialog: false,
      new_list: false,
      new_task: false,
      dialog_title: "",
      dialog_body: "",
      board_name: "",
      cards: {}
    };
  },
  methods: {
    updateTask(e, list_id){
      //window.console.log(e);
      if(e.added){
        console.log(e.added.element)
        if(e.added.element.taskListId != list_id){
          e.added.element.taskListId = list_id
          //console.log(list_id)
          // THIS IS CORRECTLY UPDATING THE ID AS FAR AS I CAN TELL
          const res = this.$apollo.mutate({
            mutation: updateTask,
            variables: {
              taskId: e.added.element.id,
              parentId: list_id
            }
          }).then(({data}) => data)
        }
      }
      console.log(this.lists)
    },
    openDialog(name, desc){
      this.dialog = true;
      this.dialog_title = name;
      this.dialog_body = desc;
    },
    newList(){
      this.new_list = true;
    },
    newTask(){
      this.new_task = true;
    },
    add(list){
    }
  },
  apollo: {
    lists: {
      query: getLists,
      variables () {
        return {
          id: this.board_id
        }
      },
      update({getTaskList}){ 
        this.$store.commit(UPDATE_TITLE, getTaskList[0].board.name)
        return getTaskList 
      }
    },
  },
  computed: {
    
  }



};
</script>



<style>
  .header{
    background-color: rgba(0, 0, 0, .36);
    height: 50;
    font-size: 1.3em;
  }

  .new-task-header{
    height: 50;
    font-size: 1.2em;
  }
  
  .cards{
    cursor: pointer;
  }

  .new-button{
    color: black;
    vertical-align: bottom;
  }
</style>