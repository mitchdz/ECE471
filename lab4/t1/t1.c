#include <stdio.h>
#include <openssl/bn.h>

#define p F7E75FDC469067FFDC4E847C51F452DF
#define q E85CED54AF57E53E092113E62F436F4F
#define e 0D88C3

#define NBITS 256

void printBN(char *msg, BIGNUM * a);

int main ()
{
        BN_CTX *ctx = BN_CTX_new();
        BIGNUM *a = BN_new();
        BIGNUM *b = BN_new();
        BIGNUM *n = BN_new();
        BIGNUM *res = BN_new();

        // Initialize a, b, n
        BN_generate_prime_ex(a, NBITS, 1, NULL, NULL, NULL);
        BN_dec2bn(&b, "273489463796838501848592769467194369268");
        BN_rand(n, NBITS, 0, 0);

        //res = a*b
        BN_mul(res, a, b, ctx);
        printBN("a * b = ", res);

        // res = aˆb mod n
        BN_mod_exp(res, a, b, n, ctx);
        printBN("aˆc mod n = ", res);

        return 0;

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
