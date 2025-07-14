-- get_experimental_on = function(center)
--   local experimental_toggle = false
--   if pokermonext_config.enable_experimental then
--     experimental_toggle = true
--   end
--   return experimental_toggle
-- end

is_seal = function(self, card, context)
  if self.seal == 'Red' then
    return 'Red'
  elseif self.seal == 'Blue' then
    return 'Blue'
  end
  -- if self.seal == 'poke_ext_sleep' or
  -- self.seal == 'poke_ext_burned' or 
  -- self.seal == 'poke_ext_poison' or 
  -- self.seal == 'poke_ext_para' or 
  -- self.seal == 'poke_ext_frozen' then
  --   return true
  -- end
end

-- print("FuncWorking")