rs.initiate(
    {
        _id: "ciudad1",
        members: [
            { _id: 0, host : "hades:27018" },
            { _id: 1, host : "apollo:27018" }
        ]
    }
);

rs.addArb("arthemis:27018");