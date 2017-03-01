defmodule Simple do
	def funcion(elemento) do
		set = MapSet.new
		set = MapSet.put(set, "hola")
		set = MapSet.put(set, "adios")
		MapSet.member?(set, elemento)  
	end
end
