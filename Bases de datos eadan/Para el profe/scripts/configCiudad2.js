rs.initiate(
    {
        _id: "ciudad2",
        members: [
            { _id: 0, host : "poseidon:27018" },
            { _id: 1, host : "atlas:27018" },
            { _id: 2, host : "prometheus:27018", arbiterOnly: true }
        ]
    }
);