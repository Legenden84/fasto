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
# Function add
f.add:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_x_31_,x10
# 	mv	_param_y_32_,x11
# 	mv	_plus_L_34_,_param_x_31_
# 	mv	_plus_R_35_,_param_y_32_
	add	x10, x10, x11
# was:	add	_addres_33_, _plus_L_34_, _plus_R_35_
# 	mv	x10,_addres_33_
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
# was:	li	_arg_38_, 0
# 	mv	x10,_arg_38_
	jal	f.readInt
# was:	jal	f.readInt, x10
	mv	x21, x10
# was:	mv	_let_n_37_, x10
# 	mv	_lt_L_43_,_let_n_37_
	li	x10, 1
# was:	li	_lt_R_44_, 1
	slt	x10, x21, x10
# was:	slt	_cond_42_, _lt_L_43_, _lt_R_44_
	bne	x10, x0, l.then_39_
# was:	bne	_cond_42_, x0, l.then_39_
	j	l.else_40_
l.then_39_:
	la	x10, s.Incorre_47_
# was:	la	_tmp_46_, s.Incorre_47_
# s.Incorre_47_: string "Incorrect Input!"
# 	mv	_let_output_45_,_tmp_46_
# 	mv	x10,_tmp_46_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x18, 0
# was:	li	_mainres_36_, 0
	j	l.endif_41_
l.else_40_:
# 	mv	_size_53_,_let_n_37_
	bge	x21, x0, l.safe_54_
# was:	bge	_size_53_, x0, l.safe_54_
	li	x10, 27
# was:	li	x10, 27
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_54_:
	mv	x10, x3
# was:	mv	_arr_50_, x3
	slli	x11, x21, 2
# was:	slli	_tmp_59_, _size_53_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_59_, _tmp_59_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_59_
	sw	x21, 0(x10)
# was:	sw	_size_53_, 0(_arr_50_)
	addi	x11, x10, 4
# was:	addi	_addr_55_, _arr_50_, 4
	mv	x12, x0
# was:	mv	_i_56_, x0
l.loop_beg_57_:
	bge	x12, x21, l.loop_end_58_
# was:	bge	_i_56_, _size_53_, l.loop_end_58_
	sw	x12, 0(x11)
# was:	sw	_i_56_, 0(_addr_55_)
	addi	x11, x11, 4
# was:	addi	_addr_55_, _addr_55_, 4
	addi	x12, x12, 1
# was:	addi	_i_56_, _i_56_, 1
	j	l.loop_beg_57_
l.loop_end_58_:
	lw	x22, 0(x10)
# was:	lw	_size_49_, 0(_arr_50_)
	mv	x18, x3
# was:	mv	_let_arr_48_, x3
	slli	x11, x22, 2
# was:	slli	_tmp_65_, _size_49_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_65_, _tmp_65_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_65_
	sw	x22, 0(x18)
# was:	sw	_size_49_, 0(_let_arr_48_)
	addi	x20, x18, 4
# was:	addi	_addrg_60_, _let_arr_48_, 4
	mv	x19, x0
# was:	mv	_i_61_, x0
	addi	x23, x10, 4
# was:	addi	_elem_51_, _arr_50_, 4
l.loop_beg_62_:
	bge	x19, x22, l.loop_end_63_
# was:	bge	_i_61_, _size_49_, l.loop_end_63_
	lw	x10, 0(x23)
# was:	lw	_res_52_, 0(_elem_51_)
	addi	x23, x23, 4
# was:	addi	_elem_51_, _elem_51_, 4
# 	mv	x10,_res_52_
	jal	f.readInt
# was:	jal	f.readInt, x10
# 	mv	_tmp_64_,x10
# 	mv	_res_52_,_tmp_64_
	sw	x10, 0(x20)
# was:	sw	_res_52_, 0(_addrg_60_)
	addi	x20, x20, 4
# was:	addi	_addrg_60_, _addrg_60_, 4
	addi	x19, x19, 1
# was:	addi	_i_61_, _i_61_, 1
	j	l.loop_beg_62_
l.loop_end_63_:
# 	mv	_size_71_,_let_n_37_
	bge	x21, x0, l.safe_72_
# was:	bge	_size_71_, x0, l.safe_72_
	li	x10, 29
# was:	li	x10, 29
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_72_:
	mv	x14, x3
# was:	mv	_arr_68_, x3
	slli	x10, x21, 2
# was:	slli	_tmp_77_, _size_71_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_77_, _tmp_77_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_77_
	sw	x21, 0(x14)
