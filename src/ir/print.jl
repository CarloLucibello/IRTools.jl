import Base: show

function show(io::IO, ir::IR)
  defs = Dict((b, i) => s for (s, (b, i)) in enumerate(ir.defs))
  for b in 1:length(ir.blocks)
    println(io, b, ":")
    for i in 1:length(ir.blocks[b].stmts)
      print(io, lpad(string("%", defs[(b, i)]), 4), " = ")
      st = ir.blocks[b].stmts[i]
      st.expr == nothing ? println(io, "nothing") :
        println(io, st.expr)
    end
    for g in ir.blocks[b].gotos
      println(io, "       ", g.expr)
    end
  end
end
