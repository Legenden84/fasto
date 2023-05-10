	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function mul
f.mul:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_a_1_,x10
# 	mv	_param_b_2_,x11
# 	mv	_eq_L_8_,_param_b_2_
	li	x12, 0
# was:	li	_eq_R_9_, 0
	li	x13, 0
# was:	li	_cond_7_, 0
	bne	x11, x12, l.false_10_
# was:	bne	_eq_L_8_, _eq_R_9_, l.false_10_
	li	x13, 1
# was:	li	_cond_7_, 1
l.false_10_:
	bne	x13, x0, l.then_4_
# was:	bne	_cond_7_, x0, l.then_4_
	j	l.else_5_
l.then_4_:
	li	x10, 0
# was:	li	_mulres_3_, 0
	j	l.endif_6_
l.else_5_:
	li	x12, 0
# was:	li	_lt_L_15_, 0
# 	mv	_lt_R_16_,_param_b_2_
	slt	x12, x12, x11
# was:	slt	_cond_14_, _lt_L_15_, _lt_R_16_
	bne	x12, x0, l.then_11_
# was:	bne	_cond_14_, x0, l.then_11_
	j	l.else_12_
l.then_11_:
	mv	x18, x10
# was:	mv	_plus_L_17_, _param_a_1_
# 	mv	_arg_19_,_param_a_1_
# 	mv	_minus_L_21_,_param_b_2_
	li	x12, 1
# was:	li	_minus_R_22_, 1
	sub	x11, x11, x12
# was:	sub	_arg_20_, _minus_L_21_, _minus_R_22_
# 	mv	x10,_arg_19_
# 	mv	x11,_arg_20_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_plus_R_18_,x10
	add	x10, x18, x10
# was:	add	_mulres_3_, _plus_L_17_, _plus_R_18_
	j	l.endif_13_
l.else_12_:
	li	x18, 0
# was:	li	_minus_L_23_, 0
# 	mv	_arg_25_,_param_a_1_
	li	x12, 0
# was:	li	_minus_L_27_, 0
# 	mv	_minus_R_28_,_param_b_2_
	sub	x11, x12, x11
# was:	sub	_arg_26_, _minus_L_27_, _minus_R_28_
# 	mv	x10,_arg_25_
# 	mv	x11,_arg_26_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_minus_R_24_,x10
	sub	x10, x18, x10
# was:	sub	_mulres_3_, _minus_L_23_, _minus_R_24_
l.endif_13_:
l.endif_6_:
# 	mv	x10,_mulres_3_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function readInt
f.readInt:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_i_29_,x10
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_readIntres_30_,x10
# 	mv	x10,_readIntres_30_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function square
f.square:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_a_31_,x10
# 	mv	_arg_33_,_param_a_31_
	mv	x11, x10
# was:	mv	_arg_34_, _param_a_31_
# 	mv	x10,_arg_33_
# 	mv	x11,_arg_34_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_squareres_32_,x10
# 	mv	x10,_squareres_32_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function add
f.add:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_x_35_,x10
# 	mv	_param_y_36_,x11
# 	mv	_plus_L_38_,_param_x_35_
# 	mv	_plus_R_39_,_param_y_36_
	add	x10, x10, x11
# was:	add	_addres_37_, _plus_L_38_, _plus_R_39_
# 	mv	x10,_addres_37_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x23, -28(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -28
	li	x10, 0
# was:	li	_arg_42_, 0
# 	mv	x10,_arg_42_
	jal	f.readInt
# was:	jal	f.readInt, x10
	mv	x19, x10
# was:	mv	_let_n_41_, x10
# 	mv	_lt_L_47_,_let_n_41_
	li	x10, 1
# was:	li	_lt_R_48_, 1
	slt	x10, x19, x10
# was:	slt	_cond_46_, _lt_L_47_, _lt_R_48_
	bne	x10, x0, l.then_43_
# was:	bne	_cond_46_, x0, l.then_43_
	j	l.else_44_
l.then_43_:
	la	x10, s.Incorre_51_
# was:	la	_tmp_50_, s.Incorre_51_
# s.Incorre_51_: string "Incorrect Input!"
# 	mv	_let_output_49_,_tmp_50_
# 	mv	x10,_tmp_50_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x18, 0
# was:	li	_mainres_40_, 0
	j	l.endif_45_
l.else_44_:
# 	mv	_size_57_,_let_n_41_
	bge	x19, x0, l.safe_58_
# was:	bge	_size_57_, x0, l.safe_58_
	li	x10, 23
# was:	li	x10, 23
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_58_:
	mv	x10, x3
# was:	mv	_arr_54_, x3
	slli	x11, x19, 2
