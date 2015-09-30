" Open the Ag command and place the cursor into the quotes
let g:ackprg = 'ag --nogroup --nocolor --column'
nmap `ag :Ag ""<Left>
nmap `af :AgFile ""<Left>
