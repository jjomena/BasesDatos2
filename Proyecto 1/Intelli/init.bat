docker-compose exec chronus sh -c "mongo --port 27019 /jss/configConfigServers.js"
docker-compose exec hades sh -c "mongo --port 27018 /jss/configCiudad1.js"
docker-compose exec poseidon sh -c "mongo --port 27018 /jss/configCiudad2.js"
docker-compose exec zeus sh -c "mongo --port 27018 /jss/configCiudad3.js"
timeout 20
docker-compose exec uranus sh -c "mongo /jss/configRouters.js"
docker-compose exec gaea sh -c "mongo /jss/configRouters.js"