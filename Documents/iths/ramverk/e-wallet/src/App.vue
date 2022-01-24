<template>
  <div id="app">
    <nav>
     
    </nav>
    <Home v-if="currentView == 'Home'"
          @send="currentView = 'Addcard'"
          :displayCard="displayCard"
          :newArr="newArr"/>
    <Addcard v-else-if="currentView == 'Addcard'"
          @sendit="displayCard"/>

  </div>
</template>

<script>
import Home from './views/Home.vue'
import Addcard from './views/Addcard.vue'
export default {
  components: {Home, Addcard},
  name: 'App',
  methods:{
    displayCard(card){
      this.currentView = 'Home'
     console.log(card);
    this.newArr.push({...card})
      
    },
    
  },
  data(){
    return{
      currentView: 'Home', 
      
      newArr:[]
    }

  },
  
    
  

  }

</script>

<style>
*{
  margin: 0;
}
body{
  background-color: cadetblue;
}
#app{
display: flex;
justify-content: center;
width: 414px;
height: 896px;
background-color: white;
}

</style>
