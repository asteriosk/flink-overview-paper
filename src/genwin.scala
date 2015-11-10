//general window API
stream.window(SlidingTimeWindows.of(Time.seconds(6), Time.seconds(2))
  .trigger(TimeTrigger.create())

//equivalent short hand for common use case
stream.timeWindow(Time.seconds(6), Time.seconds(2))

//global window
stream.window(GlobalWindow.create)
  .trigger(Count.of(1000))
  .evict(Count.of(100))