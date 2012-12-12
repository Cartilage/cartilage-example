class window.App.Models.Hours extends Backbone.Model

  initialize: ->
    thisYear = new Date().getFullYear()
    @set('year', thisYear)
    @set('year_hours', 24 * if @isLeapYear(thisYear) then 366 else 365)

    jan1 = new Date(thisYear, 0, 1).getTime()
    now = new Date().getTime()

    @set('num_hours', Math.round((now - jan1) / 1000 / 60 / 60))

  # from http://stackoverflow.com/questions/9852837/leap-year-check-using-bitwise-operators-amazing-speed
  isLeapYear: (year) ->
    !(year & 3 || year & 15 && !(year % 25))

