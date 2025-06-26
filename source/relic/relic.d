/++
+ Machine generated D bindings for Relic library.
+ 
+ Generated on: 2025-06-26 15:20:27
+ 
+ Source header: relic.h
+ Module: relic.relic
+/
module relic.relic;
import core.stdc.stdint;

enum BN_PRECI = 1024;
enum RLC_DIG = size_t.sizeof;

template RLC_CEIL(int A, int B)
{
    enum RLC_CEIL = ((A - 1) / B + 1);
}

enum RLC_BN_BITS = cast(size_t) BN_PRECI;
enum RLC_BN_DIGS = cast(size_t) RLC_CEIL!(BN_PRECI, RLC_DIG);
version (BN_MAGNI_DOUBLE)
    enum RLC_BN_SIZE = cast(size_t)(2 * RLC_BN_DIGS + 2);
else version (BN_MAGNI_CARRY)
    enum RLC_BN_SIZE = cast(size_t)(RLC_BN_DIGS + 1);
else
    enum RLC_BN_SIZE = cast(size_t) RLC_BN_DIGS;

extern (C) struct _rsa_st;
extern (C) struct _rsa_t;
extern (C) struct bdpe_st;
extern (C) struct bdpe_t;
extern (C) struct bgn_st;
extern (C) struct bgn_t;
extern (C) struct bn_st
{
    size_t alloc = 0;
    size_t used = 0;
    int sign = 0;
    dig_t* dp = null;
}

alias bn_t = bn_st;
extern (C) struct crt_st;
extern (C) struct ctx_t;
extern (C) struct dig_t;
extern (C) struct dv2_t;
extern (C) struct dv3_t;
extern (C) struct dv4_t;
extern (C) struct dv6_t;
extern (C) struct dv8_t;
extern (C) struct dv9_t;
extern (C) struct eb_t;
extern (C) struct ec_t;
extern (C) struct ed_st;
extern (C) struct ed_t;
extern (C) struct ep2_st;
extern (C) struct ep2_t;
extern (C) struct ep3_st;
extern (C) struct ep3_t;
extern (C) struct ep4_st;
extern (C) struct ep4_t;
extern (C) struct ep8_st;
extern (C) struct ep8_t;
extern (C) struct ep_st;
extern (C) struct ep_t;
extern (C) struct ers_t;
extern (C) struct etrs_st;
extern (C) struct etrs_t;
extern (C) struct fb_st;
extern (C) struct fb_t;
extern (C) struct fp12_t;
extern (C) struct fp16_t;
extern (C) struct fp18_t;
extern (C) struct fp24_t;
extern (C) struct fp2_t;
extern (C) struct fp3_t;
extern (C) struct fp48_t;
extern (C) struct fp4_t;
extern (C) struct fp54_t;
extern (C) struct fp6_t;
extern (C) struct fp8_t;
extern (C) struct fp9_t;
extern (C) struct fp_t;
extern (C) struct g1_t;
extern (C) struct g2_t;
extern (C) struct gt_t;
extern (C) struct iso2_t;
extern (C) struct iso_t;
extern (C) struct mt_t;
extern (C) struct pt_st;
extern (C) struct pt_t;
extern (C) struct shpe_st;
extern (C) struct shpe_t;
extern (C) struct smlers_t;
extern (C) struct sokaka_st;
extern (C) struct sokaka_t;
extern (C) struct _pt_st
{
    g1_t* a = null;
    g2_t* b = null;
    gt_t* c = null;
}

extern (C) struct _sokaka
{
    g1_t* s1 = null;
    g2_t* s2 = null;
}

extern (C) struct _ers_st
{
    ec_t* h = null;
    ec_t* pk = null;
    bn_t[2] c = void;
    bn_t[2] r = void;
}

extern (C) struct _smlers_st
{
    ers_t* sig = null;
    ec_t* tau = null;
    bn_t[2] c = void;
    bn_t[2] r = void;
}

extern (C) struct _etrs_st
{
    bn_t* y = null;
    ec_t* h = null;
    ec_t* pk = null;
    bn_t[2] c = void;
    bn_t[2] r = void;
}

enum errors
{
    Caught,
    No_memory,
    No_preci,
    No_file,
    No_read,
    No_valid,
    No_buffer,
    No_field,
    No_curve,
    No_config,
    No_rand,
    Max,
}

