using SpineOpt
using JuMP
using Clp

input_db_url = ARGS[1]
output_db_url = ARGS[2]
m = run_spineopt(input_db_url, output_db_url; with_optimizer=optimizer_with_attributes(Clp.Optimizer))

# Show active variables and constraints
println("*** Active constraints: ***")
for key in keys(m.ext[:constraints])
    !isempty(m.ext[:constraints][key]) && println(key)
end
println("*** Active variables: ***")
for key in keys(m.ext[:variables])
    !isempty(m.ext[:variables][key]) && println(key)
end
