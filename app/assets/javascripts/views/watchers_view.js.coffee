class window.App.Views.WatchersView extends Cartilage.View

  prepare: ->
    @usageBarView = new Cartilage.Views.UsageBarView {
      segments: new Cartilage.Collections.Segments([
        new Cartilage.Models.Segment({ maximum: 500, title: "0-500" }),
        new Cartilage.Models.Segment({ maximum: 1500, title: "501-1,500" }),
        new Cartilage.Models.Segment({ maximum: 5000, title: "1,501-5,000" }),
        new Cartilage.Models.Segment({ maximum: 10000, title: "5,001-10,000" }),
        new Cartilage.Models.Segment({ maximum: 20000, title: "10,001-20,000" }),
        new Cartilage.Models.Segment({ maximum: 25000, title: "20,001-25,000" })
      ])
      value: @model.watchers
    }

    @addSubview @usageBarView, (@$ '#repository-watchers-usage-bar-view')
