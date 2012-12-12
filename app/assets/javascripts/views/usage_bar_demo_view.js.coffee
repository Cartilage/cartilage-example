class window.App.Views.UsageBarDemoView extends Cartilage.View

  events: ->
    "change #hours-input": "update"

  prepare: ->
    @model.on('all', @refresh, @);

  render: ->
    super()
    @refresh()
    @

  update: (event) ->
    @model.set('num_hours', $(event.target).val())

  refresh: ->
    (@$ '#hours-elapsed-usage-bar-view').empty()

    @usageBarView = new Cartilage.Views.UsageBarView {
      segments: new Cartilage.Collections.Segments([
        new Cartilage.Models.Segment({ maximum: 1944, title: "Winter (0-1,944)" }),
        new Cartilage.Models.Segment({ maximum: 4152, title: "Spring (1,945-4,152)" }),
        new Cartilage.Models.Segment({ maximum: 6360, title: "Summer (4,153-6,360)" }),
        new Cartilage.Models.Segment({ maximum: 8544, title: "Autumn (6,361-8,544)" }),
        new Cartilage.Models.Segment({ maximum: 8784, title: "Winter (8,545-)" }),
      ])
      value: @model.get('num_hours')
    }

    @addSubview @usageBarView, (@$ '#hours-elapsed-usage-bar-view')
    (@$ '#num-hours').text @model.get('num_hours')
