lines = ["A", "B", "C", "D", "E", "F", "G", "H", "I"]
0.upto(20) do |idx|
  Seat.create(
    seat_group: idx%5,
    line: "#{lines[idx%9]}",
    start_line: 1,
    last_line: idx+10,
    num: 50+idx*idx
  )
end