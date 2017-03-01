defmodule Math do 
   def get_fibonnacci_list(limit) do

		get_fibonnacci_list(limit,[2,1])

	end	

	def get_fibonnacci_list(limit, list) do
   		[a|[b|_]] = list
   		
		next = a + b

		if  next < limit do
			get_fibonnacci_list(limit,[next| list])
		else
			list
		end	
	end	

	def is_prime(number) do 
		if Enum.member?([1,2,3], number) do
			true
		else
			Enum.all?(2..round(:math.sqrt(number)) , fn(x)-> rem(number, x)>0 end )
		end
	end

	def possible_primes(number) do
		Enum.filter(2..number  - 1 , fn(x)-> is_prime(x) and rem(number, x )==0 end )
	end

	def next_prim_number(number) do
		number = number + 1
		if is_prime(number) do 
			number
		else
			next_prim_number(number)
		end
	end

	def descomposicion_factorial(number) do
		factor_list = []
		descomposicion_factorial(number, factor_list, 2)	
	end

	def descomposicion_factorial(number, factor_list, prim_ref) do
		if number == 1 do
			factor_list
		else
			if rem(number, prim_ref) == 0 do
				factor_list = [prim_ref| factor_list]
				descomposicion_factorial(div(number, prim_ref), factor_list, prim_ref)
			else	
				prim_ref = next_prim_number(prim_ref)
				descomposicion_factorial(number, factor_list, prim_ref)

			end
		end
	end

	def obtener_mayor_palindromo() do
		dif = 0 
		max_palindromo = 0

		hayar_palindromos_variando_diferencia_entre_numeros_a_multiplicar(dif, max_palindromo)
	end

	def hayar_palindromos_variando_diferencia_entre_numeros_a_multiplicar(diff, max_palindromo) do
		palindromo_actual = max_palindromo

		if test_if_we_can_get_a_bigger_palindromic(diff, palindromo_actual) do
			palindromo_actual = hayar_un_palindromo_mayor(palindromo_actual, 999, 999 - diff) 	
			hayar_palindromos_variando_diferencia_entre_numeros_a_multiplicar(diff+1, palindromo_actual)
		else
			palindromo_actual	
		end

	end

	def hayar_un_palindromo_mayor(palindromo_actual, numero_1, numero_2) do
		producto = numero_1 * numero_2
		if producto > palindromo_actual do
			if Palindromo.es_palindromo(producto) do
				producto
			else
			lower_numbers_to_multiply_and_test_if_zero_has_been_reached(palindromo_actual, numero_1, numero_2)
			end	
		else
		IO.puts producto	
		palindromo_actual
		end
	end	

	def lower_numbers_to_multiply_and_test_if_zero_has_been_reached(palindromo_actual, numero_1, numero_2) do
		next_numero_1 = numero_1 - 1
		next_numero_2 = numero_2 - 1

		if numero_2 == 0 do
			palindromo_actual
		else
			hayar_un_palindromo_mayor(palindromo_actual, next_numero_1, next_numero_2)
		end

	end

	def test_if_we_can_get_a_bigger_palindromic(diff, palindromo_actual) do
		(999 * (999 - diff)) > palindromo_actual
	end
end



# Ejercicio 3. Factor primo mas grande

# Enum.max(Math.possible_primes(600851475143))






# GENERAR LISTAS DE NUMEROS Y APLICAR OPERACION Enum.map(1..3, &Math.dup/1)
# DIVISION div("dividendo", "divisor")

# OBTENER EL MINIMO DE UNA LISTA
# b = [4,5]
# Enum.min(b)

# Realizar filtrado de listas numericas
# Enum.filter

# Ejercicio 1 - TOTAL
# Enum.sum(Enum.filter(1..total, fn(s)-> rem(s,3) == 0 || rem(s,5) == 0 end))

# Ejercicio 2 -> 4000000
# Enum.sum(Enum.filter(Math.get_fibonnacci_list(4000000), fn(s) -> rem(s,2) == 1 end))