# was:	sw	_size_71_, 0(_arr_68_)
	addi	x10, x14, 4
# was:	addi	_addr_73_, _arr_68_, 4
	mv	x11, x0
# was:	mv	_i_74_, x0
l.loop_beg_75_:
	bge	x11, x21, l.loop_end_76_
# was:	bge	_i_74_, _size_71_, l.loop_end_76_
	sw	x11, 0(x10)
# was:	sw	_i_74_, 0(_addr_73_)
	addi	x10, x10, 4
# was:	addi	_addr_73_, _addr_73_, 4
	addi	x11, x11, 1
# was:	addi	_i_74_, _i_74_, 1
	j	l.loop_beg_75_
l.loop_end_76_:
	lw	x11, 0(x14)
# was:	lw	_size_67_, 0(_arr_68_)
	mv	x10, x3
# was:	mv	_let_difs_66_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_109_, _size_67_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_109_, _tmp_109_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_109_
	sw	x11, 0(x10)
# was:	sw	_size_67_, 0(_let_difs_66_)
	addi	x12, x10, 4
# was:	addi	_addrg_78_, _let_difs_66_, 4
	mv	x13, x0
# was:	mv	_i_79_, x0
	addi	x14, x14, 4
# was:	addi	_elem_69_, _arr_68_, 4
l.loop_beg_80_:
	bge	x13, x11, l.loop_end_81_
# was:	bge	_i_79_, _size_67_, l.loop_end_81_
	lw	x16, 0(x14)
# was:	lw	_res_70_, 0(_elem_69_)
	addi	x14, x14, 4
# was:	addi	_elem_69_, _elem_69_, 4
# 	mv	_eq_L_87_,_res_70_
	li	x17, 0
# was:	li	_eq_R_88_, 0
	li	x15, 0
# was:	li	_cond_86_, 0
	bne	x16, x17, l.false_89_
# was:	bne	_eq_L_87_, _eq_R_88_, l.false_89_
	li	x15, 1
# was:	li	_cond_86_, 1
l.false_89_:
	bne	x15, x0, l.then_83_
# was:	bne	_cond_86_, x0, l.then_83_
	j	l.else_84_
l.then_83_:
	li	x16, 0
# was:	li	_arr_ind_90_, 0
	addi	x17, x18, 4
# was:	addi	_arr_data_91_, _let_arr_48_, 4
	lw	x15, 0(x18)
# was:	lw	_size_92_, 0(_let_arr_48_)
	bge	x16, x0, l.nonneg_94_
# was:	bge	_arr_ind_90_, x0, l.nonneg_94_
l.error_93_:
	li	x10, 29
# was:	li	x10, 29
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_94_:
	bge	x16, x15, l.error_93_
# was:	bge	_arr_ind_90_, _size_92_, l.error_93_
	slli	x16, x16, 2
# was:	slli	_arr_ind_90_, _arr_ind_90_, 2
	add	x17, x17, x16
# was:	add	_arr_data_91_, _arr_data_91_, _arr_ind_90_
	lw	x16, 0(x17)
# was:	lw	_fun_arg_res_82_, 0(_arr_data_91_)
	j	l.endif_85_
l.else_84_:
	mv	x15, x16
# was:	mv	_arr_ind_97_, _res_70_
	addi	x19, x18, 4
# was:	addi	_arr_data_98_, _let_arr_48_, 4
	lw	x17, 0(x18)
# was:	lw	_size_99_, 0(_let_arr_48_)
	bge	x15, x0, l.nonneg_101_
# was:	bge	_arr_ind_97_, x0, l.nonneg_101_
l.error_100_:
	li	x10, 29
# was:	li	x10, 29
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_101_:
	bge	x15, x17, l.error_100_
# was:	bge	_arr_ind_97_, _size_99_, l.error_100_
	slli	x15, x15, 2
# was:	slli	_arr_ind_97_, _arr_ind_97_, 2
	add	x19, x19, x15
# was:	add	_arr_data_98_, _arr_data_98_, _arr_ind_97_
	lw	x15, 0(x19)
# was:	lw	_minus_L_95_, 0(_arr_data_98_)
	mv	x17, x16
# was:	mv	_minus_L_103_, _res_70_
	li	x16, 1
# was:	li	_minus_R_104_, 1
	sub	x19, x17, x16
# was:	sub	_arr_ind_102_, _minus_L_103_, _minus_R_104_
	addi	x17, x18, 4
# was:	addi	_arr_data_105_, _let_arr_48_, 4
	lw	x16, 0(x18)
