<template>

  <v-layout row justify-left fill-height wrap>
    
    <v-flex xs4 lg3 mx-2>
      <v-layout column wrap>
        <v-sheet color="grey lighten-2" min-height="600">
          <v-sheet class="header pa-2 mt-1 mx-2 mb-auto align-center justify-center d-flex">
            Todo
          </v-sheet>
          <div class='height-test'>
          <draggable 
            class="task-list"
            v-bind="dragOptions"
            :list="list1"
            group="tasks"
            @start="isDragging = true"
            @end  ="isDragging = false"
            @change="log"
          >
            <transition-group type="transition">
              <div class='task-list-item' v-for="card in list1" :key="card.title">
                <v-card @click.stop="openDialog(card.title, card.desc)" color="blue darken-3" class="white--text cards mt-2 mx-2">
                  <v-card-title primary-title>
                    <div>
                      <div>{{ card.title }}</div>
                      <span>{{ card.desc }}</span>
                    </div>
                  </v-card-title>
                </v-card>
              </div>
            </transition-group>
          </draggable>
          </div>
        </v-sheet>
      </v-layout>
    </v-flex>

    <v-flex xs4 lg3 class="mx-2">
      <v-layout column wrap>
        <v-sheet color="grey lighten-2" min-height="600">
          <v-sheet class="header pa-2 mt-1 mx-2 mb-auto align-center justify-center d-flex">
            Finished
          </v-sheet>
          <div class='height-test'>
          <draggable 
            class="task-list"
            v-bind="dragOptions"
            :list="list2"
            group="tasks"
            @start="isDragging = true"
            @end  ="isDragging = false"
            @change="log"
          >
            <transition-group type="transition">
              <div class='task-list-item' v-for="card in list2" :key="card.title">
                <v-card @click.stop="openDialog(card.title, card.desc)" color="green darken-3" class="white--text cards mt-2 mx-2">
                  <v-card-title primary-title>
                    <div>
                      <div>{{ card.title }}</div>
                      <span>{{ card.desc }}</span>
                    </div>
                  </v-card-title>
                </v-card>
              </div>
            </transition-group>
          </draggable>
          </div>
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


  </v-layout>




</template>

<script>
export default {
  mounted: function() {
    this.$store.commit('update', "Todo Board NAME HERE")
  },
  data() {
    return {
      list1: [
        { title: "Finish work", desc: "I gotta finish work by 7" },
        { title: "Make Dinner", desc: "I want to make spaghetti" },
        { title: "Eat Dinner",  desc: "I need to finish dinner by 9" },
        { title: "Sleep",       desc: "I should sleep before 12:00" }
      ],
      list2: [
        { title: "Eat lunch", desc: "Eat amazing food" },
      ],
      dialog: false,
      dialog_title: "I'm a dialog",
      dialog_body: "I'm a body"
    };
  },
  methods: {
    log: function(evt) {
      window.console.log(evt);
    },
    openDialog(name, desc){
      this.dialog = true;
      this.dialog_title = name;
      this.dialog_body = desc;
    }
  },
  computed: {
    dragOptions() {
      return {
        animation: 0,
        group: "description",
        disabled: false,
        ghostClass: "ghost"
      };
    }
  }



};
</script>



<style>
  .header{
    background-color: rgba(0, 0, 0, .36);
    height: 50;
    font-size: 1.3em;
  }
  .no-move {
    transition: transform 0s;
  }
  .ghost {
    opacity: 0.5;
    background: #c8ebfb;
  }
  .height-test{
    min-height:150px;
  }
  .task-list-item {
    cursor: move;
  }
  .task-list-item i {
    cursor: pointer;
  }

</style>