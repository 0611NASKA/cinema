body =
  "text、text、text、text、text、text、text、text、text。\n\n" +
  "text、text、text、text、text、text、text、text、text、\n\n" +
  "text、text、text、text、text、text、text、text、text、\n\n" +
  "text、text、text、text、text、text、text、text、text。"

ftitles = ["進撃の", "襲撃の", "妄執の", "日常の"]
gtitles = ["青春", "情報", "修羅場"]
int = [120, 130, 110]

dis = ["生田", "神田", "石巻"]
dir = ["田中", "佐藤", "堀北"]

0.upto(9) do |idx|
  Movie.create(
    title: "#{ftitles[idx % 4]}#{gtitles[idx % 3]}",
    explanation: body,
    released_at: 31.days.ago.advance(days: idx),
    expired_at: 31.days.ago.advance(days: idx),
    screening_time: int[idx % 3],
    distribution: dis[idx % 3],
    director: dir[idx % 3]
  )
end