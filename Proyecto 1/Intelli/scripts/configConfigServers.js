rs.initiate(
    {
        _id: "configserver",
        configsvr: true,
        members: [
            { _id: 0, host : '10.0.0.5:27019' },
            { _id: 1, host : '10.0.0.6:27019'}
        ]
    }
);

rs.addArb("10.0.0.7:27019")