# was:	slli	_tmp_63_, _size_57_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_63_, _tmp_63_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_63_
	sw	x19, 0(x10)
# was:	sw	_size_57_, 0(_arr_54_)
	addi	x11, x10, 4
# was:	addi	_addr_59_, _arr_54_, 4
	mv	x12, x0
# was:	mv	_i_60_, x0
l.loop_beg_61_:
	bge	x12, x19, l.loop_end_62_
# was:	bge	_i_60_, _size_57_, l.loop_end_62_
	sw	x12, 0(x11)
# was:	sw	_i_60_, 0(_addr_59_)
	addi	x11, x11, 4
# was:	addi	_addr_59_, _addr_59_, 4
	addi	x12, x12, 1
# was:	addi	_i_60_, _i_60_, 1
	j	l.loop_beg_61_
l.loop_end_62_:
	lw	x20, 0(x10)
# was:	lw	_size_53_, 0(_arr_54_)
	mv	x18, x3
# was:	mv	_let_arr_52_, x3
	slli	x11, x20, 2
# was:	slli	_tmp_69_, _size_53_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_69_, _tmp_69_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_69_
	sw	x20, 0(x18)
# was:	sw	_size_53_, 0(_let_arr_52_)
	addi	x22, x18, 4
# was:	addi	_addrg_64_, _let_arr_52_, 4
	mv	x21, x0
# was:	mv	_i_65_, x0
	addi	x23, x10, 4
# was:	addi	_elem_55_, _arr_54_, 4
l.loop_beg_66_:
	bge	x21, x20, l.loop_end_67_
# was:	bge	_i_65_, _size_53_, l.loop_end_67_
	lw	x10, 0(x23)
# was:	lw	_res_56_, 0(_elem_55_)
	addi	x23, x23, 4
# was:	addi	_elem_55_, _elem_55_, 4
# 	mv	x10,_res_56_
	jal	f.readInt
# was:	jal	f.readInt, x10
# 	mv	_tmp_68_,x10
# 	mv	_res_56_,_tmp_68_
	sw	x10, 0(x22)
# was:	sw	_res_56_, 0(_addrg_64_)
	addi	x22, x22, 4
# was:	addi	_addrg_64_, _addrg_64_, 4
	addi	x21, x21, 1
# was:	addi	_i_65_, _i_65_, 1
	j	l.loop_beg_66_
l.loop_end_67_:
# 	mv	_size_75_,_let_n_41_
	bge	x19, x0, l.safe_76_
# was:	bge	_size_75_, x0, l.safe_76_
	li	x10, 24
# was:	li	x10, 24
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_76_:
	mv	x14, x3
# was:	mv	_arr_72_, x3
	slli	x10, x19, 2
# was:	slli	_tmp_81_, _size_75_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_81_, _tmp_81_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_81_
	sw	x19, 0(x14)
# was:	sw	_size_75_, 0(_arr_72_)
	addi	x10, x14, 4
# was:	addi	_addr_77_, _arr_72_, 4
	mv	x11, x0
# was:	mv	_i_78_, x0
l.loop_beg_79_:
	bge	x11, x19, l.loop_end_80_
# was:	bge	_i_78_, _size_75_, l.loop_end_80_
	sw	x11, 0(x10)
# was:	sw	_i_78_, 0(_addr_77_)
	addi	x10, x10, 4
# was:	addi	_addr_77_, _addr_77_, 4
	addi	x11, x11, 1
# was:	addi	_i_78_, _i_78_, 1
	j	l.loop_beg_79_
l.loop_end_80_:
	lw	x10, 0(x14)
# was:	lw	_size_71_, 0(_arr_72_)
	mv	x11, x3
# was:	mv	_let_difs_70_, x3
	slli	x12, x10, 2
# was:	slli	_tmp_113_, _size_71_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_113_, _tmp_113_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_113_
	sw	x10, 0(x11)
# was:	sw	_size_71_, 0(_let_difs_70_)
	addi	x12, x11, 4
# was:	addi	_addrg_82_, _let_difs_70_, 4
	mv	x13, x0
# was:	mv	_i_83_, x0
	addi	x14, x14, 4
# was:	addi	_elem_73_, _arr_72_, 4
l.loop_beg_84_:
	bge	x13, x10, l.loop_end_85_
# was:	bge	_i_83_, _size_71_, l.loop_end_85_
	lw	x16, 0(x14)
# was:	lw	_res_74_, 0(_elem_73_)
	addi	x14, x14, 4
# was:	addi	_elem_73_, _elem_73_, 4
# 	mv	_eq_L_91_,_res_74_
	li	x17, 0
# was:	li	_eq_R_92_, 0
	li	x15, 0
