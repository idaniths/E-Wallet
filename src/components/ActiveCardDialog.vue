<template>
  <div>
      <dialog open @click="cancel" >
          <h2>Do you want to remove this card?</h2>
          <button @click="$emit('delete')">Yes</button>
          <button @click="$emit('cancel')">Cancel</button>
      </dialog>
  </div>
</template>

<script>
export default {
    methods:{
        cancel(){
            this.$emit('close')
        },
    }
}
</script>

<style scoped>
div{
    position: relative;
    
}
dialog{
    position: absolute;
    z-index: 1;
    width: 20rem;
    font-family: PT Mono;
    font-size: 1rem;
    border: 1px solid black;
    top: 2rem;
    left: 0.9rem;
    border-radius: 0.5rem;
    text-align: center;
}
h2{
    font-family: 'Roboto', sans-serif;
    padding: 0 1rem 0 1rem;
}
button{
    width: 5rem;
    height: 2rem;
    background-color: white;
    color: black;
    font-family: PT Mono;
    margin: 1rem;
    border: 1px solid black;
    border-radius: 0.3rem;
}


</style>