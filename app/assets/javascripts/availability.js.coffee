$ -> 
  $(".availability-types-row").live "click", (e) ->
    # load the rooms table for the selected type
    # availability/rooms?types=1
    url = $(this).attr("data-url")
    params = '&start_date=' + $("#availability-table").attr("data-start")
    loadAvailability(url, params)

$ ->
  $(".next-date-selector").click (e) -> 
    url = $("#availability-table").attr("data-url")
    start_date = moment($("#availability-table").attr("data-start"))
    start_date.add('days', 14)
    params = '?start_date=' + start_date.format('YYYY-MM-DD')
    if ($("#availability-table").attr("data-type"))
      params += '&type=' + $("#availability-table").attr("data-type") 
    loadAvailability(url, params)

$ ->
  $(".prev-date-selector").click (e) -> 
    url = $("#availability-table").attr("data-url")
    start_date = moment($("#availability-table").attr("data-start"))
    start_date.subtract('days', 14)
    params = '?start_date=' + start_date.format('YYYY-MM-DD')
    if ($("#availability-table").attr("data-type"))
      params += '&type=' + $("#availability-table").attr("data-type") 
    loadAvailability(url, params)

loadAvailability = (url, params) ->
  $("#availability-loading").removeClass("hidden")
  $("#availability-loading").spin()
  $("#availability-table-cont").addClass("hidden")

  $("#availability-table-cont").load url + params, -> 
    $("#availability-loading").addClass("hidden")
    $("#availability-loading").spin(false)
    $("#availability-table-cont").removeClass("hidden")