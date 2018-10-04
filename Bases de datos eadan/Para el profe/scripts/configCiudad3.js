rs.initiate(
    {
        _id: "ciudad3",
        members: [
            { _id: 0, host : "zeus:27018" },
            { _id: 1, host : "maia:27018" },
            { _id: 2, host: "leto:27018", arbiterOnly: true }
        ]
    }
);
