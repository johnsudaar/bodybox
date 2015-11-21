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
    maxProteines = Math.floor(size / 30) * 10
    $("#commande_box-size").val(size);

    sProteines = document.getElementById('proteines-slider')

    noUiSlider.create sProteines,
      start: maxProteines
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