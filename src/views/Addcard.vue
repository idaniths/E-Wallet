<template>
  <main class="add-card">
    <h1>ADD A NEW BANK CARD</h1>
    <Card :item="card" />
    <Form @add-card="currentView" 
    @preview="cardView" :cards="cards"/>
  </main>
</template>

<script>
import Form from '../components/Form.vue'
import Card from '../components/Card.vue'
export default {
  props:{cards: Array},
  components: {Form, Card},

  data(){
    return{
      card: 
        {
            cardNumber: '',
            cardName: '',
            month: 0,
            year: 22, 
            vendor: {
                name: 'Bitcoin',
                logo: require("../assets/bitcoin_copy.svg"),
                wifi: require("../assets/wifi.svg"),
                background: "linear-gradient(248.3deg, rgba(255, 255, 255, 0.24) 0%, rgba(255, 255, 255, 0) 100%), #D0D0D0" 
                },
            },

      
    }
  },
  methods:{
    cardView(previewData){
      this.card = previewData

    },
    // changeCardNum(newCardNum){
    //   console.log('Yuval card num', newCardNum)
    //   this.card = newCardNum;
    // },
    // showCard(event){
    //   this.card = event    
    //   },
    currentView(newcard){
      this.$emit('sendit', newcard)
      this.card = {...newcard}
      // console.log(this.card)
    }
  }
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');


main{
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin: 0;
  
}
h1{
  width: 15rem;
  margin-top: 2rem;
  margin-bottom: 3rem;
  text-align: center;
  font-family: 'Roboto', sans-serif;
}
button{
  
  padding: 1.5rem 8rem;
  background-color: black;
  color: white; 
  border-radius: 0.5rem;
  
}
</style>