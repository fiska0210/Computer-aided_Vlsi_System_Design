/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09-SP2
// Date      : Wed Jan  9 07:23:36 2019
/////////////////////////////////////////////////////////////


module LEDDC ( DCK, DAI, DEN, GCK, Vsync, mode, rst, OUT );
  output [15:0] OUT;
  input DCK, DAI, DEN, GCK, Vsync, mode, rst;
  wire   DEN_reg, read_en0_n, read_en1_n, round_60fps_cs, scan_idx_ns_4_,
         cur_read, N245, N246, N247, N248, n270, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
         n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399,
         n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n418, n419, n420, n421,
         n422, n423, n424, n425, n426, n427, n428, n429, n430, n431, n432,
         n433, n434, n435, n436, n437, n438, n439, n440, n441, n442, n443,
         n444, n445, n446, n447, n448, n449, n450, n451, n452, n453, n454,
         n455, n456, n457, n458, n459, n460, n461, n462, n463, n464, n465,
         n466, n467, n468, n469, n470, n471, n472, n473, n474, n475, n476,
         n477, n478, n479, n480, n481, n482, n483, n484, n485, n486, n487,
         n488, n489, n490, n491, n492, n493, n494, n495, n496, n497, n498,
         n499, n500, n501, n502, n503, n504, n505, n506, n507, n508, n509,
         n510, n511, n512, n513, n514, n515, n516, n517, n518, n519, n520,
         n521, n522, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633, n634, n635, n636, n637, n638, n639, n640, n641,
         n642, n643, n644, n645, n646, n647, n648, n649, n650, n651, n652,
         n653, n654, n655, n656, n657, n658, n659, n660, n661, n662, n663,
         n664, n665, n666, n667, n668, n669, n670, n671, n672, n673, n674,
         n675, n676, n677, n678, n679, n680, n681, n682, n683, n684, n685,
         n686, n687, n688, n689, n690, n691, n692, n693, n694, n695, n696,
         n697, n698, n699, n700, n701, n702, n703, n704, n705, n706, n707,
         n708, n709, n710, n711, n712, n713, n714, n715, n716, n717, n718,
         n719, n720, n721, n722, n723, n724, n725, n726, n727, n728, n729,
         n730, n731, n732, n733, n734, n735, n736, n737, n738, n739, n740,
         n741, n742, n743, n744, n745, n746;
  wire   [9:0] d_addr_cs;
  wire   [15:0] d_data;
  wire   [15:0] g_data0;
  wire   [9:8] g_addr_ns;
  wire   [15:0] g_data1;
  wire   [2:0] cur_state;
  wire   [15:0] counter_cs;
  wire   [4:0] scan_idx_cs;
  wire   [1:0] shift_cs;
  wire   [1:0] ram_addr_mode_cs;
  wire   [4:0] scanline_cnt_cs;
  wire   [2:0] next_state;
  wire   [1:0] shift_ns;
  wire   [1:0] ram_addr_mode_ns;
  wire   [3:0] read_idx_ns;
  wire   [3:0] tmp_addr_ns;
  wire   [3:0] shift_g_data;
  wire   [63:0] next_scanline;
  wire   [63:0] cur_scanline;
  wire   [3:0] counter_shift;

  sram_512x16 inst_sram_0 ( .AB(d_addr_cs[8:0]), .DB(d_data), .AA({
        g_addr_ns[8], read_idx_ns, tmp_addr_ns}), .QA(g_data0), .CENB(n345), 
        .CENA(read_en0_n), .CLKB(DCK), .CLKA(GCK) );
  sram_256x16 inst_sram_1 ( .AB(d_addr_cs[7:0]), .DB(d_data), .AA({read_idx_ns, 
        tmp_addr_ns}), .QA(g_data1), .CENB(n346), .CENA(read_en1_n), .CLKB(DCK), .CLKA(GCK) );
  DFFRX1 DEN_reg_reg ( .D(n367), .CK(DCK), .RN(n704), .Q(DEN_reg) );
  DFFRX1 d_addr_cs_reg_0_ ( .D(n344), .CK(DCK), .RN(n704), .Q(d_addr_cs[0]), 
        .QN(n700) );
  DFFRX1 d_addr_cs_reg_2_ ( .D(n342), .CK(DCK), .RN(n704), .Q(d_addr_cs[2]), 
        .QN(n703) );
  DFFRX1 d_addr_cs_reg_3_ ( .D(n341), .CK(DCK), .RN(n704), .Q(d_addr_cs[3]), 
        .QN(n676) );
  DFFRX1 d_addr_cs_reg_4_ ( .D(n340), .CK(DCK), .RN(n704), .Q(d_addr_cs[4]), 
        .QN(n701) );
  DFFRX1 d_addr_cs_reg_5_ ( .D(n339), .CK(DCK), .RN(n704), .Q(d_addr_cs[5]), 
        .QN(n675) );
  DFFRX1 d_addr_cs_reg_6_ ( .D(n338), .CK(DCK), .RN(n704), .Q(d_addr_cs[6]), 
        .QN(n699) );
  DFFRX1 d_addr_cs_reg_7_ ( .D(n337), .CK(DCK), .RN(n704), .Q(d_addr_cs[7]) );
  DFFRX1 d_addr_cs_reg_8_ ( .D(n336), .CK(DCK), .RN(n704), .Q(d_addr_cs[8]), 
        .QN(n702) );
  DFFRX1 d_addr_cs_reg_9_ ( .D(n335), .CK(DCK), .RN(n704), .Q(d_addr_cs[9]), 
        .QN(n677) );
  DFFRX1 scanline_cnt_cs_reg_4_ ( .D(n730), .CK(GCK), .RN(n705), .Q(
        scanline_cnt_cs[4]) );
  DFFRX1 scanline_cnt_cs_reg_0_ ( .D(tmp_addr_ns[0]), .CK(GCK), .RN(n704), .Q(
        scanline_cnt_cs[0]), .QN(n672) );
  DFFRX1 scanline_cnt_cs_reg_1_ ( .D(tmp_addr_ns[1]), .CK(GCK), .RN(n706), .Q(
        scanline_cnt_cs[1]), .QN(n682) );
  DFFRX1 scanline_cnt_cs_reg_2_ ( .D(tmp_addr_ns[2]), .CK(GCK), .RN(n706), .Q(
        scanline_cnt_cs[2]), .QN(n669) );
  DFFRX1 scanline_cnt_cs_reg_3_ ( .D(tmp_addr_ns[3]), .CK(GCK), .RN(n704), .Q(
        scanline_cnt_cs[3]), .QN(n674) );
  DFFRX1 scan_idx_cs_reg_1_ ( .D(n728), .CK(GCK), .RN(n705), .Q(scan_idx_cs[1]), .QN(n685) );
  DFFRX1 scan_idx_cs_reg_3_ ( .D(n727), .CK(GCK), .RN(n705), .Q(scan_idx_cs[3]) );
  DFFRX1 scan_idx_cs_reg_4_ ( .D(scan_idx_ns_4_), .CK(GCK), .RN(n704), .Q(
        scan_idx_cs[4]) );
  DFFRX4 counter_cs_reg_0_ ( .D(n732), .CK(GCK), .RN(n706), .Q(counter_cs[0])
         );
  DFFRX4 counter_cs_reg_7_ ( .D(n738), .CK(GCK), .RN(n705), .Q(counter_cs[7]), 
        .QN(n693) );
  DFFRX4 counter_cs_reg_9_ ( .D(n740), .CK(GCK), .RN(n705), .Q(counter_cs[9]), 
        .QN(n694) );
  DFFRX4 counter_cs_reg_10_ ( .D(n741), .CK(GCK), .RN(n706), .Q(counter_cs[10]), .QN(n689) );
  DFFRX4 counter_cs_reg_11_ ( .D(n742), .CK(GCK), .RN(n705), .Q(counter_cs[11]), .QN(n692) );
  DFFRX1 ram_addr_mode_cs_reg_0_ ( .D(ram_addr_mode_ns[0]), .CK(GCK), .RN(n705), .Q(ram_addr_mode_cs[0]) );
  DFFSX1 ram_addr_mode_cs_reg_1_ ( .D(ram_addr_mode_ns[1]), .CK(GCK), .SN(n705), .Q(ram_addr_mode_cs[1]), .QN(n687) );
  DFFRX1 round_60fps_cs_reg ( .D(n270), .CK(GCK), .RN(n704), .Q(round_60fps_cs) );
  DFFQX1 counter_shift_reg_3_ ( .D(N248), .CK(GCK), .Q(counter_shift[3]) );
  DFFQX1 counter_shift_reg_2_ ( .D(N247), .CK(GCK), .Q(counter_shift[2]) );
  DFFQX1 counter_shift_reg_1_ ( .D(N246), .CK(GCK), .Q(counter_shift[1]) );
  DFFQX1 counter_shift_reg_0_ ( .D(N245), .CK(GCK), .Q(counter_shift[0]) );
  DFFRX1 scan_idx_cs_reg_0_ ( .D(n729), .CK(GCK), .RN(n706), .Q(scan_idx_cs[0]), .QN(n670) );
  DFFRX2 cur_state_reg_2_ ( .D(next_state[2]), .CK(GCK), .RN(n705), .Q(
        cur_state[2]), .QN(n684) );
  DFFSX2 shift_cs_reg_0_ ( .D(shift_ns[0]), .CK(GCK), .SN(n705), .Q(
        shift_cs[0]), .QN(n679) );
  DFFRX2 cur_state_reg_0_ ( .D(next_state[0]), .CK(GCK), .RN(n705), .Q(
        cur_state[0]), .QN(n671) );
  EDFFXL cur_scanline_reg_13__0_ ( .D(next_scanline[8]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[8]) );
  EDFFXL cur_scanline_reg_9__0_ ( .D(next_scanline[24]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[24]) );
  EDFFXL cur_scanline_reg_7__0_ ( .D(next_scanline[32]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[32]) );
  EDFFXL cur_scanline_reg_13__1_ ( .D(next_scanline[9]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[9]) );
  EDFFXL cur_scanline_reg_12__1_ ( .D(next_scanline[13]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[13]) );
  EDFFXL cur_scanline_reg_9__1_ ( .D(next_scanline[25]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[25]) );
  EDFFXL cur_scanline_reg_8__1_ ( .D(next_scanline[29]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[29]) );
  EDFFXL cur_scanline_reg_15__0_ ( .D(next_scanline[0]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[0]) );
  EDFFXL cur_scanline_reg_11__0_ ( .D(next_scanline[16]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[16]) );
  EDFFXL cur_scanline_reg_5__0_ ( .D(next_scanline[40]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[40]) );
  EDFFXL cur_scanline_reg_3__0_ ( .D(next_scanline[48]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[48]) );
  EDFFXL cur_scanline_reg_2__0_ ( .D(next_scanline[52]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[52]) );
  EDFFXL cur_scanline_reg_11__1_ ( .D(next_scanline[17]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[17]) );
  EDFFXL cur_scanline_reg_10__1_ ( .D(next_scanline[21]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[21]) );
  EDFFXL cur_scanline_reg_6__1_ ( .D(next_scanline[37]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[37]) );
  EDFFXL cur_scanline_reg_4__1_ ( .D(next_scanline[45]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[45]) );
  EDFFXL cur_scanline_reg_3__1_ ( .D(next_scanline[49]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[49]) );
  EDFFXL cur_scanline_reg_2__1_ ( .D(next_scanline[53]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[53]) );
  EDFFXL cur_scanline_reg_14__0_ ( .D(next_scanline[4]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[4]) );
  EDFFXL cur_scanline_reg_12__0_ ( .D(next_scanline[12]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[12]) );
  EDFFXL cur_scanline_reg_10__0_ ( .D(next_scanline[20]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[20]) );
  EDFFXL cur_scanline_reg_8__0_ ( .D(next_scanline[28]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[28]) );
  EDFFXL cur_scanline_reg_6__0_ ( .D(next_scanline[36]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[36]) );
  EDFFXL cur_scanline_reg_4__0_ ( .D(next_scanline[44]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[44]) );
  EDFFXL cur_scanline_reg_1__0_ ( .D(next_scanline[56]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[56]) );
  EDFFXL cur_scanline_reg_0__0_ ( .D(next_scanline[60]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[60]) );
  EDFFXL cur_scanline_reg_15__1_ ( .D(next_scanline[1]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[1]) );
  EDFFXL cur_scanline_reg_14__1_ ( .D(next_scanline[5]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[5]) );
  EDFFXL cur_scanline_reg_7__1_ ( .D(next_scanline[33]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[33]) );
  EDFFXL cur_scanline_reg_5__1_ ( .D(next_scanline[41]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[41]) );
  EDFFXL cur_scanline_reg_1__1_ ( .D(next_scanline[57]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[57]) );
  EDFFXL cur_scanline_reg_0__1_ ( .D(next_scanline[61]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[61]), .QN(n709) );
  EDFFXL cur_scanline_reg_12__2_ ( .D(next_scanline[14]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[14]) );
  EDFFXL cur_scanline_reg_11__3_ ( .D(next_scanline[19]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[19]), .QN(n721) );
  EDFFXL cur_scanline_reg_10__2_ ( .D(next_scanline[22]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[22]) );
  EDFFXL cur_scanline_reg_9__3_ ( .D(next_scanline[27]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[27]), .QN(n719) );
  EDFFXL cur_scanline_reg_8__3_ ( .D(next_scanline[31]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[31]), .QN(n718) );
  EDFFXL cur_scanline_reg_8__2_ ( .D(next_scanline[30]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[30]) );
  EDFFXL cur_scanline_reg_15__3_ ( .D(next_scanline[3]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[3]), .QN(n725) );
  EDFFXL cur_scanline_reg_15__2_ ( .D(next_scanline[2]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[2]) );
  EDFFXL cur_scanline_reg_14__3_ ( .D(next_scanline[7]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[7]), .QN(n724) );
  EDFFXL cur_scanline_reg_14__2_ ( .D(next_scanline[6]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[6]) );
  EDFFXL cur_scanline_reg_13__2_ ( .D(next_scanline[10]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[10]) );
  EDFFXL cur_scanline_reg_12__3_ ( .D(next_scanline[15]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[15]), .QN(n722) );
  EDFFXL cur_scanline_reg_9__2_ ( .D(next_scanline[26]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[26]) );
  EDFFXL cur_scanline_reg_7__3_ ( .D(next_scanline[35]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[35]), .QN(n717) );
  EDFFXL cur_scanline_reg_7__2_ ( .D(next_scanline[34]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[34]) );
  EDFFXL cur_scanline_reg_6__3_ ( .D(next_scanline[39]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[39]), .QN(n716) );
  EDFFXL cur_scanline_reg_6__2_ ( .D(next_scanline[38]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[38]) );
  EDFFXL cur_scanline_reg_5__3_ ( .D(next_scanline[43]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[43]), .QN(n715) );
  EDFFXL cur_scanline_reg_5__2_ ( .D(next_scanline[42]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[42]) );
  EDFFXL cur_scanline_reg_11__2_ ( .D(next_scanline[18]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[18]) );
  EDFFXL cur_scanline_reg_10__3_ ( .D(next_scanline[23]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[23]), .QN(n720) );
  EDFFXL cur_scanline_reg_13__3_ ( .D(next_scanline[11]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[11]), .QN(n723) );
  EDFFXL cur_scanline_reg_4__3_ ( .D(next_scanline[47]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[47]), .QN(n714) );
  EDFFXL cur_scanline_reg_4__2_ ( .D(next_scanline[46]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[46]) );
  EDFFXL cur_scanline_reg_3__3_ ( .D(next_scanline[51]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[51]), .QN(n713) );
  EDFFXL cur_scanline_reg_3__2_ ( .D(next_scanline[50]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[50]) );
  EDFFXL cur_scanline_reg_2__3_ ( .D(next_scanline[55]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[55]), .QN(n712) );
  EDFFXL cur_scanline_reg_2__2_ ( .D(next_scanline[54]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[54]) );
  EDFFXL cur_scanline_reg_1__3_ ( .D(next_scanline[59]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[59]), .QN(n711) );
  EDFFXL cur_scanline_reg_1__2_ ( .D(next_scanline[58]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[58]) );
  EDFFXL cur_scanline_reg_0__3_ ( .D(next_scanline[63]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[63]), .QN(n710) );
  EDFFXL cur_scanline_reg_0__2_ ( .D(next_scanline[62]), .E(n707), .CK(GCK), 
        .Q(cur_scanline[62]) );
  DFFRX2 cur_state_reg_1_ ( .D(next_state[1]), .CK(GCK), .RN(n706), .Q(
        cur_state[1]), .QN(n683) );
  EDFFXL d_data_reg_10_ ( .D(d_data[11]), .E(n367), .CK(DCK), .Q(d_data[10])
         );
  EDFFXL next_scanline_reg_12__3_ ( .D(next_scanline[11]), .E(n708), .CK(GCK), 
        .Q(next_scanline[15]) );
  EDFFXL next_scanline_reg_13__2_ ( .D(next_scanline[6]), .E(n708), .CK(GCK), 
        .Q(next_scanline[10]) );
  EDFFXL next_scanline_reg_14__1_ ( .D(next_scanline[1]), .E(n708), .CK(GCK), 
        .Q(next_scanline[5]) );
  EDFFXL next_scanline_reg_15__0_ ( .D(shift_g_data[0]), .E(n708), .CK(GCK), 
        .Q(next_scanline[0]) );
  EDFFXL next_scanline_reg_0__0_ ( .D(next_scanline[56]), .E(n708), .CK(GCK), 
        .Q(next_scanline[60]) );
  EDFFX2 cur_read_reg ( .D(g_addr_ns[9]), .E(n706), .CK(GCK), .Q(cur_read), 
        .QN(n678) );
  DFFRX2 d_addr_cs_reg_1_ ( .D(n343), .CK(DCK), .RN(n704), .Q(d_addr_cs[1]) );
  DFFSX4 shift_cs_reg_1_ ( .D(shift_ns[1]), .CK(GCK), .SN(n706), .Q(
        shift_cs[1]) );
  DFFRX1 counter_cs_reg_1_ ( .D(n731), .CK(GCK), .RN(n705), .Q(counter_cs[1]), 
        .QN(n691) );
  DFFRX1 counter_cs_reg_2_ ( .D(n733), .CK(GCK), .RN(n706), .Q(counter_cs[2]), 
        .QN(n696) );
  DFFRX1 counter_cs_reg_3_ ( .D(n734), .CK(GCK), .RN(n705), .Q(counter_cs[3]), 
        .QN(n698) );
  DFFRX2 counter_cs_reg_5_ ( .D(n736), .CK(GCK), .RN(n705), .Q(counter_cs[5]), 
        .QN(n686) );
  DFFRX2 counter_cs_reg_6_ ( .D(n737), .CK(GCK), .RN(n706), .Q(counter_cs[6]), 
        .QN(n681) );
  DFFRX1 counter_cs_reg_12_ ( .D(n743), .CK(GCK), .RN(n705), .Q(counter_cs[12]), .QN(n688) );
  DFFRX2 counter_cs_reg_13_ ( .D(n744), .CK(GCK), .RN(n706), .Q(counter_cs[13]), .QN(n695) );
  EDFFXL d_data_reg_15_ ( .D(DAI), .E(n367), .CK(DCK), .Q(d_data[15]) );
  EDFFXL d_data_reg_14_ ( .D(d_data[15]), .E(n367), .CK(DCK), .Q(d_data[14])
         );
  EDFFXL d_data_reg_13_ ( .D(d_data[14]), .E(n367), .CK(DCK), .Q(d_data[13])
         );
  EDFFXL d_data_reg_12_ ( .D(d_data[13]), .E(n367), .CK(DCK), .Q(d_data[12])
         );
  EDFFXL d_data_reg_11_ ( .D(d_data[12]), .E(n367), .CK(DCK), .Q(d_data[11])
         );
  EDFFXL d_data_reg_9_ ( .D(d_data[10]), .E(n367), .CK(DCK), .Q(d_data[9]) );
  EDFFXL d_data_reg_8_ ( .D(d_data[9]), .E(n367), .CK(DCK), .Q(d_data[8]) );
  EDFFXL d_data_reg_7_ ( .D(d_data[8]), .E(n367), .CK(DCK), .Q(d_data[7]) );
  EDFFXL d_data_reg_6_ ( .D(d_data[7]), .E(n367), .CK(DCK), .Q(d_data[6]) );
  EDFFXL d_data_reg_5_ ( .D(d_data[6]), .E(n367), .CK(DCK), .Q(d_data[5]) );
  EDFFXL d_data_reg_4_ ( .D(d_data[5]), .E(n367), .CK(DCK), .Q(d_data[4]) );
  EDFFXL d_data_reg_3_ ( .D(d_data[4]), .E(n367), .CK(DCK), .Q(d_data[3]) );
  EDFFXL d_data_reg_2_ ( .D(d_data[3]), .E(n367), .CK(DCK), .Q(d_data[2]) );
  EDFFXL d_data_reg_1_ ( .D(d_data[2]), .E(n367), .CK(DCK), .Q(d_data[1]) );
  EDFFXL d_data_reg_0_ ( .D(d_data[1]), .E(n367), .CK(DCK), .Q(d_data[0]) );
  EDFFXL next_scanline_reg_15__3_ ( .D(shift_g_data[3]), .E(n708), .CK(GCK), 
        .Q(next_scanline[3]) );
  EDFFXL next_scanline_reg_14__3_ ( .D(next_scanline[3]), .E(n708), .CK(GCK), 
        .Q(next_scanline[7]) );
  EDFFXL next_scanline_reg_13__3_ ( .D(next_scanline[7]), .E(n708), .CK(GCK), 
        .Q(next_scanline[11]) );
  EDFFXL next_scanline_reg_11__3_ ( .D(next_scanline[15]), .E(n708), .CK(GCK), 
        .Q(next_scanline[19]) );
  EDFFXL next_scanline_reg_10__3_ ( .D(next_scanline[19]), .E(n708), .CK(GCK), 
        .Q(next_scanline[23]) );
  EDFFXL next_scanline_reg_9__3_ ( .D(next_scanline[23]), .E(n708), .CK(GCK), 
        .Q(next_scanline[27]) );
  EDFFXL next_scanline_reg_8__3_ ( .D(next_scanline[27]), .E(n708), .CK(GCK), 
        .Q(next_scanline[31]) );
  EDFFXL next_scanline_reg_7__3_ ( .D(next_scanline[31]), .E(n708), .CK(GCK), 
        .Q(next_scanline[35]) );
  EDFFXL next_scanline_reg_6__3_ ( .D(next_scanline[35]), .E(n708), .CK(GCK), 
        .Q(next_scanline[39]) );
  EDFFXL next_scanline_reg_5__3_ ( .D(next_scanline[39]), .E(n708), .CK(GCK), 
        .Q(next_scanline[43]) );
  EDFFXL next_scanline_reg_4__3_ ( .D(next_scanline[43]), .E(n708), .CK(GCK), 
        .Q(next_scanline[47]) );
  EDFFXL next_scanline_reg_3__3_ ( .D(next_scanline[47]), .E(n708), .CK(GCK), 
        .Q(next_scanline[51]) );
  EDFFXL next_scanline_reg_2__3_ ( .D(next_scanline[51]), .E(n708), .CK(GCK), 
        .Q(next_scanline[55]) );
  EDFFXL next_scanline_reg_1__3_ ( .D(next_scanline[55]), .E(n708), .CK(GCK), 
        .Q(next_scanline[59]) );
  EDFFXL next_scanline_reg_0__3_ ( .D(next_scanline[59]), .E(n708), .CK(GCK), 
        .Q(next_scanline[63]) );
  EDFFXL next_scanline_reg_15__2_ ( .D(shift_g_data[2]), .E(n708), .CK(GCK), 
        .Q(next_scanline[2]) );
  EDFFXL next_scanline_reg_14__2_ ( .D(next_scanline[2]), .E(n708), .CK(GCK), 
        .Q(next_scanline[6]) );
  EDFFXL next_scanline_reg_12__2_ ( .D(next_scanline[10]), .E(n708), .CK(GCK), 
        .Q(next_scanline[14]) );
  EDFFXL next_scanline_reg_11__2_ ( .D(next_scanline[14]), .E(n708), .CK(GCK), 
        .Q(next_scanline[18]) );
  EDFFXL next_scanline_reg_10__2_ ( .D(next_scanline[18]), .E(n708), .CK(GCK), 
        .Q(next_scanline[22]) );
  EDFFXL next_scanline_reg_9__2_ ( .D(next_scanline[22]), .E(n708), .CK(GCK), 
        .Q(next_scanline[26]) );
  EDFFXL next_scanline_reg_8__2_ ( .D(next_scanline[26]), .E(n708), .CK(GCK), 
        .Q(next_scanline[30]) );
  EDFFXL next_scanline_reg_7__2_ ( .D(next_scanline[30]), .E(n708), .CK(GCK), 
        .Q(next_scanline[34]) );
  EDFFXL next_scanline_reg_6__2_ ( .D(next_scanline[34]), .E(n708), .CK(GCK), 
        .Q(next_scanline[38]) );
  EDFFXL next_scanline_reg_5__2_ ( .D(next_scanline[38]), .E(n708), .CK(GCK), 
        .Q(next_scanline[42]) );
  EDFFXL next_scanline_reg_4__2_ ( .D(next_scanline[42]), .E(n708), .CK(GCK), 
        .Q(next_scanline[46]) );
  EDFFXL next_scanline_reg_3__2_ ( .D(next_scanline[46]), .E(n708), .CK(GCK), 
        .Q(next_scanline[50]) );
  EDFFXL next_scanline_reg_2__2_ ( .D(next_scanline[50]), .E(n708), .CK(GCK), 
        .Q(next_scanline[54]) );
  EDFFXL next_scanline_reg_1__2_ ( .D(next_scanline[54]), .E(n708), .CK(GCK), 
        .Q(next_scanline[58]) );
  EDFFXL next_scanline_reg_0__2_ ( .D(next_scanline[58]), .E(n708), .CK(GCK), 
        .Q(next_scanline[62]) );
  EDFFXL next_scanline_reg_15__1_ ( .D(shift_g_data[1]), .E(n708), .CK(GCK), 
        .Q(next_scanline[1]) );
  EDFFXL next_scanline_reg_13__1_ ( .D(next_scanline[5]), .E(n708), .CK(GCK), 
        .Q(next_scanline[9]) );
  EDFFXL next_scanline_reg_12__1_ ( .D(next_scanline[9]), .E(n708), .CK(GCK), 
        .Q(next_scanline[13]) );
  EDFFXL next_scanline_reg_11__1_ ( .D(next_scanline[13]), .E(n708), .CK(GCK), 
        .Q(next_scanline[17]) );
  EDFFXL next_scanline_reg_10__1_ ( .D(next_scanline[17]), .E(n708), .CK(GCK), 
        .Q(next_scanline[21]) );
  EDFFXL next_scanline_reg_9__1_ ( .D(next_scanline[21]), .E(n708), .CK(GCK), 
        .Q(next_scanline[25]) );
  EDFFXL next_scanline_reg_8__1_ ( .D(next_scanline[25]), .E(n708), .CK(GCK), 
        .Q(next_scanline[29]) );
  EDFFXL next_scanline_reg_7__1_ ( .D(next_scanline[29]), .E(n708), .CK(GCK), 
        .Q(next_scanline[33]) );
  EDFFXL next_scanline_reg_6__1_ ( .D(next_scanline[33]), .E(n708), .CK(GCK), 
        .Q(next_scanline[37]) );
  EDFFXL next_scanline_reg_5__1_ ( .D(next_scanline[37]), .E(n708), .CK(GCK), 
        .Q(next_scanline[41]) );
  EDFFXL next_scanline_reg_4__1_ ( .D(next_scanline[41]), .E(n708), .CK(GCK), 
        .Q(next_scanline[45]) );
  EDFFXL next_scanline_reg_3__1_ ( .D(next_scanline[45]), .E(n708), .CK(GCK), 
        .Q(next_scanline[49]) );
  EDFFXL next_scanline_reg_2__1_ ( .D(next_scanline[49]), .E(n708), .CK(GCK), 
        .Q(next_scanline[53]) );
  EDFFXL next_scanline_reg_1__1_ ( .D(next_scanline[53]), .E(n708), .CK(GCK), 
        .Q(next_scanline[57]) );
  EDFFXL next_scanline_reg_0__1_ ( .D(next_scanline[57]), .E(n708), .CK(GCK), 
        .Q(next_scanline[61]) );
  EDFFXL next_scanline_reg_14__0_ ( .D(next_scanline[0]), .E(n708), .CK(GCK), 
        .Q(next_scanline[4]) );
  EDFFXL next_scanline_reg_13__0_ ( .D(next_scanline[4]), .E(n708), .CK(GCK), 
        .Q(next_scanline[8]) );
  EDFFXL next_scanline_reg_12__0_ ( .D(next_scanline[8]), .E(n708), .CK(GCK), 
        .Q(next_scanline[12]) );
  EDFFXL next_scanline_reg_11__0_ ( .D(next_scanline[12]), .E(n708), .CK(GCK), 
        .Q(next_scanline[16]) );
  EDFFXL next_scanline_reg_10__0_ ( .D(next_scanline[16]), .E(n708), .CK(GCK), 
        .Q(next_scanline[20]) );
  EDFFXL next_scanline_reg_9__0_ ( .D(next_scanline[20]), .E(n708), .CK(GCK), 
        .Q(next_scanline[24]) );
  EDFFXL next_scanline_reg_8__0_ ( .D(next_scanline[24]), .E(n708), .CK(GCK), 
        .Q(next_scanline[28]) );
  EDFFXL next_scanline_reg_7__0_ ( .D(next_scanline[28]), .E(n708), .CK(GCK), 
        .Q(next_scanline[32]) );
  EDFFXL next_scanline_reg_6__0_ ( .D(next_scanline[32]), .E(n708), .CK(GCK), 
        .Q(next_scanline[36]) );
  EDFFXL next_scanline_reg_5__0_ ( .D(next_scanline[36]), .E(n708), .CK(GCK), 
        .Q(next_scanline[40]) );
  EDFFXL next_scanline_reg_4__0_ ( .D(next_scanline[40]), .E(n708), .CK(GCK), 
        .Q(next_scanline[44]) );
  EDFFXL next_scanline_reg_3__0_ ( .D(next_scanline[44]), .E(n708), .CK(GCK), 
        .Q(next_scanline[48]) );
  EDFFXL next_scanline_reg_2__0_ ( .D(next_scanline[48]), .E(n708), .CK(GCK), 
        .Q(next_scanline[52]) );
  EDFFXL next_scanline_reg_1__0_ ( .D(next_scanline[52]), .E(n708), .CK(GCK), 
        .Q(next_scanline[56]) );
  DFFSX1 scan_idx_cs_reg_2_ ( .D(n726), .CK(GCK), .SN(n706), .QN(
        scan_idx_cs[2]) );
  DFFRX2 counter_cs_reg_14_ ( .D(n745), .CK(GCK), .RN(n705), .Q(counter_cs[14]), .QN(n690) );
  DFFRX2 counter_cs_reg_8_ ( .D(n739), .CK(GCK), .RN(n706), .Q(counter_cs[8]), 
        .QN(n680) );
  DFFRX2 counter_cs_reg_15_ ( .D(n746), .CK(GCK), .RN(n706), .Q(counter_cs[15]), .QN(n697) );
  DFFRX2 counter_cs_reg_4_ ( .D(n735), .CK(GCK), .RN(n706), .Q(counter_cs[4]), 
        .QN(n673) );
  NOR2X1 U415 ( .A(n519), .B(n508), .Y(n509) );
  BUFX6 U416 ( .A(n460), .Y(n456) );
  BUFX6 U417 ( .A(n460), .Y(n493) );
  INVX16 U418 ( .A(n425), .Y(n492) );
  BUFX2 U419 ( .A(n654), .Y(n347) );
  INVX1 U420 ( .A(n410), .Y(n412) );
  NOR2X4 U421 ( .A(n417), .B(counter_shift[2]), .Y(n460) );
  INVX3 U422 ( .A(n506), .Y(n645) );
  NAND2X2 U423 ( .A(n638), .B(counter_cs[11]), .Y(n616) );
  NOR2X4 U424 ( .A(n631), .B(n689), .Y(n638) );
  NOR2X1 U425 ( .A(n515), .B(n522), .Y(n729) );
  NOR2X4 U426 ( .A(n510), .B(n574), .Y(n519) );
  NOR2X1 U427 ( .A(n514), .B(n670), .Y(n522) );
  INVX4 U428 ( .A(n555), .Y(n574) );
  NAND2X2 U429 ( .A(Vsync), .B(n516), .Y(n397) );
  NAND2X2 U430 ( .A(shift_cs[1]), .B(shift_cs[0]), .Y(n565) );
  NAND2X4 U431 ( .A(n369), .B(n368), .Y(n384) );
  NOR2X2 U432 ( .A(counter_cs[10]), .B(counter_cs[11]), .Y(n375) );
  NOR2X4 U433 ( .A(counter_cs[13]), .B(counter_cs[14]), .Y(n369) );
  INVXL U434 ( .A(n419), .Y(n420) );
  NAND2XL U435 ( .A(n409), .B(n408), .Y(n419) );
  INVXL U436 ( .A(n576), .Y(n571) );
  INVXL U437 ( .A(n578), .Y(n581) );
  INVXL U438 ( .A(n539), .Y(n541) );
  OAI22XL U439 ( .A0(n583), .A1(n582), .B0(n581), .B1(n580), .Y(n655) );
  NAND2XL U440 ( .A(n648), .B(n739), .Y(n622) );
  NAND2XL U441 ( .A(n533), .B(n532), .Y(n535) );
  NOR2XL U442 ( .A(scanline_cnt_cs[0]), .B(scanline_cnt_cs[1]), .Y(n547) );
  AOI2BB2X1 U443 ( .B0(n456), .B1(cur_scanline[63]), .A0N(n492), .A1N(n434), 
        .Y(n437) );
  AND2X1 U444 ( .A(n645), .B(n644), .Y(n734) );
  OAI211XL U445 ( .A0(n615), .A1(n651), .B0(n614), .C0(n613), .Y(N246) );
  NAND4X1 U446 ( .A(scanline_cnt_cs[4]), .B(n547), .C(n669), .D(n674), .Y(n586) );
  INVX1 U447 ( .A(n745), .Y(n635) );
  OA21X2 U448 ( .A0(n727), .A1(n601), .B0(n537), .Y(read_idx_ns[3]) );
  AND2X2 U449 ( .A(n626), .B(n645), .Y(n745) );
  AND2X2 U450 ( .A(n645), .B(n617), .Y(n743) );
  AND2X2 U451 ( .A(n645), .B(n608), .Y(n731) );
  AND2X2 U452 ( .A(n645), .B(n610), .Y(n740) );
  AND2X2 U453 ( .A(n645), .B(n607), .Y(n736) );
  AND2X2 U454 ( .A(n645), .B(n632), .Y(n741) );
  AND2X2 U455 ( .A(n645), .B(n641), .Y(n738) );
  AND2X2 U456 ( .A(n645), .B(n628), .Y(n737) );
  AND2X2 U457 ( .A(n645), .B(n621), .Y(n739) );
  AND2X2 U458 ( .A(n645), .B(n604), .Y(n744) );
  AND2X2 U459 ( .A(n645), .B(n639), .Y(n742) );
  AND2X2 U460 ( .A(n645), .B(n619), .Y(n735) );
  AND2X2 U461 ( .A(n645), .B(n630), .Y(n733) );
  NOR2X4 U462 ( .A(n602), .B(n726), .Y(n601) );
  INVX1 U463 ( .A(shift_ns[1]), .Y(n612) );
  AND2X2 U464 ( .A(n546), .B(n542), .Y(n730) );
  INVX16 U465 ( .A(n509), .Y(n707) );
  OAI211X1 U466 ( .A0(n577), .A1(n576), .B0(n575), .C0(cur_read), .Y(n578) );
  BUFX12 U467 ( .A(n586), .Y(n708) );
  NOR2X1 U468 ( .A(n673), .B(n686), .Y(n503) );
  INVX6 U469 ( .A(n424), .Y(n425) );
  NAND2X4 U470 ( .A(n601), .B(n727), .Y(n537) );
  NOR2X2 U471 ( .A(n625), .B(n690), .Y(n504) );
  NAND2X4 U472 ( .A(n653), .B(n728), .Y(n602) );
  NOR2X4 U473 ( .A(n616), .B(n688), .Y(n603) );
  INVX1 U474 ( .A(n546), .Y(n599) );
  NOR2X1 U475 ( .A(n526), .B(n525), .Y(n527) );
  INVX1 U476 ( .A(n528), .Y(n526) );
  NOR2X1 U477 ( .A(n524), .B(scan_idx_cs[2]), .Y(n525) );
  OR2X1 U478 ( .A(n563), .B(n562), .Y(n656) );
  NOR2X1 U479 ( .A(n567), .B(n531), .Y(n532) );
  NOR2X1 U480 ( .A(n517), .B(cur_state[2]), .Y(n518) );
  INVX1 U481 ( .A(n414), .Y(n415) );
  INVX1 U482 ( .A(n605), .Y(n618) );
  NOR2X1 U483 ( .A(n393), .B(cur_state[2]), .Y(n394) );
  INVX1 U484 ( .A(n407), .Y(n409) );
  OAI22X1 U485 ( .A0(n555), .A1(cur_state[2]), .B0(n402), .B1(n508), .Y(n399)
         );
  INVX1 U486 ( .A(n516), .Y(n517) );
  NOR2X2 U487 ( .A(n502), .B(n629), .Y(n605) );
  INVX1 U488 ( .A(n629), .Y(n642) );
  NOR2X1 U489 ( .A(n565), .B(n364), .Y(n414) );
  NOR2X1 U490 ( .A(cur_state[2]), .B(n365), .Y(n408) );
  NOR2X1 U491 ( .A(n693), .B(counter_cs[11]), .Y(n374) );
  INVX2 U492 ( .A(n364), .Y(n365) );
  INVX2 U493 ( .A(mode), .Y(n364) );
  NOR2X1 U494 ( .A(n407), .B(n684), .Y(n395) );
  NAND2X6 U495 ( .A(n405), .B(n404), .Y(next_state[1]) );
  OAI21X2 U496 ( .A0(Vsync), .A1(cur_state[0]), .B0(n683), .Y(n406) );
  NAND4X2 U497 ( .A(n370), .B(counter_cs[8]), .C(counter_cs[13]), .D(
        counter_cs[14]), .Y(n371) );
  NOR2X1 U498 ( .A(ram_addr_mode_ns[0]), .B(ram_addr_mode_ns[1]), .Y(n637) );
  NOR3X2 U499 ( .A(n671), .B(n684), .C(cur_state[1]), .Y(n508) );
  NAND2X2 U500 ( .A(n516), .B(cur_state[2]), .Y(n514) );
  NAND2X1 U501 ( .A(n648), .B(n741), .Y(n633) );
  NAND2X2 U502 ( .A(n380), .B(n375), .Y(n377) );
  XOR2X2 U503 ( .A(counter_cs[15]), .B(n365), .Y(n370) );
  NOR3X6 U504 ( .A(n388), .B(n387), .C(n386), .Y(n389) );
  NOR2X2 U505 ( .A(n385), .B(counter_cs[11]), .Y(n387) );
  NOR2X4 U506 ( .A(counter_cs[15]), .B(counter_cs[8]), .Y(n368) );
  AOI21X1 U507 ( .A0(n726), .A1(n602), .B0(n601), .Y(read_idx_ns[2]) );
  XOR2X4 U508 ( .A(n537), .B(scan_idx_ns_4_), .Y(n636) );
  CLKBUFX3 U509 ( .A(n442), .Y(n490) );
  AOI211XL U510 ( .A0(n579), .A1(g_data0[1]), .B0(n549), .C0(cur_read), .Y(
        n554) );
  INVXL U511 ( .A(g_data1[7]), .Y(n577) );
  AOI22XL U512 ( .A0(n574), .A1(g_data1[15]), .B0(g_data1[11]), .B1(n573), .Y(
        n575) );
  INVX3 U513 ( .A(counter_shift[0]), .Y(n495) );
  NOR3XL U514 ( .A(n671), .B(n683), .C(n365), .Y(n393) );
  NAND2XL U515 ( .A(n603), .B(counter_cs[13]), .Y(n625) );
  NAND2X2 U516 ( .A(n609), .B(counter_cs[9]), .Y(n631) );
  NAND3XL U517 ( .A(n730), .B(n598), .C(n544), .Y(n545) );
  NAND2XL U518 ( .A(n543), .B(n586), .Y(n544) );
  INVXL U519 ( .A(n548), .Y(n543) );
  INVXL U520 ( .A(n743), .Y(n624) );
  INVXL U521 ( .A(n744), .Y(n615) );
  CLKINVX1 U522 ( .A(n746), .Y(n650) );
  CLKINVX1 U523 ( .A(n384), .Y(n385) );
  OAI2BB1XL U524 ( .A0N(n579), .A1N(g_data0[2]), .B0(n678), .Y(n558) );
  NAND3X1 U525 ( .A(n398), .B(n365), .C(n684), .Y(n400) );
  AOI22XL U526 ( .A0(n574), .A1(g_data0[13]), .B0(g_data0[9]), .B1(n573), .Y(
        n553) );
  AOI211XL U527 ( .A0(n579), .A1(g_data1[1]), .B0(n550), .C0(n678), .Y(n551)
         );
  AOI211XL U528 ( .A0(n571), .A1(g_data1[6]), .B0(n561), .C0(n560), .Y(n562)
         );
  AOI211XL U529 ( .A0(n571), .A1(g_data0[6]), .B0(n559), .C0(n558), .Y(n563)
         );
  OAI2BB1XL U530 ( .A0N(n579), .A1N(g_data1[2]), .B0(cur_read), .Y(n560) );
  NAND2XL U531 ( .A(g_data0[3]), .B(n579), .Y(n580) );
  NOR2X1 U532 ( .A(shift_ns[1]), .B(shift_ns[0]), .Y(n654) );
  NOR2X2 U533 ( .A(shift_ns[0]), .B(n523), .Y(n653) );
  OAI2BB1XL U534 ( .A0N(cur_scanline[57]), .A1N(n495), .B0(n494), .Y(n466) );
  OAI2BB1XL U535 ( .A0N(cur_scanline[53]), .A1N(n495), .B0(n494), .Y(n457) );
  OAI2BB1XL U536 ( .A0N(cur_scanline[49]), .A1N(n495), .B0(n494), .Y(n474) );
  OAI2BB1XL U537 ( .A0N(cur_scanline[45]), .A1N(n495), .B0(n494), .Y(n431) );
  OAI2BB1XL U538 ( .A0N(cur_scanline[41]), .A1N(n495), .B0(n494), .Y(n478) );
  OAI2BB1XL U539 ( .A0N(cur_scanline[37]), .A1N(n495), .B0(n494), .Y(n427) );
  AOI2BB2X1 U540 ( .B0(n493), .B1(cur_scanline[35]), .A0N(n492), .A1N(n461), 
        .Y(n464) );
  OAI2BB1XL U541 ( .A0N(cur_scanline[33]), .A1N(n495), .B0(n494), .Y(n462) );
  OAI2BB1XL U542 ( .A0N(cur_scanline[29]), .A1N(n495), .B0(n494), .Y(n444) );
  OAI2BB1XL U543 ( .A0N(cur_scanline[25]), .A1N(n495), .B0(n494), .Y(n498) );
  OAI2BB1XL U544 ( .A0N(cur_scanline[21]), .A1N(n495), .B0(n494), .Y(n439) );
  OAI2BB1XL U545 ( .A0N(cur_scanline[17]), .A1N(n495), .B0(n494), .Y(n482) );
  OAI2BB1XL U546 ( .A0N(cur_scanline[13]), .A1N(n495), .B0(n494), .Y(n448) );
  OAI2BB1XL U547 ( .A0N(cur_scanline[9]), .A1N(n495), .B0(n494), .Y(n486) );
  OAI2BB1XL U548 ( .A0N(cur_scanline[5]), .A1N(n495), .B0(n494), .Y(n452) );
  OAI2BB1XL U549 ( .A0N(cur_scanline[1]), .A1N(n495), .B0(n494), .Y(n470) );
  AO22X1 U550 ( .A0(n512), .A1(shift_cs[1]), .B0(n574), .B1(n513), .Y(
        shift_ns[1]) );
  MXI2X1 U551 ( .A(n406), .B(cur_state[0]), .S0(cur_state[2]), .Y(
        next_state[0]) );
  CLKINVX1 U552 ( .A(n527), .Y(n726) );
  NAND2X2 U553 ( .A(n512), .B(n511), .Y(shift_ns[0]) );
  NAND3XL U554 ( .A(n510), .B(shift_cs[0]), .C(n514), .Y(n511) );
  NAND2XL U555 ( .A(n535), .B(ram_addr_mode_cs[0]), .Y(n534) );
  XNOR2X1 U556 ( .A(n693), .B(n640), .Y(n641) );
  NOR2XL U557 ( .A(n618), .B(n673), .Y(n606) );
  NAND2XL U558 ( .A(n642), .B(counter_cs[2]), .Y(n643) );
  NOR2XL U559 ( .A(n506), .B(counter_cs[0]), .Y(n732) );
  AOI21XL U560 ( .A0(scanline_cnt_cs[4]), .A1(n541), .B0(n540), .Y(n542) );
  NOR2XL U561 ( .A(scanline_cnt_cs[4]), .B(n541), .Y(n540) );
  INVXL U562 ( .A(DEN), .Y(n366) );
  AND2X1 U563 ( .A(scanline_cnt_cs[2]), .B(n548), .Y(n520) );
  MX2X1 U564 ( .A(n637), .B(ram_addr_mode_ns[1]), .S0(n636), .Y(g_addr_ns[8])
         );
  OAI22X4 U565 ( .A0(n501), .A1(n710), .B0(n437), .B1(n436), .Y(OUT[0]) );
  OAI22X4 U566 ( .A0(n501), .A1(n711), .B0(n468), .B1(n467), .Y(OUT[1]) );
  OAI22X4 U567 ( .A0(n501), .A1(n712), .B0(n459), .B1(n458), .Y(OUT[2]) );
  OAI22X4 U568 ( .A0(n501), .A1(n717), .B0(n464), .B1(n463), .Y(OUT[7]) );
  OAI22X4 U569 ( .A0(n501), .A1(n713), .B0(n476), .B1(n475), .Y(OUT[3]) );
  OAI22X4 U570 ( .A0(n501), .A1(n714), .B0(n433), .B1(n432), .Y(OUT[4]) );
  OAI22X4 U571 ( .A0(n501), .A1(n715), .B0(n480), .B1(n479), .Y(OUT[5]) );
  OAI22X4 U572 ( .A0(n501), .A1(n716), .B0(n429), .B1(n428), .Y(OUT[6]) );
  OAI22X4 U573 ( .A0(n501), .A1(n718), .B0(n446), .B1(n445), .Y(OUT[8]) );
  OAI22X4 U574 ( .A0(n501), .A1(n719), .B0(n500), .B1(n499), .Y(OUT[9]) );
  OAI22X4 U575 ( .A0(n501), .A1(n720), .B0(n441), .B1(n440), .Y(OUT[10]) );
  OAI22X4 U576 ( .A0(n501), .A1(n721), .B0(n484), .B1(n483), .Y(OUT[11]) );
  OAI22X4 U577 ( .A0(n501), .A1(n722), .B0(n450), .B1(n449), .Y(OUT[12]) );
  OAI22X4 U578 ( .A0(n501), .A1(n723), .B0(n488), .B1(n487), .Y(OUT[13]) );
  OAI22X4 U579 ( .A0(n501), .A1(n724), .B0(n454), .B1(n453), .Y(OUT[14]) );
  OAI22X4 U580 ( .A0(n501), .A1(n725), .B0(n472), .B1(n471), .Y(OUT[15]) );
  INVX3 U581 ( .A(n366), .Y(n367) );
  NAND2XL U582 ( .A(n556), .B(n364), .Y(n557) );
  NAND2XL U583 ( .A(n655), .B(n364), .Y(n584) );
  NOR2XL U584 ( .A(round_60fps_cs), .B(n364), .Y(n529) );
  OAI21X1 U585 ( .A0(n593), .A1(n592), .B0(n657), .Y(n663) );
  AOI211XL U586 ( .A0(n573), .A1(g_data0[11]), .B0(n572), .C0(cur_read), .Y(
        n583) );
  INVXL U587 ( .A(shift_ns[0]), .Y(n611) );
  NAND4XL U588 ( .A(n530), .B(scan_idx_cs[2]), .C(scan_idx_cs[4]), .D(
        scan_idx_cs[3]), .Y(n531) );
  AOI22XL U589 ( .A0(n574), .A1(g_data1[13]), .B0(g_data1[9]), .B1(n573), .Y(
        n552) );
  BUFX8 U590 ( .A(n413), .Y(n501) );
  NAND2XL U591 ( .A(n657), .B(d_addr_cs[9]), .Y(n346) );
  NAND2BX4 U592 ( .AN(shift_cs[0]), .B(shift_cs[1]), .Y(n576) );
  NOR2X4 U593 ( .A(n565), .B(n371), .Y(n372) );
  NOR2X4 U594 ( .A(n372), .B(n692), .Y(n373) );
  OAI21X4 U595 ( .A0(n576), .A1(n384), .B0(n373), .Y(n392) );
  OR2X4 U596 ( .A(shift_cs[1]), .B(shift_cs[0]), .Y(n555) );
  NAND2X2 U597 ( .A(n555), .B(n693), .Y(n391) );
  NAND2BX2 U598 ( .AN(shift_cs[1]), .B(shift_cs[0]), .Y(n567) );
  NAND2X2 U599 ( .A(n567), .B(n374), .Y(n390) );
  NAND4X1 U600 ( .A(counter_cs[10]), .B(counter_cs[9]), .C(counter_cs[4]), .D(
        counter_cs[11]), .Y(n378) );
  NOR2X4 U601 ( .A(counter_cs[9]), .B(counter_cs[4]), .Y(n380) );
  NAND4X1 U602 ( .A(counter_cs[0]), .B(counter_cs[6]), .C(counter_cs[5]), .D(
        counter_cs[7]), .Y(n376) );
  AOI21X4 U603 ( .A0(n378), .A1(n377), .B0(n376), .Y(n383) );
  NOR2X2 U604 ( .A(counter_cs[0]), .B(counter_cs[7]), .Y(n379) );
  NAND2X2 U605 ( .A(n380), .B(n379), .Y(n381) );
  NOR4X4 U606 ( .A(n381), .B(counter_cs[10]), .C(counter_cs[6]), .D(
        counter_cs[5]), .Y(n382) );
  NOR2X4 U607 ( .A(n383), .B(n382), .Y(n388) );
  NAND4BX2 U608 ( .AN(counter_cs[12]), .B(counter_cs[2]), .C(counter_cs[3]), 
        .D(counter_cs[1]), .Y(n386) );
  NAND4X8 U609 ( .A(n392), .B(n391), .C(n390), .D(n389), .Y(n510) );
  NOR2X2 U610 ( .A(n683), .B(cur_state[0]), .Y(n402) );
  NAND2X1 U611 ( .A(n574), .B(n402), .Y(n396) );
  NAND2X2 U612 ( .A(cur_state[1]), .B(cur_state[0]), .Y(n407) );
  OAI22X4 U613 ( .A0(n510), .A1(n396), .B0(n395), .B1(n394), .Y(next_state[2])
         );
  NOR2X4 U614 ( .A(cur_state[1]), .B(cur_state[0]), .Y(n516) );
  NAND2X1 U615 ( .A(n397), .B(n407), .Y(n398) );
  NAND2X2 U616 ( .A(n400), .B(n399), .Y(n401) );
  AOI21X4 U617 ( .A0(n510), .A1(n402), .B0(n401), .Y(n405) );
  INVX6 U618 ( .A(n510), .Y(n533) );
  NOR3X1 U619 ( .A(n555), .B(cur_state[1]), .C(n671), .Y(n403) );
  NAND2X4 U620 ( .A(n533), .B(n403), .Y(n404) );
  NAND4BX4 U621 ( .AN(next_state[2]), .B(next_state[1]), .C(n365), .D(
        next_state[0]), .Y(n418) );
  AND2X8 U622 ( .A(n418), .B(n419), .Y(n416) );
  INVX3 U623 ( .A(counter_shift[3]), .Y(n489) );
  NAND2X4 U624 ( .A(n416), .B(n489), .Y(n410) );
  OAI22X2 U625 ( .A0(n410), .A1(n414), .B0(round_60fps_cs), .B1(n416), .Y(n411) );
  OAI21X4 U626 ( .A0(n365), .A1(n412), .B0(n411), .Y(n413) );
  NAND2X6 U627 ( .A(n416), .B(n415), .Y(n417) );
  INVX4 U628 ( .A(n417), .Y(n423) );
  INVX3 U629 ( .A(n418), .Y(n421) );
  NOR3X2 U630 ( .A(n421), .B(counter_shift[3]), .C(n420), .Y(n422) );
  NOR2X4 U631 ( .A(n423), .B(n422), .Y(n424) );
  NOR2X1 U632 ( .A(counter_shift[3]), .B(counter_shift[2]), .Y(n442) );
  OAI22XL U633 ( .A0(n442), .A1(cur_scanline[38]), .B0(cur_scanline[39]), .B1(
        n489), .Y(n426) );
  AOI2BB2X1 U634 ( .B0(n456), .B1(cur_scanline[39]), .A0N(n492), .A1N(n426), 
        .Y(n429) );
  INVX3 U635 ( .A(counter_shift[1]), .Y(n497) );
  NAND2X4 U636 ( .A(n497), .B(n495), .Y(n494) );
  INVX3 U637 ( .A(counter_shift[2]), .Y(n496) );
  AOI222XL U638 ( .A0(n427), .A1(cur_scanline[36]), .B0(n497), .B1(
        cur_scanline[37]), .C0(n496), .C1(cur_scanline[38]), .Y(n428) );
  OAI22XL U639 ( .A0(n442), .A1(cur_scanline[46]), .B0(cur_scanline[47]), .B1(
        n489), .Y(n430) );
  AOI2BB2X1 U640 ( .B0(n456), .B1(cur_scanline[47]), .A0N(n492), .A1N(n430), 
        .Y(n433) );
  AOI222XL U641 ( .A0(n431), .A1(cur_scanline[44]), .B0(n497), .B1(
        cur_scanline[45]), .C0(n496), .C1(cur_scanline[46]), .Y(n432) );
  OAI22XL U642 ( .A0(n490), .A1(cur_scanline[62]), .B0(cur_scanline[63]), .B1(
        n489), .Y(n434) );
  OAI21XL U643 ( .A0(counter_shift[0]), .A1(n709), .B0(n494), .Y(n435) );
  AOI222XL U644 ( .A0(n435), .A1(cur_scanline[60]), .B0(n497), .B1(
        cur_scanline[61]), .C0(n496), .C1(cur_scanline[62]), .Y(n436) );
  OAI22XL U645 ( .A0(n442), .A1(cur_scanline[22]), .B0(cur_scanline[23]), .B1(
        n489), .Y(n438) );
  AOI2BB2X1 U646 ( .B0(n456), .B1(cur_scanline[23]), .A0N(n492), .A1N(n438), 
        .Y(n441) );
  AOI222XL U647 ( .A0(n439), .A1(cur_scanline[20]), .B0(n497), .B1(
        cur_scanline[21]), .C0(n496), .C1(cur_scanline[22]), .Y(n440) );
  OAI22XL U648 ( .A0(n442), .A1(cur_scanline[30]), .B0(cur_scanline[31]), .B1(
        n489), .Y(n443) );
  AOI2BB2X1 U649 ( .B0(n456), .B1(cur_scanline[31]), .A0N(n492), .A1N(n443), 
        .Y(n446) );
  AOI222XL U650 ( .A0(n444), .A1(cur_scanline[28]), .B0(n497), .B1(
        cur_scanline[29]), .C0(n496), .C1(cur_scanline[30]), .Y(n445) );
  OAI22XL U651 ( .A0(n490), .A1(cur_scanline[14]), .B0(cur_scanline[15]), .B1(
        n489), .Y(n447) );
  AOI2BB2X1 U652 ( .B0(n456), .B1(cur_scanline[15]), .A0N(n492), .A1N(n447), 
        .Y(n450) );
  AOI222XL U653 ( .A0(n448), .A1(cur_scanline[12]), .B0(n497), .B1(
        cur_scanline[13]), .C0(n496), .C1(cur_scanline[14]), .Y(n449) );
  OAI22XL U654 ( .A0(n490), .A1(cur_scanline[6]), .B0(cur_scanline[7]), .B1(
        n489), .Y(n451) );
  AOI2BB2X1 U655 ( .B0(n456), .B1(cur_scanline[7]), .A0N(n492), .A1N(n451), 
        .Y(n454) );
  AOI222XL U656 ( .A0(n452), .A1(cur_scanline[4]), .B0(n497), .B1(
        cur_scanline[5]), .C0(n496), .C1(cur_scanline[6]), .Y(n453) );
  OAI22XL U657 ( .A0(n490), .A1(cur_scanline[54]), .B0(cur_scanline[55]), .B1(
        n489), .Y(n455) );
  AOI2BB2X1 U658 ( .B0(n456), .B1(cur_scanline[55]), .A0N(n492), .A1N(n455), 
        .Y(n459) );
  AOI222XL U659 ( .A0(n457), .A1(cur_scanline[52]), .B0(n497), .B1(
        cur_scanline[53]), .C0(n496), .C1(cur_scanline[54]), .Y(n458) );
  OAI22XL U660 ( .A0(n490), .A1(cur_scanline[34]), .B0(cur_scanline[35]), .B1(
        n489), .Y(n461) );
  AOI222XL U661 ( .A0(n462), .A1(cur_scanline[32]), .B0(n497), .B1(
        cur_scanline[33]), .C0(n496), .C1(cur_scanline[34]), .Y(n463) );
  OAI22XL U662 ( .A0(n490), .A1(cur_scanline[58]), .B0(cur_scanline[59]), .B1(
        n489), .Y(n465) );
  AOI2BB2X1 U663 ( .B0(n493), .B1(cur_scanline[59]), .A0N(n492), .A1N(n465), 
        .Y(n468) );
  AOI222XL U664 ( .A0(n466), .A1(cur_scanline[56]), .B0(n497), .B1(
        cur_scanline[57]), .C0(n496), .C1(cur_scanline[58]), .Y(n467) );
  OAI22XL U665 ( .A0(n490), .A1(cur_scanline[2]), .B0(cur_scanline[3]), .B1(
        n489), .Y(n469) );
  AOI2BB2X1 U666 ( .B0(n493), .B1(cur_scanline[3]), .A0N(n492), .A1N(n469), 
        .Y(n472) );
  AOI222XL U667 ( .A0(n496), .A1(cur_scanline[2]), .B0(n497), .B1(
        cur_scanline[1]), .C0(n470), .C1(cur_scanline[0]), .Y(n471) );
  OAI22XL U668 ( .A0(n490), .A1(cur_scanline[50]), .B0(cur_scanline[51]), .B1(
        n489), .Y(n473) );
  AOI2BB2X1 U669 ( .B0(n493), .B1(cur_scanline[51]), .A0N(n492), .A1N(n473), 
        .Y(n476) );
  AOI222XL U670 ( .A0(n474), .A1(cur_scanline[48]), .B0(n497), .B1(
        cur_scanline[49]), .C0(n496), .C1(cur_scanline[50]), .Y(n475) );
  OAI22XL U671 ( .A0(n490), .A1(cur_scanline[42]), .B0(cur_scanline[43]), .B1(
        n489), .Y(n477) );
  AOI2BB2X1 U672 ( .B0(n493), .B1(cur_scanline[43]), .A0N(n492), .A1N(n477), 
        .Y(n480) );
  AOI222XL U673 ( .A0(n478), .A1(cur_scanline[40]), .B0(n497), .B1(
        cur_scanline[41]), .C0(n496), .C1(cur_scanline[42]), .Y(n479) );
  OAI22XL U674 ( .A0(n490), .A1(cur_scanline[18]), .B0(cur_scanline[19]), .B1(
        n489), .Y(n481) );
  AOI2BB2X1 U675 ( .B0(n493), .B1(cur_scanline[19]), .A0N(n492), .A1N(n481), 
        .Y(n484) );
  AOI222XL U676 ( .A0(n482), .A1(cur_scanline[16]), .B0(n497), .B1(
        cur_scanline[17]), .C0(n496), .C1(cur_scanline[18]), .Y(n483) );
  OAI22XL U677 ( .A0(n490), .A1(cur_scanline[10]), .B0(cur_scanline[11]), .B1(
        n489), .Y(n485) );
  AOI2BB2X1 U678 ( .B0(n493), .B1(cur_scanline[11]), .A0N(n492), .A1N(n485), 
        .Y(n488) );
  AOI222XL U679 ( .A0(n486), .A1(cur_scanline[8]), .B0(n497), .B1(
        cur_scanline[9]), .C0(n496), .C1(cur_scanline[10]), .Y(n487) );
  OAI22XL U680 ( .A0(n490), .A1(cur_scanline[26]), .B0(cur_scanline[27]), .B1(
        n489), .Y(n491) );
  AOI2BB2X1 U681 ( .B0(n493), .B1(cur_scanline[27]), .A0N(n492), .A1N(n491), 
        .Y(n500) );
  AOI222XL U682 ( .A0(n498), .A1(cur_scanline[24]), .B0(n497), .B1(
        cur_scanline[25]), .C0(n496), .C1(cur_scanline[26]), .Y(n499) );
  NAND2X1 U683 ( .A(counter_cs[2]), .B(counter_cs[3]), .Y(n502) );
  NAND2X1 U684 ( .A(counter_cs[1]), .B(counter_cs[0]), .Y(n629) );
  NAND2X1 U685 ( .A(n605), .B(n503), .Y(n627) );
  NOR2X2 U686 ( .A(n627), .B(n681), .Y(n640) );
  NAND2X2 U687 ( .A(n640), .B(counter_cs[7]), .Y(n620) );
  NOR2X2 U688 ( .A(n620), .B(n680), .Y(n609) );
  XNOR2X1 U689 ( .A(n504), .B(n697), .Y(n507) );
  XNOR2X1 U690 ( .A(next_state[1]), .B(next_state[0]), .Y(n505) );
  OR3X2 U691 ( .A(n505), .B(n533), .C(next_state[2]), .Y(n506) );
  AND2X2 U692 ( .A(n507), .B(n645), .Y(n746) );
  CLKINVX1 U693 ( .A(n514), .Y(n513) );
  OAI21X2 U694 ( .A0(n519), .A1(n513), .B0(n679), .Y(n512) );
  NOR2X1 U695 ( .A(n513), .B(scan_idx_cs[0]), .Y(n515) );
  NOR2X1 U696 ( .A(n519), .B(n518), .Y(n546) );
  NAND2X1 U697 ( .A(n546), .B(n586), .Y(n600) );
  NOR2X1 U698 ( .A(n672), .B(n682), .Y(n548) );
  NAND3X1 U699 ( .A(n548), .B(scanline_cnt_cs[2]), .C(scanline_cnt_cs[3]), .Y(
        n539) );
  OAI21XL U700 ( .A0(scanline_cnt_cs[3]), .A1(n520), .B0(n539), .Y(n521) );
  NOR2X1 U701 ( .A(n600), .B(n521), .Y(tmp_addr_ns[3]) );
  AND2X4 U702 ( .A(n522), .B(scan_idx_cs[1]), .Y(n524) );
  AOI2BB1X1 U703 ( .A0N(scan_idx_cs[1]), .A1N(n522), .B0(n524), .Y(n728) );
  NAND2BX1 U704 ( .AN(shift_cs[1]), .B(n729), .Y(n523) );
  OA21XL U705 ( .A0(n728), .A1(n653), .B0(n602), .Y(read_idx_ns[1]) );
  NAND2X2 U706 ( .A(n524), .B(scan_idx_cs[2]), .Y(n528) );
  XNOR2X1 U707 ( .A(n528), .B(scan_idx_cs[3]), .Y(n727) );
  NOR2BX1 U708 ( .AN(scan_idx_cs[3]), .B(n528), .Y(n596) );
  XOR2X1 U709 ( .A(n596), .B(scan_idx_cs[4]), .Y(scan_idx_ns_4_) );
  NOR3X1 U710 ( .A(n529), .B(n670), .C(n685), .Y(n530) );
  OAI31X1 U711 ( .A0(n535), .A1(ram_addr_mode_cs[1]), .A2(ram_addr_mode_cs[0]), 
        .B0(n534), .Y(ram_addr_mode_ns[0]) );
  NAND2XL U712 ( .A(n687), .B(ram_addr_mode_cs[0]), .Y(n536) );
  MXI2X2 U713 ( .A(n536), .B(n687), .S0(n535), .Y(ram_addr_mode_ns[1]) );
  NAND2X2 U714 ( .A(n636), .B(ram_addr_mode_ns[0]), .Y(n538) );
  MXI2X4 U715 ( .A(n538), .B(n636), .S0(ram_addr_mode_ns[1]), .Y(g_addr_ns[9])
         );
  XOR2X1 U716 ( .A(n548), .B(n669), .Y(n598) );
  NOR2X1 U717 ( .A(tmp_addr_ns[3]), .B(n545), .Y(n652) );
  OR2X2 U718 ( .A(g_addr_ns[9]), .B(n652), .Y(read_en0_n) );
  NOR3X1 U719 ( .A(n599), .B(n548), .C(n547), .Y(tmp_addr_ns[1]) );
  CLKINVX1 U720 ( .A(n567), .Y(n579) );
  NOR2BX1 U721 ( .AN(g_data0[5]), .B(n576), .Y(n549) );
  CLKINVX1 U722 ( .A(n565), .Y(n573) );
  NOR2BX1 U723 ( .AN(g_data1[5]), .B(n576), .Y(n550) );
  AO22X1 U724 ( .A0(n554), .A1(n553), .B0(n552), .B1(n551), .Y(n564) );
  MXI4X1 U725 ( .A(g_data0[0]), .B(g_data1[0]), .C(g_data0[8]), .D(g_data1[8]), 
        .S0(cur_read), .S1(shift_cs[1]), .Y(n570) );
  MXI2X1 U726 ( .A(g_data0[4]), .B(g_data1[4]), .S0(cur_read), .Y(n568) );
  MXI2X1 U727 ( .A(g_data0[12]), .B(g_data1[12]), .S0(cur_read), .Y(n566) );
  OAI222XL U728 ( .A0(n570), .A1(n679), .B0(n576), .B1(n568), .C0(n555), .C1(
        n566), .Y(n556) );
  OAI21XL U729 ( .A0(n364), .A1(n564), .B0(n557), .Y(shift_g_data[0]) );
  AO22X1 U730 ( .A0(n574), .A1(g_data0[14]), .B0(g_data0[10]), .B1(n573), .Y(
        n559) );
  AO22X1 U731 ( .A0(n574), .A1(g_data1[14]), .B0(g_data1[10]), .B1(n573), .Y(
        n561) );
  OAI22XL U732 ( .A0(n365), .A1(n564), .B0(n364), .B1(n656), .Y(
        shift_g_data[1]) );
  OAI22XL U733 ( .A0(n568), .A1(n567), .B0(n566), .B1(n565), .Y(n569) );
  AOI2BB1X1 U734 ( .A0N(n570), .A1N(shift_cs[0]), .B0(n569), .Y(n585) );
  AO22X1 U735 ( .A0(n574), .A1(g_data0[15]), .B0(g_data0[7]), .B1(n571), .Y(
        n572) );
  AOI21X1 U736 ( .A0(n579), .A1(g_data1[3]), .B0(n578), .Y(n582) );
  OAI21XL U737 ( .A0(n585), .A1(n364), .B0(n584), .Y(shift_g_data[3]) );
  INVXL U738 ( .A(rst), .Y(n587) );
  CLKBUFX3 U739 ( .A(n587), .Y(n704) );
  CLKBUFX3 U740 ( .A(n587), .Y(n705) );
  CLKBUFX3 U741 ( .A(n587), .Y(n706) );
  NAND2BX1 U742 ( .AN(n367), .B(DEN_reg), .Y(n664) );
  OAI21XL U743 ( .A0(n700), .A1(n664), .B0(d_addr_cs[1]), .Y(n588) );
  OAI31XL U744 ( .A0(n700), .A1(d_addr_cs[1]), .A2(n664), .B0(n588), .Y(n343)
         );
  INVX1 U745 ( .A(n664), .Y(n657) );
  NAND2XL U746 ( .A(n657), .B(n677), .Y(n345) );
  NAND2XL U747 ( .A(d_addr_cs[1]), .B(d_addr_cs[0]), .Y(n590) );
  AND3X1 U748 ( .A(d_addr_cs[1]), .B(d_addr_cs[0]), .C(n657), .Y(n589) );
  OAI32XL U749 ( .A0(d_addr_cs[2]), .A1(n590), .A2(n664), .B0(n589), .B1(n703), 
        .Y(n342) );
  NAND2XL U750 ( .A(d_addr_cs[4]), .B(d_addr_cs[3]), .Y(n593) );
  NAND3XL U751 ( .A(d_addr_cs[1]), .B(d_addr_cs[0]), .C(d_addr_cs[2]), .Y(n658) );
  NOR2X1 U752 ( .A(n593), .B(n658), .Y(n662) );
  NOR2XL U753 ( .A(n699), .B(n675), .Y(n591) );
  NAND3XL U754 ( .A(n591), .B(d_addr_cs[9]), .C(d_addr_cs[7]), .Y(n592) );
  NAND2BX1 U755 ( .AN(n663), .B(n662), .Y(n595) );
  AOI32XL U756 ( .A0(n657), .A1(d_addr_cs[5]), .A2(n662), .B0(n675), .B1(n595), 
        .Y(n339) );
  AND3X1 U757 ( .A(d_addr_cs[5]), .B(n662), .C(n657), .Y(n594) );
  OAI32XL U758 ( .A0(d_addr_cs[6]), .A1(n675), .A2(n595), .B0(n594), .B1(n699), 
        .Y(n338) );
  NAND3XL U759 ( .A(n365), .B(n596), .C(scan_idx_cs[4]), .Y(n597) );
  XNOR2X1 U760 ( .A(round_60fps_cs), .B(n597), .Y(n270) );
  NOR2X1 U761 ( .A(n599), .B(n598), .Y(tmp_addr_ns[2]) );
  NOR2X1 U762 ( .A(scanline_cnt_cs[0]), .B(n600), .Y(tmp_addr_ns[0]) );
  XNOR2X1 U763 ( .A(n603), .B(n695), .Y(n604) );
  XNOR2X1 U764 ( .A(n606), .B(n686), .Y(n607) );
  XNOR2X1 U765 ( .A(n691), .B(counter_cs[0]), .Y(n608) );
  XNOR2X1 U766 ( .A(n609), .B(n694), .Y(n610) );
  NAND2X1 U767 ( .A(shift_ns[1]), .B(shift_ns[0]), .Y(n651) );
  NOR2X1 U768 ( .A(shift_ns[1]), .B(n611), .Y(n646) );
  AOI22X1 U769 ( .A0(n646), .A1(n736), .B0(n731), .B1(n347), .Y(n614) );
  NOR2X1 U770 ( .A(n612), .B(shift_ns[0]), .Y(n648) );
  NAND2X1 U771 ( .A(n648), .B(n740), .Y(n613) );
  XOR2X1 U772 ( .A(n616), .B(n688), .Y(n617) );
  XOR2X1 U773 ( .A(n618), .B(n673), .Y(n619) );
  XOR2X1 U774 ( .A(n620), .B(n680), .Y(n621) );
  AOI22X1 U775 ( .A0(n732), .A1(n347), .B0(n646), .B1(n735), .Y(n623) );
  OAI211X1 U776 ( .A0(n624), .A1(n651), .B0(n623), .C0(n622), .Y(N245) );
  XOR2X1 U777 ( .A(n625), .B(n690), .Y(n626) );
  XOR2X1 U778 ( .A(n627), .B(n681), .Y(n628) );
  XNOR2X1 U779 ( .A(n642), .B(n696), .Y(n630) );
  XOR2X1 U780 ( .A(n631), .B(n689), .Y(n632) );
  AOI22X1 U781 ( .A0(n646), .A1(n737), .B0(n733), .B1(n347), .Y(n634) );
  OAI211X1 U782 ( .A0(n635), .A1(n651), .B0(n634), .C0(n633), .Y(N247) );
  XNOR2X1 U783 ( .A(n638), .B(n692), .Y(n639) );
  XOR2X1 U784 ( .A(n643), .B(n698), .Y(n644) );
  AO22X1 U785 ( .A0(n646), .A1(n738), .B0(n734), .B1(n347), .Y(n647) );
  AOI21X1 U786 ( .A0(n648), .A1(n742), .B0(n647), .Y(n649) );
  OAI31X1 U787 ( .A0(n365), .A1(n651), .A2(n650), .B0(n649), .Y(N248) );
  NAND2BX1 U788 ( .AN(n652), .B(g_addr_ns[9]), .Y(read_en1_n) );
  AOI2BB1X1 U789 ( .A0N(n347), .A1N(n729), .B0(n653), .Y(read_idx_ns[0]) );
  AOI2BB2X1 U790 ( .B0(n364), .B1(n656), .A0N(n364), .A1N(n655), .Y(
        shift_g_data[2]) );
  OAI22XL U791 ( .A0(d_addr_cs[0]), .A1(n664), .B0(n700), .B1(n657), .Y(n344)
         );
  NOR2XL U792 ( .A(n658), .B(n663), .Y(n659) );
  NOR3XL U793 ( .A(n676), .B(n658), .C(n664), .Y(n660) );
  AOI2BB1X1 U794 ( .A0N(d_addr_cs[3]), .A1N(n659), .B0(n660), .Y(n341) );
  NAND2XL U795 ( .A(n701), .B(n659), .Y(n661) );
  OAI22XL U796 ( .A0(n676), .A1(n661), .B0(n660), .B1(n701), .Y(n340) );
  NAND3XL U797 ( .A(d_addr_cs[6]), .B(d_addr_cs[5]), .C(n662), .Y(n665) );
  NOR2XL U798 ( .A(n665), .B(n663), .Y(n666) );
  NOR3BX1 U799 ( .AN(d_addr_cs[7]), .B(n665), .C(n664), .Y(n668) );
  AOI2BB1X1 U800 ( .A0N(d_addr_cs[7]), .A1N(n666), .B0(n668), .Y(n337) );
  NAND2XL U801 ( .A(d_addr_cs[7]), .B(n666), .Y(n667) );
  OAI22XL U802 ( .A0(d_addr_cs[8]), .A1(n667), .B0(n702), .B1(n668), .Y(n336)
         );
  OAI22XL U803 ( .A0(n668), .A1(n677), .B0(n667), .B1(n702), .Y(n335) );
endmodule

