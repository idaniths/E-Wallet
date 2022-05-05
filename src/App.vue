<template>
  <div id="app">
    <Home v-if="currentView == 'Home'"
          @send="currentView = 'Addcard'"
          :displayCard="displayCard"
          :cards="newArr"
          @updateCardArray="updateLocalStorage"
          />  
    <Addcard v-else-if="currentView == 'Addcard'"
          @sendit="displayCard" :cards="newArr"/>

  </div>
</template>

<script>
import Home from './views/Home.vue'
import Addcard from './views/Addcard.vue'
export default {
  components: {Home, Addcard},
  name: 'App',
    data(){
      return{
        currentView: 'Home', 
        
        newArr:[]
      }
    },
  methods:{
    displayCard(card){
      this.currentView = 'Home'
      this.newArr.push({...card})
      this.updateLocalStorage(this.newArr)
    },
    updateLocalStorage(){
      localStorage.setItem("cards", JSON.stringify(this.newArr)) 
    },
   
  },
  beforeMount(){
    if (localStorage.cards){
      try{
        this.newArr = JSON.parse(localStorage.getItem("cards"));
      }catch(err){
        this.newArr = []
      }
    }
  },
  }

</script>

<style>
*{
  margin: 0;
}
body{
  background-color: rgb(39, 39, 39);
  display: flex;
  justify-content: center;
}
#app{
display: flex;
justify-content: center;
width: 414px;
height: 896px;
background-color: white;
}

</style>
