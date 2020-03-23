/* l4_util.h */
#include <stdio.h>
#include <string.h>
#include <string.h>

#define PHEX3_1 "F7E75FDC469067FFDC4E847C51F452DF"
#define QHEX3_1 "E85CED54AF57E53E092113E62F436F4F"
#define EHEX3_1 "0D88C3"

#define DHEX3_2 "74D806F9F3A62BAE331FFE3F0A68AFE35B3D2E4794148AACBC26AA381CD7D30D"
#define NHEX3_2 "DCBFFE3E51F62E09CE7032E2677A78946A849DC4CDDE3A4D0CB81629242FB1A5"
#define MHEX3_2 "4120746f702073656372657421"
#define EHEX3_2 "010001"

#define CHEX3_3 "8C0F971DF2F3672B28811407E2DABBE1DA0FEBBBDFC7DCB67396567EA1E2493F"

#define SIGHEX3_4 "239a09ea0d5fdaea94ec97130b1c74c89764226065bbe614da7fb9f851be7beabd5f8ece4b06c84c8bf49162e2c914fc8c8b6bd98b9ed086fb3bdb7f74fc5075424541fc8911c6c87953d5377d38fff94ecb0cb86018d3f00c5a1d418cf9e65e19dd56a947ae301fc73ffc9d513ece60e85373a4408f6958a466e41044a3b924d3e85c4ea6afaa86b2cfe388f70873d8513c1c10df65ccdfdb00cbd7d7a5f08dc7f3e5f40b500ac7913796dd11a71d88aaf53f728ab1584b80ea7e32e378679b247297df7b562b08efd4a56e1861f41dcd1d17d58e1015a8c5c580862167e884876ce72ff539e8da7397bd86cca42ac02576b778ad4a96943c6ae1b33f27a8dd"
#define MHEX3_4p1 "I owe you $2000"
#define MHEX3_4p2 "I owe you $3000"

#define MHEX3_5 "Launch a missle."
#define SHEX3_5 "643D6F34902D9C7EC90CB0B2BCA36C47FA37165C0005CAB026C0542CBDB6802F"
#define SHEX3_5p2 "643D6F34902D9C7EC90CB0B2BCA36C47FA37165C0005CAB026C0542CBDB6803F"
#define EHEX3_5 "010001"
#define NHEX3_5 "AE1CD4DC432798D933779FBD46C6E1247F0CF1233595113AA51B450F18116115"

#define N6 "D753A40451F899A616484B6727AA9349D039ED0CB0B00087F1672886858C8E63DABCB14038E2D3F5ECA50518B83D3EC5991732EC188CFAF10CA6642185CB071034B052882B1F689BD2B18F12B0B3D2E7881F1FEF387754535F80793F2E1AAAA81E4B2B0DABB763B935B77D14BC594BDF514AD2A1E20CE29082876AAEEAD764D69855E8FDAF1A506C54BC11F2FD4AF29DBB7F0EF4D5BE8E16891255D8C07134EEF6DC2DECC48725868DD821E4B04D0C89DC392617DDF6D79485D80421709D6F6FFF5CBA19E145CB5657287E1C0D4157AAB7B827BBB1E4FA2AEF2123751AAD2D9B86358C9C77B573ADD8942DE4F30C9DEEC14E627E17C0719E2CDEF1F910281933"
#define E6 "010001"
#define S6 "700f5a96a758e5bf8a9da827982b007f26a907daba7b82544faf69cfbcf259032bf2d5745825d81ea42076626029732ad7dccc6f77856bca6d24f83513473fd2e2690a9d342d7b7b9bcd1e75d5506c3ecb1ca330b1aa9207a93a767645bd7891c4ce1a9e22e40b89bae68cc17982a3b8d4c0fc1f2ded4d5255412aa83a2cad0772ae0ad2c667c44f07171899f765a95760155a344c11cff6cf6b213680efc6f15463263539eebbc483649b240a73eca0481673c8b9d7485556987af7bb975c69a406180478dafe9876be222f7f0777874e88199af855ec5c122a5948db493e155e675aa25eeecc53288c0e33931403640bc5e5780994015a75fc929dafed7a29"
#define calcHASH6 "85088f934d3e58e3673ea5be32c7c8cf6965e4ab93fbed4fff634723f46d5693"




#define NBITS 256

BIGNUM *RSA_get_priv(BIGNUM* p, BIGNUM* q, BIGNUM* e){
    BN_CTX *ctx = BN_CTX_new();
    BIGNUM* p_minus_one = BN_new();
    BIGNUM* q_minus_one = BN_new();
    BIGNUM* one = BN_new();
    BIGNUM* ret = BN_new();

    BN_dec2bn(&one, "1");
    BN_sub(p_minus_one, p, one);
    BN_sub(q_minus_one, q, one);
    BN_mul(ret, p_minus_one, q_minus_one, ctx);

    BIGNUM* res = BN_new();
    BN_mod_inverse(res, e, ret, ctx);
    BN_CTX_free(ctx);
    return res;
}

void printBN(char *msg, BIGNUM * a)
{
    /* Use BN_bn2hex(a) for hex string
     *
     * * Use BN_bn2dec(a) for decimal string */
    char * number_str = BN_bn2hex(a);
    printf("%s %s\n", msg, number_str);
    OPENSSL_free(number_str);
}

BIGNUM* RSA_ENC(BIGNUM* message, BIGNUM* mod, BIGNUM* pub_key){
    BN_CTX *ctx = BN_CTX_new();
    BIGNUM* enc = BN_new();
    BN_mod_exp(enc, message, mod, pub_key, ctx);
    BN_CTX_free(ctx);
    return enc;
}

BIGNUM* RSA_DEC(BIGNUM* enc, BIGNUM* priv_key, BIGNUM* pub_key){
    BN_CTX *ctx = BN_CTX_new();
    BIGNUM* dec = BN_new();
    BN_mod_exp(dec, enc, priv_key, pub_key, ctx);
    BN_CTX_free(ctx);
    return dec;
}
int hex2int(char c){
    // return (int)strtol(c, NULL, 16);
    if (c >= 97)
        c = c - 32;
    int first = c / 16 - 3;
    int second = c % 16;
    int res = first * 10 + second;
    if (res > 9) res--;
    return res;
}

int hex2ascii(const char c, const char d){return (hex2int(c) * 16) + hex2int(d);}

void printHEX(const char* st){
    int length = strlen(st);
    if (length % 2 != 0) {
        printf("%s\n", "hex length needs to be even.");
        return;
    }
    int i;
    char buf = 0;
    for(i = 0; i < length; i++) {
        if(i % 2 != 0)
            printf("%c", hex2ascii(buf, st[i]));
        else
            buf = st[i];
    }
    printf("\n");
}