extern (C) void err_simple_msg(int error) @system @nogc nothrow pure;
extern (C) void err_full_msg(scope const(char)* fn, scope const(char)* file, int line, int error) @system @nogc nothrow pure;
extern (C) void err_get_msg(scope int* e, scope const(char*)* msg) @system @nogc nothrow pure;
extern (C) int err_get_code() @system @nogc nothrow pure;
extern (C) void bn_make(scope bn_st* a, size_t digits) @system @nogc nothrow pure;
extern (C) void bn_clean(scope bn_st* a) @system @nogc nothrow pure;
extern (C) void bn_grow(scope bn_st* a, size_t digits) @system @nogc nothrow pure;
extern (C) void bn_trim(scope bn_st* a) @system @nogc nothrow pure;
extern (C) void bn_copy(scope bn_st* c, scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) void bn_abs(scope bn_st* c, scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) void bn_neg(scope bn_st* c, scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) int bn_sign(scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) void bn_zero(scope bn_st* a) @system @nogc nothrow pure;
extern (C) int bn_is_zero(scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) int bn_is_even(scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) size_t bn_bits(scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) int bn_get_bit(scope const(bn_st)* a, uint bit) @system @nogc nothrow pure;
extern (C) void bn_set_bit(scope bn_st* a, uint bit, int value) @system @nogc nothrow pure;
extern (C) uint bn_ham(scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) void bn_get_dig(scope dig_t* digit, scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) void bn_set_dig(scope bn_st* a, ulong digit) @system @nogc nothrow pure;
extern (C) void bn_set_2b(scope bn_st* a, size_t b) @system @nogc nothrow pure;
extern (C) void bn_rand(scope bn_st* a, int sign, size_t bits) @system @nogc nothrow pure;
extern (C) void bn_rand_mod(scope bn_st* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void bn_rand_frb(scope bn_st* a, scope const(bn_st)* b, scope const(bn_st)* n, size_t bits) @system @nogc nothrow pure;
extern (C) void bn_print(scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) size_t bn_size_str(scope const(bn_st)* a, uint radix) @system @nogc nothrow pure;
extern (C) void bn_read_str(scope bn_st* a, scope const(char)* str, size_t len, uint radix) @system @nogc nothrow pure;
extern (C) void bn_write_str(scope char* str, size_t len, scope const(bn_st)* a, uint radix) @system @nogc nothrow pure;
extern (C) size_t bn_size_bin(scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) void bn_read_bin(scope bn_st* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void bn_write_bin(scope ubyte* bin, size_t len, scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) size_t bn_size_raw(scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) void bn_read_raw(scope bn_st* a, scope const(dig_t)* raw, size_t len) @system @nogc nothrow pure;
extern (C) void bn_write_raw(scope dig_t* raw, size_t len, scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) int bn_cmp_abs(scope const(bn_st)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) int bn_cmp_dig(scope const(bn_st)* a, ulong b) @system @nogc nothrow pure;
extern (C) int bn_cmp(scope const(bn_st)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void bn_add(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void bn_add_dig(scope bn_st* c, scope const(bn_st)* a, ulong b) @system @nogc nothrow pure;
extern (C) void bn_sub(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void bn_sub_dig(scope bn_st* c, scope const(bn_st)* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void bn_mul_dig(scope bn_st* c, scope const(bn_st)* a, ulong b) @system @nogc nothrow pure;
extern (C) void bn_mul_basic(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void bn_mul_comba(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void bn_mul_karat(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void bn_sqr_basic(scope bn_st* c, scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) void bn_sqr_comba(scope bn_st* c, scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) void bn_sqr_karat(scope bn_st* c, scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) void bn_dbl(scope bn_st* c, scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) void bn_hlv(scope bn_st* c, scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) void bn_lsh(scope bn_st* c, scope const(bn_st)* a, uint bits) @system @nogc nothrow pure;
extern (C) void bn_rsh(scope bn_st* c, scope const(bn_st)* a, uint bits) @system @nogc nothrow pure;
extern (C) void bn_div(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void bn_div_rem(scope bn_st* c, scope bn_st* d, scope const(bn_st)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void bn_div_dig(scope bn_st* c, scope const(bn_st)* a, ulong b) @system @nogc nothrow pure;
extern (C) void bn_div_rem_dig(scope bn_st* c, scope dig_t* d, scope const(bn_st)* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void bn_mod_inv(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void bn_mod_inv_sim(scope bn_t* c, scope const(bn_t)* a, scope const(bn_st)* b, int n) @system @nogc nothrow pure;
extern (C) void bn_mod_2b(scope bn_st* c, scope const(bn_st)* a, int b) @system @nogc nothrow pure;
extern (C) void bn_mod_dig(scope dig_t* c, scope const(bn_st)* a, ulong b) @system @nogc nothrow pure;
extern (C) void bn_mod_basic(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void bn_mod_pre_barrt(scope bn_st* u, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void bn_mod_barrt(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* m, scope const(
        bn_st)* u) @system @nogc nothrow pure;
extern (C) void bn_mod_pre_monty(scope bn_st* u, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void bn_mod_monty_conv(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void bn_mod_monty_back(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void bn_mod_monty_basic(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* m, scope const(
        bn_st)* u) @system @nogc nothrow pure;
extern (C) void bn_mod_monty_comba(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* m, scope const(
        bn_st)* u) @system @nogc nothrow pure;
extern (C) void bn_mod_pre_pmers(scope bn_st* u, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void bn_mod_pmers(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* m, scope const(
        bn_st)* u) @system @nogc nothrow pure;
extern (C) void bn_mxp_basic(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* b, scope const(
        bn_st)* m) @system @nogc nothrow pure;
extern (C) void bn_mxp_slide(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* b, scope const(
        bn_st)* m) @system @nogc nothrow pure;
extern (C) void bn_mxp_monty(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* b, scope const(
        bn_st)* m) @system @nogc nothrow pure;
extern (C) void bn_mxp_dig(scope bn_st* c, scope const(bn_st)* a, ulong b, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void bn_mxp_crt(scope bn_st* d, scope const(bn_st)* a, scope const(bn_st)* b, scope const(
        bn_st)* c, scope const(crt_st)* crt, int sqr) @system @nogc nothrow pure;
extern (C) void bn_mxp_sim(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* b, scope const(
        bn_st)* d, scope const(bn_st)* e, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void bn_mxp_sim_few(scope bn_st* c, scope const(bn_t)* a, scope const(bn_t)* b, scope const(
        bn_st)* m, size_t n) @system @nogc nothrow pure;
extern (C) void bn_mxp_sim_lot(scope bn_st* c, scope const(bn_t)* a, scope const(bn_t)* b, scope const(
        bn_st)* m, size_t n) @system @nogc nothrow pure;
extern (C) void bn_srt(scope bn_st* c, scope bn_st* a) @system @nogc nothrow pure;
extern (C) void bn_gcd_basic(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void bn_gcd_lehme(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void bn_gcd_binar(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void bn_gcd_dig(scope bn_st* c, scope const(bn_st)* a, ulong b) @system @nogc nothrow pure;
extern (C) void bn_gcd_ext_basic(scope bn_st* c, scope bn_st* d, scope bn_st* e, scope const(bn_st)* a, scope const(
        bn_st)* b) @system @nogc nothrow pure;
extern (C) void bn_gcd_ext_lehme(scope bn_st* c, scope bn_st* d, scope bn_st* e, scope const(bn_st)* a, scope const(
        bn_st)* b) @system @nogc nothrow pure;
extern (C) void bn_gcd_ext_binar(scope bn_st* c, scope bn_st* d, scope bn_st* e, scope const(bn_st)* a, scope const(
        bn_st)* b) @system @nogc nothrow pure;
extern (C) void bn_gcd_ext_mid(scope bn_st* c, scope bn_st* d, scope bn_st* e, scope bn_st* f, scope const(
        bn_st)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void bn_gcd_ext_dig(scope bn_st* c, scope bn_st* d, scope bn_st* e, scope const(bn_st)* a, ulong b) @system @nogc nothrow pure;
extern (C) void bn_lcm(scope bn_st* c, scope const(bn_st)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) int bn_smb_leg(scope const(bn_st)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) int bn_smb_jac(scope const(bn_st)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) int bn_is_prime(scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) int bn_is_prime_basic(scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) int bn_is_prime_rabin(scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) int bn_is_prime_solov(scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) void bn_gen_prime_basic(scope bn_st* a, size_t bits) @system @nogc nothrow pure;
extern (C) void bn_gen_prime_safep(scope bn_st* a, size_t bits) @system @nogc nothrow pure;
extern (C) void bn_gen_prime_stron(scope bn_st* a, size_t bits) @system @nogc nothrow pure;
extern (C) int bn_gen_prime_factor(scope bn_st* a, scope bn_st* b, size_t abits, size_t bbits) @system @nogc nothrow pure;
extern (C) int bn_factor(scope bn_st* c, scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) int bn_is_factor(scope bn_st* c, scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) void bn_rec_win(scope ubyte* win, scope size_t* len, scope const(bn_st)* k, size_t w) @system @nogc nothrow pure;
extern (C) void bn_rec_slw(scope ubyte* win, scope size_t* len, scope const(bn_st)* k, size_t w) @system @nogc nothrow pure;
extern (C) void bn_rec_naf(scope byte* naf, scope size_t* len, scope const(bn_st)* k, size_t w) @system @nogc nothrow pure;
extern (C) void bn_rec_tnaf(scope byte* tnaf, scope size_t* len, scope const(bn_st)* k, byte u, size_t m, size_t w) @system @nogc nothrow pure;
extern (C) void bn_rec_rtnaf(scope byte* tnaf, scope size_t* len, scope const(bn_st)* k, byte u, size_t m, size_t w) @system @nogc nothrow pure;
extern (C) void bn_rec_tnaf_get(scope ubyte* t, scope byte* beta, scope byte* gama, byte u, size_t w) @system @nogc nothrow pure;
extern (C) void bn_rec_tnaf_mod(scope bn_st* r0, scope bn_st* r1, scope const(bn_st)* k, int u, size_t m) @system @nogc nothrow pure;
extern (C) void bn_rec_reg(scope byte* naf, scope size_t* len, scope const(bn_st)* k, size_t n, size_t w) @system @nogc nothrow pure;
extern (C) void bn_rec_jsf(scope byte* jsf, scope size_t* len, scope const(bn_st)* k, scope const(
        bn_st)* l) @system @nogc nothrow pure;
extern (C) void bn_rec_glv(scope bn_st* k0, scope bn_st* k1, scope const(bn_st)* k, scope const(
        bn_st)* n, scope const(bn_st)* v1, scope const(bn_st)* v2) @system @nogc nothrow pure;
extern (C) void bn_rec_frb(scope bn_t* ki, int sub, scope const(bn_st)* k, scope const(bn_st)* x, scope const(
        bn_st)* n, int cof) @system @nogc nothrow pure;
extern (C) void bn_rec_sac(scope byte* b, scope size_t* len, scope const(bn_t)* k, scope const(
        bn_st)* u, size_t c, size_t m, size_t n, int cof) @system @nogc nothrow pure;
extern (C) void bn_lag(scope bn_t* c, scope const(bn_t)* a, scope const(bn_st)* b, size_t n) @system @nogc nothrow pure;
extern (C) void bn_evl(scope bn_st* c, scope const(bn_t)* a, scope const(bn_st)* x, scope const(
        bn_st)* b, size_t n) @system @nogc nothrow pure;
extern (C) void dv_print(scope const(dig_t)* a, size_t digits) @system @nogc nothrow pure;
extern (C) void dv_zero(scope dig_t* a, size_t digits) @system @nogc nothrow pure;
extern (C) void dv_copy(scope dig_t* c, scope const(dig_t)* a, size_t digits) @system @nogc nothrow pure;
extern (C) void dv_copy_sec(scope dig_t* c, scope const(dig_t)* a, size_t digits, ulong bit) @system @nogc nothrow pure;
extern (C) void dv_swap_sec(scope dig_t* c, scope dig_t* a, size_t digits, ulong bit) @system @nogc nothrow pure;
extern (C) int dv_cmp(scope const(dig_t)* a, scope const(dig_t)* b, size_t size) @system @nogc nothrow pure;
extern (C) int dv_cmp_sec(scope const(dig_t)* a, scope const(dig_t)* b, size_t size) @system @nogc nothrow pure;
extern (C) void dv_lshd(scope dig_t* c, scope const(dig_t)* a, size_t size, uint digits) @system @nogc nothrow pure;
extern (C) void dv_rshd(scope dig_t* c, scope const(dig_t)* a, size_t size, uint digits) @system @nogc nothrow pure;
extern (C) void fb_poly_init() @system @nogc nothrow pure;
extern (C) void fb_poly_clean() @system @nogc nothrow pure;
extern (C) dig_t* fb_poly_get() @system @nogc nothrow pure;
extern (C) void fb_poly_set_dense(scope const(dig_t)* f) @system @nogc nothrow pure;
extern (C) void fb_poly_set_trino(int a) @system @nogc nothrow pure;
extern (C) void fb_poly_set_penta(int a, int b, int c) @system @nogc nothrow pure;
extern (C) dig_t* fb_poly_get_srz() @system @nogc nothrow pure;
extern (C) const(dig_t)* fb_poly_tab_srz(int i) @system @nogc nothrow pure;
extern (C) const(fb_st)* fb_poly_tab_sqr(int i) @system @nogc nothrow pure;
extern (C) const(int)* fb_poly_get_chain(scope int* len) @system @nogc nothrow pure;
extern (C) void fb_poly_get_rdc(scope int* a, scope int* b, scope int* c) @system @nogc nothrow pure;
extern (C) void fb_poly_get_trc(scope int* a, scope int* b, scope int* c) @system @nogc nothrow pure;
extern (C) const(dig_t)* fb_poly_get_slv() @system @nogc nothrow pure;
extern (C) void fb_param_set(int param) @system @nogc nothrow pure;
extern (C) void fb_param_set_any() @system @nogc nothrow pure;
extern (C) void fb_param_print() @system @nogc nothrow pure;
extern (C) void fb_poly_add(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fb_copy(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fb_neg(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fb_zero(scope dig_t* a) @system @nogc nothrow pure;
extern (C) int fb_is_zero(scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) int fb_get_bit(scope const(dig_t)* a, uint bit) @system @nogc nothrow pure;
extern (C) void fb_set_bit(scope dig_t* a, uint bit, int value) @system @nogc nothrow pure;
extern (C) void fb_set_dig(scope dig_t* c, ulong a) @system @nogc nothrow pure;
extern (C) size_t fb_bits(scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fb_rand(scope dig_t* a) @system @nogc nothrow pure;
extern (C) void fb_print(scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) size_t fb_size_str(scope const(dig_t)* a, uint radix) @system @nogc nothrow pure;
extern (C) void fb_read_str(scope dig_t* a, scope const(char)* str, size_t len, uint radix) @system @nogc nothrow pure;
extern (C) void fb_write_str(scope char* str, size_t len, scope const(dig_t)* a, uint radix) @system @nogc nothrow pure;
extern (C) void fb_read_bin(scope dig_t* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void fb_write_bin(scope ubyte* bin, size_t len, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) int fb_cmp(scope const(dig_t)* a, scope const(dig_t)* b) @system @nogc nothrow pure;
extern (C) int fb_cmp_dig(scope const(dig_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fb_add(scope dig_t* c, scope const(dig_t)* a, scope const(dig_t)* b) @system @nogc nothrow pure;
extern (C) void fb_add_dig(scope dig_t* c, scope const(dig_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fb_mul_basic(scope dig_t* c, scope const(dig_t)* a, scope const(dig_t)* b) @system @nogc nothrow pure;
extern (C) void fb_mul_integ(scope dig_t* c, scope const(dig_t)* a, scope const(dig_t)* b) @system @nogc nothrow pure;
extern (C) void fb_mul_lodah(scope dig_t* c, scope const(dig_t)* a, scope const(dig_t)* b) @system @nogc nothrow pure;
extern (C) void fb_mul_dig(scope dig_t* c, scope const(dig_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fb_mul_karat(scope dig_t* c, scope const(dig_t)* a, scope const(dig_t)* b) @system @nogc nothrow pure;
extern (C) void fb_sqr_basic(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fb_sqr_integ(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fb_sqr_quick(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fb_lsh(scope dig_t* c, scope const(dig_t)* a, uint bits) @system @nogc nothrow pure;
extern (C) void fb_rsh(scope dig_t* c, scope const(dig_t)* a, uint bits) @system @nogc nothrow pure;
extern (C) void fb_rdc_basic(scope dig_t* c, scope dig_t* a) @system @nogc nothrow pure;
extern (C) void fb_rdc_quick(scope dig_t* c, scope dig_t* a) @system @nogc nothrow pure;
extern (C) void fb_srt_basic(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fb_srt_quick(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) ulong fb_trc_basic(scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) ulong fb_trc_quick(scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fb_inv_basic(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fb_inv_binar(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fb_inv_exgcd(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fb_inv_almos(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fb_inv_itoht(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fb_inv_bruch(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fb_inv_ctaia(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fb_inv_lower(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fb_inv_sim(scope fb_t* c, scope const(fb_t)* a, int n) @system @nogc nothrow pure;
extern (C) void fb_exp_2b(scope dig_t* c, scope const(dig_t)* a, int b) @system @nogc nothrow pure;
extern (C) void fb_exp_basic(scope dig_t* c, scope const(dig_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fb_exp_slide(scope dig_t* c, scope const(dig_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fb_exp_monty(scope dig_t* c, scope const(dig_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fb_slv_basic(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fb_slv_quick(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fb_itr_basic(scope dig_t* c, scope const(dig_t)* a, int b) @system @nogc nothrow pure;
extern (C) void fb_itr_pre_quick(scope fb_st* t, int b) @system @nogc nothrow pure;
extern (C) void fb_itr_quick(scope dig_t* c, scope const(dig_t)* a, scope const(fb_st)* t) @system @nogc nothrow pure;
extern (C) void eb_curve_init() @system @nogc nothrow pure;
extern (C) void eb_curve_clean() @system @nogc nothrow pure;
extern (C) dig_t* eb_curve_get_a() @system @nogc nothrow pure;
extern (C) dig_t* eb_curve_get_b() @system @nogc nothrow pure;
extern (C) int eb_curve_opt_a() @system @nogc nothrow pure;
extern (C) int eb_curve_opt_b() @system @nogc nothrow pure;
extern (C) int eb_curve_is_kbltz() @system @nogc nothrow pure;
extern (C) void eb_curve_get_gen(scope eb_t* g) @system @nogc nothrow pure;
extern (C) const(eb_t)* eb_curve_get_tab() @system @nogc nothrow pure;
extern (C) void eb_curve_get_ord(scope bn_st* n) @system @nogc nothrow pure;
extern (C) void eb_curve_get_cof(scope bn_st* h) @system @nogc nothrow pure;
extern (C) void eb_curve_set(scope const(dig_t)* a, scope const(dig_t)* b, scope const(eb_t)* g, scope const(
        bn_st)* n, scope const(bn_st)* h) @system @nogc nothrow pure;
extern (C) void eb_param_set(int param) @system @nogc nothrow pure;
extern (C) int eb_param_set_any() @system @nogc nothrow pure;
extern (C) int eb_param_set_any_plain() @system @nogc nothrow pure;
extern (C) int eb_param_set_any_kbltz() @system @nogc nothrow pure;
extern (C) int eb_param_get() @system @nogc nothrow pure;
extern (C) void eb_param_print() @system @nogc nothrow pure;
extern (C) int eb_param_level() @system @nogc nothrow pure;
extern (C) int eb_is_infty(scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) void eb_set_infty(scope eb_t* p) @system @nogc nothrow pure;
extern (C) void eb_copy(scope eb_t* r, scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) int eb_cmp(scope const(eb_t)* p, scope const(eb_t)* q) @system @nogc nothrow pure;
extern (C) void eb_rand(scope eb_t* p) @system @nogc nothrow pure;
extern (C) void eb_blind(scope eb_t* r, scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) void eb_rhs(scope dig_t* rhs, scope const(dig_t)* p) @system @nogc nothrow pure;
extern (C) int eb_on_curve(scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) void eb_tab(scope eb_t* t, scope const(eb_t)* p, int w) @system @nogc nothrow pure;
extern (C) void eb_print(scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) size_t eb_size_bin(scope const(eb_t)* a, int pack) @system @nogc nothrow pure;
extern (C) void eb_read_bin(scope eb_t* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void eb_write_bin(scope ubyte* bin, size_t len, scope const(eb_t)* a, int pack) @system @nogc nothrow pure;
extern (C) void eb_neg_basic(scope eb_t* r, scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) void eb_neg_projc(scope eb_t* r, scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) void eb_add_basic(scope eb_t* r, scope const(eb_t)* p, scope const(eb_t)* q) @system @nogc nothrow pure;
extern (C) void eb_add_projc(scope eb_t* r, scope const(eb_t)* p, scope const(eb_t)* q) @system @nogc nothrow pure;
extern (C) void eb_sub_basic(scope eb_t* r, scope const(eb_t)* p, scope const(eb_t)* q) @system @nogc nothrow pure;
extern (C) void eb_sub_projc(scope eb_t* r, scope const(eb_t)* p, scope const(eb_t)* q) @system @nogc nothrow pure;
extern (C) void eb_dbl_basic(scope eb_t* r, scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) void eb_dbl_projc(scope eb_t* r, scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) void eb_hlv(scope eb_t* r, scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) void eb_frb(scope eb_t* r, scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) void eb_mul_basic(scope eb_t* r, scope const(eb_t)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void eb_mul_lodah(scope eb_t* r, scope const(eb_t)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void eb_mul_lwnaf(scope eb_t* r, scope const(eb_t)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void eb_mul_rwnaf(scope eb_t* r, scope const(eb_t)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void eb_mul_halve(scope eb_t* r, scope const(eb_t)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void eb_mul_gen(scope eb_t* r, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void eb_mul_dig(scope eb_t* r, scope const(eb_t)* p, const(ulong) k) @system @nogc nothrow pure;
extern (C) void eb_mul_pre_basic(scope eb_t* t, scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) void eb_mul_pre_yaowi(scope eb_t* t, scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) void eb_mul_pre_nafwi(scope eb_t* t, scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) void eb_mul_pre_combs(scope eb_t* t, scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) void eb_mul_pre_combd(scope eb_t* t, scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) void eb_mul_pre_lwnaf(scope eb_t* t, scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) void eb_mul_fix_basic(scope eb_t* r, scope const(eb_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void eb_mul_fix_yaowi(scope eb_t* r, scope const(eb_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void eb_mul_fix_nafwi(scope eb_t* r, scope const(eb_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void eb_mul_fix_combs(scope eb_t* r, scope const(eb_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void eb_mul_fix_combd(scope eb_t* r, scope const(eb_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void eb_mul_fix_lwnaf(scope eb_t* r, scope const(eb_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void eb_mul_sim_basic(scope eb_t* r, scope const(eb_t)* p, scope const(bn_st)* k, scope const(
        eb_t)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void eb_mul_sim_trick(scope eb_t* r, scope const(eb_t)* p, scope const(bn_st)* k, scope const(
        eb_t)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void eb_mul_sim_inter(scope eb_t* r, scope const(eb_t)* p, scope const(bn_st)* k, scope const(
        eb_t)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void eb_mul_sim_joint(scope eb_t* r, scope const(eb_t)* p, scope const(bn_st)* k, scope const(
        eb_t)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void eb_mul_sim_gen(scope eb_t* r, scope const(bn_st)* k, scope const(eb_t)* q, scope const(
        bn_st)* m) @system @nogc nothrow pure;
extern (C) void eb_norm(scope eb_t* r, scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) void eb_norm_sim(scope eb_t* r, scope const(eb_t)* t, int n) @system @nogc nothrow pure;
extern (C) void eb_map(scope eb_t* p, scope const(ubyte)* msg, size_t len) @system @nogc nothrow pure;
extern (C) void eb_pck(scope eb_t* r, scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) int eb_upk(scope eb_t* r, scope const(eb_t)* p) @system @nogc nothrow pure;
extern (C) void fp_prime_init() @system @nogc nothrow pure;
extern (C) void fp_prime_clean() @system @nogc nothrow pure;
extern (C) const(dig_t)* fp_prime_get() @system @nogc nothrow pure;
extern (C) const(dig_t)* fp_prime_get_rdc() @system @nogc nothrow pure;
extern (C) const(dig_t)* fp_prime_get_conv() @system @nogc nothrow pure;
extern (C) const(dig_t)* fp_prime_get_srt() @system @nogc nothrow pure;
extern (C) const(dig_t)* fp_prime_get_crt() @system @nogc nothrow pure;
extern (C) ulong fp_prime_get_mod8() @system @nogc nothrow pure;
extern (C) ulong fp_prime_get_mod18() @system @nogc nothrow pure;
extern (C) const(int)* fp_prime_get_sps(scope int* len) @system @nogc nothrow pure;
extern (C) int fp_prime_get_qnr() @system @nogc nothrow pure;
extern (C) int fp_prime_get_cnr() @system @nogc nothrow pure;
extern (C) int fp_prime_get_2ad() @system @nogc nothrow pure;
extern (C) int fp_param_get() @system @nogc nothrow pure;
extern (C) void fp_prime_set_dense(scope const(bn_st)* p) @system @nogc nothrow pure;
extern (C) void fp_prime_set_pmers(scope const(int)* spars, size_t len) @system @nogc nothrow pure;
extern (C) void fp_prime_set_pairf(scope const(bn_st)* x, int pairf) @system @nogc nothrow pure;
extern (C) void fp_prime_calc() @system @nogc nothrow pure;
extern (C) void fp_prime_conv(scope dig_t* c, scope const(bn_st)* a) @system @nogc nothrow pure;
extern (C) void fp_prime_conv_dig(scope dig_t* c, ulong a) @system @nogc nothrow pure;
extern (C) void fp_prime_back(scope bn_st* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_param_set(int param) @system @nogc nothrow pure;
extern (C) int fp_param_set_any() @system @nogc nothrow pure;
extern (C) int fp_param_set_any_dense() @system @nogc nothrow pure;
extern (C) int fp_param_set_any_pmers() @system @nogc nothrow pure;
extern (C) int fp_param_set_any_tower() @system @nogc nothrow pure;
extern (C) int fp_param_set_any_h2adc() @system @nogc nothrow pure;
extern (C) void fp_param_print() @system @nogc nothrow pure;
extern (C) void fp_prime_get_par(scope bn_st* x) @system @nogc nothrow pure;
extern (C) const(int)* fp_prime_get_par_sps(scope int* len) @system @nogc nothrow pure;
extern (C) void fp_param_get_sps(scope int* s, scope int* len) @system @nogc nothrow pure;
extern (C) void fp_copy(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_copy_sec(scope dig_t* c, scope const(dig_t)* a, ulong bit) @system @nogc nothrow pure;
extern (C) void fp_zero(scope dig_t* a) @system @nogc nothrow pure;
extern (C) int fp_is_zero(scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) int fp_is_even(scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) int fp_get_bit(scope const(dig_t)* a, uint bit) @system @nogc nothrow pure;
extern (C) void fp_set_bit(scope dig_t* a, uint bit, int value) @system @nogc nothrow pure;
extern (C) void fp_set_dig(scope dig_t* c, ulong a) @system @nogc nothrow pure;
extern (C) size_t fp_bits(scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_rand(scope dig_t* a) @system @nogc nothrow pure;
extern (C) void fp_norm(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_print(scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) size_t fp_size_str(scope const(dig_t)* a, uint radix) @system @nogc nothrow pure;
extern (C) void fp_read_str(scope dig_t* a, scope const(char)* str, size_t len, uint radix) @system @nogc nothrow pure;
extern (C) void fp_write_str(scope char* str, size_t len, scope const(dig_t)* a, uint radix) @system @nogc nothrow pure;
extern (C) void fp_read_bin(scope dig_t* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void fp_write_bin(scope ubyte* bin, size_t len, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) int fp_cmp(scope const(dig_t)* a, scope const(dig_t)* b) @system @nogc nothrow pure;
extern (C) int fp_cmp_dig(scope const(dig_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp_add_basic(scope dig_t* c, scope const(dig_t)* a, scope const(dig_t)* b) @system @nogc nothrow pure;
extern (C) void fp_add_integ(scope dig_t* c, scope const(dig_t)* a, scope const(dig_t)* b) @system @nogc nothrow pure;
extern (C) void fp_add_dig(scope dig_t* c, scope const(dig_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp_sub_basic(scope dig_t* c, scope const(dig_t)* a, scope const(dig_t)* b) @system @nogc nothrow pure;
extern (C) void fp_sub_integ(scope dig_t* c, scope const(dig_t)* a, scope const(dig_t)* b) @system @nogc nothrow pure;
extern (C) void fp_sub_dig(scope dig_t* c, scope const(dig_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp_neg_basic(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_neg_integ(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_dbl_basic(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_dbl_integ(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_hlv_basic(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_hlv_integ(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_trs(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_mul_basic(scope dig_t* c, scope const(dig_t)* a, scope const(dig_t)* b) @system @nogc nothrow pure;
extern (C) void fp_mul_comba(scope dig_t* c, scope const(dig_t)* a, scope const(dig_t)* b) @system @nogc nothrow pure;
extern (C) void fp_mul_integ(scope dig_t* c, scope const(dig_t)* a, scope const(dig_t)* b) @system @nogc nothrow pure;
extern (C) void fp_mul_karat(scope dig_t* c, scope const(dig_t)* a, scope const(dig_t)* b) @system @nogc nothrow pure;
extern (C) void fp_mul_dig(scope dig_t* c, scope const(dig_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp_sqr_basic(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_sqr_comba(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_sqr_integ(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_sqr_karat(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_lsh(scope dig_t* c, scope const(dig_t)* a, uint bits) @system @nogc nothrow pure;
extern (C) void fp_rsh(scope dig_t* c, scope const(dig_t)* a, uint bits) @system @nogc nothrow pure;
extern (C) void fp_rdc_basic(scope dig_t* c, scope dig_t* a) @system @nogc nothrow pure;
extern (C) void fp_rdc_monty_basic(scope dig_t* c, scope dig_t* a) @system @nogc nothrow pure;
extern (C) void fp_rdc_monty_comba(scope dig_t* c, scope dig_t* a) @system @nogc nothrow pure;
extern (C) void fp_rdc_quick(scope dig_t* c, scope dig_t* a) @system @nogc nothrow pure;
extern (C) void fp_inv_basic(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_inv_binar(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_inv_monty(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_inv_exgcd(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_inv_divst(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_inv_jmpds(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_inv_lower(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_inv_sim(scope fp_t* c, scope const(fp_t)* a, int n) @system @nogc nothrow pure;
extern (C) int fp_smb_basic(scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) int fp_smb_binar(scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) int fp_smb_divst(scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) int fp_smb_jmpds(scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) int fp_smb_lower(scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp_exp_basic(scope dig_t* c, scope const(dig_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp_exp_slide(scope dig_t* c, scope const(dig_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp_exp_monty(scope dig_t* c, scope const(dig_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp_exp_dig(scope dig_t* c, scope const(dig_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) int fp_is_sqr(scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) int fp_srt(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) int fp_is_cub(scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) int fp_crt(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void fp2_field_init() @system @nogc nothrow pure;
extern (C) int fp2_field_get_qnr() @system @nogc nothrow pure;
extern (C) void fp2_copy(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp2_copy_sec(scope fp_t* c, scope const(fp_t)* a, ulong bit) @system @nogc nothrow pure;
extern (C) void fp2_zero(scope fp_t* a) @system @nogc nothrow pure;
extern (C) int fp2_is_zero(scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp2_rand(scope fp_t* a) @system @nogc nothrow pure;
extern (C) void fp2_print(scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) int fp2_size_bin(scope const(fp_t)* a, int pack) @system @nogc nothrow pure;
extern (C) void fp2_read_bin(scope fp_t* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void fp2_write_bin(scope ubyte* bin, size_t len, scope const(fp_t)* a, int pack) @system @nogc nothrow pure;
extern (C) int fp2_cmp(scope const(fp_t)* a, scope const(fp_t)* b) @system @nogc nothrow pure;
extern (C) int fp2_cmp_dig(scope const(fp_t)* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp2_set_dig(scope fp_t* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp2_add_basic(scope fp_t* c, scope const(fp_t)* a, scope const(fp_t)* b) @system @nogc nothrow pure;
extern (C) void fp2_add_integ(scope fp_t* c, scope const(fp_t)* a, scope const(fp_t)* b) @system @nogc nothrow pure;
extern (C) void fp2_add_dig(scope fp_t* c, scope const(fp_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp2_sub_basic(scope fp_t* c, scope const(fp_t)* a, scope const(fp_t)* b) @system @nogc nothrow pure;
extern (C) void fp2_sub_integ(scope fp_t* c, scope const(fp_t)* a, scope const(fp_t)* b) @system @nogc nothrow pure;
extern (C) void fp2_sub_dig(scope fp_t* c, scope const(fp_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp2_neg(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp2_dbl_basic(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp2_dbl_integ(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp2_mul_basic(scope fp_t* c, scope const(fp_t)* a, scope const(fp_t)* b) @system @nogc nothrow pure;
extern (C) void fp2_mul_integ(scope fp_t* c, scope const(fp_t)* a, scope const(fp_t)* b) @system @nogc nothrow pure;
extern (C) void fp2_mul_art(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp2_mul_nor_basic(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp2_mul_nor_integ(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp2_mul_frb(scope fp_t* c, scope const(fp_t)* a, int i, int j) @system @nogc nothrow pure;
extern (C) void fp2_mul_dig(scope fp_t* c, scope const(fp_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp2_sqr_basic(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp2_sqr_integ(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp2_inv(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp2_inv_cyc(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp2_inv_sim(scope fp2_t* c, scope const(fp2_t)* a, int n) @system @nogc nothrow pure;
extern (C) int fp2_test_cyc(scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp2_conv_cyc(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp2_exp(scope fp_t* c, scope const(fp_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp2_exp_dig(scope fp_t* c, scope const(fp_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp2_exp_cyc(scope fp_t* c, scope const(fp_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp2_exp_cyc_sim(scope fp_t* e, scope const(fp_t)* a, scope const(bn_st)* b, scope const(
        fp_t)* c, scope const(bn_st)* d) @system @nogc nothrow pure;
extern (C) void fp2_frb(scope fp_t* c, scope const(fp_t)* a, int i) @system @nogc nothrow pure;
extern (C) int fp2_is_sqr(scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) int fp2_srt(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp2_pck(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) int fp2_upk(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp3_field_init() @system @nogc nothrow pure;
extern (C) int fp3_field_get_cnr() @system @nogc nothrow pure;
extern (C) void fp3_copy(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp3_copy_sec(scope fp_t* c, scope const(fp_t)* a, ulong bit) @system @nogc nothrow pure;
extern (C) void fp3_zero(scope fp_t* a) @system @nogc nothrow pure;
extern (C) int fp3_is_zero(scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp3_rand(scope fp_t* a) @system @nogc nothrow pure;
extern (C) void fp3_print(scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) int fp3_size_bin(scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp3_read_bin(scope fp_t* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void fp3_write_bin(scope ubyte* bin, size_t len, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) int fp3_cmp(scope const(fp_t)* a, scope const(fp_t)* b) @system @nogc nothrow pure;
extern (C) int fp3_cmp_dig(scope const(fp_t)* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp3_set_dig(scope fp_t* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp3_add_basic(scope fp_t* c, scope const(fp_t)* a, scope const(fp_t)* b) @system @nogc nothrow pure;
extern (C) void fp3_add_integ(scope fp_t* c, scope const(fp_t)* a, scope const(fp_t)* b) @system @nogc nothrow pure;
extern (C) void fp3_add_dig(scope fp_t* c, scope const(fp_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp3_sub_basic(scope fp_t* c, scope const(fp_t)* a, scope const(fp_t)* b) @system @nogc nothrow pure;
extern (C) void fp3_sub_integ(scope fp_t* c, scope const(fp_t)* a, scope const(fp_t)* b) @system @nogc nothrow pure;
extern (C) void fp3_sub_dig(scope fp_t* c, scope const(fp_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp3_neg(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp3_dbl_basic(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp3_dbl_integ(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp3_mul_basic(scope fp_t* c, scope const(fp_t)* a, scope const(fp_t)* b) @system @nogc nothrow pure;
extern (C) void fp3_mul_integ(scope fp_t* c, scope const(fp_t)* a, scope const(fp_t)* b) @system @nogc nothrow pure;
extern (C) void fp3_mul_art(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp3_mul_nor(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp3_mul_frb(scope fp_t* c, scope const(fp_t)* a, int i, int j) @system @nogc nothrow pure;
extern (C) void fp3_mul_dig(scope fp_t* c, scope const(fp_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp3_sqr_basic(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp3_sqr_integ(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp3_inv(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp3_inv_sim(scope fp3_t* c, scope const(fp3_t)* a, int n) @system @nogc nothrow pure;
extern (C) void fp3_exp(scope fp_t* c, scope const(fp_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp3_frb(scope fp_t* c, scope const(fp_t)* a, int i) @system @nogc nothrow pure;
extern (C) int fp3_is_sqr(scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) int fp3_srt(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void fp4_field_init() @system @nogc nothrow pure;
extern (C) void fp4_copy(scope fp2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp4_copy_sec(scope fp2_t* c, scope const(fp2_t)* a, ulong bit) @system @nogc nothrow pure;
extern (C) void fp4_zero(scope fp2_t* a) @system @nogc nothrow pure;
extern (C) int fp4_is_zero(scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp4_rand(scope fp2_t* a) @system @nogc nothrow pure;
extern (C) void fp4_print(scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) int fp4_size_bin(scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp4_read_bin(scope fp2_t* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void fp4_write_bin(scope ubyte* bin, size_t len, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) int fp4_cmp(scope const(fp2_t)* a, scope const(fp2_t)* b) @system @nogc nothrow pure;
extern (C) int fp4_cmp_dig(scope const(fp2_t)* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp4_set_dig(scope fp2_t* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp4_add(scope fp2_t* c, scope const(fp2_t)* a, scope const(fp2_t)* b) @system @nogc nothrow pure;
extern (C) void fp4_add_dig(scope fp2_t* c, scope const(fp2_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp4_sub(scope fp2_t* c, scope const(fp2_t)* a, scope const(fp2_t)* b) @system @nogc nothrow pure;
extern (C) void fp4_sub_dig(scope fp2_t* c, scope const(fp2_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp4_neg(scope fp2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp4_dbl(scope fp2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp4_mul_unr(scope dv2_t* c, scope const(fp2_t)* a, scope const(fp2_t)* b) @system @nogc nothrow pure;
extern (C) void fp4_mul_basic(scope fp2_t* c, scope const(fp2_t)* a, scope const(fp2_t)* b) @system @nogc nothrow pure;
extern (C) void fp4_mul_lazyr(scope fp2_t* c, scope const(fp2_t)* a, scope const(fp2_t)* b) @system @nogc nothrow pure;
extern (C) void fp4_mul_art(scope fp2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp4_mul_frb(scope fp2_t* c, scope const(fp2_t)* a, int i, int j) @system @nogc nothrow pure;
extern (C) void fp4_mul_dig(scope fp2_t* c, scope const(fp2_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp4_mul_dxs(scope fp2_t* c, scope const(fp2_t)* a, scope const(fp2_t)* b) @system @nogc nothrow pure;
extern (C) void fp4_sqr_unr(scope dv2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp4_sqr_basic(scope fp2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp4_sqr_lazyr(scope fp2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp4_inv(scope fp2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp4_inv_sim(scope fp4_t* c, scope const(fp4_t)* a, int n) @system @nogc nothrow pure;
extern (C) void fp4_inv_cyc(scope fp2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp4_exp(scope fp2_t* c, scope const(fp2_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp4_frb(scope fp2_t* c, scope const(fp2_t)* a, int i) @system @nogc nothrow pure;
extern (C) int fp4_is_sqr(scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) int fp4_srt(scope fp2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp6_copy(scope fp2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp6_copy_sec(scope fp2_t* c, scope const(fp2_t)* a, ulong bit) @system @nogc nothrow pure;
extern (C) void fp6_zero(scope fp2_t* a) @system @nogc nothrow pure;
extern (C) int fp6_is_zero(scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp6_rand(scope fp2_t* a) @system @nogc nothrow pure;
extern (C) void fp6_print(scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) int fp6_size_bin(scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp6_read_bin(scope fp2_t* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void fp6_write_bin(scope ubyte* bin, size_t len, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) int fp6_cmp(scope const(fp2_t)* a, scope const(fp2_t)* b) @system @nogc nothrow pure;
extern (C) int fp6_cmp_dig(scope const(fp2_t)* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp6_set_dig(scope fp2_t* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp6_add(scope fp2_t* c, scope const(fp2_t)* a, scope const(fp2_t)* b) @system @nogc nothrow pure;
extern (C) void fp6_sub(scope fp2_t* c, scope const(fp2_t)* a, scope const(fp2_t)* b) @system @nogc nothrow pure;
extern (C) void fp6_neg(scope fp2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp6_dbl(scope fp2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp6_mul_unr(scope dv2_t* c, scope const(fp2_t)* a, scope const(fp2_t)* b) @system @nogc nothrow pure;
extern (C) void fp6_mul_basic(scope fp2_t* c, scope const(fp2_t)* a, scope const(fp2_t)* b) @system @nogc nothrow pure;
extern (C) void fp6_mul_lazyr(scope fp2_t* c, scope const(fp2_t)* a, scope const(fp2_t)* b) @system @nogc nothrow pure;
extern (C) void fp6_mul_art(scope fp2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp6_mul_dxs(scope fp2_t* c, scope const(fp2_t)* a, scope const(fp2_t)* b) @system @nogc nothrow pure;
extern (C) void fp6_sqr_unr(scope dv2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp6_sqr_basic(scope fp2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp6_sqr_lazyr(scope fp2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp6_inv(scope fp2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void fp6_exp(scope fp2_t* c, scope const(fp2_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp6_frb(scope fp2_t* c, scope const(fp2_t)* a, int i) @system @nogc nothrow pure;
extern (C) void fp8_field_init() @system @nogc nothrow pure;
extern (C) void fp8_copy(scope fp4_t* c, scope const(fp4_t)* a) @system @nogc nothrow pure;
extern (C) void fp8_copy_sec(scope fp4_t* c, scope const(fp4_t)* a, ulong bit) @system @nogc nothrow pure;
extern (C) void fp8_zero(scope fp4_t* a) @system @nogc nothrow pure;
extern (C) int fp8_is_zero(scope const(fp4_t)* a) @system @nogc nothrow pure;
extern (C) void fp8_rand(scope fp4_t* a) @system @nogc nothrow pure;
extern (C) void fp8_print(scope const(fp4_t)* a) @system @nogc nothrow pure;
extern (C) int fp8_size_bin(scope const(fp4_t)* a, int pack) @system @nogc nothrow pure;
extern (C) void fp8_read_bin(scope fp4_t* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void fp8_write_bin(scope ubyte* bin, size_t len, scope const(fp4_t)* a, int pack) @system @nogc nothrow pure;
extern (C) int fp8_cmp(scope const(fp4_t)* a, scope const(fp4_t)* b) @system @nogc nothrow pure;
extern (C) int fp8_cmp_dig(scope const(fp4_t)* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp8_set_dig(scope fp4_t* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp8_add(scope fp4_t* c, scope const(fp4_t)* a, scope const(fp4_t)* b) @system @nogc nothrow pure;
extern (C) void fp8_sub(scope fp4_t* c, scope const(fp4_t)* a, scope const(fp4_t)* b) @system @nogc nothrow pure;
extern (C) void fp8_neg(scope fp4_t* c, scope const(fp4_t)* a) @system @nogc nothrow pure;
extern (C) void fp8_dbl(scope fp4_t* c, scope const(fp4_t)* a) @system @nogc nothrow pure;
extern (C) void fp8_mul_unr(scope dv4_t* c, scope const(fp4_t)* a, scope const(fp4_t)* b) @system @nogc nothrow pure;
extern (C) void fp8_mul_basic(scope fp4_t* c, scope const(fp4_t)* a, scope const(fp4_t)* b) @system @nogc nothrow pure;
extern (C) void fp8_mul_lazyr(scope fp4_t* c, scope const(fp4_t)* a, scope const(fp4_t)* b) @system @nogc nothrow pure;
extern (C) void fp8_mul_art(scope fp4_t* c, scope const(fp4_t)* a) @system @nogc nothrow pure;
extern (C) void fp8_mul_frb(scope fp4_t* c, scope const(fp4_t)* a, int i, int j) @system @nogc nothrow pure;
extern (C) void fp8_mul_dig(scope fp4_t* c, scope const(fp4_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp8_mul_dxs(scope fp4_t* c, scope const(fp4_t)* a, scope const(fp4_t)* b) @system @nogc nothrow pure;
extern (C) void fp8_sqr_unr(scope dv4_t* c, scope const(fp4_t)* a) @system @nogc nothrow pure;
extern (C) void fp8_sqr_basic(scope fp4_t* c, scope const(fp4_t)* a) @system @nogc nothrow pure;
extern (C) void fp8_sqr_lazyr(scope fp4_t* c, scope const(fp4_t)* a) @system @nogc nothrow pure;
extern (C) void fp8_sqr_cyc(scope fp4_t* c, scope const(fp4_t)* a) @system @nogc nothrow pure;
extern (C) void fp8_inv(scope fp4_t* c, scope const(fp4_t)* a) @system @nogc nothrow pure;
extern (C) void fp8_inv_cyc(scope fp4_t* c, scope const(fp4_t)* a) @system @nogc nothrow pure;
extern (C) void fp8_inv_sim(scope fp8_t* c, scope const(fp8_t)* a, int n) @system @nogc nothrow pure;
extern (C) int fp8_test_cyc(scope const(fp4_t)* a) @system @nogc nothrow pure;
extern (C) void fp8_conv_cyc(scope fp4_t* c, scope const(fp4_t)* a) @system @nogc nothrow pure;
extern (C) void fp8_exp(scope fp4_t* c, scope const(fp4_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp8_exp_dig(scope fp4_t* c, scope const(fp4_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp8_exp_cyc(scope fp4_t* c, scope const(fp4_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp8_exp_cyc_sim(scope fp4_t* e, scope const(fp4_t)* a, scope const(bn_st)* b, scope const(
        fp4_t)* c, scope const(bn_st)* d) @system @nogc nothrow pure;
extern (C) void fp8_frb(scope fp4_t* c, scope const(fp4_t)* a, int i) @system @nogc nothrow pure;
extern (C) int fp8_is_sqr(scope const(fp4_t)* a) @system @nogc nothrow pure;
extern (C) int fp8_srt(scope fp4_t* c, scope const(fp4_t)* a) @system @nogc nothrow pure;
extern (C) void fp9_copy(scope fp3_t* c, scope const(fp3_t)* a) @system @nogc nothrow pure;
extern (C) void fp9_copy_sec(scope fp3_t* c, scope const(fp3_t)* a, ulong bit) @system @nogc nothrow pure;
extern (C) void fp9_zero(scope fp3_t* a) @system @nogc nothrow pure;
extern (C) int fp9_is_zero(scope const(fp3_t)* a) @system @nogc nothrow pure;
extern (C) void fp9_rand(scope fp3_t* a) @system @nogc nothrow pure;
extern (C) void fp9_print(scope const(fp3_t)* a) @system @nogc nothrow pure;
extern (C) int fp9_size_bin(scope const(fp3_t)* a) @system @nogc nothrow pure;
extern (C) void fp9_read_bin(scope fp3_t* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void fp9_write_bin(scope ubyte* bin, size_t len, scope const(fp3_t)* a) @system @nogc nothrow pure;
extern (C) int fp9_cmp(scope const(fp3_t)* a, scope const(fp3_t)* b) @system @nogc nothrow pure;
extern (C) int fp9_cmp_dig(scope const(fp3_t)* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp9_set_dig(scope fp3_t* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp9_add(scope fp3_t* c, scope const(fp3_t)* a, scope const(fp3_t)* b) @system @nogc nothrow pure;
extern (C) void fp9_sub(scope fp3_t* c, scope const(fp3_t)* a, scope const(fp3_t)* b) @system @nogc nothrow pure;
extern (C) void fp9_neg(scope fp3_t* c, scope const(fp3_t)* a) @system @nogc nothrow pure;
extern (C) void fp9_dbl(scope fp3_t* c, scope const(fp3_t)* a) @system @nogc nothrow pure;
extern (C) void fp9_mul_unr(scope dv3_t* c, scope const(fp3_t)* a, scope const(fp3_t)* b) @system @nogc nothrow pure;
extern (C) void fp9_mul_basic(scope fp3_t* c, scope const(fp3_t)* a, scope const(fp3_t)* b) @system @nogc nothrow pure;
extern (C) void fp9_mul_lazyr(scope fp3_t* c, scope const(fp3_t)* a, scope const(fp3_t)* b) @system @nogc nothrow pure;
extern (C) void fp9_mul_art(scope fp3_t* c, scope const(fp3_t)* a) @system @nogc nothrow pure;
extern (C) void fp9_mul_dxs(scope fp3_t* c, scope const(fp3_t)* a, scope const(fp3_t)* b) @system @nogc nothrow pure;
extern (C) void fp9_sqr_unr(scope dv3_t* c, scope const(fp3_t)* a) @system @nogc nothrow pure;
extern (C) void fp9_sqr_basic(scope fp3_t* c, scope const(fp3_t)* a) @system @nogc nothrow pure;
extern (C) void fp9_sqr_lazyr(scope fp3_t* c, scope const(fp3_t)* a) @system @nogc nothrow pure;
extern (C) void fp9_inv(scope fp3_t* c, scope const(fp3_t)* a) @system @nogc nothrow pure;
extern (C) void fp9_inv_sim(scope fp9_t* c, scope const(fp9_t)* a, int n) @system @nogc nothrow pure;
extern (C) void fp9_exp(scope fp3_t* c, scope const(fp3_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp9_frb(scope fp3_t* c, scope const(fp3_t)* a, int i) @system @nogc nothrow pure;
extern (C) void fp12_copy(scope fp6_t* c, scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) void fp12_copy_sec(scope fp6_t* c, scope const(fp6_t)* a, ulong bit) @system @nogc nothrow pure;
extern (C) void fp12_zero(scope fp6_t* a) @system @nogc nothrow pure;
extern (C) int fp12_is_zero(scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) void fp12_rand(scope fp6_t* a) @system @nogc nothrow pure;
extern (C) void fp12_print(scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) int fp12_size_bin(scope const(fp6_t)* a, int pack) @system @nogc nothrow pure;
extern (C) void fp12_read_bin(scope fp6_t* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void fp12_write_bin(scope ubyte* bin, size_t len, scope const(fp6_t)* a, int pack) @system @nogc nothrow pure;
extern (C) int fp12_cmp(scope const(fp6_t)* a, scope const(fp6_t)* b) @system @nogc nothrow pure;
extern (C) int fp12_cmp_dig(scope const(fp6_t)* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp12_set_dig(scope fp6_t* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp12_add(scope fp6_t* c, scope const(fp6_t)* a, scope const(fp6_t)* b) @system @nogc nothrow pure;
extern (C) void fp12_sub(scope fp6_t* c, scope const(fp6_t)* a, scope const(fp6_t)* b) @system @nogc nothrow pure;
extern (C) void fp12_neg(scope fp6_t* c, scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) void fp12_dbl(scope fp6_t* c, scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) void fp12_mul_unr(scope dv6_t* c, scope const(fp6_t)* a, scope const(fp6_t)* b) @system @nogc nothrow pure;
extern (C) void fp12_mul_basic(scope fp6_t* c, scope const(fp6_t)* a, scope const(fp6_t)* b) @system @nogc nothrow pure;
extern (C) void fp12_mul_lazyr(scope fp6_t* c, scope const(fp6_t)* a, scope const(fp6_t)* b) @system @nogc nothrow pure;
extern (C) void fp12_mul_art(scope fp6_t* c, scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) void fp12_mul_dxs_basic(scope fp6_t* c, scope const(fp6_t)* a, scope const(fp6_t)* b) @system @nogc nothrow pure;
extern (C) void fp12_mul_dxs_lazyr(scope fp6_t* c, scope const(fp6_t)* a, scope const(fp6_t)* b) @system @nogc nothrow pure;
extern (C) void fp12_sqr_unr(scope dv6_t* c, scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) void fp12_sqr_basic(scope fp6_t* c, scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) void fp12_sqr_lazyr(scope fp6_t* c, scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) void fp12_sqr_cyc_basic(scope fp6_t* c, scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) void fp12_sqr_cyc_lazyr(scope fp6_t* c, scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) void fp12_sqr_pck_basic(scope fp6_t* c, scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) void fp12_sqr_pck_lazyr(scope fp6_t* c, scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) int fp12_test_cyc(scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) void fp12_conv_cyc(scope fp6_t* c, scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) void fp12_back_cyc(scope fp6_t* c, scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) void fp12_back_cyc_sim(scope fp12_t* c, scope const(fp12_t)* a, int n) @system @nogc nothrow pure;
extern (C) void fp12_inv(scope fp6_t* c, scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) void fp12_inv_cyc(scope fp6_t* c, scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) void fp12_frb(scope fp6_t* c, scope const(fp6_t)* a, int i) @system @nogc nothrow pure;
extern (C) void fp12_exp(scope fp6_t* c, scope const(fp6_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp12_exp_dig(scope fp6_t* c, scope const(fp6_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp12_exp_cyc(scope fp6_t* c, scope const(fp6_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp12_exp_cyc_gls(scope fp6_t* c, scope const(fp6_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp12_exp_cyc_sim(scope fp6_t* e, scope const(fp6_t)* a, scope const(bn_st)* b, scope const(
        fp6_t)* c, scope const(bn_st)* d) @system @nogc nothrow pure;
extern (C) void fp12_exp_cyc_sps(scope fp6_t* c, scope const(fp6_t)* a, scope const(int)* b, size_t l, int s) @system @nogc nothrow pure;
extern (C) void fp12_pck(scope fp6_t* c, scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) int fp12_upk(scope fp6_t* c, scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) void fp12_pck_max(scope fp6_t* c, scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) int fp12_upk_max(scope fp6_t* c, scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) void fp16_field_init() @system @nogc nothrow pure;
extern (C) void fp16_copy(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp16_copy_sec(scope fp8_t* c, scope const(fp8_t)* a, ulong bit) @system @nogc nothrow pure;
extern (C) void fp16_zero(scope fp8_t* a) @system @nogc nothrow pure;
extern (C) int fp16_is_zero(scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp16_rand(scope fp8_t* a) @system @nogc nothrow pure;
extern (C) void fp16_print(scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) int fp16_size_bin(scope const(fp8_t)* a, int pack) @system @nogc nothrow pure;
extern (C) void fp16_read_bin(scope fp8_t* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void fp16_write_bin(scope ubyte* bin, size_t len, scope const(fp8_t)* a, int pack) @system @nogc nothrow pure;
extern (C) int fp16_cmp(scope const(fp8_t)* a, scope const(fp8_t)* b) @system @nogc nothrow pure;
extern (C) int fp16_cmp_dig(scope const(fp8_t)* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp16_set_dig(scope fp8_t* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp16_add(scope fp8_t* c, scope const(fp8_t)* a, scope const(fp8_t)* b) @system @nogc nothrow pure;
extern (C) void fp16_sub(scope fp8_t* c, scope const(fp8_t)* a, scope const(fp8_t)* b) @system @nogc nothrow pure;
extern (C) void fp16_neg(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp16_dbl(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp16_mul_unr(scope dv8_t* c, scope const(fp8_t)* a, scope const(fp8_t)* b) @system @nogc nothrow pure;
extern (C) void fp16_mul_basic(scope fp8_t* c, scope const(fp8_t)* a, scope const(fp8_t)* b) @system @nogc nothrow pure;
extern (C) void fp16_mul_lazyr(scope fp8_t* c, scope const(fp8_t)* a, scope const(fp8_t)* b) @system @nogc nothrow pure;
extern (C) void fp16_mul_art(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp16_mul_frb(scope fp8_t* c, scope const(fp8_t)* a, int i, int j) @system @nogc nothrow pure;
extern (C) void fp16_mul_dxs_lazyr(scope fp8_t* c, scope const(fp8_t)* a, scope const(fp8_t)* b) @system @nogc nothrow pure;
extern (C) void fp16_sqr_unr(scope dv8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp16_sqr_basic(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp16_sqr_lazyr(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp16_sqr_cyc(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp16_inv(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp16_inv_cyc(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp16_inv_sim(scope fp16_t* c, scope const(fp16_t)* a, int n) @system @nogc nothrow pure;
extern (C) int fp16_test_cyc(scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp16_conv_cyc(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp16_exp(scope fp8_t* c, scope const(fp8_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp16_exp_dig(scope fp8_t* c, scope const(fp8_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp16_exp_cyc(scope fp8_t* c, scope const(fp8_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp16_exp_cyc_gls(scope fp8_t* c, scope const(fp8_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp16_exp_cyc_sim(scope fp8_t* e, scope const(fp8_t)* a, scope const(bn_st)* b, scope const(
        fp8_t)* c, scope const(bn_st)* d) @system @nogc nothrow pure;
extern (C) void fp16_frb(scope fp8_t* c, scope const(fp8_t)* a, int i) @system @nogc nothrow pure;
extern (C) int fp16_is_sqr(scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) int fp16_srt(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp18_copy(scope fp9_t* c, scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) void fp18_copy_sec(scope fp9_t* c, scope const(fp9_t)* a, ulong bit) @system @nogc nothrow pure;
extern (C) void fp18_zero(scope fp9_t* a) @system @nogc nothrow pure;
extern (C) int fp18_is_zero(scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) void fp18_rand(scope fp9_t* a) @system @nogc nothrow pure;
extern (C) void fp18_print(scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) int fp18_size_bin(scope const(fp9_t)* a, int pack) @system @nogc nothrow pure;
extern (C) void fp18_read_bin(scope fp9_t* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void fp18_write_bin(scope ubyte* bin, size_t len, scope const(fp9_t)* a, int pack) @system @nogc nothrow pure;
extern (C) int fp18_cmp(scope const(fp9_t)* a, scope const(fp9_t)* b) @system @nogc nothrow pure;
extern (C) int fp18_cmp_dig(scope const(fp9_t)* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp18_set_dig(scope fp9_t* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp18_add(scope fp9_t* c, scope const(fp9_t)* a, scope const(fp9_t)* b) @system @nogc nothrow pure;
extern (C) void fp18_sub(scope fp9_t* c, scope const(fp9_t)* a, scope const(fp9_t)* b) @system @nogc nothrow pure;
extern (C) void fp18_neg(scope fp9_t* c, scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) void fp18_dbl(scope fp9_t* c, scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) void fp18_mul_unr(scope dv9_t* c, scope const(fp9_t)* a, scope const(fp9_t)* b) @system @nogc nothrow pure;
extern (C) void fp18_mul_basic(scope fp9_t* c, scope const(fp9_t)* a, scope const(fp9_t)* b) @system @nogc nothrow pure;
extern (C) void fp18_mul_lazyr(scope fp9_t* c, scope const(fp9_t)* a, scope const(fp9_t)* b) @system @nogc nothrow pure;
extern (C) void fp18_mul_art(scope fp9_t* c, scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) void fp18_mul_dxs_basic(scope fp9_t* c, scope const(fp9_t)* a, scope const(fp9_t)* b) @system @nogc nothrow pure;
extern (C) void fp18_mul_dxs_lazyr(scope fp9_t* c, scope const(fp9_t)* a, scope const(fp9_t)* b) @system @nogc nothrow pure;
extern (C) void fp18_sqr_unr(scope dv9_t* c, scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) void fp18_sqr_basic(scope fp9_t* c, scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) void fp18_sqr_lazyr(scope fp9_t* c, scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) void fp18_sqr_cyc_basic(scope fp9_t* c, scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) void fp18_sqr_cyc_lazyr(scope fp9_t* c, scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) void fp18_sqr_pck_basic(scope fp9_t* c, scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) void fp18_sqr_pck_lazyr(scope fp9_t* c, scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) int fp18_test_cyc(scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) void fp18_conv_cyc(scope fp9_t* c, scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) void fp18_back_cyc(scope fp9_t* c, scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) void fp18_back_cyc_sim(scope fp18_t* c, scope const(fp18_t)* a, int n) @system @nogc nothrow pure;
extern (C) void fp18_inv(scope fp9_t* c, scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) void fp18_inv_cyc(scope fp9_t* c, scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) void fp18_frb(scope fp9_t* c, scope const(fp9_t)* a, int i) @system @nogc nothrow pure;
extern (C) void fp18_exp(scope fp9_t* c, scope const(fp9_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp18_exp_dig(scope fp9_t* c, scope const(fp9_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp18_exp_cyc(scope fp9_t* c, scope const(fp9_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp18_exp_cyc_gls(scope fp9_t* c, scope const(fp9_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp18_exp_cyc_sim(scope fp9_t* e, scope const(fp9_t)* a, scope const(bn_st)* b, scope const(
        fp9_t)* c, scope const(bn_st)* d) @system @nogc nothrow pure;
extern (C) void fp18_exp_cyc_sps(scope fp9_t* c, scope const(fp9_t)* a, scope const(int)* b, int l, int s) @system @nogc nothrow pure;
extern (C) void fp18_pck(scope fp9_t* c, scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) int fp18_upk(scope fp9_t* c, scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) void fp18_pck_max(scope fp9_t* c, scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) int fp18_upk_max(scope fp9_t* c, scope const(fp9_t)* a) @system @nogc nothrow pure;
extern (C) void fp24_copy(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp24_copy_sec(scope fp8_t* c, scope const(fp8_t)* a, ulong bit) @system @nogc nothrow pure;
extern (C) void fp24_zero(scope fp8_t* a) @system @nogc nothrow pure;
extern (C) int fp24_is_zero(scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp24_rand(scope fp8_t* a) @system @nogc nothrow pure;
extern (C) void fp24_print(scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) int fp24_size_bin(scope const(fp8_t)* a, int pack) @system @nogc nothrow pure;
extern (C) void fp24_read_bin(scope fp8_t* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void fp24_write_bin(scope ubyte* bin, size_t len, scope const(fp8_t)* a, int pack) @system @nogc nothrow pure;
extern (C) int fp24_cmp(scope const(fp8_t)* a, scope const(fp8_t)* b) @system @nogc nothrow pure;
extern (C) int fp24_cmp_dig(scope const(fp8_t)* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp24_set_dig(scope fp8_t* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp24_add(scope fp8_t* c, scope const(fp8_t)* a, scope const(fp8_t)* b) @system @nogc nothrow pure;
extern (C) void fp24_sub(scope fp8_t* c, scope const(fp8_t)* a, scope const(fp8_t)* b) @system @nogc nothrow pure;
extern (C) void fp24_neg(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp24_dbl(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp24_mul_unr(scope dv8_t* c, scope const(fp8_t)* a, scope const(fp8_t)* b) @system @nogc nothrow pure;
extern (C) void fp24_mul_basic(scope fp8_t* c, scope const(fp8_t)* a, scope const(fp8_t)* b) @system @nogc nothrow pure;
extern (C) void fp24_mul_lazyr(scope fp8_t* c, scope const(fp8_t)* a, scope const(fp8_t)* b) @system @nogc nothrow pure;
extern (C) void fp24_mul_art(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp24_mul_dxs(scope fp8_t* c, scope const(fp8_t)* a, scope const(fp8_t)* b) @system @nogc nothrow pure;
extern (C) void fp24_sqr_unr(scope dv8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp24_sqr_basic(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp24_sqr_lazyr(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp24_sqr_cyc_basic(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp24_sqr_cyc_lazyr(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp24_sqr_pck_basic(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp24_sqr_pck_lazyr(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) int fp24_test_cyc(scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp24_conv_cyc(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp24_back_cyc(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp24_back_cyc_sim(scope fp24_t* c, scope const(fp24_t)* a, int n) @system @nogc nothrow pure;
extern (C) void fp24_inv(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp24_inv_cyc(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp24_frb(scope fp8_t* c, scope const(fp8_t)* a, int i) @system @nogc nothrow pure;
extern (C) void fp24_exp(scope fp8_t* c, scope const(fp8_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp24_exp_dig(scope fp8_t* c, scope const(fp8_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp24_exp_cyc(scope fp8_t* c, scope const(fp8_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp24_exp_cyc_gls(scope fp8_t* c, scope const(fp8_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp24_exp_cyc_sim(scope fp8_t* e, scope const(fp8_t)* a, scope const(bn_st)* b, scope const(
        fp8_t)* c, scope const(bn_st)* d) @system @nogc nothrow pure;
extern (C) void fp24_exp_cyc_sps(scope fp8_t* c, scope const(fp8_t)* a, scope const(int)* b, size_t l, int s) @system @nogc nothrow pure;
extern (C) void fp24_pck(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) int fp24_upk(scope fp8_t* c, scope const(fp8_t)* a) @system @nogc nothrow pure;
extern (C) void fp48_copy(scope fp24_t* c, scope const(fp24_t)* a) @system @nogc nothrow pure;
extern (C) void fp48_copy_sec(scope fp24_t* c, scope const(fp24_t)* a, ulong bit) @system @nogc nothrow pure;
extern (C) void fp48_zero(scope fp24_t* a) @system @nogc nothrow pure;
extern (C) int fp48_is_zero(scope const(fp24_t)* a) @system @nogc nothrow pure;
extern (C) void fp48_rand(scope fp24_t* a) @system @nogc nothrow pure;
extern (C) void fp48_print(scope const(fp24_t)* a) @system @nogc nothrow pure;
extern (C) int fp48_size_bin(scope const(fp24_t)* a, int pack) @system @nogc nothrow pure;
extern (C) void fp48_read_bin(scope fp24_t* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void fp48_write_bin(scope ubyte* bin, size_t len, scope const(fp24_t)* a, int pack) @system @nogc nothrow pure;
extern (C) int fp48_cmp(scope const(fp24_t)* a, scope const(fp24_t)* b) @system @nogc nothrow pure;
extern (C) int fp48_cmp_dig(scope const(fp24_t)* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp48_set_dig(scope fp24_t* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp48_add(scope fp24_t* c, scope const(fp24_t)* a, scope const(fp24_t)* b) @system @nogc nothrow pure;
extern (C) void fp48_sub(scope fp24_t* c, scope const(fp24_t)* a, scope const(fp24_t)* b) @system @nogc nothrow pure;
extern (C) void fp48_neg(scope fp24_t* c, scope const(fp24_t)* a) @system @nogc nothrow pure;
extern (C) void fp48_dbl(scope fp24_t* c, scope const(fp24_t)* a) @system @nogc nothrow pure;
extern (C) void fp48_mul_basic(scope fp24_t* c, scope const(fp24_t)* a, scope const(fp24_t)* b) @system @nogc nothrow pure;
extern (C) void fp48_mul_lazyr(scope fp24_t* c, scope const(fp24_t)* a, scope const(fp24_t)* b) @system @nogc nothrow pure;
extern (C) void fp48_mul_art(scope fp24_t* c, scope const(fp24_t)* a) @system @nogc nothrow pure;
extern (C) void fp48_mul_dxs(scope fp24_t* c, scope const(fp24_t)* a, scope const(fp24_t)* b) @system @nogc nothrow pure;
extern (C) void fp48_sqr_basic(scope fp24_t* c, scope const(fp24_t)* a) @system @nogc nothrow pure;
extern (C) void fp48_sqr_lazyr(scope fp24_t* c, scope const(fp24_t)* a) @system @nogc nothrow pure;
extern (C) void fp48_sqr_cyc_basic(scope fp24_t* c, scope const(fp24_t)* a) @system @nogc nothrow pure;
extern (C) void fp48_sqr_cyc_lazyr(scope fp24_t* c, scope const(fp24_t)* a) @system @nogc nothrow pure;
extern (C) void fp48_sqr_pck_basic(scope fp24_t* c, scope const(fp24_t)* a) @system @nogc nothrow pure;
extern (C) void fp48_sqr_pck_lazyr(scope fp24_t* c, scope const(fp24_t)* a) @system @nogc nothrow pure;
extern (C) int fp48_test_cyc(scope const(fp24_t)* a) @system @nogc nothrow pure;
extern (C) void fp48_conv_cyc(scope fp24_t* c, scope const(fp24_t)* a) @system @nogc nothrow pure;
extern (C) void fp48_back_cyc(scope fp24_t* c, scope const(fp24_t)* a) @system @nogc nothrow pure;
extern (C) void fp48_back_cyc_sim(scope fp48_t* c, scope const(fp48_t)* a, int n) @system @nogc nothrow pure;
extern (C) void fp48_inv(scope fp24_t* c, scope const(fp24_t)* a) @system @nogc nothrow pure;
extern (C) void fp48_inv_cyc(scope fp24_t* c, scope const(fp24_t)* a) @system @nogc nothrow pure;
extern (C) void fp48_frb(scope fp24_t* c, scope const(fp24_t)* a, int i) @system @nogc nothrow pure;
extern (C) void fp48_exp(scope fp24_t* c, scope const(fp24_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp48_exp_dig(scope fp24_t* c, scope const(fp24_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp48_exp_cyc(scope fp24_t* c, scope const(fp24_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp48_exp_cyc_gls(scope fp24_t* c, scope const(fp24_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp48_exp_cyc_sps(scope fp24_t* c, scope const(fp24_t)* a, scope const(int)* b, size_t l, int s) @system @nogc nothrow pure;
extern (C) void fp48_exp_cyc_sim(scope fp24_t* e, scope const(fp24_t)* a, scope const(bn_st)* b, scope const(
        fp24_t)* c, scope const(bn_st)* d) @system @nogc nothrow pure;
extern (C) void fp48_pck(scope fp24_t* c, scope const(fp24_t)* a) @system @nogc nothrow pure;
extern (C) int fp48_upk(scope fp24_t* c, scope const(fp24_t)* a) @system @nogc nothrow pure;
extern (C) void fp54_copy(scope fp18_t* c, scope const(fp18_t)* a) @system @nogc nothrow pure;
extern (C) void fp54_copy_sec(scope fp18_t* c, scope const(fp18_t)* a, ulong bit) @system @nogc nothrow pure;
extern (C) void fp54_zero(scope fp18_t* a) @system @nogc nothrow pure;
extern (C) int fp54_is_zero(scope const(fp18_t)* a) @system @nogc nothrow pure;
extern (C) void fp54_rand(scope fp18_t* a) @system @nogc nothrow pure;
extern (C) void fp54_print(scope const(fp18_t)* a) @system @nogc nothrow pure;
extern (C) int fp54_size_bin(scope const(fp18_t)* a, int pack) @system @nogc nothrow pure;
extern (C) void fp54_read_bin(scope fp18_t* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void fp54_write_bin(scope ubyte* bin, size_t len, scope const(fp18_t)* a, int pack) @system @nogc nothrow pure;
extern (C) int fp54_cmp(scope const(fp18_t)* a, scope const(fp18_t)* b) @system @nogc nothrow pure;
extern (C) int fp54_cmp_dig(scope const(fp18_t)* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp54_set_dig(scope fp18_t* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void fp54_add(scope fp18_t* c, scope const(fp18_t)* a, scope const(fp18_t)* b) @system @nogc nothrow pure;
extern (C) void fp54_sub(scope fp18_t* c, scope const(fp18_t)* a, scope const(fp18_t)* b) @system @nogc nothrow pure;
extern (C) void fp54_neg(scope fp18_t* c, scope const(fp18_t)* a) @system @nogc nothrow pure;
extern (C) void fp54_dbl(scope fp18_t* c, scope const(fp18_t)* a) @system @nogc nothrow pure;
extern (C) void fp54_mul_basic(scope fp18_t* c, scope const(fp18_t)* a, scope const(fp18_t)* b) @system @nogc nothrow pure;
extern (C) void fp54_mul_lazyr(scope fp18_t* c, scope const(fp18_t)* a, scope const(fp18_t)* b) @system @nogc nothrow pure;
extern (C) void fp54_mul_art(scope fp18_t* c, scope const(fp18_t)* a) @system @nogc nothrow pure;
extern (C) void fp54_mul_dxs(scope fp18_t* c, scope const(fp18_t)* a, scope const(fp18_t)* b) @system @nogc nothrow pure;
extern (C) void fp54_sqr_basic(scope fp18_t* c, scope const(fp18_t)* a) @system @nogc nothrow pure;
extern (C) void fp54_sqr_lazyr(scope fp18_t* c, scope const(fp18_t)* a) @system @nogc nothrow pure;
extern (C) void fp54_sqr_cyc_basic(scope fp18_t* c, scope const(fp18_t)* a) @system @nogc nothrow pure;
extern (C) void fp54_sqr_cyc_lazyr(scope fp18_t* c, scope const(fp18_t)* a) @system @nogc nothrow pure;
extern (C) void fp54_sqr_pck_basic(scope fp18_t* c, scope const(fp18_t)* a) @system @nogc nothrow pure;
extern (C) void fp54_sqr_pck_lazyr(scope fp18_t* c, scope const(fp18_t)* a) @system @nogc nothrow pure;
extern (C) int fp54_test_cyc(scope const(fp18_t)* a) @system @nogc nothrow pure;
extern (C) void fp54_conv_cyc(scope fp18_t* c, scope const(fp18_t)* a) @system @nogc nothrow pure;
extern (C) void fp54_back_cyc(scope fp18_t* c, scope const(fp18_t)* a) @system @nogc nothrow pure;
extern (C) void fp54_back_cyc_sim(scope fp54_t* c, scope const(fp54_t)* a, int n) @system @nogc nothrow pure;
extern (C) void fp54_inv(scope fp18_t* c, scope const(fp18_t)* a) @system @nogc nothrow pure;
extern (C) void fp54_inv_cyc(scope fp18_t* c, scope const(fp18_t)* a) @system @nogc nothrow pure;
extern (C) void fp54_frb(scope fp18_t* c, scope const(fp18_t)* a, int i) @system @nogc nothrow pure;
extern (C) void fp54_exp(scope fp18_t* c, scope const(fp18_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp54_exp_dig(scope fp18_t* c, scope const(fp18_t)* a, ulong b) @system @nogc nothrow pure;
extern (C) void fp54_exp_cyc(scope fp18_t* c, scope const(fp18_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void fp54_exp_cyc_sps(scope fp18_t* c, scope const(fp18_t)* a, scope const(int)* b, size_t l, int s) @system @nogc nothrow pure;
extern (C) void fp54_pck(scope fp18_t* c, scope const(fp18_t)* a) @system @nogc nothrow pure;
extern (C) int fp54_upk(scope fp18_t* c, scope const(fp18_t)* a) @system @nogc nothrow pure;
extern (C) void ep_curve_init() @system @nogc nothrow pure;
extern (C) void ep_curve_clean() @system @nogc nothrow pure;
extern (C) dig_t* ep_curve_get_a() @system @nogc nothrow pure;
extern (C) dig_t* ep_curve_get_b() @system @nogc nothrow pure;
extern (C) dig_t* ep_curve_get_b3() @system @nogc nothrow pure;
extern (C) dig_t* ep_curve_get_beta() @system @nogc nothrow pure;
extern (C) const(bn_st)* ep_curve_get_v1() @system @nogc nothrow pure;
extern (C) const(bn_st)* ep_curve_get_v2() @system @nogc nothrow pure;
extern (C) int ep_curve_opt_a() @system @nogc nothrow pure;
extern (C) int ep_curve_opt_b() @system @nogc nothrow pure;
extern (C) void ep_curve_mul_a(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) void ep_curve_mul_b(scope dig_t* c, scope const(dig_t)* a) @system @nogc nothrow pure;
extern (C) int ep_curve_is_endom() @system @nogc nothrow pure;
extern (C) int ep_curve_is_super() @system @nogc nothrow pure;
extern (C) int ep_curve_is_pairf() @system @nogc nothrow pure;
extern (C) int ep_curve_is_ctmap() @system @nogc nothrow pure;
extern (C) void ep_curve_get_gen(scope ep_st* g) @system @nogc nothrow pure;
extern (C) const(ep_t)* ep_curve_get_tab() @system @nogc nothrow pure;
extern (C) void ep_curve_get_ord(scope bn_st* n) @system @nogc nothrow pure;
extern (C) void ep_curve_get_cof(scope bn_st* h) @system @nogc nothrow pure;
extern (C) iso_t* ep_curve_get_iso() @system @nogc nothrow pure;
extern (C) void ep_curve_set_plain(scope const(dig_t)* a, scope const(dig_t)* b, scope const(ep_st)* g, scope const(
        bn_st)* r, scope const(bn_st)* h, int ctmap) @system @nogc nothrow pure;
extern (C) void ep_curve_set_super(scope const(dig_t)* a, scope const(dig_t)* b, scope const(ep_st)* g, scope const(
        bn_st)* r, scope const(bn_st)* h, int ctmap) @system @nogc nothrow pure;
extern (C) void ep_curve_set_endom(scope const(dig_t)* a, scope const(dig_t)* b, scope const(ep_st)* g, scope const(
        bn_st)* r, scope const(bn_st)* h, scope const(dig_t)* beta, scope const(bn_st)* l, int ctmap) @system @nogc nothrow pure;
extern (C) int ep_curve_embed() @system @nogc nothrow pure;
extern (C) int ep_curve_frdim() @system @nogc nothrow pure;
extern (C) void ep_param_set(int param) @system @nogc nothrow pure;
extern (C) int ep_param_set_any() @system @nogc nothrow pure;
extern (C) int ep_param_set_any_plain() @system @nogc nothrow pure;
extern (C) int ep_param_set_any_endom() @system @nogc nothrow pure;
extern (C) int ep_param_set_any_super() @system @nogc nothrow pure;
extern (C) int ep_param_set_any_pairf() @system @nogc nothrow pure;
extern (C) int ep_param_get() @system @nogc nothrow pure;
extern (C) void ep_param_print() @system @nogc nothrow pure;
extern (C) int ep_param_level() @system @nogc nothrow pure;
extern (C) int ep_is_infty(scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void ep_set_infty(scope ep_st* p) @system @nogc nothrow pure;
extern (C) void ep_copy(scope ep_st* r, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) int ep_cmp(scope const(ep_st)* p, scope const(ep_st)* q) @system @nogc nothrow pure;
extern (C) void ep_rand(scope ep_st* p) @system @nogc nothrow pure;
extern (C) void ep_blind(scope ep_st* r, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void ep_rhs(scope dig_t* rhs, scope const(dig_t)* x) @system @nogc nothrow pure;
extern (C) int ep_on_curve(scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void ep_tab(scope ep_t* t, scope const(ep_st)* p, int w) @system @nogc nothrow pure;
extern (C) void ep_print(scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) size_t ep_size_bin(scope const(ep_st)* a, int pack) @system @nogc nothrow pure;
extern (C) void ep_read_bin(scope ep_st* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void ep_write_bin(scope ubyte* bin, size_t len, scope const(ep_st)* a, int pack) @system @nogc nothrow pure;
extern (C) void ep_neg(scope ep_st* r, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void ep_add_basic(scope ep_st* r, scope const(ep_st)* p, scope const(ep_st)* q) @system @nogc nothrow pure;
extern (C) void ep_add_slp_basic(scope ep_st* r, scope dig_t* s, scope const(ep_st)* p, scope const(
        ep_st)* q) @system @nogc nothrow pure;
extern (C) void ep_add_projc(scope ep_st* r, scope const(ep_st)* p, scope const(ep_st)* q) @system @nogc nothrow pure;
extern (C) void ep_add_jacob(scope ep_st* r, scope const(ep_st)* p, scope const(ep_st)* q) @system @nogc nothrow pure;
extern (C) void ep_sub(scope ep_st* r, scope const(ep_st)* p, scope const(ep_st)* q) @system @nogc nothrow pure;
extern (C) void ep_dbl_basic(scope ep_st* r, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void ep_dbl_slp_basic(scope ep_st* r, scope dig_t* s, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void ep_dbl_projc(scope ep_st* r, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void ep_dbl_jacob(scope ep_st* r, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void ep_psi(scope ep_st* r, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void ep_mul_basic(scope ep_st* r, scope const(ep_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep_mul_slide(scope ep_st* r, scope const(ep_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep_mul_monty(scope ep_st* r, scope const(ep_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep_mul_lwnaf(scope ep_st* r, scope const(ep_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep_mul_lwreg(scope ep_st* r, scope const(ep_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep_mul_gen(scope ep_st* r, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep_mul_dig(scope ep_st* r, scope const(ep_st)* p, ulong k) @system @nogc nothrow pure;
extern (C) void ep_mul_cof(scope ep_st* r, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void ep_mul_pre_basic(scope ep_t* t, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void ep_mul_pre_yaowi(scope ep_t* t, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void ep_mul_pre_nafwi(scope ep_t* t, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void ep_mul_pre_combs(scope ep_t* t, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void ep_mul_pre_combd(scope ep_t* t, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void ep_mul_pre_lwnaf(scope ep_t* t, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void ep_mul_fix_basic(scope ep_st* r, scope const(ep_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep_mul_fix_yaowi(scope ep_st* r, scope const(ep_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep_mul_fix_nafwi(scope ep_st* r, scope const(ep_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep_mul_fix_combs(scope ep_st* r, scope const(ep_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep_mul_fix_combd(scope ep_st* r, scope const(ep_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep_mul_fix_lwnaf(scope ep_st* r, scope const(ep_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep_mul_sim_basic(scope ep_st* r, scope const(ep_st)* p, scope const(bn_st)* k, scope const(
        ep_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep_mul_sim_trick(scope ep_st* r, scope const(ep_st)* p, scope const(bn_st)* k, scope const(
        ep_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep_mul_sim_inter(scope ep_st* r, scope const(ep_st)* p, scope const(bn_st)* k, scope const(
        ep_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep_mul_sim_joint(scope ep_st* r, scope const(ep_st)* p, scope const(bn_st)* k, scope const(
        ep_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep_mul_sim_lot(scope ep_st* r, scope const(ep_t)* p, scope const(bn_t)* k, int n) @system @nogc nothrow pure;
extern (C) void ep_mul_sim_gen(scope ep_st* r, scope const(bn_st)* k, scope const(ep_st)* q, scope const(
        bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep_mul_sim_dig(scope ep_st* r, scope const(ep_t)* p, scope const(dig_t)* k, int n) @system @nogc nothrow pure;
extern (C) void ep_norm(scope ep_st* r, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void ep_norm_sim(scope ep_t* r, scope const(ep_t)* t, int n) @system @nogc nothrow pure;
extern (C) void ep_map_basic(scope ep_st* p, scope const(ubyte)* msg, size_t len) @system @nogc nothrow pure;
extern (C) void ep_map_sswum(scope ep_st* p, scope const(ubyte)* msg, size_t len) @system @nogc nothrow pure;
extern (C) void ep_map_swift(scope ep_st* p, scope const(ubyte)* msg, size_t len) @system @nogc nothrow pure;
extern (C) size_t ep_map_rnd_size() @system @nogc nothrow pure;
extern (C) void ep_map_rnd(scope ep_st* p, scope const(ubyte)* uniform_bytes, size_t len) @system @nogc nothrow pure;
extern (C) void ep_pck(scope ep_st* r, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) int ep_upk(scope ep_st* r, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void ep2_curve_init() @system @nogc nothrow pure;
extern (C) void ep2_curve_clean() @system @nogc nothrow pure;
extern (C) fp_t* ep2_curve_get_a() @system @nogc nothrow pure;
extern (C) fp_t* ep2_curve_get_b() @system @nogc nothrow pure;
extern (C) int ep2_curve_opt_a() @system @nogc nothrow pure;
extern (C) int ep2_curve_opt_b() @system @nogc nothrow pure;
extern (C) void ep2_curve_mul_a(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void ep2_curve_mul_b(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) int ep2_curve_is_twist() @system @nogc nothrow pure;
extern (C) int ep2_curve_is_ctmap() @system @nogc nothrow pure;
extern (C) void ep2_curve_get_gen(scope ep2_st* g) @system @nogc nothrow pure;
extern (C) ep2_t* ep2_curve_get_tab() @system @nogc nothrow pure;
extern (C) void ep2_curve_get_ord(scope bn_st* n) @system @nogc nothrow pure;
extern (C) void ep2_curve_get_cof(scope bn_st* h) @system @nogc nothrow pure;
extern (C) iso2_t* ep2_curve_get_iso() @system @nogc nothrow pure;
extern (C) void ep2_curve_set(scope const(fp_t)* a, scope const(fp_t)* b, scope const(ep2_st)* g, scope const(
        bn_st)* r, scope const(bn_st)* h) @system @nogc nothrow pure;
extern (C) void ep2_curve_set_twist(int type) @system @nogc nothrow pure;
extern (C) int ep2_is_infty(scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) void ep2_set_infty(scope ep2_st* p) @system @nogc nothrow pure;
extern (C) void ep2_copy(scope ep2_st* r, scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) int ep2_cmp(scope const(ep2_st)* p, scope const(ep2_st)* q) @system @nogc nothrow pure;
extern (C) void ep2_rand(scope ep2_st* p) @system @nogc nothrow pure;
extern (C) void ep2_blind(scope ep2_st* r, scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) void ep2_rhs(scope fp_t* rhs, scope const(fp_t)* x) @system @nogc nothrow pure;
extern (C) int ep2_on_curve(scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) void ep2_tab(scope ep2_t* t, scope const(ep2_st)* p, int w) @system @nogc nothrow pure;
extern (C) void ep2_print(scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) size_t ep2_size_bin(scope const(ep2_st)* a, int pack) @system @nogc nothrow pure;
extern (C) void ep2_read_bin(scope ep2_st* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void ep2_write_bin(scope ubyte* bin, size_t len, scope const(ep2_st)* a, int pack) @system @nogc nothrow pure;
extern (C) void ep2_neg(scope ep2_st* r, scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) void ep2_add_basic(scope ep2_st* r, scope const(ep2_st)* p, scope const(ep2_st)* q) @system @nogc nothrow pure;
extern (C) void ep2_add_slp_basic(scope ep2_st* r, scope fp_t* s, scope const(ep2_st)* p, scope const(
        ep2_st)* q) @system @nogc nothrow pure;
extern (C) void ep2_add_projc(scope ep2_st* r, scope const(ep2_st)* p, scope const(ep2_st)* q) @system @nogc nothrow pure;
extern (C) void ep2_add_jacob(scope ep2_st* r, scope const(ep2_st)* p, scope const(ep2_st)* q) @system @nogc nothrow pure;
extern (C) void ep2_sub(scope ep2_st* r, scope const(ep2_st)* p, scope const(ep2_st)* q) @system @nogc nothrow pure;
extern (C) void ep2_dbl_basic(scope ep2_st* r, scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) void ep2_dbl_slp_basic(scope ep2_st* r, scope fp_t* s, scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) void ep2_dbl_projc(scope ep2_st* r, scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) void ep2_dbl_jacob(scope ep2_st* r, scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) void ep2_mul_basic(scope ep2_st* r, scope const(ep2_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep2_mul_slide(scope ep2_st* r, scope const(ep2_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep2_mul_monty(scope ep2_st* r, scope const(ep2_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep2_mul_lwnaf(scope ep2_st* r, scope const(ep2_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep2_mul_lwreg(scope ep2_st* r, scope const(ep2_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep2_mul_gen(scope ep2_st* r, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep2_mul_dig(scope ep2_st* r, scope const(ep2_st)* p, const(ulong) k) @system @nogc nothrow pure;
extern (C) void ep2_mul_cof(scope ep2_st* r, scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) void ep2_mul_pre_basic(scope ep2_t* t, scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) void ep2_mul_pre_yaowi(scope ep2_t* t, scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) void ep2_mul_pre_nafwi(scope ep2_t* t, scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) void ep2_mul_pre_combs(scope ep2_t* t, scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) void ep2_mul_pre_combd(scope ep2_t* t, scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) void ep2_mul_pre_lwnaf(scope ep2_t* t, scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) void ep2_mul_fix_basic(scope ep2_st* r, scope const(ep2_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep2_mul_fix_yaowi(scope ep2_st* r, scope const(ep2_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep2_mul_fix_nafwi(scope ep2_st* r, scope const(ep2_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep2_mul_fix_combs(scope ep2_st* r, scope const(ep2_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep2_mul_fix_combd(scope ep2_st* r, scope const(ep2_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep2_mul_fix_lwnaf(scope ep2_st* r, scope const(ep2_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep2_mul_sim_basic(scope ep2_st* r, scope const(ep2_st)* p, scope const(bn_st)* k, scope const(
        ep2_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep2_mul_sim_trick(scope ep2_st* r, scope const(ep2_st)* p, scope const(bn_st)* k, scope const(
        ep2_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep2_mul_sim_inter(scope ep2_st* r, scope const(ep2_st)* p, scope const(bn_st)* k, scope const(
        ep2_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep2_mul_sim_joint(scope ep2_st* r, scope const(ep2_st)* p, scope const(bn_st)* k, scope const(
        ep2_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep2_mul_sim_lot(scope ep2_st* r, scope const(ep2_t)* p, scope const(bn_t)* k, size_t n) @system @nogc nothrow pure;
extern (C) void ep2_mul_sim_gen(scope ep2_st* r, scope const(bn_st)* k, scope const(ep2_st)* q, scope const(
        bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep2_mul_sim_dig(scope ep2_st* r, scope const(ep2_t)* p, scope const(dig_t)* k, size_t len) @system @nogc nothrow pure;
extern (C) void ep2_norm(scope ep2_st* r, scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) void ep2_norm_sim(scope ep2_t* r, scope const(ep2_t)* t, int n) @system @nogc nothrow pure;
extern (C) void ep2_map_basic(scope ep2_st* p, scope const(ubyte)* msg, size_t len) @system @nogc nothrow pure;
extern (C) void ep2_map_sswum(scope ep2_st* p, scope const(ubyte)* msg, size_t len) @system @nogc nothrow pure;
extern (C) void ep2_map_swift(scope ep2_st* p, scope const(ubyte)* msg, size_t len) @system @nogc nothrow pure;
extern (C) void ep2_frb(scope ep2_st* r, scope const(ep2_st)* p, int i) @system @nogc nothrow pure;
extern (C) void ep2_pck(scope ep2_st* r, scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) int ep2_upk(scope ep2_st* r, scope const(ep2_st)* p) @system @nogc nothrow pure;
extern (C) void ep3_curve_init() @system @nogc nothrow pure;
extern (C) void ep3_curve_clean() @system @nogc nothrow pure;
extern (C) fp_t* ep3_curve_get_a() @system @nogc nothrow pure;
extern (C) fp_t* ep3_curve_get_b() @system @nogc nothrow pure;
extern (C) int ep3_curve_opt_a() @system @nogc nothrow pure;
extern (C) int ep3_curve_opt_b() @system @nogc nothrow pure;
extern (C) void ep3_curve_mul_a(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) void ep3_curve_mul_b(scope fp_t* c, scope const(fp_t)* a) @system @nogc nothrow pure;
extern (C) int ep3_curve_is_twist() @system @nogc nothrow pure;
extern (C) void ep3_curve_get_gen(scope ep3_st* g) @system @nogc nothrow pure;
extern (C) ep3_t* ep3_curve_get_tab() @system @nogc nothrow pure;
extern (C) void ep3_curve_get_ord(scope bn_st* n) @system @nogc nothrow pure;
extern (C) void ep3_curve_get_cof(scope bn_st* h) @system @nogc nothrow pure;
extern (C) void ep3_curve_set(scope const(fp_t)* a, scope const(fp_t)* b, scope const(ep3_st)* g, scope const(
        bn_st)* r, scope const(bn_st)* h) @system @nogc nothrow pure;
extern (C) void ep3_curve_set_twist(int type) @system @nogc nothrow pure;
extern (C) int ep3_is_infty(scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) void ep3_set_infty(scope ep3_st* p) @system @nogc nothrow pure;
extern (C) void ep3_copy(scope ep3_st* r, scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) int ep3_cmp(scope const(ep3_st)* p, scope const(ep3_st)* q) @system @nogc nothrow pure;
extern (C) void ep3_rand(scope ep3_st* p) @system @nogc nothrow pure;
extern (C) void ep3_blind(scope ep3_st* r, scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) void ep3_rhs(scope fp_t* rhs, scope const(fp_t)* x) @system @nogc nothrow pure;
extern (C) int ep3_on_curve(scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) void ep3_tab(scope ep3_t* t, scope const(ep3_st)* p, int w) @system @nogc nothrow pure;
extern (C) void ep3_print(scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) size_t ep3_size_bin(scope const(ep3_st)* a, int pack) @system @nogc nothrow pure;
extern (C) void ep3_read_bin(scope ep3_st* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void ep3_write_bin(scope ubyte* bin, size_t len, scope const(ep3_st)* a, int pack) @system @nogc nothrow pure;
extern (C) void ep3_neg(scope ep3_st* r, scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) void ep3_add_basic(scope ep3_st* r, scope const(ep3_st)* p, scope const(ep3_st)* q) @system @nogc nothrow pure;
extern (C) void ep3_add_slp_basic(scope ep3_st* r, scope fp_t* s, scope const(ep3_st)* p, scope const(
        ep3_st)* q) @system @nogc nothrow pure;
extern (C) void ep3_add_projc(scope ep3_st* r, scope const(ep3_st)* p, scope const(ep3_st)* q) @system @nogc nothrow pure;
extern (C) void ep3_add_jacob(scope ep3_st* r, scope const(ep3_st)* p, scope const(ep3_st)* q) @system @nogc nothrow pure;
extern (C) void ep3_sub(scope ep3_st* r, scope const(ep3_st)* p, scope const(ep3_st)* q) @system @nogc nothrow pure;
extern (C) void ep3_dbl_basic(scope ep3_st* r, scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) void ep3_dbl_slp_basic(scope ep3_st* r, scope fp_t* s, scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) void ep3_dbl_projc(scope ep3_st* r, scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) void ep3_dbl_jacob(scope ep3_st* r, scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) void ep3_mul_basic(scope ep3_st* r, scope const(ep3_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep3_mul_slide(scope ep3_st* r, scope const(ep3_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep3_mul_monty(scope ep3_st* r, scope const(ep3_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep3_mul_lwnaf(scope ep3_st* r, scope const(ep3_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep3_mul_lwreg(scope ep3_st* r, scope const(ep3_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep3_mul_gen(scope ep3_st* r, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep3_mul_dig(scope ep3_st* r, scope const(ep3_st)* p, const(ulong) k) @system @nogc nothrow pure;
extern (C) void ep3_mul_cof(scope ep3_st* r, scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) void ep3_mul_pre_basic(scope ep3_t* t, scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) void ep3_mul_pre_yaowi(scope ep3_t* t, scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) void ep3_mul_pre_nafwi(scope ep3_t* t, scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) void ep3_mul_pre_combs(scope ep3_t* t, scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) void ep3_mul_pre_combd(scope ep3_t* t, scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) void ep3_mul_pre_lwnaf(scope ep3_t* t, scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) void ep3_mul_fix_basic(scope ep3_st* r, scope const(ep3_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep3_mul_fix_yaowi(scope ep3_st* r, scope const(ep3_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep3_mul_fix_nafwi(scope ep3_st* r, scope const(ep3_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep3_mul_fix_combs(scope ep3_st* r, scope const(ep3_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep3_mul_fix_combd(scope ep3_st* r, scope const(ep3_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep3_mul_fix_lwnaf(scope ep3_st* r, scope const(ep3_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep3_mul_sim_basic(scope ep3_st* r, scope const(ep3_st)* p, scope const(bn_st)* k, scope const(
        ep3_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep3_mul_sim_trick(scope ep3_st* r, scope const(ep3_st)* p, scope const(bn_st)* k, scope const(
        ep3_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep3_mul_sim_inter(scope ep3_st* r, scope const(ep3_st)* p, scope const(bn_st)* k, scope const(
        ep3_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep3_mul_sim_joint(scope ep3_st* r, scope const(ep3_st)* p, scope const(bn_st)* k, scope const(
        ep3_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep3_mul_sim_lot(scope ep3_st* r, scope const(ep3_t)* p, scope const(bn_t)* k, int n) @system @nogc nothrow pure;
extern (C) void ep3_mul_sim_gen(scope ep3_st* r, scope const(bn_st)* k, scope const(ep3_st)* q, scope const(
        bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep3_mul_sim_dig(scope ep3_st* r, scope const(ep3_t)* p, scope const(dig_t)* k, size_t len) @system @nogc nothrow pure;
extern (C) void ep3_norm(scope ep3_st* r, scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) void ep3_norm_sim(scope ep3_t* r, scope const(ep3_t)* t, int n) @system @nogc nothrow pure;
extern (C) void ep3_map(scope ep3_st* p, scope const(ubyte)* msg, size_t len) @system @nogc nothrow pure;
extern (C) void ep3_frb(scope ep3_st* r, scope const(ep3_st)* p, int i) @system @nogc nothrow pure;
extern (C) void ep3_pck(scope ep3_st* r, scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) int ep3_upk(scope ep3_st* r, scope const(ep3_st)* p) @system @nogc nothrow pure;
extern (C) void ep4_curve_init() @system @nogc nothrow pure;
extern (C) void ep4_curve_clean() @system @nogc nothrow pure;
extern (C) fp2_t* ep4_curve_get_a() @system @nogc nothrow pure;
extern (C) fp2_t* ep4_curve_get_b() @system @nogc nothrow pure;
extern (C) int ep4_curve_opt_a() @system @nogc nothrow pure;
extern (C) int ep4_curve_opt_b() @system @nogc nothrow pure;
extern (C) void ep4_curve_mul_a(scope fp2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) void ep4_curve_mul_b(scope fp2_t* c, scope const(fp2_t)* a) @system @nogc nothrow pure;
extern (C) int ep4_curve_is_twist() @system @nogc nothrow pure;
extern (C) void ep4_curve_get_gen(scope ep4_st* g) @system @nogc nothrow pure;
extern (C) ep4_t* ep4_curve_get_tab() @system @nogc nothrow pure;
extern (C) void ep4_curve_get_ord(scope bn_st* n) @system @nogc nothrow pure;
extern (C) void ep4_curve_get_cof(scope bn_st* h) @system @nogc nothrow pure;
extern (C) void ep4_curve_set(scope const(fp2_t)* a, scope const(fp2_t)* b, scope const(ep4_st)* g, scope const(
        bn_st)* r, scope const(bn_st)* h) @system @nogc nothrow pure;
extern (C) void ep4_curve_set_twist(int type) @system @nogc nothrow pure;
extern (C) int ep4_is_infty(scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) void ep4_set_infty(scope ep4_st* p) @system @nogc nothrow pure;
extern (C) void ep4_copy(scope ep4_st* r, scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) int ep4_cmp(scope const(ep4_st)* p, scope const(ep4_st)* q) @system @nogc nothrow pure;
extern (C) void ep4_rand(scope ep4_st* p) @system @nogc nothrow pure;
extern (C) void ep4_blind(scope ep4_st* r, scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) void ep4_rhs(scope fp2_t* rhs, scope const(fp2_t)* x) @system @nogc nothrow pure;
extern (C) int ep4_on_curve(scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) void ep4_tab(scope ep4_t* t, scope const(ep4_st)* p, int w) @system @nogc nothrow pure;
extern (C) void ep4_print(scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) size_t ep4_size_bin(scope const(ep4_st)* a, int pack) @system @nogc nothrow pure;
extern (C) void ep4_read_bin(scope ep4_st* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void ep4_write_bin(scope ubyte* bin, size_t len, scope const(ep4_st)* a, int pack) @system @nogc nothrow pure;
extern (C) void ep4_neg(scope ep4_st* r, scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) void ep4_add_basic(scope ep4_st* r, scope const(ep4_st)* p, scope const(ep4_st)* q) @system @nogc nothrow pure;
extern (C) void ep4_add_slp_basic(scope ep4_st* r, scope fp2_t* s, scope const(ep4_st)* p, scope const(
        ep4_st)* q) @system @nogc nothrow pure;
extern (C) void ep4_add_projc(scope ep4_st* r, scope const(ep4_st)* p, scope const(ep4_st)* q) @system @nogc nothrow pure;
extern (C) void ep4_add_jacob(scope ep4_st* r, scope const(ep4_st)* p, scope const(ep4_st)* q) @system @nogc nothrow pure;
extern (C) void ep4_sub(scope ep4_st* r, scope const(ep4_st)* p, scope const(ep4_st)* q) @system @nogc nothrow pure;
extern (C) void ep4_dbl_basic(scope ep4_st* r, scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) void ep4_dbl_slp_basic(scope ep4_st* r, scope fp2_t* s, scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) void ep4_dbl_projc(scope ep4_st* r, scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) void ep4_dbl_jacob(scope ep4_st* r, scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) void ep4_mul_basic(scope ep4_st* r, scope const(ep4_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep4_mul_slide(scope ep4_st* r, scope const(ep4_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep4_mul_monty(scope ep4_st* r, scope const(ep4_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep4_mul_lwnaf(scope ep4_st* r, scope const(ep4_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep4_mul_lwreg(scope ep4_st* r, scope const(ep4_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep4_mul_gen(scope ep4_st* r, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep4_mul_dig(scope ep4_st* r, scope const(ep4_st)* p, const(ulong) k) @system @nogc nothrow pure;
extern (C) void ep4_mul_cof(scope ep4_st* r, scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) void ep4_mul_pre_basic(scope ep4_t* t, scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) void ep4_mul_pre_yaowi(scope ep4_t* t, scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) void ep4_mul_pre_nafwi(scope ep4_t* t, scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) void ep4_mul_pre_combs(scope ep4_t* t, scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) void ep4_mul_pre_combd(scope ep4_t* t, scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) void ep4_mul_pre_lwnaf(scope ep4_t* t, scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) void ep4_mul_fix_basic(scope ep4_st* r, scope const(ep4_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep4_mul_fix_yaowi(scope ep4_st* r, scope const(ep4_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep4_mul_fix_nafwi(scope ep4_st* r, scope const(ep4_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep4_mul_fix_combs(scope ep4_st* r, scope const(ep4_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep4_mul_fix_combd(scope ep4_st* r, scope const(ep4_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep4_mul_fix_lwnaf(scope ep4_st* r, scope const(ep4_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep4_mul_sim_basic(scope ep4_st* r, scope const(ep4_st)* p, scope const(bn_st)* k, scope const(
        ep4_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep4_mul_sim_trick(scope ep4_st* r, scope const(ep4_st)* p, scope const(bn_st)* k, scope const(
        ep4_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep4_mul_sim_inter(scope ep4_st* r, scope const(ep4_st)* p, scope const(bn_st)* k, scope const(
        ep4_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep4_mul_sim_joint(scope ep4_st* r, scope const(ep4_st)* p, scope const(bn_st)* k, scope const(
        ep4_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep4_mul_sim_lot(scope ep4_st* r, scope const(ep4_t)* p, scope const(bn_t)* k, size_t n) @system @nogc nothrow pure;
extern (C) void ep4_mul_sim_gen(scope ep4_st* r, scope const(bn_st)* k, scope const(ep4_st)* q, scope const(
        bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep4_mul_sim_dig(scope ep4_st* r, scope const(ep4_t)* p, scope const(dig_t)* k, size_t len) @system @nogc nothrow pure;
extern (C) void ep4_norm(scope ep4_st* r, scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) void ep4_norm_sim(scope ep4_t* r, scope const(ep4_t)* t, int n) @system @nogc nothrow pure;
extern (C) void ep4_map(scope ep4_st* p, scope const(ubyte)* msg, size_t len) @system @nogc nothrow pure;
extern (C) void ep4_frb(scope ep4_st* r, scope const(ep4_st)* p, int i) @system @nogc nothrow pure;
extern (C) void ep4_pck(scope ep4_st* r, scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) int ep4_upk(scope ep4_st* r, scope const(ep4_st)* p) @system @nogc nothrow pure;
extern (C) void ep8_curve_init() @system @nogc nothrow pure;
extern (C) void ep8_curve_clean() @system @nogc nothrow pure;
extern (C) fp4_t* ep8_curve_get_a() @system @nogc nothrow pure;
extern (C) fp4_t* ep8_curve_get_b() @system @nogc nothrow pure;
extern (C) int ep8_curve_opt_a() @system @nogc nothrow pure;
extern (C) int ep8_curve_opt_b() @system @nogc nothrow pure;
extern (C) void ep8_curve_mul_a(scope fp4_t* c, scope const(fp4_t)* a) @system @nogc nothrow pure;
extern (C) void ep8_curve_mul_b(scope fp4_t* c, scope const(fp4_t)* a) @system @nogc nothrow pure;
extern (C) int ep8_curve_is_twist() @system @nogc nothrow pure;
extern (C) void ep8_curve_get_gen(scope ep8_st* g) @system @nogc nothrow pure;
extern (C) ep8_t* ep8_curve_get_tab() @system @nogc nothrow pure;
extern (C) void ep8_curve_get_ord(scope bn_st* n) @system @nogc nothrow pure;
extern (C) void ep8_curve_get_cof(scope bn_st* h) @system @nogc nothrow pure;
extern (C) void ep8_curve_set(scope const(fp4_t)* a, scope const(fp4_t)* b, scope const(ep8_st)* g, scope const(
        bn_st)* r, scope const(bn_st)* h) @system @nogc nothrow pure;
extern (C) void ep8_curve_set_twist(int type) @system @nogc nothrow pure;
extern (C) int ep8_is_infty(scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) void ep8_set_infty(scope ep8_st* p) @system @nogc nothrow pure;
extern (C) void ep8_copy(scope ep8_st* r, scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) int ep8_cmp(scope const(ep8_st)* p, scope const(ep8_st)* q) @system @nogc nothrow pure;
extern (C) void ep8_rand(scope ep8_st* p) @system @nogc nothrow pure;
extern (C) void ep8_blind(scope ep8_st* r, scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) void ep8_rhs(scope fp4_t* rhs, scope const(fp4_t)* x) @system @nogc nothrow pure;
extern (C) int ep8_on_curve(scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) void ep8_tab(scope ep8_t* t, scope const(ep8_st)* p, int w) @system @nogc nothrow pure;
extern (C) void ep8_print(scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) size_t ep8_size_bin(scope const(ep8_st)* a, int pack) @system @nogc nothrow pure;
extern (C) void ep8_read_bin(scope ep8_st* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void ep8_write_bin(scope ubyte* bin, size_t len, scope const(ep8_st)* a, int pack) @system @nogc nothrow pure;
extern (C) void ep8_neg(scope ep8_st* r, scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) void ep8_add_basic(scope ep8_st* r, scope const(ep8_st)* p, scope const(ep8_st)* q) @system @nogc nothrow pure;
extern (C) void ep8_add_slp_basic(scope ep8_st* r, scope fp4_t* s, scope const(ep8_st)* p, scope const(
        ep8_st)* q) @system @nogc nothrow pure;
extern (C) void ep8_add_projc(scope ep8_st* r, scope const(ep8_st)* p, scope const(ep8_st)* q) @system @nogc nothrow pure;
extern (C) void ep8_add_jacob(scope ep8_st* r, scope const(ep8_st)* p, scope const(ep8_st)* q) @system @nogc nothrow pure;
extern (C) void ep8_sub(scope ep8_st* r, scope const(ep8_st)* p, scope const(ep8_st)* q) @system @nogc nothrow pure;
extern (C) void ep8_dbl_basic(scope ep8_st* r, scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) void ep8_dbl_slp_basic(scope ep8_st* r, scope fp4_t* s, scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) void ep8_dbl_projc(scope ep8_st* r, scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) void ep8_dbl_jacob(scope ep8_st* r, scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) void ep8_mul_basic(scope ep8_st* r, scope const(ep8_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep8_mul_slide(scope ep8_st* r, scope const(ep8_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep8_mul_monty(scope ep8_st* r, scope const(ep8_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep8_mul_lwnaf(scope ep8_st* r, scope const(ep8_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep8_mul_lwreg(scope ep8_st* r, scope const(ep8_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep8_mul_gen(scope ep8_st* r, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep8_mul_dig(scope ep8_st* r, scope const(ep8_st)* p, const(ulong) k) @system @nogc nothrow pure;
extern (C) void ep8_mul_cof(scope ep8_st* r, scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) void ep8_mul_pre_basic(scope ep8_t* t, scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) void ep8_mul_pre_yaowi(scope ep8_t* t, scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) void ep8_mul_pre_nafwi(scope ep8_t* t, scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) void ep8_mul_pre_combs(scope ep8_t* t, scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) void ep8_mul_pre_combd(scope ep8_t* t, scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) void ep8_mul_pre_lwnaf(scope ep8_t* t, scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) void ep8_mul_fix_basic(scope ep8_st* r, scope const(ep8_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep8_mul_fix_yaowi(scope ep8_st* r, scope const(ep8_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep8_mul_fix_nafwi(scope ep8_st* r, scope const(ep8_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep8_mul_fix_combs(scope ep8_st* r, scope const(ep8_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep8_mul_fix_combd(scope ep8_st* r, scope const(ep8_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep8_mul_fix_lwnaf(scope ep8_st* r, scope const(ep8_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ep8_mul_sim_basic(scope ep8_st* r, scope const(ep8_st)* p, scope const(bn_st)* k, scope const(
        ep8_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep8_mul_sim_trick(scope ep8_st* r, scope const(ep8_st)* p, scope const(bn_st)* k, scope const(
        ep8_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep8_mul_sim_inter(scope ep8_st* r, scope const(ep8_st)* p, scope const(bn_st)* k, scope const(
        ep8_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep8_mul_sim_joint(scope ep8_st* r, scope const(ep8_st)* p, scope const(bn_st)* k, scope const(
        ep8_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep8_mul_sim_lot(scope ep8_st* r, scope const(ep8_t)* p, scope const(bn_t)* k, size_t n) @system @nogc nothrow pure;
extern (C) void ep8_mul_sim_gen(scope ep8_st* r, scope const(bn_st)* k, scope const(ep8_st)* q, scope const(
        bn_st)* m) @system @nogc nothrow pure;
extern (C) void ep8_mul_sim_dig(scope ep8_st* r, scope const(ep8_t)* p, scope const(dig_t)* k, size_t len) @system @nogc nothrow pure;
extern (C) void ep8_norm(scope ep8_st* r, scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) void ep8_norm_sim(scope ep8_t* r, scope const(ep8_t)* t, int n) @system @nogc nothrow pure;
extern (C) void ep8_map(scope ep8_st* p, scope const(ubyte)* msg, size_t len) @system @nogc nothrow pure;
extern (C) void ep8_frb(scope ep8_st* r, scope const(ep8_st)* p, int i) @system @nogc nothrow pure;
extern (C) void ep8_pck(scope ep8_st* r, scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) int ep8_upk(scope ep8_st* r, scope const(ep8_st)* p) @system @nogc nothrow pure;
extern (C) void ed_param_set(int param) @system @nogc nothrow pure;
extern (C) int ed_param_set_any() @system @nogc nothrow pure;
extern (C) int ed_param_get() @system @nogc nothrow pure;
extern (C) void ed_curve_get_ord(scope bn_st* r) @system @nogc nothrow pure;
extern (C) void ed_curve_get_gen(scope ed_st* g) @system @nogc nothrow pure;
extern (C) const(ed_t)* ed_curve_get_tab() @system @nogc nothrow pure;
extern (C) void ed_curve_get_cof(scope bn_st* h) @system @nogc nothrow pure;
extern (C) void ed_param_print() @system @nogc nothrow pure;
extern (C) int ed_param_level() @system @nogc nothrow pure;
extern (C) void ed_rand(scope ed_st* p) @system @nogc nothrow pure;
extern (C) void ed_blind(scope ed_st* r, scope const(ed_st)* p) @system @nogc nothrow pure;
extern (C) void ed_rhs(scope dig_t* rhs, scope const(dig_t)* p) @system @nogc nothrow pure;
extern (C) void ed_copy(scope ed_st* r, scope const(ed_st)* p) @system @nogc nothrow pure;
extern (C) int ed_cmp(scope const(ed_st)* p, scope const(ed_st)* q) @system @nogc nothrow pure;
extern (C) void ed_set_infty(scope ed_st* p) @system @nogc nothrow pure;
extern (C) int ed_is_infty(scope const(ed_st)* p) @system @nogc nothrow pure;
extern (C) void ed_neg_basic(scope ed_st* r, scope const(ed_st)* p) @system @nogc nothrow pure;
extern (C) void ed_neg_projc(scope ed_st* r, scope const(ed_st)* p) @system @nogc nothrow pure;
extern (C) void ed_add_basic(scope ed_st* r, scope const(ed_st)* p, scope const(ed_st)* q) @system @nogc nothrow pure;
extern (C) void ed_add_projc(scope ed_st* r, scope const(ed_st)* p, scope const(ed_st)* q) @system @nogc nothrow pure;
extern (C) void ed_add_extnd(scope ed_st* r, scope const(ed_st)* p, scope const(ed_st)* q) @system @nogc nothrow pure;
extern (C) void ed_sub_basic(scope ed_st* r, scope const(ed_st)* p, scope const(ed_st)* q) @system @nogc nothrow pure;
extern (C) void ed_sub_projc(scope ed_st* r, scope const(ed_st)* p, scope const(ed_st)* q) @system @nogc nothrow pure;
extern (C) void ed_sub_extnd(scope ed_st* r, scope const(ed_st)* p, scope const(ed_st)* q) @system @nogc nothrow pure;
extern (C) void ed_dbl_basic(scope ed_st* r, scope const(ed_st)* p) @system @nogc nothrow pure;
extern (C) void ed_dbl_projc(scope ed_st* r, scope const(ed_st)* p) @system @nogc nothrow pure;
extern (C) void ed_dbl_extnd(scope ed_st* r, scope const(ed_st)* p) @system @nogc nothrow pure;
extern (C) void ed_norm(scope ed_st* r, scope const(ed_st)* p) @system @nogc nothrow pure;
extern (C) void ed_norm_sim(scope ed_t* r, scope const(ed_t)* t, int n) @system @nogc nothrow pure;
extern (C) void ed_map(scope ed_st* p, scope const(ubyte)* msg, size_t len) @system @nogc nothrow pure;
extern (C) void ed_map_dst(scope ed_st* p, scope const(ubyte)* msg, size_t len, scope const(ubyte)* dst, size_t dst_len) @system @nogc nothrow pure;
extern (C) void ed_curve_init() @system @nogc nothrow pure;
extern (C) void ed_curve_clean() @system @nogc nothrow pure;
extern (C) void ed_mul_pre_basic(scope ed_t* t, scope const(ed_st)* p) @system @nogc nothrow pure;
extern (C) void ed_mul_pre_yaowi(scope ed_t* t, scope const(ed_st)* p) @system @nogc nothrow pure;
extern (C) void ed_mul_pre_nafwi(scope ed_t* t, scope const(ed_st)* p) @system @nogc nothrow pure;
extern (C) void ed_mul_pre_combs(scope ed_t* t, scope const(ed_st)* p) @system @nogc nothrow pure;
extern (C) void ed_mul_pre_combd(scope ed_t* t, scope const(ed_st)* p) @system @nogc nothrow pure;
extern (C) void ed_mul_pre_lwnaf(scope ed_t* t, scope const(ed_st)* p) @system @nogc nothrow pure;
extern (C) void ed_mul_fix_basic(scope ed_st* r, scope const(ed_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ed_mul_fix_yaowi(scope ed_st* r, scope const(ed_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ed_mul_fix_nafwi(scope ed_st* r, scope const(ed_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ed_mul_fix_combs(scope ed_st* r, scope const(ed_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ed_mul_fix_combd(scope ed_st* r, scope const(ed_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ed_mul_fix_lwnaf(scope ed_st* r, scope const(ed_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ed_mul_fix_lwnaf_mixed(scope ed_st* r, scope const(ed_t)* t, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ed_mul_gen(scope ed_st* r, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ed_mul_dig(scope ed_st* r, scope const(ed_st)* p, ulong k) @system @nogc nothrow pure;
extern (C) void ed_mul_sim_basic(scope ed_st* r, scope const(ed_st)* p, scope const(bn_st)* k, scope const(
        ed_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ed_mul_sim_trick(scope ed_st* r, scope const(ed_st)* p, scope const(bn_st)* k, scope const(
        ed_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ed_mul_sim_inter(scope ed_st* r, scope const(ed_st)* p, scope const(bn_st)* k, scope const(
        ed_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ed_mul_sim_joint(scope ed_st* r, scope const(ed_st)* p, scope const(bn_st)* k, scope const(
        ed_st)* q, scope const(bn_st)* m) @system @nogc nothrow pure;
extern (C) void ed_mul_sim_lot(scope ed_st* r, scope const(ed_t)* p, scope const(bn_t)* k, int n) @system @nogc nothrow pure;
extern (C) void ed_mul_sim_gen(scope ed_st* r, scope const(bn_st)* k, scope const(ed_st)* q, scope const(
        bn_st)* m) @system @nogc nothrow pure;
extern (C) void ed_tab(scope ed_t* t, scope const(ed_st)* p, int w) @system @nogc nothrow pure;
extern (C) void ed_print(scope const(ed_st)* p) @system @nogc nothrow pure;
extern (C) int ed_on_curve(scope const(ed_st)* p) @system @nogc nothrow pure;
extern (C) size_t ed_size_bin(scope const(ed_st)* a, int pack) @system @nogc nothrow pure;
extern (C) void ed_read_bin(scope ed_st* a, scope const(ubyte)* bin, size_t len) @system @nogc nothrow pure;
extern (C) void ed_write_bin(scope ubyte* bin, size_t len, scope const(ed_st)* a, int pack) @system @nogc nothrow pure;
extern (C) void ed_mul_basic(scope ed_st* r, scope const(ed_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ed_mul_slide(scope ed_st* r, scope const(ed_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ed_mul_monty(scope ed_st* r, scope const(ed_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ed_mul_lwnaf(scope ed_st* r, scope const(ed_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ed_mul_lwreg(scope ed_st* r, scope const(ed_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void ed_pck(scope ed_st* r, scope const(ed_st)* p) @system @nogc nothrow pure;
extern (C) int ed_upk(scope ed_st* r, scope const(ed_st)* p) @system @nogc nothrow pure;
extern (C) void pp_map_init() @system @nogc nothrow pure;
extern (C) void pp_map_clean() @system @nogc nothrow pure;
extern (C) void pp_add_k1_basic(scope dig_t* l, scope dig_t* m, scope ep_st* r, scope const(ep_st)* p, scope const(
        ep_st)* q) @system @nogc nothrow pure;
extern (C) void pp_add_k1_projc(scope dig_t* l, scope dig_t* m, scope ep_st* r, scope const(ep_st)* p, scope const(
        ep_st)* q) @system @nogc nothrow pure;
extern (C) void pp_add_k2_basic(scope fp_t* l, scope ep_st* r, scope const(ep_st)* p, scope const(
        ep_st)* q) @system @nogc nothrow pure;
extern (C) void pp_add_k2_projc_basic(scope fp_t* l, scope ep_st* r, scope const(ep_st)* p, scope const(
        ep_st)* q) @system @nogc nothrow pure;
extern (C) void pp_add_k2_projc_lazyr(scope fp_t* l, scope ep_st* r, scope const(ep_st)* p, scope const(
        ep_st)* q) @system @nogc nothrow pure;
extern (C) void pp_add_k8_basic(scope fp4_t* l, scope ep2_st* r, scope const(ep2_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_add_k8_projc_basic(scope fp4_t* l, scope ep2_st* r, scope const(ep2_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_add_k8_projc_lazyr(scope fp4_t* l, scope ep2_st* r, scope const(ep2_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_add_k12_basic(scope fp6_t* l, scope ep2_st* r, scope const(ep2_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_add_k12_projc_basic(scope fp6_t* l, scope ep2_st* r, scope const(ep2_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_add_k12_projc_lazyr(scope fp6_t* l, scope ep2_st* r, scope const(ep2_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_add_lit_k12(scope fp6_t* l, scope ep_st* r, scope const(ep_st)* p, scope const(
        ep2_st)* q) @system @nogc nothrow pure;
extern (C) void pp_add_k16_basic(scope fp8_t* l, scope ep4_st* r, scope const(ep4_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_add_k16_projc_basic(scope fp8_t* l, scope ep4_st* r, scope const(ep4_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_add_k16_projc_lazyr(scope fp8_t* l, scope ep4_st* r, scope const(ep4_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_add_lit_k16(scope fp8_t* l, scope ep_st* r, scope const(ep_st)* p, scope const(
        ep4_st)* q) @system @nogc nothrow pure;
extern (C) void pp_add_k18_basic(scope fp9_t* l, scope ep3_st* r, scope const(ep3_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_add_k18_projc_basic(scope fp9_t* l, scope ep3_st* r, scope const(ep3_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_add_k18_projc_lazyr(scope fp9_t* l, scope ep3_st* r, scope const(ep3_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_add_lit_k18(scope fp9_t* l, scope ep_st* r, scope const(ep_st)* p, scope const(
        ep3_st)* q) @system @nogc nothrow pure;
extern (C) void pp_add_k24_basic(scope fp8_t* l, scope ep4_st* r, scope const(ep4_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_add_k24_projc(scope fp8_t* l, scope ep4_st* r, scope const(ep4_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_add_k48_basic(scope fp24_t* l, scope ep8_st* r, scope const(ep8_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_add_k48_projc(scope fp24_t* l, scope ep8_st* r, scope const(ep8_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_add_k54_basic(scope fp18_t* l, scope fp3_t* rx, scope fp3_t* ry, scope const(
        fp3_t)* qx, scope const(fp3_t)* qy, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_add_k54_projc(scope fp18_t* l, scope fp3_t* rx, scope fp3_t* ry, scope fp3_t* rz, scope const(
        fp3_t)* qx, scope const(fp3_t)* qy, scope const(ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_dbl_k1_basic(scope dig_t* l, scope dig_t* m, scope ep_st* r, scope const(ep_st)* p, scope const(
        ep_st)* q) @system @nogc nothrow pure;
extern (C) void pp_dbl_k1_projc(scope dig_t* l, scope dig_t* m, scope ep_st* r, scope dig_t* w, scope const(
        ep_st)* p, scope const(dig_t)* v, scope const(ep_st)* q) @system @nogc nothrow pure;
extern (C) void pp_dbl_k2_basic(scope fp_t* l, scope ep_st* r, scope const(ep_st)* p, scope const(
        ep_st)* q) @system @nogc nothrow pure;
extern (C) void pp_dbl_k2_projc_basic(scope fp_t* l, scope ep_st* r, scope const(ep_st)* p, scope const(
        ep_st)* q) @system @nogc nothrow pure;
extern (C) void pp_dbl_k2_projc_lazyr(scope fp_t* l, scope ep_st* r, scope const(ep_st)* p, scope const(
        ep_st)* q) @system @nogc nothrow pure;
extern (C) void pp_dbl_k8_basic(scope fp4_t* l, scope ep2_st* r, scope const(ep2_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_dbl_k8_projc_basic(scope fp4_t* l, scope ep2_st* r, scope const(ep2_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_dbl_k8_projc_lazyr(scope fp4_t* l, scope ep2_st* r, scope const(ep2_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_dbl_k12_basic(scope fp6_t* l, scope ep2_st* r, scope const(ep2_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_dbl_k12_projc_basic(scope fp6_t* l, scope ep2_st* r, scope const(ep2_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_dbl_k12_projc_lazyr(scope fp6_t* l, scope ep2_st* r, scope const(ep2_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_dbl_k16_basic(scope fp8_t* l, scope ep4_st* r, scope const(ep4_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_dbl_k16_projc_basic(scope fp8_t* l, scope ep4_st* r, scope const(ep4_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_dbl_k16_projc_lazyr(scope fp8_t* l, scope ep4_st* r, scope const(ep4_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_dbl_k18_basic(scope fp9_t* l, scope ep3_st* r, scope const(ep3_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_dbl_k18_projc_basic(scope fp9_t* l, scope ep3_st* r, scope const(ep3_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_dbl_k18_projc_lazyr(scope fp9_t* l, scope ep3_st* r, scope const(ep3_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_dbl_k24_basic(scope fp8_t* l, scope ep4_st* r, scope const(ep4_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_dbl_k24_projc(scope fp8_t* l, scope ep4_st* r, scope const(ep4_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_dbl_k48_basic(scope fp24_t* l, scope ep8_st* r, scope const(ep8_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_dbl_k48_projc(scope fp24_t* l, scope ep8_st* r, scope const(ep8_st)* q, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_dbl_k54_basic(scope fp18_t* l, scope fp3_t* rx, scope fp3_t* ry, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_dbl_k54_projc(scope fp18_t* l, scope fp3_t* rx, scope fp3_t* ry, scope fp3_t* rz, scope const(
        ep_st)* p) @system @nogc nothrow pure;
extern (C) void pp_dbl_lit_k12(scope fp6_t* l, scope ep_st* r, scope const(ep_st)* p, scope const(
        ep2_st)* q) @system @nogc nothrow pure;
extern (C) void pp_dbl_lit_k16(scope fp8_t* l, scope ep_st* r, scope const(ep_st)* p, scope const(
        ep4_st)* q) @system @nogc nothrow pure;
extern (C) void pp_dbl_lit_k18(scope fp9_t* l, scope ep_st* r, scope const(ep_st)* p, scope const(
        ep3_st)* q) @system @nogc nothrow pure;
extern (C) void pp_exp_k1(scope dig_t* c, scope dig_t* a) @system @nogc nothrow pure;
extern (C) void pp_exp_k2(scope fp_t* c, scope fp_t* a) @system @nogc nothrow pure;
extern (C) void pp_exp_k8(scope fp4_t* c, scope fp4_t* a) @system @nogc nothrow pure;
extern (C) void pp_exp_k12(scope fp6_t* c, scope fp6_t* a) @system @nogc nothrow pure;
extern (C) void pp_exp_k16(scope fp8_t* c, scope fp8_t* a) @system @nogc nothrow pure;
extern (C) void pp_exp_k18(scope fp9_t* c, scope fp9_t* a) @system @nogc nothrow pure;
extern (C) void pp_exp_k24(scope fp8_t* c, scope fp8_t* a) @system @nogc nothrow pure;
extern (C) void pp_exp_k48(scope fp24_t* c, scope fp24_t* a) @system @nogc nothrow pure;
extern (C) void pp_exp_k54(scope fp18_t* c, scope fp18_t* a) @system @nogc nothrow pure;
extern (C) void pp_norm_k1(scope ep_st* c, scope const(ep_st)* a) @system @nogc nothrow pure;
extern (C) void pp_norm_k2(scope ep_st* c, scope const(ep_st)* a) @system @nogc nothrow pure;
extern (C) void pp_norm_k8(scope ep2_st* c, scope const(ep2_st)* a) @system @nogc nothrow pure;
extern (C) void pp_norm_k12(scope ep2_st* c, scope const(ep2_st)* a) @system @nogc nothrow pure;
extern (C) void pp_norm_k16(scope ep4_st* c, scope const(ep4_st)* a) @system @nogc nothrow pure;
extern (C) void pp_norm_k18(scope ep3_st* c, scope const(ep3_st)* a) @system @nogc nothrow pure;
extern (C) void pp_norm_k24(scope ep4_st* c, scope const(ep4_st)* a) @system @nogc nothrow pure;
extern (C) void pp_norm_k48(scope ep8_st* c, scope const(ep8_st)* a) @system @nogc nothrow pure;
extern (C) void pp_map_tatep_k1(scope dig_t* r, scope const(ep_st)* p, scope const(ep_st)* q) @system @nogc nothrow pure;
extern (C) void pp_map_sim_tatep_k1(scope dig_t* r, scope const(ep_t)* p, scope const(ep_t)* q, int m) @system @nogc nothrow pure;
extern (C) void pp_map_tatep_k2(scope fp_t* r, scope const(ep_st)* p, scope const(ep_st)* q) @system @nogc nothrow pure;
extern (C) void pp_map_sim_tatep_k2(scope fp_t* r, scope const(ep_t)* p, scope const(ep_t)* q, int m) @system @nogc nothrow pure;
extern (C) void pp_map_weilp_k1(scope dig_t* r, scope const(ep_st)* p, scope const(ep_st)* q) @system @nogc nothrow pure;
extern (C) void pp_map_sim_weilp_k1(scope dig_t* r, scope const(ep_t)* p, scope const(ep_t)* q, int m) @system @nogc nothrow pure;
extern (C) void pp_map_weilp_k2(scope fp_t* r, scope const(ep_st)* p, scope const(ep_st)* q) @system @nogc nothrow pure;
extern (C) void pp_map_sim_weilp_k2(scope fp_t* r, scope const(ep_t)* p, scope const(ep_t)* q, int m) @system @nogc nothrow pure;
extern (C) void pp_map_oatep_k8(scope fp4_t* r, scope const(ep_st)* p, scope const(ep2_st)* q) @system @nogc nothrow pure;
extern (C) void pp_map_sim_oatep_k8(scope fp4_t* r, scope const(ep_t)* p, scope const(ep2_t)* q, int m) @system @nogc nothrow pure;
extern (C) void pp_map_tatep_k12(scope fp6_t* r, scope const(ep_st)* p, scope const(ep2_st)* q) @system @nogc nothrow pure;
extern (C) void pp_map_sim_tatep_k12(scope fp6_t* r, scope const(ep_t)* p, scope const(ep2_t)* q, int m) @system @nogc nothrow pure;
extern (C) void pp_map_weilp_k12(scope fp6_t* r, scope const(ep_st)* p, scope const(ep2_st)* q) @system @nogc nothrow pure;
extern (C) void pp_map_sim_weilp_k12(scope fp6_t* r, scope const(ep_t)* p, scope const(ep2_t)* q, int m) @system @nogc nothrow pure;
extern (C) void pp_map_oatep_k12(scope fp6_t* r, scope const(ep_st)* p, scope const(ep2_st)* q) @system @nogc nothrow pure;
extern (C) void pp_map_sim_oatep_k12(scope fp6_t* r, scope const(ep_t)* p, scope const(ep2_t)* q, int m) @system @nogc nothrow pure;
extern (C) void pp_map_tatep_k16(scope fp8_t* r, scope const(ep_st)* p, scope const(ep4_st)* q) @system @nogc nothrow pure;
extern (C) void pp_map_sim_tatep_k16(scope fp8_t* r, scope const(ep_t)* p, scope const(ep4_t)* q, int m) @system @nogc nothrow pure;
extern (C) void pp_map_weilp_k16(scope fp8_t* r, scope const(ep_st)* p, scope const(ep4_st)* q) @system @nogc nothrow pure;
extern (C) void pp_map_sim_weilp_k16(scope fp8_t* r, scope const(ep_t)* p, scope const(ep4_t)* q, int m) @system @nogc nothrow pure;
extern (C) void pp_map_oatep_k16(scope fp8_t* r, scope const(ep_st)* p, scope const(ep4_st)* q) @system @nogc nothrow pure;
extern (C) void pp_map_sim_oatep_k16(scope fp8_t* r, scope const(ep_t)* p, scope const(ep4_t)* q, int m) @system @nogc nothrow pure;
extern (C) void pp_map_tatep_k18(scope fp9_t* r, scope const(ep_st)* p, scope const(ep3_st)* q) @system @nogc nothrow pure;
extern (C) void pp_map_sim_tatep_k18(scope fp9_t* r, scope const(ep_t)* p, scope const(ep3_t)* q, int m) @system @nogc nothrow pure;
extern (C) void pp_map_weilp_k18(scope fp9_t* r, scope const(ep_st)* p, scope const(ep3_st)* q) @system @nogc nothrow pure;
extern (C) void pp_map_sim_weilp_k18(scope fp9_t* r, scope const(ep_t)* p, scope const(ep3_t)* q, int m) @system @nogc nothrow pure;
extern (C) void pp_map_oatep_k18(scope fp9_t* r, scope const(ep_st)* p, scope const(ep3_st)* q) @system @nogc nothrow pure;
extern (C) void pp_map_sim_oatep_k18(scope fp9_t* r, scope const(ep_t)* p, scope const(ep3_t)* q, int m) @system @nogc nothrow pure;
extern (C) void pp_map_k24(scope fp8_t* r, scope const(ep_st)* p, scope const(ep4_st)* q) @system @nogc nothrow pure;
extern (C) void pp_map_sim_k24(scope fp8_t* r, scope const(ep_t)* p, scope const(ep4_t)* q, int m) @system @nogc nothrow pure;
extern (C) void pp_map_k48(scope fp24_t* r, scope const(ep_st)* p, scope const(ep8_st)* q) @system @nogc nothrow pure;
extern (C) void pp_map_sim_k48(scope fp24_t* r, scope const(ep_t)* p, scope const(ep8_t)* q, int m) @system @nogc nothrow pure;
extern (C) void pp_map_k54(scope fp18_t* r, scope const(ep_st)* p, scope const(fp3_t)* qx, scope const(
        fp3_t)* qy) @system @nogc nothrow pure;
extern (C) void pc_core_init() @system @nogc nothrow pure;
extern (C) void pc_core_calc() @system @nogc nothrow pure;
extern (C) void pc_core_clean() @system @nogc nothrow pure;
extern (C) void gt_rand(scope fp6_t* a) @system @nogc nothrow pure;
extern (C) void g1_mul(scope ep_st* r, scope const(ep_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void g2_mul(scope ep2_st* r, scope const(ep2_st)* p, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void g1_mul_gen(scope ep_st* r, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void g2_mul_gen(scope ep2_st* r, scope const(bn_st)* k) @system @nogc nothrow pure;
extern (C) void gt_exp(scope fp6_t* c, scope const(fp6_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void gt_exp_sec(scope fp6_t* c, scope const(fp6_t)* a, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void gt_exp_dig(scope fp6_t* c, scope const(fp6_t)* a, const(ulong) b) @system @nogc nothrow pure;
extern (C) void gt_exp_sim(scope fp6_t* e, scope const(fp6_t)* a, scope const(bn_st)* b, scope const(
        fp6_t)* c, scope const(bn_st)* d) @system @nogc nothrow pure;
extern (C) void gt_exp_gen(scope fp6_t* c, scope const(bn_st)* b) @system @nogc nothrow pure;
extern (C) void gt_get_gen(scope fp6_t* g) @system @nogc nothrow pure;
extern (C) int g1_is_valid(scope const(ep_st)* a) @system @nogc nothrow pure;
extern (C) int g2_is_valid(scope const(ep2_st)* a) @system @nogc nothrow pure;
extern (C) int gt_is_valid(scope const(fp6_t)* a) @system @nogc nothrow pure;
extern (C) void bench_init() @system @nogc nothrow pure;
extern (C) void bench_clean() @system @nogc nothrow pure;
extern (C) void bench_overhead() @system @nogc nothrow pure;
extern (C) void bench_reset() @system @nogc nothrow pure;
extern (C) void bench_before() @system @nogc nothrow pure;
extern (C) void bench_after() @system @nogc nothrow pure;
extern (C) void bench_compute(int benches) @system @nogc nothrow pure;
extern (C) void bench_print() @system @nogc nothrow pure;
extern (C) ulong bench_total() @system @nogc nothrow pure;
extern (C) void rand_init() @system @nogc nothrow pure;
extern (C) void rand_clean() @system @nogc nothrow pure;
extern (C) void rand_seed(scope ubyte* buf, size_t size) @system @nogc nothrow pure;
extern (C) int rand_check(scope ubyte* buf, size_t size) @system @nogc nothrow pure;
extern (C) void rand_bytes(scope ubyte* buf, size_t size) @system @nogc nothrow pure;
extern (C) int core_init() @system @nogc nothrow pure;
extern (C) int core_clean() @system @nogc nothrow pure;
extern (C) ctx_t* core_get() @system @nogc nothrow pure;
extern (C) void core_set(scope ctx_t* _ctx) @system @nogc nothrow pure;
extern (C) void fb2_mul(scope fb_t* c, scope const(fb_t)* a, scope const(fb_t)* b) @system @nogc nothrow pure;
extern (C) void fb2_mul_nor(scope fb_t* c, scope const(fb_t)* a) @system @nogc nothrow pure;
extern (C) void fb2_sqr(scope fb_t* c, scope const(fb_t)* a) @system @nogc nothrow pure;
extern (C) void fb2_slv(scope fb_t* c, scope const(fb_t)* a) @system @nogc nothrow pure;
extern (C) void fb2_inv(scope fb_t* c, scope const(fb_t)* a) @system @nogc nothrow pure;
extern (C) void mpc_mt_gen(scope mt_t* tri, scope const(bn_st)* order) @system @nogc nothrow pure;
extern (C) void mpc_mt_lcl(scope bn_st* d, scope bn_st* e, scope const(bn_st)* x, scope const(bn_st)* y, scope const(
        bn_st)* n, scope const(mt_t)* tri) @system @nogc nothrow pure;
extern (C) void mpc_mt_bct(scope bn_t* d, scope bn_t* e, scope bn_st* n) @system @nogc nothrow pure;
extern (C) void mpc_mt_mul(scope bn_st* r, scope const(bn_st)* d, scope const(bn_st)* e, scope const(
        bn_st)* n, scope const(mt_t)* tri, int party) @system @nogc nothrow pure;
extern (C) int mpc_sss_gen(scope bn_t* x, scope bn_t* y, scope const(bn_st)* key, scope const(bn_st)* order, size_t k, size_t n) @system @nogc nothrow pure;
extern (C) int mpc_sss_key(scope bn_st* key, scope const(bn_t)* x, scope const(bn_t)* y, scope const(
        bn_st)* order, size_t k) @system @nogc nothrow pure;
extern (C) void g1_mul_lcl(scope bn_st* d, scope ep_st* q, scope const(bn_st)* x, scope const(ep_st)* p, scope const(
        mt_t)* tri) @system @nogc nothrow pure;
extern (C) void g1_mul_bct(scope bn_t* d, scope g1_t* q) @system @nogc nothrow pure;
extern (C) void g1_mul_mpc(scope ep_st* r, scope const(bn_st)* d, scope const(ep_st)* q, scope const(
        mt_t)* tri, int party) @system @nogc nothrow pure;
extern (C) void g2_mul_lcl(scope bn_st* d, scope ep2_st* q, scope const(bn_st)* x, scope const(
        ep2_st)* p, scope const(mt_t)* tri) @system @nogc nothrow pure;
extern (C) void g2_mul_bct(scope bn_t* d, scope g2_t* q) @system @nogc nothrow pure;
extern (C) void g2_mul_mpc(scope ep2_st* r, scope const(bn_st)* d, scope const(ep2_st)* q, scope const(
        mt_t)* tri, int party) @system @nogc nothrow pure;
extern (C) void gt_exp_lcl(scope bn_st* d, scope fp6_t* q, scope const(bn_st)* x, scope const(fp6_t)* p, scope const(
        mt_t)* tri) @system @nogc nothrow pure;
extern (C) void gt_exp_bct(scope bn_t* d, scope gt_t* q) @system @nogc nothrow pure;
extern (C) void gt_exp_mpc(scope fp6_t* r, scope const(bn_st)* d, scope const(fp6_t)* q, scope const(
        mt_t)* tri, int party) @system @nogc nothrow pure;
extern (C) void pc_map_tri(scope pt_t* t) @system @nogc nothrow pure;
extern (C) void pc_map_lcl(scope ep_st* d, scope ep2_st* e, scope const(ep_st)* p, scope const(
        ep2_st)* q, scope const(pt_st)* t) @system @nogc nothrow pure;
extern (C) void pc_map_bct(scope g1_t* d, scope g2_t* e) @system @nogc nothrow pure;
extern (C) void pc_map_mpc(scope fp6_t* r, scope const(ep_st)* d1, scope const(ep2_st)* d2, scope const(
        pt_st)* triple, int party) @system @nogc nothrow pure;
extern (C) int cp_rsa_gen(scope _rsa_st* pub, scope _rsa_st* prv, size_t bits) @system @nogc nothrow pure;
extern (C) int cp_rsa_enc(scope ubyte* _out, scope size_t* out_len, scope const(ubyte)* _in, size_t in_len, scope const(
        _rsa_st)* pub) @system @nogc nothrow pure;
extern (C) int cp_rsa_dec(scope ubyte* _out, scope size_t* out_len, scope const(ubyte)* _in, size_t in_len, scope const(
        _rsa_st)* prv) @system @nogc nothrow pure;
extern (C) int cp_rsa_sig(scope ubyte* sig, scope size_t* sig_len, scope const(ubyte)* msg, size_t msg_len, int hash, scope const(
        _rsa_st)* prv) @system @nogc nothrow pure;
extern (C) int cp_rsa_ver(scope ubyte* sig, size_t sig_len, scope const(ubyte)* msg, size_t msg_len, int hash, scope const(
        _rsa_st)* pub) @system @nogc nothrow pure;
extern (C) int cp_rabin_gen(scope crt_st* pub, scope crt_st* prv, size_t bits) @system @nogc nothrow pure;
extern (C) int cp_rabin_enc(scope ubyte* _out, scope size_t* out_len, scope const(ubyte)* _in, size_t in_len, scope const(
        crt_st)* pub) @system @nogc nothrow pure;
extern (C) int cp_rabin_dec(scope ubyte* _out, scope size_t* out_len, scope const(ubyte)* _in, size_t in_len, scope const(
        crt_st)* prv) @system @nogc nothrow pure;
extern (C) int cp_bdpe_gen(scope bdpe_st* pub, scope bdpe_st* prv, ulong block, size_t bits) @system @nogc nothrow pure;
extern (C) int cp_bdpe_enc(scope ubyte* _out, scope size_t* out_len, ulong _in, scope const(bdpe_st)* pub) @system @nogc nothrow pure;
extern (C) int cp_bdpe_dec(scope dig_t* _out, scope const(ubyte)* _in, size_t in_len, scope const(
        bdpe_st)* prv) @system @nogc nothrow pure;
extern (C) int cp_phpe_gen(scope bn_st* pub, scope crt_st* prv, size_t bits) @system @nogc nothrow pure;
extern (C) int cp_phpe_enc(scope bn_st* c, scope const(bn_st)* m, scope const(bn_st)* pub) @system @nogc nothrow pure;
extern (C) int cp_phpe_add(scope bn_st* r, scope const(bn_st)* c, scope const(bn_st)* d, scope const(
        bn_st)* pub) @system @nogc nothrow pure;
extern (C) int cp_phpe_dec(scope bn_st* m, scope const(bn_st)* c, scope const(crt_st)* prv) @system @nogc nothrow pure;
extern (C) int cp_shpe_gen(scope shpe_st* pub, scope shpe_st* prv, size_t sbits, size_t nbits) @system @nogc nothrow pure;
extern (C) int cp_shpe_enc(scope bn_st* c, scope const(bn_st)* m, scope const(shpe_st)* pub) @system @nogc nothrow pure;
extern (C) int cp_shpe_enc_prv(scope bn_st* c, scope const(bn_st)* m, scope const(shpe_st)* prv) @system @nogc nothrow pure;
extern (C) int cp_shpe_dec(scope bn_st* m, scope const(bn_st)* c, scope const(shpe_st)* prv) @system @nogc nothrow pure;
extern (C) int cp_ghpe_gen(scope bn_st* pub, scope bn_st* prv, size_t bits) @system @nogc nothrow pure;
extern (C) int cp_ghpe_enc(scope bn_st* c, scope const(bn_st)* m, scope const(bn_st)* pub, size_t s) @system @nogc nothrow pure;
extern (C) int cp_ghpe_dec(scope bn_st* m, scope const(bn_st)* c, scope const(bn_st)* pub, scope const(
        bn_st)* prv, size_t s) @system @nogc nothrow pure;
extern (C) int cp_ecdh_gen(scope bn_st* d, scope ep_st* q) @system @nogc nothrow pure;
extern (C) int cp_ecdh_key(scope ubyte* key, size_t key_len, scope const(bn_st)* d, scope const(
        ep_st)* q) @system @nogc nothrow pure;
extern (C) int cp_ecmqv_gen(scope bn_st* d, scope ep_st* q) @system @nogc nothrow pure;
extern (C) int cp_ecmqv_key(scope ubyte* key, size_t key_len, scope const(bn_st)* d1, scope const(
        bn_st)* d2, scope const(ep_st)* q2u, scope const(ep_st)* q1v, scope const(ep_st)* q2v) @system @nogc nothrow pure;
extern (C) int cp_ecies_gen(scope bn_st* d, scope ep_st* q) @system @nogc nothrow pure;
extern (C) int cp_ecies_enc(scope ep_st* r, scope ubyte* _out, scope size_t* out_len, scope const(
        ubyte)* _in, size_t in_len, scope const(ep_st)* q) @system @nogc nothrow pure;
extern (C) int cp_ecies_dec(scope ubyte* _out, scope size_t* out_len, scope const(ep_st)* r, scope const(
        ubyte)* _in, size_t in_len, scope const(bn_st)* d) @system @nogc nothrow pure;
extern (C) int cp_ecdsa_gen(scope bn_st* d, scope ep_st* q) @system @nogc nothrow pure;
extern (C) int cp_ecdsa_sig(scope bn_st* r, scope bn_st* s, scope const(ubyte)* msg, size_t len, int hash, scope const(
        bn_st)* d) @system @nogc nothrow pure;
extern (C) int cp_ecdsa_ver(scope const(bn_st)* r, scope const(bn_st)* s, scope const(ubyte)* msg, size_t len, int hash, scope const(
        ep_st)* q) @system @nogc nothrow pure;
extern (C) int cp_ecss_gen(scope bn_st* d, scope ep_st* q) @system @nogc nothrow pure;
extern (C) int cp_ecss_sig(scope bn_st* e, scope bn_st* s, scope const(ubyte)* msg, size_t len, scope const(
        bn_st)* d) @system @nogc nothrow pure;
extern (C) int cp_ecss_ver(scope bn_st* e, scope bn_st* s, scope const(ubyte)* msg, size_t len, scope const(
        ep_st)* q) @system @nogc nothrow pure;
extern (C) int cp_pdpub_gen(scope bn_st* c, scope bn_st* r, scope ep_st* u1, scope ep2_st* u2, scope ep2_st* v2, scope fp6_t* e) @system @nogc nothrow pure;
extern (C) int cp_pdpub_ask(scope ep_st* v1, scope ep2_st* w2, scope const(ep_st)* p, scope const(
        ep2_st)* q, scope const(bn_st)* c, scope const(bn_st)* r, scope const(ep_st)* u1, scope const(
        ep2_st)* u2, scope const(ep2_st)* v2) @system @nogc nothrow pure;
extern (C) int cp_pdpub_ans(scope gt_t* g, scope const(ep_st)* p, scope const(ep2_st)* q, scope const(
        ep_st)* v1, scope const(ep2_st)* v2, scope const(ep2_st)* w2) @system @nogc nothrow pure;
extern (C) int cp_pdpub_ver(scope fp6_t* r, scope const(gt_t)* g, scope const(bn_st)* c, scope const(
        fp6_t)* e) @system @nogc nothrow pure;
extern (C) int cp_pdprv_gen(scope bn_st* c, scope bn_t* r, scope g1_t* u1, scope g2_t* u2, scope g2_t* v2, scope gt_t* e) @system @nogc nothrow pure;
extern (C) int cp_pdprv_ask(scope g1_t* v1, scope g2_t* w2, scope const(ep_st)* p, scope const(
        ep2_st)* q, scope const(bn_st)* c, scope const(bn_t)* r, scope const(g1_t)* u1, scope const(
        g2_t)* u2, scope const(g2_t)* v2) @system @nogc nothrow pure;
extern (C) int cp_pdprv_ans(scope gt_t* g, scope const(g1_t)* v1, scope const(g2_t)* w2) @system @nogc nothrow pure;
extern (C) int cp_pdprv_ver(scope fp6_t* r, scope const(gt_t)* g, scope const(bn_st)* c, scope const(
        gt_t)* e) @system @nogc nothrow pure;
extern (C) int cp_lvpub_gen(scope bn_st* c, scope bn_st* r, scope ep_st* u1, scope ep2_st* u2, scope ep2_st* v2, scope fp6_t* e) @system @nogc nothrow pure;
extern (C) int cp_lvpub_ask(scope ep_st* v1, scope ep2_st* w2, scope const(bn_st)* c, scope const(
        ep_st)* p, scope const(ep2_st)* q, scope const(bn_st)* r, scope const(ep_st)* u1, scope const(
        ep2_st)* u2, scope const(ep2_st)* v2) @system @nogc nothrow pure;
extern (C) int cp_lvpub_ans(scope gt_t* g, scope const(ep_st)* p, scope const(ep2_st)* q, scope const(
        ep_st)* v1, scope const(ep2_st)* v2, scope const(ep2_st)* w2) @system @nogc nothrow pure;
extern (C) int cp_lvpub_ver(scope fp6_t* r, scope const(gt_t)* g, scope const(bn_st)* c, scope const(
        fp6_t)* e) @system @nogc nothrow pure;
extern (C) int cp_lvprv_gen(scope bn_st* c, scope bn_t* r, scope g1_t* u1, scope g2_t* u2, scope g2_t* v2, scope gt_t* e) @system @nogc nothrow pure;
extern (C) int cp_lvprv_ask(scope g1_t* v1, scope g2_t* w2, scope const(bn_st)* c, scope const(
        ep_st)* p, scope const(ep2_st)* q, scope const(bn_t)* r, scope const(g1_t)* u1, scope const(
        g2_t)* u2, scope const(g2_t)* v2) @system @nogc nothrow pure;
extern (C) int cp_lvprv_ans(scope gt_t* g, scope const(g1_t)* v1, scope const(g2_t)* w2) @system @nogc nothrow pure;
extern (C) int cp_lvprv_ver(scope fp6_t* r, scope const(gt_t)* g, scope const(bn_st)* c, scope const(
        gt_t)* e) @system @nogc nothrow pure;
extern (C) int cp_cades_ask(scope bn_st* t, scope ep_st* t1, scope ep2_st* t2, scope fp6_t* e, scope const(
        ep_st)* p, scope const(ep2_st)* q) @system @nogc nothrow pure;
extern (C) int cp_cades_ans(scope gt_t* g, scope const(ep_st)* t1, scope const(ep2_st)* t2, scope const(
        ep_st)* p, scope const(ep2_st)* q) @system @nogc nothrow pure;
extern (C) int cp_cades_ver(scope fp6_t* r, scope const(gt_t)* g, scope const(bn_st)* t, scope const(
        fp6_t)* e) @system @nogc nothrow pure;
extern (C) int cp_pdbat_gen(scope ep_st* u, scope ep2_st* v, scope fp6_t* e) @system @nogc nothrow pure;
extern (C) int cp_pdbat_ask(scope bn_t* l, scope bn_t* b, scope g1_t* z, scope ep2_st* c, scope const(
        ep_st)* u, scope const(ep2_st)* v, scope const(g1_t)* p, scope const(g2_t)* q, size_t m) @system @nogc nothrow pure;
extern (C) int cp_pdbat_ans(scope gt_t* w, scope const(g1_t)* z, scope const(ep2_st)* c, scope const(
        ep_st)* u, scope const(g1_t)* p, scope const(g2_t)* q, size_t m) @system @nogc nothrow pure;
extern (C) int cp_pdbat_ver(scope gt_t* rs, scope const(gt_t)* w, scope const(bn_t)* b, scope const(
        fp6_t)* e, size_t m) @system @nogc nothrow pure;
extern (C) int cp_mvbat_gen(scope bn_t* l, scope ep2_st* r, scope g2_t* rs, size_t m) @system @nogc nothrow pure;
extern (C) int cp_mvbat_ask(scope bn_t* b, scope g2_t* qs, scope const(g2_t)* rs, scope const(g1_t)* p, scope const(
        g2_t)* q, size_t m) @system @nogc nothrow pure;
extern (C) int cp_mvbat_ans(scope gt_t* as, scope gt_t* bs, scope const(g2_t)* qs, scope const(g1_t)* p, scope const(
        g2_t)* q, size_t m) @system @nogc nothrow pure;
extern (C) int cp_mvbat_ver(scope gt_t* rs, scope const(gt_t)* as, scope const(gt_t)* bs, scope const(
        bn_t)* b, scope const(bn_t)* l, scope const(ep2_st)* r, scope const(g1_t)* p, size_t m) @system @nogc nothrow pure;
extern (C) int cp_amore_gen(scope bn_st* s, scope fp6_t* e) @system @nogc nothrow pure;
extern (C) int cp_amore_ask(scope bn_t* r, scope g1_t* c, scope ep_st* x, scope ep2_st* y, scope ep2_st* d, scope ep_st* u, scope ep2_st* v, scope const(
        bn_st)* s, scope const(fp6_t)* e, scope const(g1_t)* p, scope const(g2_t)* q, size_t m) @system @nogc nothrow pure;
extern (C) int cp_amore_ans(scope gt_t* gs, scope const(g1_t)* c, scope const(ep_st)* x, scope const(
        ep2_st)* y, scope const(ep2_st)* d, scope const(g1_t)* p, scope const(g2_t)* q, size_t m) @system @nogc nothrow pure;
extern (C) int cp_amore_ver(scope gt_t* gs, scope const(bn_t)* c, scope const(fp6_t)* e, size_t m) @system @nogc nothrow pure;
extern (C) int cp_sokaka_gen(scope bn_st* master) @system @nogc nothrow pure;
extern (C) int cp_sokaka_gen_prv(scope sokaka_st* k, scope const(char)* id, scope bn_st* master) @system @nogc nothrow pure;
extern (C) int cp_sokaka_key(scope ubyte* key, size_t key_len, scope const(char)* id1, scope const(
        sokaka_st)* k, scope const(char)* id2) @system @nogc nothrow pure;
extern (C) int cp_bgn_gen(scope bgn_st* pub, scope bgn_st* prv) @system @nogc nothrow pure;
extern (C) int cp_bgn_enc1(scope g1_t* _out, const(ulong) _in, scope const(bgn_st)* pub) @system @nogc nothrow pure;
extern (C) int cp_bgn_dec1(scope dig_t* _out, scope const(g1_t)* _in, scope const(bgn_st)* prv) @system @nogc nothrow pure;
extern (C) int cp_bgn_enc2(scope g2_t* _out, const(ulong) _in, scope const(bgn_st)* pub) @system @nogc nothrow pure;
extern (C) int cp_bgn_dec2(scope dig_t* _out, scope const(g2_t)* _in, scope const(bgn_st)* prv) @system @nogc nothrow pure;
extern (C) int cp_bgn_add(scope gt_t* e, scope const(gt_t)* c, scope const(gt_t)* d) @system @nogc nothrow pure;
extern (C) int cp_bgn_mul(scope gt_t* e, scope const(g1_t)* c, scope const(g2_t)* d) @system @nogc nothrow pure;
extern (C) int cp_bgn_dec(scope dig_t* _out, scope const(gt_t)* _in, scope const(bgn_st)* prv) @system @nogc nothrow pure;
extern (C) int cp_ibe_gen(scope bn_st* master, scope ep_st* pub) @system @nogc nothrow pure;
extern (C) int cp_ibe_gen_prv(scope ep2_st* prv, scope const(char)* id, scope const(bn_st)* master) @system @nogc nothrow pure;
extern (C) int cp_ibe_enc(scope ubyte* _out, scope size_t* out_len, scope const(ubyte)* _in, size_t in_len, scope const(
        char)* id, scope const(ep_st)* pub) @system @nogc nothrow pure;
extern (C) int cp_ibe_dec(scope ubyte* _out, scope size_t* out_len, scope const(ubyte)* _in, size_t in_len, scope const(
        ep2_st)* prv) @system @nogc nothrow pure;
extern (C) int cp_bls_gen(scope bn_st* d, scope ep2_st* q) @system @nogc nothrow pure;
extern (C) int cp_bls_sig(scope ep_st* s, scope const(ubyte)* msg, size_t len, scope const(bn_st)* d) @system @nogc nothrow pure;
extern (C) int cp_bls_ver(scope const(ep_st)* s, scope const(ubyte)* msg, size_t len, scope const(
        ep2_st)* q) @system @nogc nothrow pure;
extern (C) int cp_bls_agg_sig(scope ep_st* sig, scope ep2_st* a, scope const(ep_st)* s, scope const(
        ep2_st)* q) @system @nogc nothrow pure;
extern (C) int cp_bls_agg_ver(scope const(ep_st)* s, scope const(ubyte*)* m, scope const(size_t)* l, size_t size, scope const(
        g2_t)* q) @system @nogc nothrow pure;
extern (C) int cp_bbs_gen(scope bn_st* d, scope ep2_st* q, scope fp6_t* z) @system @nogc nothrow pure;
extern (C) int cp_bbs_sig(scope ep_st* s, scope const(ubyte)* msg, size_t len, int hash, scope const(
        bn_st)* d) @system @nogc nothrow pure;
extern (C) int cp_bbs_ver(scope ep_st* s, scope const(ubyte)* msg, size_t len, int hash, scope const(
        ep2_st)* q, scope const(fp6_t)* z) @system @nogc nothrow pure;
extern (C) int cp_cls_gen(scope bn_st* u, scope bn_st* v, scope ep2_st* x, scope ep2_st* y) @system @nogc nothrow pure;
extern (C) int cp_cls_sig(scope ep_st* a, scope ep_st* b, scope ep_st* c, scope const(ubyte)* msg, size_t len, scope const(
        bn_st)* u, scope const(bn_st)* v) @system @nogc nothrow pure;
extern (C) int cp_cls_ver(scope const(ep_st)* a, scope const(ep_st)* b, scope const(ep_st)* c, scope const(
        ubyte)* msg, size_t len, scope const(ep2_st)* x, scope const(ep2_st)* y) @system @nogc nothrow pure;
extern (C) int cp_cli_gen(scope bn_st* t, scope bn_st* u, scope bn_st* v, scope ep2_st* x, scope ep2_st* y, scope ep2_st* z) @system @nogc nothrow pure;
extern (C) int cp_cli_sig(scope ep_st* a, scope ep_st* A, scope ep_st* b, scope ep_st* B, scope ep_st* c, scope const(
        ubyte)* msg, size_t len, scope const(bn_st)* r, scope const(bn_st)* t, scope const(bn_st)* u, scope const(
        bn_st)* v) @system @nogc nothrow pure;
extern (C) int cp_cli_ver(scope ep_st* a, scope ep_st* A, scope ep_st* b, scope ep_st* B, scope ep_st* c, scope const(
        ubyte)* msg, size_t len, scope const(bn_st)* r, scope const(ep2_st)* x, scope const(ep2_st)* y, scope const(
        ep2_st)* z) @system @nogc nothrow pure;
extern (C) int cp_clb_gen(scope bn_st* t, scope bn_st* u, scope bn_t* v, scope ep2_st* x, scope ep2_st* y, scope g2_t* z, size_t l) @system @nogc nothrow pure;
extern (C) int cp_clb_sig(scope ep_st* a, scope g1_t* A, scope ep_st* b, scope g1_t* B, scope ep_st* c, scope const(
        ubyte*)* ms, scope const(size_t)* ls, scope const(bn_st)* t, scope const(bn_st)* u, scope const(
        bn_t)* v, const(size_t) l) @system @nogc nothrow pure;
extern (C) int cp_clb_ver(scope const(ep_st)* a, scope const(g1_t)* A, scope const(ep_st)* b, scope const(
        g1_t)* B, scope const(ep_st)* c, scope const(ubyte*)* ms, scope const(size_t)* ls, scope const(
        ep2_st)* x, scope const(ep2_st)* y, scope const(g2_t)* z, size_t l) @system @nogc nothrow pure;
extern (C) int cp_pss_gen(scope bn_st* u, scope bn_st* v, scope ep2_st* g, scope ep2_st* x, scope ep2_st* y) @system @nogc nothrow pure;
extern (C) int cp_pss_sig(scope ep_st* a, scope ep_st* b, scope const(bn_st)* m, scope const(bn_st)* u, scope const(
        bn_st)* v) @system @nogc nothrow pure;
extern (C) int cp_pss_ver(scope const(ep_st)* a, scope const(ep_st)* b, scope const(bn_st)* m, scope const(
        ep2_st)* g, scope const(ep2_st)* x, scope const(ep2_st)* y) @system @nogc nothrow pure;
extern (C) int cp_mpss_gen(scope bn_t* r, scope bn_t* s, scope ep2_st* g, scope g2_t* x, scope g2_t* y) @system @nogc nothrow pure;
extern (C) int cp_mpss_sig(scope ep_st* a, scope g1_t* b, scope const(bn_t)* m, scope const(bn_t)* r, scope const(
        bn_t)* s, scope const(mt_t)* mul_tri, scope const(mt_t)* sm_tri) @system @nogc nothrow pure;
extern (C) int cp_mpss_bct(scope g2_t* x, scope g2_t* y) @system @nogc nothrow pure;
extern (C) int cp_mpss_ver(scope fp6_t* e, scope const(ep_st)* a, scope const(g1_t)* b, scope const(
        bn_t)* m, scope const(ep2_st)* h, scope const(ep2_st)* x, scope const(ep2_st)* y, scope const(
        mt_t)* sm_tri, scope const(pt_t)* pc_tri) @system @nogc nothrow pure;
extern (C) int cp_psb_gen(scope bn_st* r, scope bn_t* s, scope ep2_st* g, scope ep2_st* x, scope g2_t* y, size_t l) @system @nogc nothrow pure;
extern (C) int cp_psb_sig(scope ep_st* a, scope ep_st* b, scope const(bn_t)* ms, scope const(bn_st)* r, scope const(
        bn_t)* s, size_t l) @system @nogc nothrow pure;
extern (C) int cp_psb_ver(scope const(ep_st)* a, scope const(ep_st)* b, scope const(bn_t)* ms, scope const(
        ep2_st)* g, scope const(ep2_st)* x, scope const(g2_t)* y, size_t l) @system @nogc nothrow pure;
extern (C) int cp_mpsb_gen(scope bn_t* r, void[2] s, scope ep2_st* h, scope g2_t* x, void[2] y, size_t l) @system @nogc nothrow pure;
extern (C) int cp_mpsb_sig(scope ep_st* a, scope g1_t* b, void[2] m, scope const(bn_t)* r, void[2] s, scope const(
        mt_t)* mul_tri, scope const(mt_t)* sm_tri, size_t l) @system @nogc nothrow pure;
extern (C) int cp_mpsb_bct(scope g2_t* x, void[2] y, size_t l) @system @nogc nothrow pure;
extern (C) int cp_mpsb_ver(scope fp6_t* e, scope const(ep_st)* a, scope const(g1_t)* b, void[2] m, scope const(
        ep2_st)* h, scope const(ep2_st)* x, void[2] y, void[2] v, scope const(mt_t)* sm_tri, scope const(
        pt_t)* pc_tri, size_t l) @system @nogc nothrow pure;
extern (C) int cp_zss_gen(scope bn_st* d, scope ep_st* q, scope fp6_t* z) @system @nogc nothrow pure;
extern (C) int cp_zss_sig(scope ep2_st* s, scope const(ubyte)* msg, size_t len, int hash, scope const(
        bn_st)* d) @system @nogc nothrow pure;
extern (C) int cp_zss_ver(scope const(ep2_st)* s, scope const(ubyte)* msg, size_t len, int hash, scope const(
        ep_st)* q, scope const(fp6_t)* z) @system @nogc nothrow pure;
extern (C) int cp_vbnn_gen(scope bn_st* msk, scope ep_st* mpk) @system @nogc nothrow pure;
extern (C) int cp_vbnn_gen_prv(scope bn_st* sk, scope ep_st* pk, scope const(bn_st)* msk, scope const(
        ubyte)* id, size_t id_len) @system @nogc nothrow pure;
extern (C) int cp_vbnn_sig(scope ep_st* r, scope bn_st* z, scope bn_st* h, scope const(ubyte)* id, size_t id_len, scope const(
        ubyte)* msg, int msg_len, scope const(bn_st)* sk, scope const(ep_st)* pk) @system @nogc nothrow pure;
extern (C) int cp_vbnn_ver(scope const(ep_st)* r, scope const(bn_st)* z, scope const(bn_st)* h, scope const(
        ubyte)* id, size_t id_len, scope const(ubyte)* msg, int msg_len, scope const(ep_st)* mpk) @system @nogc nothrow pure;
extern (C) int cp_pokdl_prv(scope bn_st* c, scope bn_st* r, scope const(ep_st)* y, scope const(
        bn_st)* x) @system @nogc nothrow pure;
extern (C) int cp_pokdl_ver(scope const(bn_st)* c, scope const(bn_st)* r, scope const(ep_st)* y) @system @nogc nothrow pure;
extern (C) int cp_pokor_prv(scope bn_t* c, scope bn_t* r, scope const(ec_t)* y, scope const(bn_st)* x) @system @nogc nothrow pure;
extern (C) int cp_pokor_ver(scope const(bn_t)* c, scope const(bn_t)* r, scope const(ec_t)* y) @system @nogc nothrow pure;
extern (C) int cp_sokdl_sig(scope bn_st* c, scope bn_st* r, scope const(ubyte)* msg, size_t len, scope const(
        ep_st)* y, scope const(bn_st)* x) @system @nogc nothrow pure;
extern (C) int cp_sokdl_ver(scope const(bn_st)* c, scope const(bn_st)* r, scope const(ubyte)* msg, size_t len, scope const(
        ep_st)* y) @system @nogc nothrow pure;
extern (C) int cp_sokor_sig(scope bn_t* c, scope bn_t* r, scope const(ubyte)* msg, size_t len, scope const(
        ec_t)* y, scope const(ec_t)* g, scope const(bn_st)* x, int first) @system @nogc nothrow pure;
extern (C) int cp_sokor_ver(scope const(bn_t)* c, scope const(bn_t)* r, scope const(ubyte)* msg, size_t len, scope const(
        ec_t)* y, scope const(ec_t)* g) @system @nogc nothrow pure;
extern (C) int cp_ers_gen(scope ep_st* pp) @system @nogc nothrow pure;
extern (C) int cp_ers_gen_key(scope bn_st* sk, scope ep_st* pk) @system @nogc nothrow pure;
extern (C) int cp_ers_sig(scope bn_st* td, scope ers_t* p, scope const(ubyte)* msg, size_t len, scope const(
        bn_st)* sk, scope const(ep_st)* pk, scope const(ep_st)* pp) @system @nogc nothrow pure;
extern (C) int cp_ers_ver(scope const(bn_st)* td, scope const(ers_t)* s, size_t size, scope const(
        ubyte)* msg, size_t len, scope const(ep_st)* pp) @system @nogc nothrow pure;
extern (C) int cp_ers_ext(scope bn_st* td, scope ers_t* p, scope size_t* size, scope const(ubyte)* msg, size_t len, scope const(
        ep_st)* pk, scope const(ep_st)* pp) @system @nogc nothrow pure;
extern (C) int cp_smlers_sig(scope bn_st* td, scope smlers_t* p, scope const(ubyte)* msg, size_t len, scope const(
        bn_st)* sk, scope const(ep_st)* pk, scope const(ep_st)* pp) @system @nogc nothrow pure;
extern (C) int cp_smlers_ver(scope bn_st* td, scope smlers_t* s, size_t size, scope const(ubyte)* msg, size_t len, scope const(
        ep_st)* pp) @system @nogc nothrow pure;
extern (C) int cp_smlers_ext(scope bn_st* td, scope smlers_t* p, scope size_t* size, scope const(
        ubyte)* msg, size_t len, scope const(ep_st)* pk, scope const(ep_st)* pp) @system @nogc nothrow pure;
extern (C) int cp_etrs_sig(scope bn_t* td, scope bn_t* y, size_t max, scope etrs_st* p, scope const(
        ubyte)* msg, size_t len, scope const(bn_st)* sk, scope const(ep_st)* pk, scope const(ep_st)* pp) @system @nogc nothrow pure;
extern (C) int cp_etrs_ver(size_t thres, scope const(bn_t)* td, scope const(bn_t)* y, size_t max, scope const(
        etrs_t)* s, size_t size, scope const(ubyte)* msg, size_t len, scope const(ep_st)* pp) @system @nogc nothrow pure;
extern (C) int cp_etrs_ext(scope bn_t* td, scope bn_t* y, size_t max, scope etrs_t* p, scope size_t* size, scope const(
        ubyte)* msg, size_t len, scope const(ep_st)* pk, scope const(ep_st)* pp) @system @nogc nothrow pure;
extern (C) int cp_etrs_uni(int thres, scope bn_t* td, scope bn_t* y, int max, scope etrs_t* p, scope size_t* size, scope const(
        ubyte)* msg, size_t len, scope const(bn_st)* sk, scope const(ep_st)* pk, scope const(ep_st)* pp) @system @nogc nothrow pure;
extern (C) int cp_ped_com(scope ep_st* c, scope ep_st* h, scope bn_st* r, scope bn_st* x) @system @nogc nothrow pure;
extern (C) int cp_cmlhs_init(scope ep_st* h) @system @nogc nothrow pure;
extern (C) int cp_cmlhs_gen(scope bn_t* x, scope gt_t* hs, size_t len, scope ubyte* prf, size_t plen, scope bn_st* sk, scope ep2_st* pk, scope bn_st* d, scope ep2_st* y, int bls) @system @nogc nothrow pure;
extern (C) int cp_cmlhs_sig(scope ep_st* sig, scope ep2_st* z, scope ep_st* a, scope ep_st* c, scope ep_st* r, scope ep2_st* s, scope const(
        bn_st)* msg, scope const(char)* data, int label, scope const(bn_st)* x, scope const(ep_st)* h, scope const(
        ubyte)* prf, size_t plen, scope const(bn_st)* sk, scope const(bn_st)* d, int bls) @system @nogc nothrow pure;
extern (C) int cp_cmlhs_fun(scope ep_st* a, scope ep_st* c, scope const(g1_t)* as, scope const(g1_t)* cs, scope const(
        dig_t)* f, size_t len) @system @nogc nothrow pure;
extern (C) int cp_cmlhs_evl(scope ep_st* r, scope ep2_st* s, scope const(g1_t)* rs, scope const(
        g2_t)* ss, scope const(dig_t)* f, size_t len) @system @nogc nothrow pure;
extern (C) int cp_cmlhs_ver(scope const(ep_st)* r, scope const(ep2_st)* s, scope const(g1_t)* sig, scope const(
        g2_t)* z, scope const(g1_t)* a, scope const(g1_t)* c, scope const(bn_st)* m, scope const(
        char)* data, scope const(ep_st)* h, scope const(int)* label, scope const(gt_t*)* hs, scope const(
        dig_t*)* f, scope const(size_t)* flen, scope const(g2_t)* y, scope const(g2_t)* pk, size_t slen, int bls) @system @nogc nothrow pure;
extern (C) void cp_cmlhs_off(scope fp6_t* vk, scope const(ep_st)* h, scope const(int)* label, scope const(
        gt_t*)* hs, scope const(dig_t*)* f, scope const(size_t)* flen, size_t slen) @system @nogc nothrow pure;
extern (C) int cp_cmlhs_onv(scope const(ep_st)* r, scope const(ep2_st)* s, scope const(g1_t)* sig, scope const(
        g2_t)* z, scope const(g1_t)* a, scope const(g1_t)* c, scope const(bn_st)* msg, scope const(
        char)* data, scope const(ep_st)* h, scope const(fp6_t)* vk, scope const(g2_t)* y, scope const(
        g2_t)* pk, size_t slen, int bls) @system @nogc nothrow pure;
extern (C) int cp_mklhs_gen(scope bn_st* sk, scope ep2_st* pk) @system @nogc nothrow pure;
extern (C) int cp_mklhs_sig(scope ep_st* s, scope const(bn_st)* m, scope const(char)* data, scope const(
        char)* id, scope const(char)* tag, scope const(bn_st)* sk) @system @nogc nothrow pure;
extern (C) int cp_mklhs_fun(scope bn_st* mu, scope const(bn_t)* m, scope const(dig_t)* f, size_t len) @system @nogc nothrow pure;
extern (C) int cp_mklhs_evl(scope ep_st* sig, scope const(g1_t)* s, scope const(dig_t)* f, size_t len) @system @nogc nothrow pure;
extern (C) int cp_mklhs_ver(scope const(ep_st)* sig, scope const(bn_st)* m, scope const(bn_t)* mu, scope const(
        char)* data, scope const(char*)* id, scope const(char*)* tag, scope const(dig_t*)* f, scope const(
        size_t)* flen, scope const(g2_t)* pk, size_t slen) @system @nogc nothrow pure;
extern (C) int cp_mklhs_off(scope g1_t* h, scope dig_t* ft, scope const(char*)* id, scope const(
        char*)* tag, scope const(dig_t*)* f, scope const(size_t)* flen, size_t slen) @system @nogc nothrow pure;
extern (C) int cp_mklhs_onv(scope const(ep_st)* sig, scope const(bn_st)* m, scope const(bn_t)* mu, scope const(
        char)* data, scope const(char*)* id, scope const(g1_t)* h, scope const(dig_t)* ft, scope const(
        g2_t)* pk, size_t slen) @system @nogc nothrow pure;
extern (C) int cp_rsapsi_gen(scope bn_st* g, scope bn_st* n, size_t bits) @system @nogc nothrow pure;
extern (C) int cp_rsapsi_ask(scope bn_st* d, scope bn_st* r, scope bn_t* p, scope const(bn_st)* g, scope const(
        bn_st)* n, scope const(bn_t)* x, size_t m) @system @nogc nothrow pure;
extern (C) int cp_rsapsi_ans(scope bn_t* t, scope bn_t* u, scope const(bn_st)* d, scope const(bn_st)* g, scope const(
        bn_st)* n, scope const(bn_t)* y, size_t l) @system @nogc nothrow pure;
extern (C) int cp_rsapsi_int(scope bn_t* z, scope size_t* len, scope const(bn_st)* r, scope const(
        bn_t)* p, scope const(bn_st)* n, scope const(bn_t)* x, const(size_t) m, scope const(bn_t)* t, scope const(
        bn_t)* u, size_t l) @system @nogc nothrow pure;
extern (C) int cp_shipsi_gen(scope bn_st* g, scope crt_st* crt, size_t bits) @system @nogc nothrow pure;
extern (C) int cp_shipsi_ask(scope bn_st* d, scope bn_st* r, scope bn_t* p, scope const(bn_st)* g, scope const(
        bn_st)* n, scope const(bn_t)* x, size_t m) @system @nogc nothrow pure;
extern (C) int cp_shipsi_ans(scope bn_t* t, scope bn_st* u, scope bn_st* d, scope const(bn_st)* g, scope const(
        crt_st)* crt, scope const(bn_t)* y, const(size_t) n) @system @nogc nothrow pure;
extern (C) int cp_shipsi_int(scope bn_t* z, scope size_t* len, scope const(bn_st)* r, scope const(
        bn_t)* p, scope const(bn_st)* n, scope const(bn_t)* x, size_t m, scope const(bn_t)* t, scope const(
        bn_st)* u, size_t l) @system @nogc nothrow pure;
extern (C) int cp_pbpsi_gen(scope bn_st* sk, scope ep_st* ss, scope g2_t* s, size_t m) @system @nogc nothrow pure;
extern (C) int cp_pbpsi_ask(scope g2_t* d, scope bn_st* r, scope const(bn_t)* x, scope const(g2_t)* s, size_t m) @system @nogc nothrow pure;
extern (C) int cp_pbpsi_ans(scope gt_t* t, scope g1_t* u, scope const(ep_st)* ss, scope const(
        ep2_st)* d, scope const(bn_t)* y, size_t n) @system @nogc nothrow pure;
extern (C) int cp_pbpsi_int(scope bn_t* z, scope size_t* len, scope const(g2_t)* d, scope const(
        bn_t)* x, size_t m, scope const(gt_t)* t, scope const(g1_t)* u, size_t n) @system @nogc nothrow pure;
extern (C) int bc_aes_cbc_enc(scope ubyte* _out, scope size_t* out_len, scope const(ubyte)* _in, size_t in_len, scope const(
        ubyte)* key, size_t key_len, scope const(ubyte)* iv) @system @nogc nothrow pure;
extern (C) int bc_aes_cbc_dec(scope ubyte* _out, scope size_t* out_len, scope const(ubyte)* _in, size_t in_len, scope const(
        ubyte)* key, size_t key_len, scope const(ubyte)* iv) @system @nogc nothrow pure;
extern (C) void md_map_sh224(scope ubyte* hash, scope const(ubyte)* msg, size_t len) @system @nogc nothrow pure;
extern (C) void md_map_sh256(scope ubyte* hash, scope const(ubyte)* msg, size_t len) @system @nogc nothrow pure;
extern (C) void md_map_sh384(scope ubyte* hash, scope const(ubyte)* msg, size_t len) @system @nogc nothrow pure;
extern (C) void md_map_sh512(scope ubyte* hash, scope const(ubyte)* msg, size_t len) @system @nogc nothrow pure;
extern (C) void md_map_b2s160(scope ubyte* hash, scope const(ubyte)* msg, size_t len) @system @nogc nothrow pure;
extern (C) void md_map_b2s256(scope ubyte* hash, scope const(ubyte)* msg, size_t len) @system @nogc nothrow pure;
extern (C) void md_kdf(scope ubyte* key, size_t key_len, scope const(ubyte)* _in, size_t in_len) @system @nogc nothrow pure;
extern (C) void md_mgf(scope ubyte* mask, size_t mask_len, scope const(ubyte)* _in, size_t in_len) @system @nogc nothrow pure;
extern (C) void md_hmac(scope ubyte* mac, scope const(ubyte)* _in, size_t in_len, scope const(ubyte)* key, size_t key_len) @system @nogc nothrow pure;
extern (C) void md_xmd_sh224(scope ubyte* buf, size_t buf_len, scope const(ubyte)* _in, size_t in_len, scope const(
        ubyte)* dst, size_t dst_len) @system @nogc nothrow pure;
extern (C) void md_xmd_sh256(scope ubyte* buf, size_t buf_len, scope const(ubyte)* _in, size_t in_len, scope const(
        ubyte)* dst, size_t dst_len) @system @nogc nothrow pure;
extern (C) void md_xmd_sh384(scope ubyte* buf, size_t buf_len, scope const(ubyte)* _in, size_t in_len, scope const(
        ubyte)* dst, size_t dst_len) @system @nogc nothrow pure;
extern (C) void md_xmd_sh512(scope ubyte* buf, size_t buf_len, scope const(ubyte)* _in, size_t in_len, scope const(
        ubyte)* dst, size_t dst_len) @system @nogc nothrow pure;
