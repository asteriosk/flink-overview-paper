object WindowWordCount {
  def main(args: Array[String]) {

    val env = StreamExecutionEnvironment.getExecutionEnvironment
    val text = env.socketTextStream("localhost", 9999)

    val counts = text
	.flatMap {line =>
		    line.toLowerCase.split("\\W+")
				.filter { w => w.nonEmpty }}
    .map {w =>  (w, 1) }
    .keyBy(0)
    .timeWindow(Time.of(5, TimeUnit.SECONDS))
    .sum(1)

    counts.print
    env.execute("Window Stream WordCount")
  }
}

