module detector_pos_matrix(input logic [9:0] x, y, 
                            output logic [4:0] x_matrix_aux, y_matrix_aux);

    assign x_matrix_aux = (x-80)/7;
    assign y_matrix_aux = (y - 80)/7;

endmodule