# was:	li	_cond_90_, 0
	bne	x16, x17, l.false_93_
# was:	bne	_eq_L_91_, _eq_R_92_, l.false_93_
	li	x15, 1
# was:	li	_cond_90_, 1
l.false_93_:
	bne	x15, x0, l.then_87_
# was:	bne	_cond_90_, x0, l.then_87_
	j	l.else_88_
l.then_87_:
	li	x15, 0
# was:	li	_arr_ind_94_, 0
	addi	x16, x18, 4
# was:	addi	_arr_data_95_, _let_arr_52_, 4
	lw	x17, 0(x18)
# was:	lw	_size_96_, 0(_let_arr_52_)
	bge	x15, x0, l.nonneg_98_
# was:	bge	_arr_ind_94_, x0, l.nonneg_98_
l.error_97_:
	li	x10, 24
# was:	li	x10, 24
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_98_:
	bge	x15, x17, l.error_97_
# was:	bge	_arr_ind_94_, _size_96_, l.error_97_
	slli	x15, x15, 2
# was:	slli	_arr_ind_94_, _arr_ind_94_, 2
	add	x16, x16, x15
# was:	add	_arr_data_95_, _arr_data_95_, _arr_ind_94_
	lw	x16, 0(x16)
# was:	lw	_fun_arg_res_86_, 0(_arr_data_95_)
	j	l.endif_89_
l.else_88_:
	mv	x19, x16
# was:	mv	_arr_ind_101_, _res_74_
	addi	x15, x18, 4
# was:	addi	_arr_data_102_, _let_arr_52_, 4
	lw	x17, 0(x18)
# was:	lw	_size_103_, 0(_let_arr_52_)
	bge	x19, x0, l.nonneg_105_
# was:	bge	_arr_ind_101_, x0, l.nonneg_105_
l.error_104_:
	li	x10, 24
# was:	li	x10, 24
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_105_:
	bge	x19, x17, l.error_104_
# was:	bge	_arr_ind_101_, _size_103_, l.error_104_
	slli	x19, x19, 2
# was:	slli	_arr_ind_101_, _arr_ind_101_, 2
	add	x15, x15, x19
# was:	add	_arr_data_102_, _arr_data_102_, _arr_ind_101_
	lw	x15, 0(x15)
# was:	lw	_minus_L_99_, 0(_arr_data_102_)
	mv	x17, x16
# was:	mv	_minus_L_107_, _res_74_
	li	x16, 1
# was:	li	_minus_R_108_, 1
	sub	x19, x17, x16
# was:	sub	_arr_ind_106_, _minus_L_107_, _minus_R_108_
	addi	x16, x18, 4
# was:	addi	_arr_data_109_, _let_arr_52_, 4
	lw	x17, 0(x18)
# was:	lw	_size_110_, 0(_let_arr_52_)
	bge	x19, x0, l.nonneg_112_
# was:	bge	_arr_ind_106_, x0, l.nonneg_112_
l.error_111_:
	li	x10, 24
# was:	li	x10, 24
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_112_:
	bge	x19, x17, l.error_111_
# was:	bge	_arr_ind_106_, _size_110_, l.error_111_
	slli	x19, x19, 2
# was:	slli	_arr_ind_106_, _arr_ind_106_, 2
	add	x16, x16, x19
# was:	add	_arr_data_109_, _arr_data_109_, _arr_ind_106_
	lw	x16, 0(x16)
# was:	lw	_minus_R_100_, 0(_arr_data_109_)
	sub	x16, x15, x16
# was:	sub	_fun_arg_res_86_, _minus_L_99_, _minus_R_100_
l.endif_89_:
# 	mv	_res_74_,_fun_arg_res_86_
	sw	x16, 0(x12)
# was:	sw	_res_74_, 0(_addrg_82_)
	addi	x12, x12, 4
# was:	addi	_addrg_82_, _addrg_82_, 4
	addi	x13, x13, 1
# was:	addi	_i_83_, _i_83_, 1
	j	l.loop_beg_84_
l.loop_end_85_:
# 	mv	_arr_116_,_let_difs_70_
	lw	x18, 0(x11)
# was:	lw	_size_115_, 0(_arr_116_)
	mv	x19, x3
# was:	mv	_let_map_squares_114_, x3
	slli	x10, x18, 2
# was:	slli	_tmp_126_, _size_115_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_126_, _tmp_126_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_126_
	sw	x18, 0(x19)
# was:	sw	_size_115_, 0(_let_map_squares_114_)
	addi	x20, x19, 4
# was:	addi	_addrg_119_, _let_map_squares_114_, 4
	mv	x21, x0
