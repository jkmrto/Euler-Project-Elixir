defmodule Ej5 do 

	def get_minimun_common_multiple(number) do

		Agent.start_link(fn -> %{} end, name: :agente)
		Agent.update(:agente, &Map.put(&1, :"max_number", number))
		analize_factor_and_update_mcm(1, %{}, number)
	end

	def analize_factor_and_update_mcm(current_mcm, prime_factors_included, current_index) do 
		set = Agent.get(:agente, &Map.get(&1, :"max_number"))
		
		update_primes_factor_counter_and_current_mcm_calculated(Math.descomposicion_factorial(current_index), current_mcm)

	end

	def update_primes_factor_counter_and_current_mcm_calculated(primes_factor_counted, current_number) do
		[primes_factor_counted, current_number]
	end
end