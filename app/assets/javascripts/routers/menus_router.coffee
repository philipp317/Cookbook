class Cookbook.MenusRouter extends Backbone.Router

  routes:
    "menus/:id": "showMenu"

  constructor: ->
    super
    @menuView = new Cookbook.MenuView(el: $("#menu-view"))

    @menuListView = new Cookbook.MenuListView(el: $("#menu-list-view"))
    @menuListView.collection = new Cookbook.Menus

  list: ->
    @menuListView.collection.fetch success: => @menuListView.render()

  showMenu: (id) ->
    @menuView.model = new Cookbook.Menu(id: id)
    @menuView.model.fetch success: => @menuView.render()