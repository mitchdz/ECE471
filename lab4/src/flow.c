#include <stdio.h>
#include <string.h>
#include <openssl/bn.h>

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


int main ()
{
    BN_CTX *ctx = BN_CTX_new();
    BIGNUM *p = BN_new();
    BIGNUM *q = BN_new();
    BIGNUM *e = BN_new();
    BIGNUM *n = BN_new();
    BIGNUM *res = BN_new();

    // part 3.1
    // Initialize p, q, e
    BN_dec2bn(&p, PHEX3_1);
    BN_dec2bn(&q, QHEX3_1);
    BN_dec2bn(&e, EHEX3_1);

    BIGNUM *part1PrivatKey = RSA_get_priv(p, q, e);
    printf("(3.1)\n");
    printBN("The Private key is: ", part1PrivatKey); printf("\n");

    // Part 3.2
    printf("(3.2)\n");   
    BIGNUM* enc = BN_new();
    BIGNUM* dec = BN_new();
    // Init private key d
    BIGNUM* privateKey3_2 = BN_new();
    BN_hex2bn(&privateKey3_2, DHEX3_2);

    BIGNUM* publicKey = BN_new();
    BN_hex2bn(&publicKey, NHEX3_2);
    printBN("Public key: ", publicKey);
    printf("\n");

    BIGNUM* mod = BN_new();
    BN_hex2bn(&mod, EHEX3_2);
    
    BIGNUM* message = BN_new();
    BN_hex2bn(&message, MHEX3_2);

    printBN("Message Hex:", message);
    enc = RSA_ENC(message, mod, publicKey);
    printBN("Encrypted message:", enc);
    dec = RSA_DEC(enc, privateKey3_2, publicKey);
    printf("Decrypted message: ");
    printHEX(BN_bn2hex(dec));
    printf("\n");

    // Part 3.3
    printf("(3.3)\n");
    BIGNUM* task3_C = BN_new();
    BN_hex2bn(&task3_C, CHEX3_3);
    
    dec = RSA_DEC(task3_C, privateKey3_2, publicKey);
    printf("Decrypted message: "); printHEX(BN_bn2hex(dec)); printf("\n");


    // part 3.4 Signing a Message
    printf("(3.4)\n");
    BIGNUM* BN_t4 = BN_new();
    BN_hex2bn(&BN_t4, "49206f776520796f75202432303030"); // python -c ’print("I owe you $2000".encode("hex"))’
    enc = RSA_ENC(BN_t4, privateKey3_2, publicKey);
    printBN("Signature: ", enc);
    dec = RSA_DEC(enc, mod, publicKey);
    printf("message: "); printHEX(BN_bn2hex(dec));

    BN_hex2bn(&BN_t4, "49206f776520796f75202433303030"); // python -c ’print("I owe you $2000".encode("hex"))’
    enc = RSA_ENC(BN_t4, privateKey3_2, publicKey);
    printBN("Signature: ", enc);
    dec = RSA_DEC(enc, mod, publicKey);
    printf("message: "); printHEX(BN_bn2hex(dec)); printf("\n");

    // Part 3.5 Verifying a signature
    printf("(3.5)\n");
    BIGNUM *BN_t5 = BN_new();
    BIGNUM *S = BN_new();
    BN_hex2bn(&BN_t5, "4c61756e63682061206d6973736c652e");
    BN_hex2bn(&publicKey, EHEX3_5);
    BN_hex2bn(&S, SHEX3_5);


    dec = RSA_DEC(S, mod, publicKey);
    printf("message: "); printHEX(BN_bn2hex(dec)); printf("\n");




    // Part 3.6 Manually Verifying an X.509 Certificate



    OPENSSL_free(ctx);
    return 0;
}