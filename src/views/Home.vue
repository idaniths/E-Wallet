<template>
  <div class="home">
    <h1>E-WALLET</h1>
    <div class="active-card" v-if="activeCard">
      <Card :item="activeCard" />
    </div>
    <div class="card-list">
    <Card v-for="card in cards" 
        :key="card.cardNumber" 
        @click="makeActive(card)" 
        :item="card"
        />
    </div>

    <button @click="currentView">ADD A NEW CARD</button>
    
  </div>
</template>

<script>
import Card from '../components/Card.vue'
export default {
  props:{cards: Array},
   components: {Card},

   computed:{
    //  filterActive(){
    //     return this.cards.filter(card => card != this.activeCard)
    //  }
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
*{
  margin: 0;
}
.home{
  display: flex;
  /* justify-content: center; */
  flex-direction: column;
  justify-content: space-between;
}
p{
  text-align: center;
  font-family: PT Mono;
}
h1{
  margin-top: 2rem;
  margin-bottom: 2rem;
  text-align: center;
  font-family: 'Roboto', sans-serif;
}
button{
  margin-bottom: 1rem;
  margin-top: 1rem;
  width: 382px;
  height: 80px;
  background-color: white;
  border-radius: 0.5rem;
  border: 1px solid black;
  
}
.active-card{
  padding: 0;
  margin-top: 1rem;
  margin-bottom: 3rem;
  transform: translateY(-5rem);
}
.card-list{
  display: grid;
  grid-auto-rows: 3rem;
  transform: translateY(-10rem);
  
}
</style>