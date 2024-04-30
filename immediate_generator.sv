module immediate_generator (
    input logic [24:0] inmGen,
    input logic [2:0] immSrc,
    output logic [31:0] immExt
);

    // Tipo R no tiene imm
    logic [11:0] immI;
    logic [11:0] immS;
    logic [12:0] immB;
    logic [31:0] immU;
    logic [20:0] immJ;

    /*
    Se asigna el espacio correspondiente al imm de cada instrucción
    según su posición dentro de la instrucción x32
    */
    assign immI = inmGen[24:13]; //últimos 12
    assign immS = {inmGen[24:18], inmGen[4:0]}; // últimos 7 + primeros 4
    assign immB = {inmGen[24], inmGen[0], inmGen[23:18], inmGen[4:1], 1'b0};
    assign immU = {inmGen[24:5], 12'b0};
    assign immJ = {inmGen[24], inmGen[12:5], inmGen[13], inmGen[23:14], 1'b0};

    always_comb begin
        case (immSrc)
            3'b000: immExt= $signed(immI);
            3'b001: immExt= $signed(immS);
            3'b101: immExt= $signed(immB);
            3'b010: immExt= $signed(immU);
            3'b110: immExt= $signed(immJ);
            default: immExt= 0;
        endcase
    end
endmodule