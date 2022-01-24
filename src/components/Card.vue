<template>
  <div>
        <article class="card" :style="cardStyle"  >
            <img class="logo" :src="item.vendor.logo" alt="logo">
            <div class="upper">
                <img :src="item.vendor.wifi" alt="">
                <img src="../assets/chip.svg" alt="">
            </div>
                <p class=cardnumber_number >{{item.cardNumber}} </p>
            <div class="lower">    
                <div class="cardholder_name_valid">
                    <p>CARDHOLDER NAME</p>
                    <p>VALID THRUE</p>
                </div>
                <div class="card_name_date">
                        <p class=card_name>{{item.cardName}}</p>
                    <div class="date">
                        <p class="card_month">{{item.month}}</p>/
                        <p class="card_year">{{item.year}}</p>
                    </div>
                </div>
            </div>
          
        </article>
  </div>
</template>

<script>


export default {
     props: {item: Object},   
    data(){
        return{
            
        }
    },
    computed:{
     
    cardStyle(){
        if(this.item){
            return{
                background: this.item.vendor.background,
                color: this.item.vendor.color,
                shadow: this.item.vendor.shadow  
            }
        }
        return null
    }
    },
     
    methods:{
    //     oncardChange(item){
    //         this.$emit('changeCardNum', item)
    //     }

    // },
    
}
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
div{
    font-family: PT Mono;
}
.card{
    background-color: #D0D0D0;
    width: 390px;
    height: 241px;
    border-radius: 0.5rem;
    box-shadow: 0px 0px 32px rgba(0, 0, 0, 0.1);
    margin-top: 3rem; 
    position: relative;
    align-self: center;
    box-shadow: 2px 2px 18px -10px rgba(0,0,0,0.75);
    
}
.logo{
    position:absolute;
    top: 1rem;
    right:1rem;
}
.upper{
    display: flex;
    flex-direction: column;
    padding-top: 1rem;
    padding-bottom: 1rem;
}
.upper img{
    width: 50px;
    margin-left: 1rem;
}
.cardnumber_number{
    position: absolute;
    font-size: 29px;
    margin-left: 1rem;
    margin-right: 1rem;
    font-family: PT Mono;
    
}
.lower{
    margin-top: 4.5rem;
    padding-top: 0rem;
    padding-bottom: 1rem;
}
.cardholder_name_valid{
    
    margin-left: 1rem;
    margin-right: 1rem;
    display: flex;
    justify-content: space-between;
    font-size: 12px;
    
}
.card_name_date{
    margin-left: 1rem;
    margin-right: 1rem;
    display: flex;
    justify-content: space-between;
   
}
.card_name_date .card_name{
    font-size: 18px;
    text-transform: uppercase;
}
.date{
    display: flex;
    flex-direction: row;
    font-size: 18px;
}
</style>