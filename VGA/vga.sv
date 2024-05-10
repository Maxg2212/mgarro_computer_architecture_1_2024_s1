module vga(input logic clk,
           input arriba, abajo, izquierda, derecha, mostrar, mostrar_flag,
           input logic rst, output logic [6:0] seg1Minas, seg2Minas, seg1Flag, seg2Flag,
           output logic vgaclk, // 25.175 MHz VGA clock
           output logic hsync, vsync,
           output logic sync_b, blank_b, // To monitor & DAC
           output logic [7:0] r, g, b); // To video DAC

    logic [9:0] x, y;
    logic [3:0] x_select, y_select;

	logic clock_dividido;
	divisor_clk divisor_clk_inst(.clk(clk), .clk_out(clock_dividido));


	
    always_ff @(posedge clock_dividido) begin
        if (arriba) begin
            if (y_select > 0) begin
                y_select = y_select - 1;
            end
        end
        if (abajo) begin
            if (y_select < 7) begin
                y_select = y_select + 1;
            end
        end
        if (izquierda) begin
            if (x_select > 0) begin
                x_select = x_select - 1;
            end
        end
        if (derecha) begin
            if (x_select < 7) begin
                x_select = x_select + 1;
            end
        end
    end

    //always_ff @(posedge rst) begin
        //if(rst) begin 
            //numero_bombas_game = numero_bombas;
        //end
    //end


    ///logica_buscaminas logica_buscaminas(clk, clock_dividido,  rst, numero_bombas_game, x_select, y_select, mostrar, mostrar_flag, 
                                            //matrix, matrix_bombas, matrix_visible, matrix_flags, win, lose, num_flags);
    
    //logica_buscaminas logica_buscaminas_fsm(.clk(clk), .clock_dividido(clock_dividido),  .rst(rst), .num_bombs(numero_bombas_game), .x_select(x_select), .y_select(y_select), .mostrar(mostrar), .mostrar_flag(mostrar_flag), 
    //                                    .matrix(matrix), .matrix_bombas(matrix_bombas), .matrix_visible(matrix_visible), .matrix_flags(matrix_flags), .win(win), .lose(lose), .num_flags(num_flags));


	
	//converter converterMinas(numero_bombas_game, seg1Minas, seg2Minas);
	//converter converterBanderas(num_flags, seg1Flag, seg2Flag);

    // Use a PLL to create the 25.175 MHz VGA pixel clock
    // 25.175 MHz clk period = 39.772 ns
    // Screen is 800 clocks wide by 525 tall, but only 640 x 480 used
    // HSync = 1/(39.772 ns *800) = 31.470 kHz
    // Vsync = 31.474 kHz / 525 = 59.94 Hz (~60 Hz refresh rate)
    pll vgapll(.inclk0(clk), .c0(vgaclk));
	 
	 
    // Generate monitor timing signals
    vgaController vgaCont(vgaclk, hsync, vsync, sync_b, blank_b, x, y);
	 
	 
    // User-defined module to determine pixel color
    videoGen videoGen(x, y, x_select, y_select,r, g, b);
	 
	 
endmodule