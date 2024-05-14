module set_icon(input logic[4:0] sel, input logic[9:0] x, y, input logic [4:0] x_matrix, y_matrix, input logic visible, output logic icon);

	logic blanck, blanck_1;
	logic com, com_1;
	logic punt, punt_1, punt_2;
	logic A, A_1, A_2, A_3, A_4;
	logic B, B_1, B_2, B_3, B_4, B_5;
	logic C, C_1, C_2, C_3;
	logic D, D_1, D_2, D_3, D_4;
	logic E, E_1, E_2, E_3, E_4;
	logic F, F_1, F_2, F_3;
	logic G, G_1, G_2, G_3, G_4, G_5;
	logic H, H_1, H_2, H_3;
	logic I, I_1, I_2, I_3;
	logic J, J_1, J_2, J_3;
	logic K, K_1, K_2, K_3, K_4, K_5, K_6;
	logic L, L_1, L_2;
	logic M, M_1, M_2, M_3, M_4, M_5;
	logic N, N_1, N_2, N_3, N_4, N_5;
	logic O, O_1, O_2, O_3, O_4;
	logic P, P_1, P_2, P_3, P_4;
	logic Q, Q_1, Q_2, Q_3, Q_4;
	logic R, R_1, R_2, R_3, R_4, R_5, R_6;
	logic S, S_1, S_2, S_3, S_4;
	logic T, T_1, T_2;
	logic U, U_1, U_2, U_3;
	logic V, V_1, V_2, V_3;
	logic W, W_1, W_2, W_3, W_4, W_5;
	logic X, X_1, X_2, X_3, X_4, X_5;
	logic Y, Y_1, Y_2, Y_3, Y_4;
	logic Z, Z_1, Z_2, Z_3, Z_4, Z_5;
	
	logic [9:0] x_aux, y_aux;
	
	assign x_aux = 200 + x_matrix * 8 - 4;
	assign y_aux = 120 + y_matrix * 8 - 4;

	rectgen rectblanck (x, y, x_aux + 0, x_aux + 1, y_aux - 0, y_aux + 3, blanck_1);
	
	rectgen rectcom (x, y, x_aux + 0, x_aux + 1, y_aux - 1, y_aux + 3, com_1);
	
	rectgen rectpunt1 (x, y, x_aux - 1, x_aux + 0, y_aux + 2, y_aux + 3, punt_1);
	rectgen rectpunt2 (x, y, x_aux + 0, x_aux + 1, y_aux + 2, y_aux + 3, punt_2);

	rectgen rectA1 (x, y, x_aux - 2, x_aux + 3, y_aux - 4, y_aux - 3, A_1); 
	rectgen rectA2 (x, y, x_aux - 2, x_aux - 1, y_aux - 3, y_aux + 3, A_2); 
	rectgen rectA3 (x, y, x_aux + 2, x_aux + 3, y_aux - 3, y_aux + 3, A_3); 
	rectgen rectA4 (x, y, x_aux - 1, x_aux + 2, y_aux + 0, y_aux + 1, A_4); 
	
	rectgen rectB1 (x, y, x_aux - 2, x_aux - 1, y_aux - 4, y_aux + 3, B_1);	
	rectgen rectB2 (x, y, x_aux + 3, x_aux + 4, y_aux - 4, y_aux + 3, B_2);	
	rectgen rectB3 (x, y, x_aux - 1, x_aux + 3, y_aux - 4, y_aux - 3, B_3);	
	rectgen rectB4 (x, y, x_aux + 0, x_aux + 3, y_aux - 1, y_aux + 0, B_4);	
	rectgen rectB5 (x, y, x_aux - 1, x_aux + 3, y_aux + 2, y_aux + 3, B_5);

	rectgen rectC1 (x, y, x_aux - 2, x_aux - 1, y_aux - 4, y_aux + 3, C_1);
	rectgen rectC2 (x, y, x_aux - 2, x_aux + 3, y_aux + 2, y_aux + 3, C_2);
	rectgen rectC3 (x, y, x_aux - 2, x_aux + 3, y_aux - 4, y_aux - 3, C_3);
	
	
	rectgen rectD1 (x, y, x_aux - 2, x_aux + 3, y_aux - 4, y_aux - 3, D_1); 
	rectgen rectD2 (x, y, x_aux - 1, x_aux + 0, y_aux - 4, y_aux + 3, D_2); 
	rectgen rectD3 (x, y, x_aux + 2, x_aux + 3, y_aux - 4, y_aux + 3, D_3); 
	rectgen rectD4 (x, y, x_aux - 2, x_aux + 3, y_aux + 2, y_aux + 3, D_4); 
	
	rectgen rectE1 (x, y, x_aux - 2, x_aux - 1, y_aux - 4, y_aux + 3, E_1);
	rectgen rectE2 (x, y, x_aux - 2, x_aux + 3, y_aux + 2, y_aux + 3, E_2);
	rectgen rectE3 (x, y, x_aux - 2, x_aux + 3, y_aux - 4, y_aux - 3, E_3);
	rectgen rectE4 (x, y, x_aux - 2, x_aux + 1, y_aux - 1, y_aux - 0, E_4);
	
	rectgen rectF1 (x, y, x_aux - 2, x_aux - 1, y_aux - 4, y_aux + 3, F_1);
	rectgen rectF2 (x, y, x_aux - 2, x_aux + 3, y_aux - 4, y_aux - 3, F_2);
	rectgen rectF3 (x, y, x_aux - 2, x_aux + 1, y_aux - 1, y_aux - 0, F_3);
	
	rectgen rectG1 (x, y, x_aux - 2, x_aux - 1, y_aux - 4, y_aux + 3, G_1);
	rectgen rectG2 (x, y, x_aux - 2, x_aux + 3, y_aux + 2, y_aux + 3, G_2);
	rectgen rectG3 (x, y, x_aux - 2, x_aux + 3, y_aux - 4, y_aux - 3, G_3);
	rectgen rectG4 (x, y, x_aux + 2, x_aux + 3, y_aux - 1, y_aux + 3, G_4);
	rectgen rectG5 (x, y, x_aux + 0, x_aux + 3, y_aux - 1, y_aux + 0, G_5);
	
	rectgen rectH1 (x, y, x_aux - 2, x_aux - 1, y_aux - 3, y_aux + 3, H_1); 
	rectgen rectH2 (x, y, x_aux + 2, x_aux + 3, y_aux - 3, y_aux + 3, H_2); 
	rectgen rectH3 (x, y, x_aux - 1, x_aux + 2, y_aux + 0, y_aux + 1, H_3); 
	
	rectgen rectI1 (x, y, x_aux - 2, x_aux + 3, y_aux + 2, y_aux + 3, I_1); 
	rectgen rectI2 (x, y, x_aux - 2, x_aux + 3, y_aux - 4, y_aux - 3, I_2); 
	rectgen rectI3 (x, y, x_aux + 0, x_aux + 1, y_aux - 4, y_aux + 3, I_3); 
	
	rectgen rectJ1 (x, y, x_aux + 2, x_aux + 3, y_aux - 4, y_aux + 3, J_1); 
	rectgen rectJ2 (x, y, x_aux - 2, x_aux + 3, y_aux + 2, y_aux + 3, J_2); 
	rectgen rectJ3 (x, y, x_aux - 2, x_aux - 1, y_aux + 0, y_aux + 3, J_3); 
	
	rectgen rectK1 (x, y, x_aux + 1, x_aux + 2, y_aux + 1, y_aux + 2, K_1); 
	rectgen rectK2 (x, y, x_aux - 2, x_aux + 1, y_aux - 1, y_aux + 0, K_2); 
	rectgen rectK3 (x, y, x_aux - 2, x_aux - 1, y_aux - 4, y_aux + 3, K_3);
	rectgen rectK4 (x, y, x_aux + 3, x_aux + 4, y_aux + 3, y_aux + 4, K_4); 
	rectgen rectK5 (x, y, x_aux + 1, x_aux + 2, y_aux - 2, y_aux - 1, K_5);
	rectgen rectK6 (x, y, x_aux + 3, x_aux + 4, y_aux - 3, y_aux - 2, K_6); 
	
	rectgen rectL1 (x, y, x_aux - 2, x_aux - 1, y_aux - 4, y_aux + 3, L_1);
	rectgen rectL2 (x, y, x_aux - 2, x_aux + 3, y_aux + 2, y_aux + 3, L_2);

	rectgen rectM1 (x, y, x_aux - 2, x_aux + 0, y_aux - 4, y_aux - 3, M_1); 
	rectgen rectM2 (x, y, x_aux - 2, x_aux - 1, y_aux - 3, y_aux + 3, M_2); 
	rectgen rectM3 (x, y, x_aux + 2, x_aux + 3, y_aux - 3, y_aux + 3, M_3); 
	rectgen rectM4 (x, y, x_aux + 1, x_aux + 3, y_aux - 4, y_aux - 3, M_4); 
	rectgen rectM5 (x, y, x_aux + 0, x_aux + 1, y_aux - 3, y_aux - 2, M_5); 
	
	rectgen rectN1 (x, y, x_aux - 2, x_aux + 0, y_aux - 4, y_aux - 3, N_1); 
	rectgen rectN2 (x, y, x_aux - 2, x_aux - 1, y_aux - 3, y_aux + 3, N_2); 
	rectgen rectN3 (x, y, x_aux + 2, x_aux + 3, y_aux - 3, y_aux + 3, N_3); 
	rectgen rectN4 (x, y, x_aux + 1, x_aux + 3, y_aux - 1, y_aux - 0, N_4); 
	rectgen rectN5 (x, y, x_aux + 0, x_aux + 1, y_aux - 3, y_aux - 2, N_5); 
	
	rectgen rectO1 (x, y, x_aux - 2, x_aux - 1, y_aux - 4, y_aux + 3, O_1);
	rectgen rectO2 (x, y, x_aux - 2, x_aux + 3, y_aux + 2, y_aux + 3, O_2);
	rectgen rectO3 (x, y, x_aux - 2, x_aux + 3, y_aux - 4, y_aux - 3, O_3);
	rectgen rectO4 (x, y, x_aux + 2, x_aux + 3, y_aux - 4, y_aux + 3, O_4);

	rectgen rectP1 (x, y, x_aux - 2, x_aux + 3, y_aux - 4, y_aux - 3, P_1); 
	rectgen rectP2 (x, y, x_aux - 2, x_aux - 1, y_aux - 3, y_aux + 3, P_2); 
	rectgen rectP3 (x, y, x_aux + 2, x_aux + 3, y_aux - 3, y_aux + 1, P_3); 
	rectgen rectP4 (x, y, x_aux - 1, x_aux + 2, y_aux + 0, y_aux + 1, P_4); 

	rectgen rectQ1 (x, y, x_aux - 2, x_aux + 3, y_aux - 4, y_aux - 3, Q_1); 
	rectgen rectQ2 (x, y, x_aux - 2, x_aux - 1, y_aux - 3, y_aux + 1, Q_2); 
	rectgen rectQ3 (x, y, x_aux + 2, x_aux + 3, y_aux - 3, y_aux + 3, Q_3); 
	rectgen rectQ4 (x, y, x_aux - 1, x_aux + 2, y_aux + 0, y_aux + 1, Q_4); 
	
	rectgen rectR1 (x, y, x_aux - 2, x_aux + 3, y_aux - 4, y_aux - 3, R_1); 
	rectgen rectR2 (x, y, x_aux - 2, x_aux - 1, y_aux - 3, y_aux + 3, R_2); 
	rectgen rectR3 (x, y, x_aux + 2, x_aux + 3, y_aux - 3, y_aux + 1, R_3); 
	rectgen rectR4 (x, y, x_aux - 1, x_aux + 2, y_aux + 0, y_aux + 1, R_4); 
	rectgen rectR5 (x, y, x_aux + 0, x_aux + 1, y_aux + 1, y_aux + 2, R_5); 
	rectgen rectR6 (x, y, x_aux + 1, x_aux + 2, y_aux + 2, y_aux + 3, R_6); 
	
	rectgen rectS1 (x, y, x_aux - 2, x_aux - 1, y_aux - 4, y_aux + 0, S_1);
	rectgen rectS2 (x, y, x_aux - 2, x_aux + 3, y_aux + 2, y_aux + 3, S_2);
	rectgen rectS3 (x, y, x_aux - 2, x_aux + 3, y_aux - 4, y_aux - 3, S_3);
	rectgen rectS4 (x, y, x_aux + 2, x_aux + 3, y_aux + 1, y_aux + 3, S_4);
	rectgen rectS5 (x, y, x_aux - 2, x_aux + 3, y_aux + 0, y_aux + 1, S_5);
	 
	rectgen rectT1 (x, y, x_aux - 2, x_aux + 3, y_aux - 4, y_aux - 3, T_1); 
	rectgen rectT2 (x, y, x_aux + 0, x_aux + 1, y_aux - 4, y_aux + 3, T_2); 
	
	rectgen rectU1 (x, y, x_aux - 2, x_aux - 1, y_aux - 4, y_aux + 3, U_1);
	rectgen rectU2 (x, y, x_aux - 2, x_aux + 3, y_aux + 2, y_aux + 3, U_2);
	rectgen rectU3 (x, y, x_aux + 2, x_aux + 3, y_aux - 4, y_aux + 3, U_3);

	rectgen rectV1 (x, y, x_aux - 2, x_aux - 1, y_aux - 4, y_aux + 3, V_1);
	rectgen rectV2 (x, y, x_aux - 2, x_aux + 0, y_aux + 1, y_aux + 2, V_2);
	rectgen rectV3 (x, y, x_aux + 2, x_aux + 3, y_aux - 4, y_aux - 2, V_3);

	rectgen rectW1 (x, y, x_aux - 2, x_aux - 1, y_aux - 4, y_aux + 3, W_1);
	rectgen rectW2 (x, y, x_aux - 2, x_aux + 3, y_aux + 2, y_aux + 3, W_2);
	rectgen rectW3 (x, y, x_aux + 2, x_aux + 3, y_aux - 4, y_aux + 3, W_3);
	rectgen rectW4 (x, y, x_aux + 0, x_aux + 1, y_aux - 0, y_aux + 3, W_4);
	
	rectgen rectX1 (x, y, x_aux - 2, x_aux - 1, y_aux - 4, y_aux - 1, X_1);
	rectgen rectX2 (x, y, x_aux - 2, x_aux - 1, y_aux + 2, y_aux + 3, X_2);
	rectgen rectX3 (x, y, x_aux + 2, x_aux + 3, y_aux - 4, y_aux - 1, X_3);
	rectgen rectX4 (x, y, x_aux + 2, x_aux + 3, y_aux + 2, y_aux + 3, X_4);
	rectgen rectX5 (x, y, x_aux - 0, x_aux + 1, y_aux + 0, y_aux + 1, X_5);
	
	rectgen rectY1 (x, y, x_aux - 2, x_aux - 1, y_aux - 4, y_aux + 0, Y_1);
	rectgen rectY2 (x, y, x_aux - 2, x_aux + 3, y_aux + 0, y_aux + 1, Y_2);
	rectgen rectY3 (x, y, x_aux + 2, x_aux + 3, y_aux - 4, y_aux + 0, Y_3);
	rectgen rectY4 (x, y, x_aux + 0, x_aux + 1, y_aux + 0, y_aux + 3, Y_4);

	rectgen rectZ1 (x, y, x_aux - 2, x_aux + 3, y_aux + 2, y_aux + 3, Z_1); 
	rectgen rectZ2 (x, y, x_aux + 2, x_aux + 3, y_aux - 3, y_aux - 2, Z_2); 
	rectgen rectZ3 (x, y, x_aux - 1, x_aux + 1, y_aux + 0 ,y_aux + 1, Z_3); 
	rectgen rectZ4 (x, y, x_aux - 2, x_aux + 3, y_aux - 4, y_aux - 3, Z_4); 
	rectgen rectZ5 (x, y, x_aux - 1, x_aux + 0, y_aux + 1, y_aux + 2, Z_5);
	
	

	assign blanck = (sel == 5'b00000 & (blanck_1                     ))? 1 : 0; // 00
	assign A = (sel == 5'b00001 & (A_1 | A_2 | A_3 | A_4             ))? 1 : 0; // 01
	assign B = (sel == 5'b00010 & (B_1 | B_2 | B_3 | B_4 | B_5       ))? 1 : 0; // 02
	assign C = (sel == 5'b00011 & (C_1 | C_2 | C_3                   ))? 1 : 0; // 03
	assign D = (sel == 5'b00100 & (D_1 | D_2 | D_3 | D_4             ))? 1 : 0; // 04
	assign E = (sel == 5'b00101 & (E_1 | E_2 | E_3 | E_4             ))? 1 : 0; // 05
	assign F = (sel == 5'b00110 & (F_1 | F_2 | F_3                   ))? 1 : 0; // 06
	assign G = (sel == 5'b00111 & (G_1 | G_2 | G_3 | G_4 | G_5       ))? 1 : 0; // 07
	assign H = (sel == 5'b01000 & (H_1 | H_2 | H_3                   ))? 1 : 0; // 08
	assign I = (sel == 5'b01001 & (I_1 | I_2 | I_3                   ))? 1 : 0; // 09
	assign J = (sel == 5'b01010 & (J_1 | J_2 | J_3                   ))? 1 : 0; // 10
	assign K = (sel == 5'b01011 & (K_1 | K_2 | K_3 | K_4 | K_5 | K_6 ))? 1 : 0; // 11
	assign L = (sel == 5'b01100 & (L_1 | L_2                         ))? 1 : 0; // 12
	assign M = (sel == 5'b01101 & (M_1 | M_2 | M_3 | M_4 | M_5       ))? 1 : 0; // 13
	assign N = (sel == 5'b01110 & (N_1 | N_2 | N_3 | N_4 | N_5       ))? 1 : 0; // 14
	assign O = (sel == 5'b01111 & (O_1 | O_2 | O_3 | O_4             ))? 1 : 0; // 15
	assign P = (sel == 5'b10000 & (P_1 | P_2 | P_3 | P_4             ))? 1 : 0; // 16
	assign Q = (sel == 5'b10001 & (Q_1 | Q_2 | Q_3 | Q_4             ))? 1 : 0; // 17
	assign R = (sel == 5'b10010 & (R_1 | R_2 | R_3 | R_4 | R_5 | R_6 ))? 1 : 0; // 18
	assign S = (sel == 5'b10011 & (S_1 | S_2 | S_3 | S_4 | S_5       ))? 1 : 0; // 19
	assign T = (sel == 5'b10100 & (T_1 | T_2                         ))? 1 : 0; // 20
	assign U = (sel == 5'b10101 & (U_1 | U_2 | U_3                   ))? 1 : 0; // 21
	assign V = (sel == 5'b10110 & (V_1 | V_2 | V_3                   ))? 1 : 0; // 22
	assign W = (sel == 5'b10111 & (W_1 | W_2 | W_3 | W_4             ))? 1 : 0; // 23
	assign X = (sel == 5'b11000 & (X_1 | X_2 | X_3 | X_4 | X_5       ))? 1 : 0; // 24
	assign Y = (sel == 5'b11001 & (Y_1 | Y_2 | Y_3 | Y_4             ))? 1 : 0; // 25
	assign Z = (sel == 5'b11010 & (Z_1 | Z_2 | Z_3 | Z_4 | Z_5       ))? 1 : 0; // 26
	assign com = (sel == 5'b11011 & (com_1                           ))? 1 : 0; // 27
	assign punt = (sel == 5'b11100 & (punt_1 | punt_1                ))? 1 : 0; // 28
	
	assign icon = (visible & (blanck | punt | com | A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X | Y | Z )) ? 1 : 0;

endmodule