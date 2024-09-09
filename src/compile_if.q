################################################################################
# File: orbit-core/macro/src/compile_if.q                                      #
# Author: Wesley Jones                                                         #
# Development Notes:  None                                                     #
################################################################################

@(fn compile_if(cond, terminator) {
  if cond then
    return
  end

  if terminator == nil then
    terminator = 'compile_endif()'
  end

  local rank = 1

  while true do
    local token = quix.api.next()
    if token.ty == 'eof' then
      quix.api.error('Unexpected EOF in conditional compilation block')
      break
    end

    if token.ty == 'macr' and token.v == terminator then
      rank = rank - 1
      if rank == 0 then
        break
      end
    end

    if (token.ty == 'macr' and string.match(token.v, '^compile_if(.*)$')) then
      rank = rank + 1
    end
  end
})

@(fn compile_endif() {})
