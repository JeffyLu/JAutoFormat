if !(has('python3') || has('python'))
    echo "Error: python2+ or python3+ required!"
    finish
endif

function! s:JAutoFormat(mid_str, end_str, data_format)
python << EOF

import vim

END_STR = vim.eval('a:end_str')
MID_STR = vim.eval('a:mid_str')
BUF = vim.current.buffer
LINE_NUM_START, COL1 = BUF.mark('<')
LINE_NUM_END, COL2 = BUF.mark('>')
LINES = vim.eval('getline({}, {})'.format(LINE_NUM_START, LINE_NUM_END))
del BUF[LINE_NUM_START - 1: LINE_NUM_END]


def to_json():
    line_num = LINE_NUM_START - 1
    BUF.append('val = {', line_num)
    for line in LINES:
        kws = line.strip(END_STR).split(END_STR)
        for kw in kws:
            line_num += 1
            k, w = kw.split(MID_STR)
            BUF.append('    \'{}\': \'{}\','.format(k, w), line_num)
    BUF.append('}', line_num + 1)


def to_list():
    _list = []
    for line in LINES:
        _list += line.strip(END_STR).split(MID_STR)
    _list[0] = 'val = [\'%s' % _list[0]
    _list[-1] = '%s\']' % _list[-1]
    length = 0
    one_line_str = []
    line_num = LINE_NUM_START - 1
    for i, v in enumerate(_list):
        length += len(v) + 4
        if (length + (len(_list[i+1]) if i+1 < len(_list) else 0)) / 79 != length / 79:
            prefix = '    \'' if line_num >= LINE_NUM_START else ''
            BUF.append(prefix + '\', \''.join(one_line_str) + '\',', line_num)
            line_num += 1
            one_line_str = []
        else:
            one_line_str.append('%s' % v)
    prefix = '    \'' if line_num >= LINE_NUM_START else ''
    BUF.append(prefix + '\', \''.join(one_line_str), line_num)


try:
    data_format = int(vim.eval('a:data_format'))
    if data_format == 1:
        to_json()
    elif data_format == 2:
        to_list()
    else:
        raise Exception("unknown command!")
except Exception as e:
    print(e.message)

EOF
endfunc

command -nargs=* JToJson :call s:JAutoFormat(<f-args>, 1)
command -nargs=* JToList :call s:JAutoFormat(<f-args>, 2)
