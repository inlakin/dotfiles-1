/*============================================================================*
 *                              command bindings                              *
 *============================================================================*/

vimfx.set('mode.normal.click_browser_element','eb');
vimfx.set('mode.normal.copy_current_url','yy');
vimfx.set('mode.normal.dev',':');
vimfx.set('mode.normal.edit_blacklist','gB');
vimfx.set('mode.normal.element_text_caret','v');
vimfx.set('mode.normal.element_text_copy','yv');
vimfx.set('mode.normal.element_text_select','av');
vimfx.set('mode.normal.enter_mode_ignore','i');
vimfx.set('mode.normal.enter_reader_view','gr');
vimfx.set('mode.normal.esc','<force><escape>');
vimfx.set('mode.normal.find','/');
vimfx.set('mode.normal.find_highlight_all','a/');
vimfx.set('mode.normal.find_links_only','g/');
vimfx.set('mode.normal.find_next','n');
vimfx.set('mode.normal.find_previous','N');
vimfx.set('mode.normal.focus_location_bar','o');
vimfx.set('mode.normal.focus_search_bar','O');
vimfx.set('mode.normal.focus_text_input','gi');
vimfx.set('mode.normal.follow','f');
vimfx.set('mode.normal.follow_copy','yf');
vimfx.set('mode.normal.follow_focus','ef');
vimfx.set('mode.normal.follow_in_focused_tab','et');
vimfx.set('mode.normal.follow_in_private_window','ep');
vimfx.set('mode.normal.follow_in_tab','F');
vimfx.set('mode.normal.follow_in_window','ew');
vimfx.set('mode.normal.follow_multiple','af');
vimfx.set('mode.normal.follow_next',']');
vimfx.set('mode.normal.follow_previous','[');
vimfx.set('mode.normal.go_home','gh');
vimfx.set('mode.normal.go_to_root','gU');
vimfx.set('mode.normal.go_up_path','gu');
vimfx.set('mode.normal.help','?');
vimfx.set('mode.normal.history_back','H');
vimfx.set('mode.normal.history_forward','L');
vimfx.set('mode.normal.history_list','gH');
vimfx.set('mode.normal.mark_scroll_position','m');
vimfx.set('mode.normal.open_context_menu','ec');
vimfx.set('mode.normal.paste_and_go','p');
vimfx.set('mode.normal.paste_and_go_in_tab','P');
vimfx.set('mode.normal.quote','I');
vimfx.set('mode.normal.reload','r');
vimfx.set('mode.normal.reload_all','ar');
vimfx.set('mode.normal.reload_all_force','aR');
vimfx.set('mode.normal.reload_config_file','gC');
vimfx.set('mode.normal.reload_force','R');
vimfx.set('mode.normal.scroll_down','j');
vimfx.set('mode.normal.scroll_half_page_down','<c-d>');
vimfx.set('mode.normal.scroll_half_page_up','<c-u>');
vimfx.set('mode.normal.scroll_left','h');
vimfx.set('mode.normal.scroll_page_down','<space>');
vimfx.set('mode.normal.scroll_page_up','<s-space>');
vimfx.set('mode.normal.scroll_right','l');
vimfx.set('mode.normal.scroll_to_bottom','G');
vimfx.set('mode.normal.scroll_to_left','0  ^');
vimfx.set('mode.normal.scroll_to_mark',"'");
vimfx.set('mode.normal.scroll_to_next_position','g]');
vimfx.set('mode.normal.scroll_to_previous_position','g[');
vimfx.set('mode.normal.scroll_to_right','$');
vimfx.set('mode.normal.scroll_to_top','gg');
vimfx.set('mode.normal.scroll_up','k');
vimfx.set('mode.normal.stop','s');
vimfx.set('mode.normal.stop_all','as');
vimfx.set('mode.normal.tab_close','d');
vimfx.set('mode.normal.tab_close_other','gxa');
vimfx.set('mode.normal.tab_close_to_end','gx$');
vimfx.set('mode.normal.tab_duplicate','yt');
vimfx.set('mode.normal.tab_move_backward','gJ');
vimfx.set('mode.normal.tab_move_forward','gK');
vimfx.set('mode.normal.tab_move_to_window','gw');
vimfx.set('mode.normal.tab_new','t');
vimfx.set('mode.normal.tab_new_after_current','T');
vimfx.set('mode.normal.tab_restore','u');
vimfx.set('mode.normal.tab_restore_list','gX');
vimfx.set('mode.normal.tab_select_first','g0');
vimfx.set('mode.normal.tab_select_first_non_pinned','g^');
vimfx.set('mode.normal.tab_select_last','g$');
vimfx.set('mode.normal.tab_select_most_recent','gl');
vimfx.set('mode.normal.tab_select_next','K    gt');
vimfx.set('mode.normal.tab_select_oldest_unvisited','gL');
vimfx.set('mode.normal.tab_select_previous','J    gT');
vimfx.set('mode.normal.tab_toggle_pinned','gp');
vimfx.set('mode.normal.window_new','w');
vimfx.set('mode.normal.window_new_private','W');

