	defmodule Palindromo do

		def es_palindromo(numero) do
			lista = number_to_list(numero)
			long = length(lista)
			evaluar_pares_numeros(lista, long, 0)

		end

		def evaluar_pares_numeros(lista, long, i_ref) do
			if Enum.at(lista, i_ref) == Enum.at(lista, (long-1)-i_ref) do

				if (i_ref + 1) >= div(long, 2) do
					true
				else
					evaluar_pares_numeros(lista, long, i_ref + 1) 
				end
			else
				false
			end
		end


		def number_to_list(number) do
			number_to_list(number, [], 1)
		end

		def number_to_list(number, previously_descomposed, digit_pos) do 
			cociente = div(number, elevar_numero_potencia(10,digit_pos))
			new_digit = rem(number, elevar_numero_potencia(10,digit_pos))  - rem(number, elevar_numero_potencia(10,digit_pos - 1)) 
			list_descomposed  = [div(new_digit, elevar_numero_potencia(10, digit_pos - 1)) | previously_descomposed]

			if cociente > 0 do
				number_to_list(number, list_descomposed, digit_pos + 1 )
			else
				list_descomposed
			end
		end

		def elevar_numero_potencia(base, exponente) do

			elevar_numero_potencia(base, exponente, 1)		
	
		end

		def elevar_numero_potencia(base, exponente, resultado_acumulado) do

			if exponente > 0 do
				resultado_acumulado = resultado_acumulado * base
				elevar_numero_potencia(base, exponente - 1, resultado_acumulado)
			else
				resultado_acumulado
			end 

		end
	end