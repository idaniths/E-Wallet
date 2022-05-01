<template>
    <div>

        <form @submit.prevent="addCard" @input="cardPreview">

            <label>CARD NUMBER</label>
            <input required class="cardnumber" type="text" 
                    placeholder="" 
                    v-model="form.cardNumber" 
                    maxlength="16">
            <label>CARD HOLDER NAME</label>
            <input required class="cardname" type="text" 
                    onkeypress="return /[a-ö, ' ']/i.test(event.key)" 
                    v-model="form.cardName" >

        <div class="month_year">
            <label>MONTH</label>
            <label>YEAR</label>
        </div>
        <div class="month_year_select">
            <select class="month" v-model="form.month">
                <option v-for="month in months" 
                :key="month">
                {{month}}
                </option>
            </select>
            
            <select class="year" v-model="form.year">
                <option v-for="year in years" 
                :key="year">
                {{year}}
                </option>
            </select>
        </div>
            
        <label>VENDOR</label>
        <select class="vendor" v-model="form.vendor">
            <option value="null"></option>
            <option v-for="vendor in vendors" 
            v-bind:key="vendor.name" 
            :value="vendor">
            {{vendor.name}}
            </option>         
        </select>

        <button>ADD CARD</button>
        </form>

    </div>
</template>

<script>

export default { 
    props:{cards: Array},
    data(){
        return{
            form:{
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
        
        vendors: [
            {
                name: 'Bitcoin',
                logo: require("../assets/bitcoin.svg"),
                wifi: require("../assets/wifi.svg"), 
                background: "linear-gradient(248.04deg, rgba(255, 255, 255, 0.15) 0%, rgba(255, 255, 255, 0) 99.07%), #FFAE34", 
            },
            {
                name: 'Ninja Bank',
                logo: require("../assets/ninja.svg"),
                wifi: require("../assets/wifi_white.svg"), 
                background: "linear-gradient(248.3deg, rgba(255, 255, 255, 0.15) 0%, rgba(255, 255, 255, 0) 100%), #222222",
                color: '#FFFFFF', 
            },
            {
                name: 'Block Chain INC',
                logo: require("../assets/blockchain.svg"),
                wifi: require("../assets/wifi_white.svg"), 
                background: "linear-gradient(248.52deg, rgba(0, 0, 0, 0.15) 1.49%, rgba(0, 0, 0, 0) 100%), #8B58F9", 
                color: '#FFFFFF',

            },
            {
                name: 'Evil Corp',
                logo: require("../assets/evil.svg"),
                wifi: require("../assets/wifi_white.svg"), 
                background: "linear-gradient(248.3deg, rgba(0, 0, 0, 0.16) 0%, rgba(0, 0, 0, 0) 100%), #F33355", 
                color: '#FFFFFF',
                
            },
        ],

        months:[
            '01','02','03','04','05','06','07','08','09','10','11','12'
        ],
        years:[
            22,23,24,25,26,27,28
        ],   
    }
},  
    computed:{ 
    },
    methods:{
        addCard(){
            if (this.cards.find((number) => number.cardNumber == this.form.cardNumber)){
              alert('Detta kort finns redan i din e-wallet!')
            }else{
            this.$emit('add-card', {...this.form});
            }
        },
        cardPreview(){
            this.$emit('preview', this.form)
        },
        },   
}



</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
div{
    font-family: PT Mono;
}
form{
    display: flex;
    justify-content: center;
    flex-direction: column;
    margin-top: 2rem;
    margin-bottom: 2rem;
    font-family: PT Mono;
}
input{
    max-width: 376px;
    height: 56px;
    border-radius: 0.5rem;
    padding-left: 0.8rem;
    background-color: white;
    border: 1px solid black;
    font-size: 1.2rem;
} 
.vendor{
    width: 382px;
    height: 56px;
    font-size: 1rem;
    border-radius: 0.5rem;
    background-color: white;
    border: 1px solid black;
    
}
.month, .year{
    width: 175px;
    height: 56px;
    font-size: 1rem;
    padding-left: 0.5rem;
    border-radius: 0.5rem;
    background-color: white;
    border: 1px solid black;
}
.month_year{
    display: flex;
    
}
.month_year label:nth-child(1){
    align-self:flex-start;

}
.month_year label:nth-child(2){
   
    transform:translateX(170px);

}
.month_year_select{
    display: flex;
    justify-content: space-between;
}
label{
    padding-top: 1rem;
    font-size: 12px;
}
button{
    margin-top: 2.5rem;
    width: 382px;
    height: 80px;
    background-color: black;
    color: white;
    border: none;
    border-radius: 0.5rem;
    font-size: 22px;
}
</style>