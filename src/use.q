################################################################################
# File: orbit-core/macro/src/use.q                                             #
# Author: Wesley Jones                                                         #
# Development Notes:  None                                                     #
################################################################################

@(fn use() {
  local next = quix.api.next();       -- Version string
  local semi = quix.api.next();       -- Required Semicolon

  if next.ty ~= 'str' then
    quix.api.abort('Expected version string after @use');
    return
  end

  if semi.ty ~= 'sym' or semi.v ~= ';' then
    quix.api.abort('Expected semicolon after version string');
    return
  end

  local version = next.v;

  if version ~= 'v1.0' then
    quix.api.abort('Unsupported QUIX environment version: ', version);
    return
  end

  quix.api.ilog('Using QUIX environment version: ', version);
})
