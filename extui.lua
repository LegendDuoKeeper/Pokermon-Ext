local restart_toggles = {
  {ref_value = "experimental_content", label = "poke_ext_settings_experimental"},
  {ref_value = "enable_giratina", label = "poke_ext_settings_giratina"}
}

local create_menu_toggles = function (parent, restart_toggles)
  for k, v in ipairs(restart_toggles) do
    parent.nodes[#parent.nodes + 1] = create_toggle({
          label = localize(v.label),
          ref_table = pokermon_ext_config,
          ref_value = v.ref_value,
          callback = function(_set_toggle)
            NFS.write(mod_dir.."/config.lua", STR_PACK(pokermon_ext_config))
          end,
    })
    if v.tooltip then
      parent.nodes[#parent.nodes].config.detailed_tooltip = v.tooltip
    end
  end
end

pokermonext_config = function()
--   local restart_left_settings = {n = G.UIT.C, config = {align = "tl", padding = 0.05, scale = 0.75, colour = G.C.CLEAR,}, nodes = {}}
--   create_menu_toggles(restart_left_settings, restart_toggles_left)

--   local restart_right_settings = {n = G.UIT.C, config = {align = "tl", padding = 0.05, scale = 0.75, colour = G.C.CLEAR,}, nodes = {}}
--   create_menu_toggles(restart_right_settings, restart_toggles_right)

  local restart_settings = {n = G.UIT.R, config = {align = "tm", padding = 0.05, scale = 0.75, colour = G.C.CLEAR,}, nodes = {}}
  create_menu_toggles(restart_settings, restart_toggles)
  
  local config_nodes =   
  {
    {
      n = G.UIT.R,
      config = {
        padding = 0,
        align = "cm"
      },
      nodes = {
        {
          n = G.UIT.T,
          config = {
            text = localize("poke_settings_header_required"),
            shadow = true,
            scale = 0.75 * 0.8,
            colour = HEX("ED533A")
          }
        }
      },
    },
    restart_settings,
    -- UIBox_button({
    --   minw = 3.85,
    --   colour = HEX("FF7ABF"),
    --   button = "pokermon_energy",
    --   label = {"Energy Options"}
    -- }),
    -- {
    --   n = G.UIT.R,
    --   config = {
    --     padding = 0,
    --     align = "cm"
    --   },
    --   nodes = {
    --     {
    --       n = G.UIT.T,
    --       config = {
    --         text = localize("poke_settings_header_required"),
    --         shadow = true,
    --         scale = 0.75 * 0.8,
    --         colour = HEX("ED533A")
    --       }
    --     }
    --   },
    -- },
    -- {
    --   n = G.UIT.R,
    --   config = {
    --     padding = 0,
    --     align = "tm"
    --   },
    --   nodes = {restart_left_settings, restart_right_settings},
    }
  return config_nodes
end

SMODS.current_mod.config_tab = function()
    return {
      n = G.UIT.ROOT,
      config = {
        align = "cm",
        padding = 0.05,
        colour = G.C.CLEAR,
      },
      nodes = pokermonext_config()
    }
end