--5.2.1
SELECT users.id, name, seat_number FROM tickets, users WHERE train=11 AND tickets.user=users.id ORDER BY seat_number;

--5.2.2
SELECT users.id, name, count(train) AS trains_count, 0.1*sum(distance) AS total_distance 
FROM users, tickets, trains 
WHERE users.id = tickets.user AND tickets.train = trains.id
GROUP BY users.id
ORDER BY total_distance DESC LIMIT 6;

--5.2.3
SELECT trains.id, types.name AS type, src.name AS src_stn, dst.name AS dst_stn, Timediff(arrival, departure) AS travel_time 
FROM trains
INNER JOIN types ON types.id = trains.type
INNER JOIN stations AS src ON src.id = trains.source 
INNER JOIN stations AS dst ON dst.id = trains.destination
ORDER BY travel_time DESC LIMIT 6;

--5.2.4
SELECT types.name AS type, src.name AS src_stn, dst.name AS dst_stn, departure, arrival, Round(0.001*distance * fare_rate, -2) AS fare
FROM trains
INNER JOIN types ON types.id = trains.type
INNER JOIN stations AS src ON src.id = trains.source 
INNER JOIN stations AS dst ON dst.id = trains.destination
ORDER BY departure;

--5.2.5
SELECT trains.id, types.name AS type, src.name AS src_stn, dst.name AS dst_stn, count(seat_number) AS occupied, max_seats AS maximum
FROM trains
INNER JOIN tickets ON tickets.train = trains.id
INNER JOIN types ON types.id = trains.type
INNER JOIN stations AS src ON src.id = trains.source 
INNER JOIN stations AS dst ON dst.id = trains.destination
GROUP BY trains.id;

--5.2.6
SELECT trains.id, types.name AS type, src.name AS src_stn, dst.name AS dst_stn, count(seat_number) AS occupied, max_seats AS maximum
FROM trains
LEFT OUTER JOIN tickets ON tickets.train = trains.id
INNER JOIN types ON types.id = trains.type
INNER JOIN stations AS src ON src.id = trains.source 
INNER JOIN stations AS dst ON dst.id = trains.destination
GROUP BY trains.id;
