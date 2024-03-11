{ config
, ...
}:
{
  home.file.".config/joplin-desktop/userchrome.css".text = ''
:root {
	--ctp-frappe-rosewater: #${config.colorScheme.palette.base06};
	--ctp-frappe-flamingo: #${config.colorScheme.palette.base0F};
	--ctp-frappe-pink: #${config.colorScheme.palette.base0F};
	--ctp-frappe-mauve: #${config.colorScheme.palette.base0E};
	--ctp-frappe-red: #${config.colorScheme.palette.base08};
	--ctp-frappe-maroon: #${config.colorScheme.palette.base0F};
	--ctp-frappe-peach: #${config.colorScheme.palette.base09};
	--ctp-frappe-yellow: #${config.colorScheme.palette.base0A};
	--ctp-frappe-green: #${config.colorScheme.palette.base0B};
	--ctp-frappe-teal: #${config.colorScheme.palette.base0C};
	--ctp-frappe-sky: #${config.colorScheme.palette.base05};
	--ctp-frappe-sapphire: #${config.colorScheme.palette.base05};
	--ctp-frappe-blue: #${config.colorScheme.palette.base0D};
	--ctp-frappe-lavender: #${config.colorScheme.palette.base07};
	--ctp-frappe-text: #${config.colorScheme.palette.base05};
	--ctp-frappe-subtext1: #${config.colorScheme.palette.base05};
	--ctp-frappe-subtext0: #${config.colorScheme.palette.base07};
	--ctp-frappe-overlay2: #${config.colorScheme.palette.base07};
	--ctp-frappe-overlay1: #${config.colorScheme.palette.base04};
	--ctp-frappe-overlay0: #${config.colorScheme.palette.base04};
	--ctp-frappe-surface2: #${config.colorScheme.palette.base04};
	--ctp-frappe-surface1: #${config.colorScheme.palette.base03};
	--ctp-frappe-surface0: #${config.colorScheme.palette.base02};
	--ctp-frappe-base: #${config.colorScheme.palette.base00};
	--ctp-frappe-mantle: #${config.colorScheme.palette.base01};
	--ctp-frappe-crust: #${config.colorScheme.palette.base01};
	--font-face: "Noto Sans", Arial, Helvetica, sans-serif;
	--font-mono: "Roboto Mono", Courier, monospace;
	--font-size: 13px;
	--icon-size: 16px;

	--regular: 400;
	--bolder: 600;

	--scroll-radius: 3px;

	--opacity-0-8: 0.8;
}

/* Font used by Joplin */
* {
	font-family: var(--font-face) !important;
}

html, body {
	background-color: var(--ctp-frappe-base) !important;
	font-size: var(--font-size) !important;
	font-weight: var(--regular) !important;
	color: var(--light) !important;
}
.CodeMirror-selected {
		/* background-color: var(--lighter-grey) !important; */
		background: #6B6B6B !important;
}
.rli-root {
	background-color: var(--ctp-frappe-base) !important;
}

/* Icons */
.fa, .far, .fas {
	font-weight: 900 !important;
	font-family: "Font Awesome 5 Free" !important;
	font-size: var(--icon-size) !important;
}

::placeholder {
	color: var(--ctp-frappe-lavender) !important;
}

/* Scrollbars */
::-webkit-scrollbar-thumb {
	background-color: var(--ctp-frappe-surface0) !important;
	border-radius: var(--scroll-radius) !important;
}

/*********************************************************************************
* PANELS
*********************************************************************************/

/* General panel style */
.resizableLayoutItem > div {
	min-width: 200px !important;
	background-color: var(--ctp-frappe-base) !important;
}

/*********************************************************************************
* SIDEBAR
*********************************************************************************/

.sidebar {
	background-color: var(--ctp-frappe-crust) !important;
	text-transform: uppercase;
	font-weight: var(--bolder);
}

/* Hide "All notes" icon
 * Comment this next block if you want the "All notes" icon */
i.icon-notes {
	display: none !important;
}

/* FOLDERS */

/* "Add new notebook" button */
.sidebar > div > div > button span {
	color: var(--ctp-frappe-lavender) !important;
}

.sidebar > div > div > button:hover {
	opacity: var(--opacity-0-8);
}
.folders .list-item-container {
		background-color: var(--ctp-frappe-crust) !important;
}
.folders .list-item-container:hover {
	background-color: var(--ctp-frappe-overlay0) !important;
}

.folders .list-item-container a {
	text-transform: initial;
	color: var(--ctp-frappe-text) !important;
	font-weight: var(--regular);
}

.folders .list-item-container a:focus {
	color: var(--ctp-frappe-text) !important;
	background-color: var(--ctp-frappe-base) !important;
}

.folders .list-item-container a:hover {
	color: var(--ctp-frappe-text) !important;
}

/* TAGS */
.tags .list-item-container {
		display: inline-block;
		line-height: 0 !important;
		padding: 0 !important;
		height: auto !important;
		background-color: var(--ctp-frappe-crust) !important;
}
.tags .list-item-container:hover {
	display: inline-block;
	line-height: 0 !important;
	padding: 0 !important;
	height: auto !important;
	background-color: var(--ctp-frappe-overlay0) !important;
}

.tags .list-item-container a {
	padding-left: 12px !important;
	text-transform: initial;
	color: var(--ctp-frappe-text) !important;
	font-weight: var(--regular);
}

.tags .list-item-container a:focus {
	color: var(--ctp-frappe-text) !important;
	background-color: var(--ctp-frappe-base) !important;
}

.tags .list-item-container a:hover {
	color: var(--ctp-frappe-text) !important;
	background-color: var(--ctp-frappe-overlay0) !important;
}

/* SYNCHRONIZATION */

.sidebar > div:last-of-type {
	background-color: none !important;
}

.sidebar > div:last-of-type > button {
	background-color: var(--ctp-frappe-lavender) !important;
	border: 0px !important;
	text-transform: uppercase;
	font-size: var(--font-size) !important;
}

.sidebar > div:last-of-type > button:hover {
	opacity: var(--opacity-0-8);
}

.sidebar > div:last-of-type > button > span {
	color: var(--ctp-frappe-crust) !important;
}

/*********************************************************************************
*NOTE LIST
*********************************************************************************/

.note-list {
	background-color: var(--ctp-frappe-mantle) !important;
	border: none !important;
}

/* Empty notelist */
.cLdGCO, .cLdGCO > div {
	background-color: var(--ctp-frappe-mantle) !important;
}

/* Remove border - introduced in 1.3.7 */
.rli-noteList div {
	border: none !important;
}

/* BUTTONS SEARCH, SORT NOTES, NEW NOTE AND NEW TASK */

div[height="50"] {
	background-color: var(--ctp-frappe-mantle) !important;
}

div[height="50"] input {
	border: none !important;
	color: var(--ctp-frappe-text) !important;
	background-color: var(--ctp-frappe-mantle) !important;
}

div[height="50"] button {
	background: transparent !important;
	color: var(--ctp-frappe-text) !important;
	border: 0 !important;
}

div[height="50"] button:hover {
	opacity: var(--opacity-0-8);
}

div[height="50"] button span {
	color: var(--ctp-frappe-text) !important;
}

.sc-hCPjZK.fJjcQe{
	background-color: var(--ctp-frappe-mantle) !important;
}
.new-note-todo-buttons > button {
	background-color: var(--ctp-frappe-lavender) !important;
	border: none !important;
}
.new-todo-button > span {
	color: var(--ctp-frappe-crust) !important;
}

.search-bar {
	background-color: var(--ctp-frappe-crust) !important;
}

.icon-search {
	color: var(--ctp-frappe-lavender) !important;
}

.sort-order-reverse-button {
	background-color: var(--ctp-frappe-crust) !important;
}
.sort-order-reverse-button {
	background-color: var(--ctp-frappe-crust) !important;
}

.fa-calendar-alt {
	color: var(--ctp-frappe-lavender) !important;
}
.fa-long-arrow-alt-up {
	color: var(--ctp-frappe-lavender) !important;
}
/* LIST OF NOTES */

.note-list .list-item-container {
	background-color: var(--ctp-frappe-mantle) !important;
}

.note-list .list-item-container:hover {
	background-color: var(--ctp-frappe-overlay1) !important;
}

.item-list.note-list .list-item-container::before {
	border: none !important;
}

.note-list .list-item-container a {
	text-transform: initial;
	color: var(--ctp-frappe-text) !important;
	font-weight: var(--regular);
}

.note-list .list-item-container a:focus {
	color: var(--ctp-frappe-text) !important;
	background-color: var(--ctp-frappe-base) !important;
}

.note-list .list-item-container a:hover {
	color: var(--ctp-frappe-text) !important;
}

/* Add "..." to notes with long titles */
.item-list.note-list .list-item-container > a > span {
	overflow: hidden;
	text-overflow: ellipsis;
}

/*********************************************************************************
* EDITOR
*********************************************************************************/

/* EDITOR TOOLBAR */

/* Title */
/* Changes frequently with updates, need to keep tabs */
.rli-editor .cCOtNv > input {
	padding-top: 5px;
	background-color: var(--ctp-frappe-base) !important;
}

.title-input {
  background-color: var(--ctp-frappe-base) !important;
  color: var(--ctp-frappe-text) !important;
}

.editor-toolbar {
	background-color: transparent !important;
}

.editor-toolbar > div > a:hover {
	opacity: var(--opacity-0-8);
}

/* Hide "Spell checker" button */
.editor-toolbar a[title="Spell checker"] {
 display: none !important;
}

/* Hide "Markdown/Richtext editor" Button */
.tox-toolbar {
 display: none !important;
}

/* Hide the Toggle editors button */
.editor-toolbar button[title="Toggle editors"] {
	display: none !important;
}

/* Breadcrumbs (In:...) - Used in tag listings */
.cJOYJm {
	background-color: var(--ctp-frappe-lavender) !important;
	margin: 0px !important;
	padding: 5px !important;
	font-size: var(--font-size) !important;
}

.cJOYJm:hover {
	opacity: var(--opacity-0-8);
}

/* CONTENT */
/* Empty notebook */
.rli-editor > div > div:empty {
	background-color: var(--ctp-frappe-base) !important;
}

/* Editor layout splitter */
.rli-editor > div > div > div > div > div > div > div:last-of-type {
	border-color: var(--ctp-frappe-base) !important;
}

div.sc-AxirZ.hagDvo, div.sc-AxirZ.hagDvo > div {
	background-color: var(--ctp-frappe-mantle) !important;
	color: var(--ctp-frappe-text) !important;
}

/* NOTE SEARCH BAR */
.note-search-bar, .note-search-bar > div > div {
	background-color: var(--ctp-frappe-base) !important;
	width: 100%;
	border: 0 !important;
}

.note-search-bar input {
	border: 0 !important;
	padding: 5px;
	color: var(--ctp-frappe-text) !important;
	background-color: var(--ctp-frappe-base) !important;
}

/* TAGS */
.tag-bar {
	background-color: transparent !important;
}

.tag-list > span {
	color: var(--ctp-frappe-lavender) !important;
	background-color: var(--ctp-frappe-crust) !important;
}

/* Hide "Click to add tags..."*/
a[Title="Tags"] + div > span {
	display: none !important;
}

/*********************************************************************************
* EDITOR (CODE MIRROR)
*********************************************************************************/

.cm-s-material-darker.CodeMirror {
	background-color: var(--ctp-frappe-base) !important;
	color: var(--ctp-frappe-text) !important;
}

/* Header */
.cm-header {
	color: var(--ctp-frappe-lavender) !important;
}

/* Italics/Emphasis, Bold, BoldItalics */
.cm-em, .cm-strong, .cm-strong.cm-em {
	color: var(--ctp-frappe-text) !important;
}

/* Lists (Bullet/number/todo) */
.cm-variable-2, .cm-variable-3, .cm-keyword {
	color: var(--ctp-frappe-text) !important;
}

.cm-s-material-darker .cm-variable-2.cm-rm-list-token {
	color: var(--ctp-frappe-text) !important;
}

/* Links (link) */
.cm-url {
	color: var(--ctp-frappe-rosewater) !important;
	opacity: 1;
	text-decoration: underline;
}

/* Links (text) */
.cm-link-text {
	color: var(--ctp-frappe-rosewater) !important;
}
pre.CodeMirror-line {
		color: var(--ctp-frappe-text) !important;
		background-color: none !important;
}
/* Image link in editor */
span.cm-string.cm-url.cm-overlay.cm-rm-link.cm-overlay.cm-rm-image {
	color: var(--ctp-frappe-lavender) !important;
}
/* Comment outside code block */
pre.CodeMirror-line span.cm-comment {
	color: var(--ctp-frappe-overlay1) !important;
	background-color: none !important;
	border: 0 !important;
}

/* Codeblock selection colour */
/* For some reason, the CodeMirror selection does not pick the colour correctly, left for now. */
pre.CodeMirror-line span.CodeMirror-selectedtext {
	/* background: var(--ctp-frappe-surface2) !important; */
	background: #6B6B6B !important;
}

div[class^="cm-jn-code-block-background "]::selection {
	background-color: var(--ctp-frappe-base) !important;
	border-color: var(--ctp-frappe-base) !important;
}

pre.cm-jn-code-block.CodeMirror-line span.cm-comment.cm-jn-monospace.CodeMirror-selectedtext {
	/* background: var(--ctp-frappe-surface2) !important; */
	background: #6B6B6B !important;
}
pre.cm-jn-code-block.CodeMirror-line::selection {
	/* background: var(--ctp-frappe-surface2) !important; */
	background: #6B6B6B !important;
}
div.cm-jn-code-block-background.CodeMirror-linebackground::selection {
	/* background: var(--ctp-frappe-surface2) !important; */
	background: #6B6B6B !important;
}
pre.cm-jn-code-block.CodeMirror-line::selection span {
	/* background: var(--ctp-frappe-surface2) !important; */
	background: #6B6B6B !important;
}

div.CodeMirror span.cm-comment.cm-jn-inline-code {
	background-color: transparent !important;
	padding-right: 0 !important;
	padding-left: 0 !important;
}

/* Code Block Text */
div.CodeMirror span.cm-comment:not(.cm-jn-inline-code) {
	color: var(--ctp-frappe-text) !important;
	background-color: transparent !important;
}

/* Code block background */
div.CodeMirror div.cm-jn-code-block-background {
		background-color: var(--ctp-frappe-mantle) !important;
}

/* Horizontal Line */
.cm-hr {
	color: var(--ctp-frappe-overlay0) !important;
}

/* Cursor colour */
.CodeMirror-cursor {
		border-left: 1px solid var(--ctp-frappe-rosewater) !important;
		border-right: none !important;
		width: 0 !important;
}
.cm-fat-cursor div.CodeMirror-cursor {
		width: 10px !important;
		border: 0 !important;
		background: var(--ctp-frappe-rosewater) !important;
}
.cm-fat-cursor div.CodeMirror-cursors {
		z-index: 1 !important;
}
.cm-fat-cursor-mark {
		background-color: rgba(150, 205, 251, 0.5) !important;
}

.cm-animate-fat-cursor {
		width: auto !important;
		border: 0;
		background-color: var(--ctp-frappe-rosewater) !important;
}

.cm-header.cm-rm-header-token {
	color: var(--ctp-frappe-green) !important;
}

.cm-strong.cm-rm-strong-token {
	color: var(--ctp-frappe-blue) !important;
}

pre.cm-rm-blockquote.CodeMirror-line {
	font-style: italic !important;
}

/* Command palette coloring */

div.modal-dialog {
	background-color: var(--ctp-frappe-mantle) !important;
}

.modal-dialog > div > input {
	background-color: var(--ctp-frappe-crust) !important;
	color: var(--ctp-frappe-text) !important;
}

.modal-dialog > .item-list {
	background-color: var(--ctp-frappe-crust) !important;
	color: var(--ctp-frappe-text) !important;

}

.modal-dialog > .item-list div[class="selected"] {
	background-color: var(--ctp-frappe-surface2) !important;
}

.modal-dialog > .item-list div[class="selected"] > div {
	color: var(--ctp-frappe-text) !important;
}

.modal-dialog > .item-list > * {
	color: var(--ctp-frappe-text) !important;
}
  '';
  home.file.".config/joplin-desktop/userstyles.css".text = ''
:root {
    --ctp-frappe-rosewater: #${config.colorScheme.palette.base06};
      --ctp-frappe-flamingo: #${config.colorScheme.palette.base0F};
      --ctp-frappe-pink: #${config.colorScheme.palette.base0F};
      --ctp-frappe-mauve: #${config.colorScheme.palette.base0E};
      --ctp-frappe-red: #${config.colorScheme.palette.base08};
      --ctp-frappe-maroon: #${config.colorScheme.palette.base0F};
      --ctp-frappe-peach: #${config.colorScheme.palette.base09};
      --ctp-frappe-yellow: #${config.colorScheme.palette.base0A};
      --ctp-frappe-green: #${config.colorScheme.palette.base0B};
      --ctp-frappe-teal: #${config.colorScheme.palette.base0C};
      --ctp-frappe-sky: #${config.colorScheme.palette.base05};
      --ctp-frappe-sapphire: #${config.colorScheme.palette.base05};
      --ctp-frappe-blue: #${config.colorScheme.palette.base0D};
      --ctp-frappe-lavender: #${config.colorScheme.palette.base07};
      --ctp-frappe-text: #${config.colorScheme.palette.base05};
      --ctp-frappe-subtext1: #${config.colorScheme.palette.base05};
      --ctp-frappe-subtext0: #${config.colorScheme.palette.base07};
      --ctp-frappe-overlay2: #${config.colorScheme.palette.base07};
      --ctp-frappe-overlay1: #${config.colorScheme.palette.base04};
      --ctp-frappe-overlay0: #${config.colorScheme.palette.base04};
      --ctp-frappe-surface2: #${config.colorScheme.palette.base04};
      --ctp-frappe-surface1: #${config.colorScheme.palette.base03};
      --ctp-frappe-surface0: #${config.colorScheme.palette.base02};
      --ctp-frappe-base: #${config.colorScheme.palette.base00};
      --ctp-frappe-mantle: #${config.colorScheme.palette.base01};
      --ctp-frappe-crust: #${config.colorScheme.palette.base01};
    --white: #D9E0EE;
    --black: #000000;
    --light: #C9CFFF;
    --lighter-grey: #C3BAC6;
    --light-grey: #988BA2;
  
      --font-face: "Noto Sans", Arial, Helvetica, sans-serif;
    --font-mono: "Roboto Mono", Courier, monospace;
    --font-size: 13px;
    --icon-size: 16px;
  
    --regular: 400;
    --bolder: 600;
  
    --scroll-radius: 3px;
  
    --opacity-0-8: 0.8;
  }
  
  
  #rendered-md, body, th, td {
    background-color: var(--ctp-frappe-base) !important;
    font-family: var(--font-face) !important;
  }
  
  p, ul, ol, li {
    color: var(--ctp-frappe-text) !important;
  }
  
  strong {
    color: var(--ctp-frappe-text) !important;
  }
  
  hr {
    border: none;
    border-bottom: 1px solid var(--ctp-frappe-base) !important;
    margin: 2.5em 0 !important;
  }
  
  /* Scrollbars */
  ::-webkit-scrollbar-thumb {
    background-color: var(--ctp-frappe-base) !important;
    border-radius: var(--scroll-radius) !important;
  }
  
  /*********************************************************************************
  * TITLES
  *********************************************************************************/
  
  h1 {
    border-bottom: 1px solid var(--ctp-frappe-base) !important;
    font-weight: var(--bolder) !important;
  }
  
  h2, h3, h4, h5, h6 {
    border-bottom: 0 !important;
    font-weight: var(--regular) !important;
  }
  
  /*********************************************************************************
  * LINKS
  *********************************************************************************/
  
  a {
    color: var(--ctp-frappe-rosewater) !important;
    text-decoration: underline !important;
  }
  
  a:hover {
    text-decoration: underline !important;
  }
  
  /* Joplin icon in Joplin link */
  .resource-icon {
    background-color: var(--ctp-frappe-rosewater) !important;
  }
  
  /*********************************************************************************
  * CODE BLOCK
  *********************************************************************************/
  
  pre, .hljs {
    background-color: var(--ctp-frappe-mantle) !important;
    font-family: var(--font-mono) !important;
    padding: 10px !important;
    color: var(--ctp-frappe-text) !important;
    font-size: 14px !important;
    overflow: scroll !important;
  }
  
  /* Inline code */
  .inline-code {
    background-color: transparent !important;
    border: 0 !important;
    font-family: var(--font-mono) !important;
    color: var(--ctp-frappe-yellow) !important;
    font-size: 14px !important;
  }
  
  /*********************************************************************************
  * BLOCKQUOTE
  *********************************************************************************/
  
  blockquote {
    background-color: var(--ctp-frappe-surface0) !important;
    padding: 10px !important;
    color: var(--light) !important;
    font-size: 14px !important;
    font-style: italic !important;
    border: 0 !important;
    border-left: 5px solid var(--ctp-frappe-mantle) !important;
  }
  
  /*********************************************************************************
  * TABLES
  *********************************************************************************/
  
  th {
    border: 1px solid var(--ctp-frappe-text) !important;
    color: var(--ctp-frappe-text) !important;
    border-bottom: 1px solid var(--ctp-frappe-text) !important;
  }
  
  td {
    border: 1px solid var(--ctp-frappe-text) !important;
    color: var(--ctp-frappe-text) !important;
    border-bottom: 1px solid var(--ctp-frappe-text) !important;
  }
  
  /*********************************************************************************
  * HIGHLIGHTING
  *********************************************************************************/
  
  ::selection {
      background-color: var(--ctp-frappe-lavender) !important;
    color: var(--ctp-frappe-crust) !important;
  }
  
  mark, mark strong {
    background: var(--ctp-frappe-yellow) !important;
    color: var(--ctp-frappe-crust) !important;
  }
  
  /* Highlighted searched item */
  mark[data-markjs] {
    background-color: var(--ctp-frappe-lavender) !important;
  }
  
  /*********************************************************************************
  * PLUGINS
  *********************************************************************************/
  
  /* SPOILERS (https://github.com/martinkorelic/joplin-plugin-spoilers) */
  
  /* Container for spoiler blocks */
  .spoiler-block {
    border: 0 !important;
    border-radius: 0px;
  }
  
  /* Container for spoiler title */
  #spoiler-block-title {
    font-family: var(--font-face) !important;
    color: var(--ctp-frappe-text) !important;
    background-color: var(--ctp-frappe-mantle) !important;
    border-radius: 0px;
  }
  
  /* Container for spoiler body */
  #spoiler-block-body {
    font-family: var(--font-face) !important;
    color: var(--light) !important;
    background-color: var(--ctp-frappe-mantle) !important;
    border-radius: 0px;
  }
  
  /* Styling of the spoiler block body */
  .summary-content {
    background-color: var(--ctp-frappe-mantle) !important;
  }
  
  .summary-title:before {
    color: var(--ctp-frappe-lavender) !important;
  }
  
  /*********************************************************************************
  * PRINT VERSION
  *********************************************************************************/
  
  @media print {
  
    #rendered-md, body, th, td {
      /* background-color: var(--white) !important; */
      background-color: #ffffff !important;
      font-family: var(--font-face) !important;
    }
  
    p, ul, ol, li {
      color: var(--black) !important;
    }
  
    strong {
      color: var(--black) !important;
    }
    th {
    border: 1px solid var(--black) !important;
    color: var(--black) !important;
    border-bottom: 1px solid var(--black) !important;
    }
  
    td {
    border: 1px solid var(--black) !important;
    color: var(--black) !important;
    border-bottom: 1px solid var(--black) !important;
    }
  
    h1 {
      border-bottom: 1px solid var(--black) !important;
      font-weight: var(--bolder) !important;
    }
  
    h2, h3, h4, h5, h6 {
      border-bottom: 0 !important;
      font-weight: var(--bolder) !important;
    }
  
    hr {
      border: none;
      border-bottom: 1px solid var(--black) !important;
      margin: 2.5em 0 !important;
    }
  
    a {
      color: var(--ctp-frappe-red) !important;
      text-decoration: underline !important;
    }
  
  /* Inline code */
  .inline-code {
    background-color: #F8F8F8 !important;
    border: 0 !important;
    font-family: var(--font-mono) !important;
    /* color: var(--ctp-frappe-yellow) !important; */
    font-size: 14px !important;
  }
  
  pre, .hljs {
    background-color: #F8F8F8 !important;
    font-family: var(--font-mono) !important;
    padding: 10px !important;
    color: var(--ctp-frappe-crust) !important;
    font-size: 14px !important;
    overflow: scroll !important;
  }
  
  blockquote {
    background-color: #F8F8F8 !important;
    padding: 10px !important;
    color: var(--ctp-frappe-crust) !important;
    font-size: 14px !important;
    font-style: italic !important;
    border: 0 !important;
    border-left: 5px solid #E8E8E8 !important;
  }
  
  }
  '';
}