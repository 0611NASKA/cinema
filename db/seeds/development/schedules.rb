0.upto(20) do |idx|
  Schedule.create(
    theater_id: idx%3+1,
    movie_id: idx%16+1,
    screen_no: 1,
    screening_date: Date.today,
    start_time: Time.parse("20:00"),
    end_time: Time.parse("22:00")
  )
end

0.upto(20) do |idx|
  Schedule.create(
    theater_id: idx%3+1,
    movie_id: idx%16+1,
    screen_no: 2,
    screening_date: Date.today,
    start_time: Time.parse("18:30"),
    end_time: Time.parse("20:30")
  )
end

0.upto(20) do |idx|
  Schedule.create(
    theater_id: idx%3+1,
    movie_id: idx%16+1,
    screen_no: 3,
    screening_date: Date.today,
    start_time: Time.parse("20:30"),
    end_time: Time.parse("22:30")
  )
end

0.upto(20) do |idx|
  Schedule.create(
    theater_id: idx%3+1,
    movie_id: idx%16+1,
    screen_no: 4,
    screening_date: Date.today,
    start_time: Time.parse("19:30"),
    end_time: Time.parse("21:30")
  )
end
