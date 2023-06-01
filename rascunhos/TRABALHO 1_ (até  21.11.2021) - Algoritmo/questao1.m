clear
format long

printf("Questão 1A) \n")

printf("\n Armazenamento em float: |1|10000011|11100000011110101110001|\n")

printf("\n s = 1") #negativo
printf("\n e = 10000011") #o expoente é 4 + 127 = 131
printf("\n f = 11100000011110101110001") #30,03 = 11110,0000011110101110000|1010001111... A | mostra onde foi feito o arredondamento

printf("\n\n------------------------------------------------------------\n\n")

printf("Questão 1B) \n")


original = -30.03; #double
originalSingle = single(original);

printf("\n Número em float (single): %f", originalSingle)

erro = ((double(originalSingle)-original)/original)*100;
printf("\n Erro percentual: %e %%", erro)

printf("\n\n------------------------------------------------------------\n\n")