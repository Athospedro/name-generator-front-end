<template>
  <div>
    <div id="main">
      <div class="container">
        <div class="row">
          <div class="col-md">
            <AppItemList
              title="Prefixos"
              type="prefix"
              :items="items.prefix"
              @addItem="addItem"
              @deleteItem="deleteItem"
            />
          </div>
          <div class="col-md">
            <AppItemList
              title="Sufixos"
              type="suffix"
              :items="items.suffix"
              @addItem="addItem"
              @deleteItem="deleteItem"  
            />
          </div>
        </div>
        <br>
        <h5>Domais <span class="badge badge-info">{{ domains.length }}</span></h5>
        <div class="card">
          <div class="card-body">
            <ul class="list-group">
              <li class="list-group-item" v-for="domain in domains" :key="domain.name">
                <div class="row">
                  <div class="col-md-6">
                    {{ domain.name }}
                  </div>
                  <div class="col-md-3">
                   <span class="badge badge-info">{{ (domain.avaliable) ? "Disponível" : "Não Disponível" }}</span>
                  </div>
                  <div class="col-md-3 text-right">
                    <a class="btn btn-info" :href="domain.checkout" target="_blank"> 
                      <i class="fa fa-shopping-cart"/>
                    </a>
                    &nbsp;
                    <button class="btn btn-info" @click="openDomain(domain)">
                      <i class="fa fa-search"/>
                    </button>
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
import AppItemList from './AppItemList.vue'
import { mapState, mapActions } from 'vuex'
  
export default {
  name: "App",
  components: { 
    AppItemList 
  },

  data() {
    return {}
  },

  methods: {
    ...mapActions(['addItem', 'deleteItem', 'getItems', 'generateDomains']),
    // generateDomains() {
    //   this.$store.dispatch('generateDomains')
    // },
    openDomain(domain) {
      this.$router.push({
        path: `/domains/${domain.name}`
      })
    }
  },
  computed: {
    ...mapState(['items', 'domains'])
  }
}

</script>

