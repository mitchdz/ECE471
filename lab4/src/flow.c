/* flow.c */
#include <stdio.h>
#include <string.h>
#include <openssl/bn.h>
#include "l4_util.h"

int main ()
{
    printf("Lab 4 RSA Public-Key Encryption and Signature Lab\n");
    // part 3.1 Deriving a private key
    BIGNUM *p = BN_new();
    BIGNUM *q = BN_new();
    BIGNUM *e = BN_new();

    // Initialize p, q, e
    BN_dec2bn(&p, "F7E75FDC469067FFDC4E847C51F452DF");
    BN_dec2bn(&q, "E85CED54AF57E53E092113E62F436F4F");
    BN_dec2bn(&e, "0D88C3"); //modulus

    BIGNUM *part1PrivatKey = RSA_get_priv(p, q, e);
    printf("(3.1)\n");
    printBN("Task 1 private key ", part1PrivatKey);
    printf("\n");

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

    /* Part 3.3 */
    printf("(3.3)\n");
    BIGNUM* task3_C = BN_new();
    BN_hex2bn(&task3_C, CHEX3_3);

    dec = RSA_DEC(task3_C, privateKey3_2, publicKey);
    printf("Decrypted message: "); printHEX(BN_bn2hex(dec)); printf("\n");

    /* part 3.4 Signing a Message */
    printf("(3.4)\n");
    BIGNUM* BN_t4 = BN_new();

    // python -c ’print("I owe you $2000".encode("hex"))’
    BN_hex2bn(&BN_t4, "49206f776520796f75202432303030"); 
    enc = RSA_ENC(BN_t4, privateKey3_2, publicKey);
    printBN("Signature: ", enc);
    dec = RSA_DEC(enc, mod, publicKey);
    printf("message: "); printHEX(BN_bn2hex(dec));

    // python -c ’print("I owe you $3000".encode("hex"))’
    BN_hex2bn(&BN_t4, "49206f776520796f75202433303030");
    enc = RSA_ENC(BN_t4, privateKey3_2, publicKey);
    printBN("Signature: ", enc);
    dec = RSA_DEC(enc, mod, publicKey);
    printf("message: "); printHEX(BN_bn2hex(dec)); printf("\n");


    /* Part 3.5 Verifying a signature */
    printf("(3.5)\n");
    BIGNUM *S = BN_new();

    BN_hex2bn(&publicKey, NHEX3_5);
    BN_hex2bn(&S, SHEX3_5);

    // correct signature
    dec = RSA_DEC(S, mod, publicKey);
    printf("message (regular) : "); printHEX(BN_bn2hex(dec)); printf("\n");

    // corrupted signature
    BN_hex2bn(&S, SHEX3_5p2);
    dec = RSA_DEC(S, mod, publicKey);
    printHEX(BN_bn2hex(dec)); printf("\n");

    /* Part 3.6 Manually Verifying an X.509 Certificate */
    printf("(3.6)\n");

    return 0;
}