# was:	mv	_i_120_, x0
	addi	x22, x11, 4
# was:	addi	_elem_117_, _arr_116_, 4
l.loop_beg_121_:
	bge	x21, x18, l.loop_end_122_
# was:	bge	_i_120_, _size_115_, l.loop_end_122_
	lw	x10, 0(x22)
# was:	lw	_res_118_, 0(_elem_117_)
	addi	x22, x22, 4
# was:	addi	_elem_117_, _elem_117_, 4
# 	mv	_arg_124_,_res_118_
	mv	x11, x10
# was:	mv	_arg_125_, _res_118_
# 	mv	x10,_arg_124_
# 	mv	x11,_arg_125_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_fun_arg_res_123_,x10
# 	mv	_res_118_,_fun_arg_res_123_
	sw	x10, 0(x20)
# was:	sw	_res_118_, 0(_addrg_119_)
	addi	x20, x20, 4
# was:	addi	_addrg_119_, _addrg_119_, 4
	addi	x21, x21, 1
# was:	addi	_i_120_, _i_120_, 1
	j	l.loop_beg_121_
l.loop_end_122_:
# 	mv	_arr_128_,_let_map_squares_114_
	lw	x18, 0(x19)
# was:	lw	_size_129_, 0(_arr_128_)
	li	x10, 0
# was:	li	_tmp_127_, 0
	addi	x19, x19, 4
# was:	addi	_arr_128_, _arr_128_, 4
	mv	x20, x0
# was:	mv	_ind_var_130_, x0
l.loop_beg_132_:
	bge	x20, x18, l.loop_end_133_
# was:	bge	_ind_var_130_, _size_129_, l.loop_end_133_
	lw	x11, 0(x19)
# was:	lw	_tmp_131_, 0(_arr_128_)
	addi	x19, x19, 4
# was:	addi	_arr_128_, _arr_128_, 4
# 	mv	x10,_tmp_127_
# 	mv	x11,_tmp_131_
	jal	f.add
# was:	jal	f.add, x10 x11
# 	mv	_tmp_134_,x10
# 	mv	_tmp_127_,_tmp_134_
	addi	x20, x20, 1
# was:	addi	_ind_var_130_, _ind_var_130_, 1
	j	l.loop_beg_132_
l.loop_end_133_:
	mv	x18, x10
# was:	mv	_mainres_40_, _tmp_127_
	mv	x10, x18
# was:	mv	x10, _mainres_40_
	jal	p.putint
# was:	jal	p.putint, x10
l.endif_45_:
	mv	x10, x18
# was:	mv	x10, _mainres_40_
	addi	x2, x2, 28
	lw	x23, -28(x2)
	lw	x22, -24(x2)
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
f.ord:
	mv	x10, x10
	jr	x1
f.chr:
	andi	x10, x10, 255
	jr	x1
p.putint:
	li	x17, 1
	ecall
	li	x17, 4
	la	x10, m.space
	ecall
	jr	x1
p.getint:
	li	x17, 5
	ecall
	jr	x1
p.putchar:
	li	x17, 11
	ecall
	li	x17, 4
	la	x10, m.space
	ecall
	jr	x1
p.getchar:
	li	x17, 12
	ecall
	jr	x1
p.putstring:
	lw	x7, 0(x10)
	addi	x6, x10, 4
	add	x7, x6, x7
	li	x17, 11
l.ps_begin:
	bge	x6, x7, l.ps_done
	lbu	x10, 0(x6)
	ecall
	addi	x6, x6, 1
	j	l.ps_begin
l.ps_done:
	jr	x1
p.RuntimeError:
	mv	x6, x10
	li	x17, 4
	la	x10, m.RunErr
	ecall
	li	x17, 1
	mv	x10, x6
	ecall
	li	x17, 4
	la	x10, m.colon_space
	ecall
	mv	x10, x11
	ecall
	la	x10, m.nl
	ecall
	j	l.stop
	.data	
# Fixed strings for runtime I/O
m.RunErr:
	.asciz	"Runtime error at line "
m.colon_space:
	.asciz	": "
m.nl:
	.asciz	"\n"
m.space:
	.asciz	" "
# Message strings for specific errors
m.BadSize:
	.asciz	"negative array size"
m.BadIndex:
	.asciz	"array index out of bounds"
m.DivZero:
	.asciz	"division by zero"
# String literals (including lengths) from program
	.align	2
s.Incorre_51_:
	.word	16
	.asciz	"Incorrect Input!"
	.align	2
s.true:
	.word	4
	.asciz	"true"
	.align	2
s.false:
	.word	5
	.asciz	"false"
	.align	2
# Space for Fasto heap
d.heap:
	.space	100000