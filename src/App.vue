<template>
  <div>
    <div  id="slogan" class="text-center">
      <h1>NameGator</h1>
      <br>
      <h6 class="text-secondary">Gerador de nomes utilizando Vue.js</h6>
    </div>
    <div id="main">
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
import 'bootstrap/dist/css/bootstrap.css'
import 'font-awesome/css/font-awesome.css'  
  
export default {
  name: "App",
  components: { 

  },
}

</script>

<style>
#slogan {
  margin-top: 30px;
  margin-bottom: 30px;
} 

#main {
  background-color: #aec6db ;
  padding-top: 30px;
  padding-bottom: 30px;
}
</style>