vimfx.set('mode.caret.copy_selection_and_exit','y');
vimfx.set('mode.caret.exit','<escape>');
vimfx.set('mode.caret.move_down','j');
vimfx.set('mode.caret.move_left','h');
vimfx.set('mode.caret.move_right','l');
vimfx.set('mode.caret.move_to_line_end','$');
vimfx.set('mode.caret.move_to_line_start','0    ^');
vimfx.set('mode.caret.move_up','k');
vimfx.set('mode.caret.move_word_left','b');
vimfx.set('mode.caret.move_word_right','w');
vimfx.set('mode.caret.toggle_selection','v');
vimfx.set('mode.caret.toggle_selection_direction','o');

vimfx.set('mode.hints.activate_highlighted','<enter>    <c-enter>    <a-enter>');
vimfx.set('mode.hints.delete_char','<backspace>');
vimfx.set('mode.hints.exit','<escape>');
vimfx.set('mode.hints.increase_count','<up>');
vimfx.set('mode.hints.rotate_markers_backward','<s-space>');
vimfx.set('mode.hints.rotate_markers_forward','<c-space>');
vimfx.set('mode.hints.toggle_complementary','<c-backspace>');

vimfx.set('mode.ignore.exit','<s-escape>');

vimfx.set('mode.ignore.unquote','<s-f1>');

vimfx.set('mode.find.exit','<escape>    <enter>');

vimfx.set('mode.marks.exit','<escape> ');

vimfx.set('hints.auto_activate', true);
vimfx.set('hints.chars', 'fjdkslaghrueiwonc mv');
vimfx.set('hints.match_text', true);
vimfx.set('hints.matched_timeout', 200);
vimfx.set('hints.peek_through', '<c-s->');
vimfx.set('hints.sleep', 15);
vimfx.set('hints.timeout', 400);
vimfx.set('hints.toggle_in_background', '<a-');
vimfx.set('hints.toggle_in_tab', '<c-');

vimfx.set('options.key.insert_default', '<c-d>');
vimfx.set('options.key.quote', '<c-q>');
vimfx.set('options.key.reset_default', '<c-r>');

vimfx.set('scroll.full_page_adjustment', 40);
vimfx.set('scroll.half_page_adjustment', 20);
vimfx.set('scroll.horizontal_boost', 6);
vimfx.set('scroll.last_find_mark', '/');
vimfx.set('scroll.last_position_mark', "'");
vimfx.set('scroll.reset_timeout', 1000);
vimfx.set('scroll.vertical_boost', 3);

vimfx.set('smoothScroll.lines.spring-constant', '1000');
vimfx.set('smoothScroll.other.spring-constant', '2500');
vimfx.set('smoothScroll.pages.spring-constant', '2500');

