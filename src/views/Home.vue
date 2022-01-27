<template>
  <div class="home" >
    <h1>E-WALLET</h1>

    <div class="active-card" v-if="activeCard">
      <!-- <div :class="{overlay: !hidden}"></div> -->
        <div class="dialog" v-if="!hidden">
          <ActiveCardDialog v-if="showDialog"
          @cancel="closeDialog"
          @delete="removeCard"/> 
        </div>
        <Card :item="activeCard" @double="showDialog"/> 
    </div>
    
    <div class="card-list">
      <!-- <div :class="{overlay: !hidden}"></div> -->
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
import ActiveCardDialog from "../components/ActiveCardDialog.vue"

export default {
  props:{cards: Array},
   components: {Card, ActiveCardDialog},
   computed:{

   },
   data(){
    return{
      activeCard: this.cards[0],
      dialog: false,
      hidden: true
    }
  },
  methods:{
    makeActive(card){
      this.activeCard = card
    },
    removeCard(){
      this.cards.splice(this.cards.indexOf(this.activeCard), 1);
      this.activeCard = this.cards[0]
      this.$emit('updateCardArray', this.cards)
      this.hidden = true
    },
    showDialog(){
      if(this.hidden == true){
        this.hidden = false
      }else{
        this.hidden = true
      }
    },
    closeDialog(){
        if(this.dialog == false){
          this.hidden = true
        }else{
          this.hidden = false
        }
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
  flex-direction: column;
  justify-content: space-between;
  position: relative;
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
  font-size: 22px;
  
}
.active-card{
  padding: 0;
  margin-top: 1rem;
  margin-bottom: 3rem;
  transform: translateY(-5rem);
}
.card-list{
  display: grid;
  grid-auto-rows: 47px;
  transform: translateY(-10rem);  
}
/* .overlay{
  position: fixed;
  z-index: 1;
  opacity: 60%;
  background-color: black;
  width: 414px;
  height: 896px;
} */


</style>