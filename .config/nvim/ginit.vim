" Enable Mouse
set mouse=a

" Set Editor Font
if exists(':GuiFont')
    GuiFont Noto Sans Mono:h10
endif

if exists(':GuiAdaptiveColor')
    GuiAdaptiveColor 1
endif

if exists(':GuiAdaptiveFont')
    GuiAdaptiveFont 1
endif

if exists(':GuiAdaptiveStyle')
    GuiAdaptiveStyle Fusion
endif

if exists(':GuiLinespace')
    GuiLinespace 5
endif

if exists(':GuiRenderLigatures')
    GuiRenderLigatures 1
endif

if exists(':GuiWindowMaximized')
    GuiWindowMaximized 1
endif

if exists(':GuiTreeviewShow')
    GuiTreeviewShow 1
endif

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 1
endif

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv
