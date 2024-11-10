#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "main.h" // Inclua suas definições de tipo e declarações de função

// Funções de impressão
void printInt(void *data) {
    printf("  Dado: %d\n", *(int*)data);
}

void printDouble(void *data) {
    printf("  Dado: %.1f\n", *(double*)data);
}

void printString(void *data) {
    printf("  Dado: %s\n", *(char**)data);
}

// Função para testar e exibir uma WebList de inteiros
void testWebListIntegers() {
    pweblist webInt;
    if (cWL(&webInt, 0, sizeof(int)) == SUCCESS) {
        printf("Testing integer WebList:\n");

        int intValues[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30};
        for (int i = 0; i < 30; i++) {
            if (iDado(webInt, &intValues[i]) == FAIL) {
                printf("Failed to insert integer: %d\n", intValues[i]);
            } else {
                printf("Inserted integer: %d\n", intValues[i]);
            }
        }

        pLista(webInt, printInt);
        
        // Remover dados e verificar balanceamento
        int removeInt[] = {25, 17};
        for (int i = 0; i < 2; i++) {
            if (rDado(webInt, &removeInt[i]) == FAIL) {
                printf("Failed to remove integer: %d\n", removeInt[i]);
            } else {
                printf("Removed integer: %d\n", removeInt[i]);
            }
        }

        if (balanceWebList(webInt) == SUCCESS) {
            printf("WebList is balanced\n");
        } else {
            printf("WebList is not balanced\n");
        }

        // Mostrar a WebList
        pLista(webInt, printInt);
        
        dWL(&webInt); // Liberar a WebList
    }
}

// Função para testar e exibir uma WebList de nível 1
// Função para testar e exibir uma WebList de nível 1
void testWebListLevel1() {
    pweblist webInt;
    if (cWL(&webInt, 1, sizeof(int)) == SUCCESS) {
        printf("\nTesting integer WebList at level 1 with 8000 elements:\n");

        // Inserir 8000 elementos
        for (int i = 0; i < 100; i++) {
            if (iDado(webInt, &i) == FAIL) {
                printf("Failed to insert integer: %d\n", i);
            } else {
                printf("Inserted integer: %d\n", i);
            }
        }

        // Exibir a WebList
        pLista(webInt, printInt);
        
        // Verificar balanceamento
        if (balanceWebList(webInt) == SUCCESS) {
            printf("WebList is balanced after insertion\n");
        } else {
            printf("WebList is not balanced after insertion\n");
        }

        dWL(&webInt); // Liberar a WebList
    }
}

// Função principal
int main() {
    // Testar WebList de inteiros
    testWebListIntegers();

    // Testar WebList de nível 1
    testWebListLevel1();

    return 0;
}
