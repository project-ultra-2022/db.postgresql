# tipos de datos <<caracteres>>

VARCHAR sucesión de caracteres de longitud variable limitada

CHAR sucesión de caracteres de longitud fija

TEXT cadena de caracteres de longitud variable ilimitada

DATE sirve para almacenar valores de tipo fecha y hora DATE almacena una fecha en el rango de 4713 a.C y 
32.767 d.C

# Tipo de datos de fechas y horas
 
DATE sirve para almacenar valores de tipo fecha y hora DATE almacena una fecha en el rango de 4713 a.C y 
32.767 d.C

# Tipo de datos <<numéricos>>
SMALLINT, int2: entero con signo sobre 2 bytes.

INTEGER, int, int4: entero con signo sobre 4 bytes.

BIGINT, int8: entero con signo sobre 8 bytes.

SERIAL es integer que es entero y auto increment que es auto incrementable

BIGSERIAL, serial8: entero sobre 8 bytes con incremento automático. Es un entero asociado a una secuencia.

REAL, float4: número en coma flotante de precisión simple sobre 4 bytes con 6 decimales.

DOUBLE PRECISION, float8: número en coma flotante de precisión doble sobre 8 bytes con 15 decimales.

NUMERIC [ (p, s) ], decimal [ (p, s) ]: número exacto de precisión indicada. Este tipo es particularmente recomendable para los valores monetarios o todos los tipos numéricos donde la parte flotante no deba variar. Las indicaciones se corresponden con el número total de dígitos (p) después de la parte decimal (s).

No existen tipos u opciones que definan un tipo no firmado. Por lo tanto, los rangos de valores se definen centrados en el cero.
  
# borrar una base de datos

Para borrar una base de datos lo primero que toca hacer es desconectarla, ya despues de eso podemos poner

Drop database if exists "Nombre del servidor"

o darle click derecho en el servidor y darle en Delete/Drop


