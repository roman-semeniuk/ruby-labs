concerts = [
  { artist: "Okean Elzy", city: "Kyiv", tickets_left: 50 },
  { artist: "Boombox", city: "Lviv", tickets_left: 120 },
  { artist: "Antytila", city: "Kyiv", tickets_left: 0 },
  { artist: "The Hardkiss", city: "Kyiv", tickets_left: 15 },
  { artist: "KAZKA", city: "Odesa", tickets_left: 80 },
  { artist: "Kalush", city: "Kyiv", tickets_left: 100 }
]

filtered_concerts = []

for concert in concerts
  if concert[:city] == "Kyiv" && concert[:tickets_left] > 0
    filtered_concerts << concert
  end
end

result = filtered_concerts.sort do |a, b|
  a[:tickets_left] <=> b[:tickets_left]
end

for concert in result
  puts concert[:artist] + " (" + concert[:city] + "): " + concert[:tickets_left].to_s + " tickets"
end