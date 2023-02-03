<template>
  <div>
    <div class="container">
      <router-link to="/domains">Voltar</router-link>
      <br><br>
      <div class="text-left">
        <h2>{{ domain }}</h2>
        <div class="card">
          <div class="card-body">
            <ul class="list-group">
              <li class="list-group-item" v-for="domain in domains" :key="domain.extension">
                <div class="row">
                  <div class="col-md-6">
                    {{ domain.extension }}
                  </div>
                  <div class="col-md-3">
                   <span class="badge badge-info">{{ (domain.avaliable) ? "Disponível" : "Não Disponível" }}</span>
                  </div>
                  <div class="col-md-3 text-right">
                    <a class="btn btn-info" :href="domain.checkout" target="_blank"> 
                      <i class="fa fa-shopping-cart"/>
                    </a>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios/dist/axios'
export default { 
 props: ['domain'], 
  data() {
    return {
      domains: []
    }
  },

  created() {
    axios({
      url: 'http://localhost:4000',
      method: 'post',
      data: {
        query: `
          mutation ($name: String){
            domains: generateDomain(name: $name) {
              name
              extension
              checkout
              avaliable
            }
          }
        `,
        variables: {
          name: this.domain
        }
      }
    }).then(res => {
      const query = res.data
      this.domains = query.data.domains
    })
  }
}
</script>

<style>

</style>