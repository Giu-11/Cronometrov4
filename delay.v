module delay (
    input clk,
    output Q_out
);

    wire Q_F0, Q_F1, Q_F2, Q_F3, Q_F4, Q_F5;

    dFlipFlop F0 (
        .d(Q_F0),
        .rstn(1'b0),
        .clk(clk),
        .q(),
        .q_(Q_F0)
    );

    dFlipFlop F1 (
        .d(Q_F1),
        .rstn(1'b0),
        .clk(Q_F0),
        .q(),
        .q_(Q_F1)
    );

    dFlipFlop F2 (
        .d(Q_F2),
        .rstn(1'b0),
        .clk(Q_F1),
        .q(),
        .q_(Q_F2)
    );

    dFlipFlop F3 (
        .d(Q_F3),
        .rstn(1'b0),
        .clk(Q_F2),
        .q(),
        .q_(Q_F3)
    );

    dFlipFlop F4 (
        .d(Q_F4),
        .rstn(1'b0),
        .clk(Q_F3),
        .q(),
        .q_(Q_F4)
    );

    dFlipFlop F5 (
        .d(Q_F5),
        .rstn(1'b0),
        .clk(Q_F4),
        .q(Q_out),
        .q_(Q_F5)
    );

endmodule

