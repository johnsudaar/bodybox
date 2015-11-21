# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#value-select").slideToggle 0 , ->
  $(".box-type").click ->
    size = Math.floor($(this).attr "data-size")
    incr = Math.floor(size / 30) * 10

    sLegumes = document.getElementById('legumes-slider')
    sGlucides = document.getElementById('glucides-slider')
    sProteines = document.getElementById('proteines-slider')

    baseSlider =
      start: incr
      connect: "lower"
      step: 10
      range:
        'min': 0
        'max': incr

    noUiSlider.create sLegumes, baseSlider
    noUiSlider.create sGlucides, baseSlider
    noUiSlider.create sProteines,
      start: size - 2*incr
      connect: "lower"
      step: 10
      range:
        'min': 0
        'max': size - 2*incr

    f_update =  ->
      legumes = Math.floor(sLegumes.noUiSlider.get())
      glucides = Math.floor(sGlucides.noUiSlider.get())
      proteines = Math.floor(sProteines.noUiSlider.get())

      total = legumes + glucides + proteines
      dispo =  size - total

      max_legumes = legumes + dispo
      max_glucides = glucides + dispo
      max_proteines = proteines + dispo


      sLegumes.noUiSlider.updateOptions(
        connect: "lower"
        step: 10
        range:
            "min":0
            "max": max_legumes
      )
      sGlucides.noUiSlider.updateOptions(
        connect: "lower"
        step: 10
        range:
            "min":0
            "max": max_glucides
      )
      sProteines.noUiSlider.updateOptions(
        connect: "lower"
        step: 10
        range:
            "min":0
            "max": max_proteines
      )

      sLegumes.noUiSlider.set legumes
      sProteines.noUiSlider.set proteines
      sGlucides.noUiSlider.set glucides

      $("#proteines-value").text(proteines+" g")
      $("#legumes-value").text(legumes+" g")
      $("#glucides-value").text(glucides+" g")

    sLegumes.noUiSlider.on 'slide', f_update
    sProteines.noUiSlider.on 'slide', f_update
    sGlucides.noUiSlider.on 'slide', f_update

    f_update()



    $("#box-select").slideToggle "slow", ->
      $("#value-select").slideToggle "slow", ->


