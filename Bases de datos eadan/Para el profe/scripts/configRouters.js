sh.addShard("ciudad1/hades:27018");
sh.addShard("ciudad1/apollo:27018");
sh.addShard("ciudad2/poseidon:27018");
sh.addShard("ciudad2/atlas:27018");
sh.addShard("ciudad3/zeus:27018");
sh.addShard("ciudad3/maia:27018");
sh.enableSharding("proyecto");
sh.shardCollection("proyecto.camion", { "placa" : "hashed" } );