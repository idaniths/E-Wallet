<template>
  <div class="home">
    <h1>E-WALLET</h1>
    <div v-if="activeCard">
      <Card :card="activeCard" />
    </div>
    <Card v-for="card in filterActive" 
        :key="card.cardNumber" 
        @click.native="()=>makeActive(card)" 
        :card="card"
        />

    <button @click="currentView">ADD A NEW CARD</button>
    
  </div>
</template>

<script>
import Card from '../components/Card.vue'
export default {
  props:{cards: Array},
   components: {Card},

   computed:{
     filterActive(){
        return this.cards.filter(card => card != this.activeCard)
     }
   },
   data(){
    return{
      activeCard: this.cards[0]
    }
  },
  methods:{
    makeActive(card){
      this.activeCard = card
    },
    currentView(){
      this.$emit('send')
      
    },
  }
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
div{
  display: flex;
  justify-content: center;
  flex-direction: column;
}
p{
  text-align: center;
  font-family: PT Mono;
}
h1{
  margin-top: 2rem;
  text-align: center;
  font-family: 'Roboto', sans-serif;
}
button{
  width: 382px;
  height: 80px;
  background-color: white;
  border-radius: 0.5rem;
  border: 1px solid black;
  
}
</style>