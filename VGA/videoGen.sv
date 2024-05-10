module videoGen(input logic [9:0] x, y, input logic [3:0] x_select, y_select,
				output logic [7:0] r, g, b);

    logic inrectBG1, inrectBG2;
	logic inSquare, inBomb;
	logic blanck, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, com, punt;

	// Rectangulo lateral izquierdo y derecho
	rectgen rectBG1(x, y, 10'd0, 10'd80, 10'd0, 10'd480, inrectBG1);
	rectgen rectBG2(x, y, 10'd560, 10'd640, 10'd0, 10'd480, inrectBG2);
	
	// Crea los cuadrados grices oscuros de 7 x 7
	assign inSquare = ((x-80) % 8 < 7) && ((y-80) % 8 < 7) && (x > 80) && (x < 560) && (y > 80) && (y < 560);

	
	//genvar i;
	//genvar j;
	//generate
        //for (i = 0; i <= 7; i++) begin : gen_set_icons_x
			//for (j = 0; j <= 7; j++) begin : gen_set_icons_y

				//logic [3:0] value_to_show;
				//assign value_to_show = (matrix_flags[i][j]==1) ? 4'b1011 : (matrix_bombas[i][j]==1) ? 4'b1010 : matrix[i][j];

				//set_icon set_icon_inst(value_to_show, x,y, i, j, matrix_visible[i][j], matrix_casillas[i][j]);

				//set_icon set_icon_inst(matrix[i][j], x,y, i, j, matrix_visible[i][j], matrix_casillas[i][j]);

			//end
        //end
    //endgenerate

	// Configura ganado_aux y perdido_aux para que tomen los valores de win y lose
	//always_comb begin
		//ganado_aux = win;
		//perdido_aux = lose;
	//end
	
	//set_icon icon_select ( 9, x, y, x_select, y_select, 1'b1, select);
	set_icon icon_A ( 1, x, y, 1, 0, 1'b1, A);
	set_icon icon_B (2, x, y, 2, 0, 1'b1, B);
	set_icon icon_C (3, x, y, 3, 0, 1'b1, C);
	set_icon icon_D (4, x, y, 4, 0, 1'b1, D);
	set_icon icon_E (5, x, y, 5, 0, 1'b1, E);
	set_icon icon_F (6, x, y, 6, 0, 1'b1, F);
	set_icon icon_G (7, x, y, 7, 0, 1'b1, G);
	set_icon icon_H (8, x, y, 8, 0, 1'b1, H);
	set_icon icon_I (9, x, y, 9, 0, 1'b1, I);
	set_icon icon_J (10, x, y, 10, 0, 1'b1, J);
	set_icon icon_K (11, x, y, 11, 0, 1'b1, K);
	set_icon icon_L (12, x, y, 12, 0, 1'b1, L);
	set_icon icon_M (13, x, y, 13, 0, 1'b1, M);
	set_icon icon_N (14, x, y, 14, 0, 1'b1, N);
	set_icon icon_O (15, x, y, 15, 0, 1'b1, O);
	set_icon icon_P (16, x, y, 16, 0, 1'b1, P);
	set_icon icon_Q (17, x, y, 17, 0, 1'b1, Q);
	set_icon icon_R (18, x, y, 18, 0, 1'b1, R);
	set_icon icon_S (19, x, y, 19, 0, 1'b1, S);
	set_icon icon_T (20, x, y, 20, 0, 1'b1, T);
	set_icon icon_U (21, x, y, 21, 0, 1'b1, U);
	set_icon icon_V (22, x, y, 22, 0, 1'b1, V);
	set_icon icon_W (23, x, y, 23, 0, 1'b1, W);
	set_icon icon_X (24, x, y, 24, 0, 1'b1, X);
	set_icon icon_Y (25, x, y, 25, 0, 1'b1, Y);
	set_icon icon_Z (26, x, y, 26, 0, 1'b1, Z);
	set_icon icon_com (27, x, y, 27, 0, 1'b1, com);
	set_icon icon_blanck (0, x, y, 0, 0, 1'b1, blanck);
	set_icon icon_punt (28, x, y, 29, 0, 1'b1, punt);
	
	detector_pos_matrix detector_pos_matrix_inst(x, y, x_matrix_aux, y_matrix_aux);

	//assign numero = (casillas) ? 1 : 0;
	//assign numero = (matrix_casillas) ? 1 : 0;
	//assign bomba = (numero && (matrix_bombas[x_matrix_aux][y_matrix_aux])) ? 1 : 0;
	//assign flag = (numero && (matrix_flags[x_matrix_aux][y_matrix_aux])) ? 1 : 0;
	
	// Determinar colores
	// Orden de prioridad: 1. Win 2. Numero 3. Select 4. Rectangulo 5. Cuadrado 6. Bomba
	//assign r = (ganado ? 8'h00 : perdido ? 8'hAA : flag ? 8'h32 : bomba ? 8'h32 : numero ? 8'hC8: select ? 8'h32 : (inrectBG1 | inrectBG2) ? 8'hD9 : inSquare ? 8'h53 :8'h00);
	//assign g = (ganado ? 8'hAA : perdido ? 8'h00 : flag ? 8'hC8 : bomba ? 8'h32 : numero ? 8'h32: select ? 8'h32 : (inrectBG1 | inrectBG2) ? 8'hD9 : inSquare ? 8'h56 :8'h00);
	//assign b = (ganado ? 8'hFF : perdido ? 8'h00 : flag ? 8'h32 : bomba ? 8'hC8 : numero ? 8'h32: select ? 8'hC8 : (inrectBG1 | inrectBG2) ? 8'hD6 : inSquare ? 8'h5B :8'h00);

	assign r = (blanck ? 8'h00 : com ? 8'h00 : punt ? 8'h00 : A ? 8'h00 : B ? 8'h00 : C ? 8'h00 : D ? 8'h00 : E ? 8'h00 : F ? 8'h00 : G ? 8'h00 : H ? 8'h00 : I ? 8'h00 : J ? 8'h00 : K ? 8'h00 : L ? 8'h00 : M ? 8'h00 : N ? 8'h00 : O ? 8'h00 : P ? 8'h00 : Q ? 8'h00 : R ? 8'h00 : S ? 8'h00 : T ? 8'h00 : U ? 8'h00 : V ? 8'h00 : W ? 8'h00 : X ? 8'h00 : Y ? 8'h00 : Z ? 8'h00 : (inrectBG1 | inrectBG2) ? 8'h00 : inSquare ? 8'h00 :8'h00);
	assign g = (blanck ? 8'h00 : com ? 8'hFF : punt ? 8'hFF : A ? 8'hFF : B ? 8'hFF : C ? 8'hFF : D ? 8'hFF : E ? 8'hFF : F ? 8'hFF : G ? 8'hFF : H ? 8'hFF : I ? 8'hFF : J ? 8'hFF : K ? 8'hFF : L ? 8'hFF : M ? 8'hFF : N ? 8'hFF : O ? 8'hFF : P ? 8'hFF : Q ? 8'hFF : R ? 8'hFF : S ? 8'hFF : T ? 8'hFF : U ? 8'hFF : V ? 8'hFF : W ? 8'hFF : X ? 8'hFF : Y ? 8'hFF : Z ? 8'hFF : (inrectBG1 | inrectBG2) ? 8'h00 : inSquare ? 8'h00 :8'h00);
	assign b = (blanck ? 8'h00 : com ? 8'h00 : punt ? 8'h00 : A ? 8'h00 : B ? 8'h00 : C ? 8'h00 : D ? 8'h00 : E ? 8'h00 : F ? 8'h00 : G ? 8'h00 : H ? 8'h00 : I ? 8'h00 : J ? 8'h00 : K ? 8'h00 : L ? 8'h00 : M ? 8'h00 : N ? 8'h00 : O ? 8'h00 : P ? 8'h00 : Q ? 8'h00 : R ? 8'h00 : S ? 8'h00 : T ? 8'h00 : U ? 8'h00 : V ? 8'h00 : W ? 8'h00 : X ? 8'h00 : Y ? 8'h00 : Z ? 8'h00 : (inrectBG1 | inrectBG2) ? 8'h00 : inSquare ? 8'h00 :8'h00);
	// Bombas y flags -> H3232C8
	
endmodule