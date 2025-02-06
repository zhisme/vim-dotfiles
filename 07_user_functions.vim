let g:copilot_toggle = 1 " enabled by default
function CopilotToggle(copilot_toggle)
  if g:copilot_toggle == 0
    :Copilot enable
    let g:copilot_toggle = 1
    echo "Copilot Enabled"
  else
    :Copilot disable
    let g:copilot_toggle = 0
    echo "Copilot Disabled"
  endif
endfunction