# was:	lw	_size_106_, 0(_let_arr_48_)
	bge	x19, x0, l.nonneg_108_
# was:	bge	_arr_ind_102_, x0, l.nonneg_108_
l.error_107_:
	li	x10, 29
# was:	li	x10, 29
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_108_:
	bge	x19, x16, l.error_107_
# was:	bge	_arr_ind_102_, _size_106_, l.error_107_
	slli	x19, x19, 2
# was:	slli	_arr_ind_102_, _arr_ind_102_, 2
	add	x17, x17, x19
# was:	add	_arr_data_105_, _arr_data_105_, _arr_ind_102_
	lw	x16, 0(x17)
# was:	lw	_minus_R_96_, 0(_arr_data_105_)
	sub	x16, x15, x16
# was:	sub	_fun_arg_res_82_, _minus_L_95_, _minus_R_96_
l.endif_85_:
# 	mv	_res_70_,_fun_arg_res_82_
	sw	x16, 0(x12)
# was:	sw	_res_70_, 0(_addrg_78_)
	addi	x12, x12, 4
# was:	addi	_addrg_78_, _addrg_78_, 4
	addi	x13, x13, 1
# was:	addi	_i_79_, _i_79_, 1
	j	l.loop_beg_80_
l.loop_end_81_:
# 	mv	_arr_112_,_let_difs_66_
	lw	x19, 0(x10)
# was:	lw	_size_111_, 0(_arr_112_)
	mv	x18, x3
# was:	mv	_let_map_squares_110_, x3
	slli	x11, x19, 2
# was:	slli	_tmp_122_, _size_111_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_122_, _tmp_122_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_122_
	sw	x19, 0(x18)
# was:	sw	_size_111_, 0(_let_map_squares_110_)
	addi	x20, x18, 4
# was:	addi	_addrg_115_, _let_map_squares_110_, 4
	mv	x21, x0
# was:	mv	_i_116_, x0
	addi	x22, x10, 4
# was:	addi	_elem_113_, _arr_112_, 4
l.loop_beg_117_:
	bge	x21, x19, l.loop_end_118_
# was:	bge	_i_116_, _size_111_, l.loop_end_118_
	lw	x10, 0(x22)
# was:	lw	_res_114_, 0(_elem_113_)
	addi	x22, x22, 4
# was:	addi	_elem_113_, _elem_113_, 4
# 	mv	_arg_120_,_res_114_
	mv	x11, x10
# was:	mv	_arg_121_, _res_114_
# 	mv	x10,_arg_120_
# 	mv	x11,_arg_121_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_fun_arg_res_119_,x10
# 	mv	_res_114_,_fun_arg_res_119_
	sw	x10, 0(x20)
# was:	sw	_res_114_, 0(_addrg_115_)
	addi	x20, x20, 4
# was:	addi	_addrg_115_, _addrg_115_, 4
	addi	x21, x21, 1
# was:	addi	_i_116_, _i_116_, 1
	j	l.loop_beg_117_
l.loop_end_118_:
	mv	x19, x18
# was:	mv	_arr_124_, _let_map_squares_110_
	lw	x18, 0(x19)
# was:	lw	_size_125_, 0(_arr_124_)
	li	x10, 0
# was:	li	_tmp_123_, 0
	addi	x19, x19, 4
# was:	addi	_arr_124_, _arr_124_, 4
	mv	x20, x0
# was:	mv	_ind_var_126_, x0
l.loop_beg_128_:
	bge	x20, x18, l.loop_end_129_
# was:	bge	_ind_var_126_, _size_125_, l.loop_end_129_
	lw	x11, 0(x19)
# was:	lw	_tmp_127_, 0(_arr_124_)
	addi	x19, x19, 4
# was:	addi	_arr_124_, _arr_124_, 4
# 	mv	x10,_tmp_123_
# 	mv	x11,_tmp_127_
	jal	f.add
# was:	jal	f.add, x10 x11
# 	mv	_tmp_130_,x10
# 	mv	_tmp_123_,_tmp_130_
	addi	x20, x20, 1
# was:	addi	_ind_var_126_, _ind_var_126_, 1
	j	l.loop_beg_128_
l.loop_end_129_:
	mv	x18, x10
# was:	mv	_mainres_36_, _tmp_123_
	mv	x10, x18
# was:	mv	x10, _mainres_36_
	jal	p.putint
# was:	jal	p.putint, x10
l.endif_41_:
	mv	x10, x18
# was:	mv	x10, _mainres_36_
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
s.Incorre_47_:
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