" Vim syntax file
" Language: hcl (Hashicorp Configuration Language)
" Maintainer: Matthieu Fronton
" Latest Revision: 07 November 2014

if exists("b:current_syntax")
  finish
endif

" --- GLOBAL ---

syn match hclEqual '='
syn match hclSimpleString '"[^\"]*"'
syn region hclComment display oneline start='\%\(^\|\s\)#' end='$'
syn region hclInterpolation display oneline start='(' end=')' contains=hclInterpolation,hclSimpleString
syn region hclSmartString display oneline start='"' end='"\s*$' contains=hclInterpolation

" --- HCL GENERIC ---

syn keyword hclRootKeywords variable provider resource nextgroup=hclString,hclString skipwhite
syn keyword hclRootKeywords default nextgroup=hclEquals skipwhite

" --- SYNTAX HIGHLIGHT ---

hi def link hclComment                  Comment
hi def link hclEqual                    Operator
hi def link hclRootKeywords             Statement
hi def link hclAwsResourcesKeywords     Type
hi def link hclSmartString              String
hi def link hclInterpolation            String
hi def link hclSimpleString             PreProc

let b:current_syntax = "hcl"
