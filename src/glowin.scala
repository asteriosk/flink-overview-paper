stream
  .window(GlobalWindow.create)
  .trigger(Count.of(1000))
  .evict(Count.of(100))