vimfx.set('activatable_element_keys', '<enter>');
vimfx.set('adjustable_element_keys', '<arrowup>  <arrowdown>  <arrowleft> <arrowright>  <space>  <enter>');
vimfx.set('blacklist', '*example.com*  http://example.org/editor/*');
vimfx.set('blur_timeout', 50);
vimfx.set('browsewithcaret', false);
vimfx.set('config_file_directory', '~/.config/vimfx');
vimfx.set('counts_enabled', true);
vimfx.set('find_from_top_of_viewport', true);
vimfx.set('focus_next_key','<tab>');
vimfx.set('focus_previous_key','<s-tab>');
vimfx.set('ignore_keyboard_layout', false);
vimfx.set('next_patterns', 'next  ›  »  ▶  →  >>  >  more  older');
vimfx.set('notifications_enabled', true);
vimfx.set('notify_entered_keys', true);
vimfx.set('pattern_attrs', 'rel  role  data-tooltip  aria-label');
vimfx.set('pattern_selector', ':-moz-any( a, button, input[type="button"] ):not([role="menu"]):not([role="tab"])');
vimfx.set('prev_patterns', 'prev  previous  ‹  «  ◀  ←  <<  <  back  newer');
vimfx.set('prevent_autofocus', false);
vimfx.set('prevent_autofocus_modes', 'normal');
vimfx.set('prevent_target_blank', true);
vimfx.set('refocus_timeout', 100);
vimfx.set('timeout', 2000);

/*============================================================================*
 *                               custom commands                              *
 *============================================================================*/

vimfx.addCommand({
    name: 'zoom_in',
    description: 'Zoom in',
}, ({vim}) => {
    vim.window.FullZoom.enlarge()
})

vimfx.addCommand({
    name: 'zoom_out',
    description: 'Zoom out',
}, ({vim}) => {
    vim.window.FullZoom.reduce()
})

vimfx.addCommand({
    name: 'zoom_reset',
    description: 'Reset zoom',
}, ({vim}) => {
    vim.window.FullZoom.reset()
})

let {commands} = vimfx.modes.normal
vimfx.addCommand({
    name: 'search_bookmarks',
    description: 'Search bookmarks',
    category: 'location',
    order: commands.focus_location_bar.order + 1,
}, (args) => {
    commands.focus_location_bar.run(args)
    args.vim.window.gURLBar.value = '* '
})

const {classes: Cc, interfaces: Ci} = Components
const mpv_path = '/usr/bin/mpv'
const mpv_options = '--video-unscaled=yes --ytdl-format=best --really-quiet'
vimfx.addCommand({
    name: 'play_with_mpv',
    description: 'Play the focused link with MPV'
}, ({vim}) => {
    vimfx.send(vim, 'getCurrentHref', null, url => {
        let file = Cc['@mozilla.org/file/local;1'].createInstance(Ci.nsIFile)
        file.initWithPath(mpv_path)
        let process = Cc['@mozilla.org/process/util;1'].createInstance(Ci.nsIProcess)
        process.init(file)
        let args = mpv_options.split(' ')
        if (url.includes('youtube.com')) {
            let qs = (function(a) {
                if (a == '') return {}
                let b = {}
                for (let i = 0; i < a.length; ++i) {
                    let p = a[i].split('=', 2)
                    if (p.length == 1) {
                        b[p[0]] = ''
                    } else {
                        b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, ' '))
                    }
                }
                return b
            })(url.substr(1).split('&'))
            if (qs['list'] && qs['index']) {
                let ytdlRawOptionsIndex = -1
                for (let i = 0; i < args.length; i++) {
                    if (args[i].includes('ytdl-raw-options')) {
                        ytdlRawOptionsIndex = i
                        break
                    }
                }
                if (ytdlRawOptionsIndex > -1) {
                    args[ytdlRawOptionsIndex] += `,yes-playlist=,playlist-start=${qs['index']}`
                } else {
                    args.push(`--ytdl-raw-options=yes-playlist=,playlist-start=${qs['index']}`)
                }
            }
        }
        args.push(url)
        process.runAsync(args, args.length)
    })
})

/*============================================================================*
 *                          custom commands bindings                          *
 *============================================================================*/

vimfx.set('custom.mode.normal.zoom_in', 'zi');
vimfx.set('custom.mode.normal.zoom_out', 'zo');
vimfx.set('custom.mode.normal.zoom_reset', 'zr');
vimfx.set('custom.mode.normal.search_bookmarks', 'sb');
vimfx.set('custom.mode.normal.play_with_mpv', 'M');

