# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

update_graph = (proteines, glucides, legumes, size) ->
  proteines_prc = Math.floor(100*(proteines/size))
  glucides_prc = Math.floor(100*(glucides/size))
  if legumes == 0
    legumes_prc = 0
  else
    legumes_prc = 100 - proteines_prc - glucides_prc

  $("#legumes-pb").width(legumes_prc+"%")
  $("#proteines-pb").width(proteines_prc+"%")
  $("#glucides-pb").width(glucides_prc+"%")

update_all = (proteines, glucides, legumes, size) ->
  $("#commande_glucides").val(glucides)
  $("#commande_proteines").val(proteines)
  $("#commande_legumes").val(legumes)
  $("#proteines-value").text(proteines+" g")
  $("#glucides-value").text(glucides+" g")
  $("#legumes-value").text(legumes+" g")

  $("#show-glucides").hide()
  $("#nb-meals-btn").hide()

  sGlucides = document.getElementById('glucides-slider')
  sProteines = document.getElementById('proteines-slider')

  noUiSlider.create sGlucides,
    start: glucides
    connect: "lower"
    step: 10
    range:
      'min': 0
      'max': Math.floor(size/20)*10
  sProteines.noUiSlider.set proteines

  $(".toggle-button").bootstrapSwitch
    onText: "Deux repas"
    offText: "Trois repas"
    handleWidth: 100
    wrapperClass: "toggle-button-wrapper"

  $("#nb-meals").slideToggle 'slow', ->
  $("#glucides-group").slideToggle "slow", ->
  update_graph(proteines, glucides, legumes, size)

$ ->
  $("#nb-meals-btn").click ->
    $(".toggle-button").bootstrapSwitch
      onText: "Deux repas"
      offText: "Trois repas"
      handleWidth: 100
      wrapperClass: "toggle-button-wrapper"
    sGlucides = document.getElementById('glucides-slider')
    sGlucides.setAttribute 'disabled', true
    $("#nb-meals-btn").addClass("hide")
    $("#nb-meals").slideToggle 'slow', ->

  $("#value-select").slideToggle 0 , ->
  $("#glucides-group").slideToggle 0 , ->
  $("#nb-meals").slideToggle 0 , ->

  $(".box-type").click ->
    size = Math.floor($(this).attr "data-size")

    $("#hyperpoteine").click ->
      proteines = Math.floor(size / 20)*10
      glucides = Math.floor(size / 40)*10
      legumes = size - proteines - glucides
      update_all proteines, glucides, legumes, size
      $(".btn-preset").hide()

    $("#regime").click ->
      proteines = Math.floor(size / 40)*10
      glucides = Math.floor(size / 40)*10
      legumes = size - proteines - glucides
      update_all proteines, glucides, legumes, size
      $(".btn-preset").hide()

    $("#hypocalorique").click ->
      proteines = Math.floor(size / 40) * 10
      glucides = Math.floor(size / 40) * 10
      legumes = size - proteines - glucides
      update_all proteines, glucides, legumes, size
      $(".btn-preset").hide()


    maxProteines = Math.floor(size / 20) * 10
    $("#commande_box-size").val(size);

    sProteines = document.getElementById('proteines-slider')

    noUiSlider.create sProteines,
      start: Math.floor(size / 30) * 10
      connect: "lower"
      step: 10
      range:
        'min': 0
        'max': maxProteines

    sProteines.noUiSlider.on 'update', ->
      proteines = Math.floor(sProteines.noUiSlider.get())
      $("#proteines-value").text(proteines+" g")
      update_graph(proteines, 0, 0, size)


    $("#box-select").slideToggle "slow", ->
      $("#value-select").slideToggle "slow", ->

    $("#show-glucides").click ->
      sGlucides = document.getElementById('glucides-slider')
      sProteines = document.getElementById('proteines-slider')
      $(".btn-preset").hide()

      proteines = sProteines.noUiSlider.get()

      max = size - proteines
      value = (max / 20) * 10

      noUiSlider.create sGlucides,
        start: value
        connect: "lower"
        step: 10
        range:
          'min': 0
          'max': max

      sGlucides.noUiSlider.on 'update', ->
        glucides = Math.floor(sGlucides.noUiSlider.get())
        proteines = Math.floor(sProteines.noUiSlider.get())
        legumes = size - proteines - glucides

        $("#commande_glucides").val(glucides);
        $("#commande_proteines").val(proteines);
        $("#commande_legumes").val(legumes);


        $("#glucides-value").text(glucides+" g")
        $("#legumes-value").text(legumes+" g")
        update_graph(proteines, glucides, legumes, size)


      sProteines.setAttribute "disabled", true
      $(this).hide()
      $("#glucides-group").slideToggle "slow", ->




first = true
$ ->
  $("#relais").slideToggle 0, ->
  $("#domicile").slideToggle 0, ->

  $("#select_type").bootstrapSwitch
      onText: "Point relais"
      offText: "Livraison a domicile"
      handleWidth: 200
      wrapperClass: "toggle-button-wrapper"

  $("#btn-relais").click ->
    if ! first
      $("#domicile").slideToggle "slow", ->
        $("#relais").slideToggle "slow", ->
    else
      $("#relais").slideToggle "slow", ->
    $("#btn-relais").addClass "active"
    $("#btn-domicile").removeClass "active"
    first = false

  $("#btn-domicile").click ->
    if ! first
      $("#relais").slideToggle "slow", ->
        $("#domicile").slideToggle "slow", ->
    else
      $("#domicile").slideToggle "slow", ->
    $("#btn-domicile").addClass "active"
    $("#btn-relais").removeClass "active"
    first = false





$ ->
  $(".infos-image").height $("#infos").height()
  $(".infos-image").removeClass "hide"