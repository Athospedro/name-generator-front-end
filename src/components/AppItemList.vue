<template>
  <div>
    <h5>{{ title }} <spam class="badge badge-info">{{ items.length }}</spam></h5>
    <div class="card">
      <div class="card-body">
        <ul class="list-group">
          <li class="list-group-item" v-for="item in items" :key="item.id">
            <div class="row">
              <div class="col-md">
                {{ item.description }}
              </div>
              <div class="col-md text-right">
                <button class="btn btn-danger" @click="deleteItem(item)"><span class="fa fa-trash"></span></button>
              </div>
            </div>
          </li>
        </ul>
        <br/>
        <div class="input-group">
          <input class="form-control" type="text" v-model="description" @keyup.enter="addItem(type, description)" placeholder="Digite o item">
          <div class="input-group-append">
            <button class="brn btn-info" @click="addItem(type, description)"> <span class="fa fa-plus"></span></button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: 'AppItemList',
  props: { // aqui é onde recebo as variaveis que vão ser setada no componente principal
    items: {
      type: Array
    },
    title: {
      type: String
    },
    type: {
      type: String
    }
  },

  data() {
    return {
      description: ''
    }
  },

  methods: {
    addItem(type, description) {
      this.$emit('addItem', {
        type,
        description
      })
      this.description = ''
    },

    deleteItem(item) {
      this.$emit('deleteItem', item)
    }
  }
}
</script>

<style>

</style>
