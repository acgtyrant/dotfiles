#!/usr/env/bin/ python

import pathlib

directory = pathlib.Path.home() / 'Documents' / 'Anki'
all_vocab_count = 0
for text_pathname in directory.iterdir():
    if text_pathname.suffix == '.txt':
        file_ = text_pathname.open()
        import_pathname = directory / 'imports' / text_pathname.name
        import_file = import_pathname.open('w')
        note = None
        front = []
        front_count = 0
        back = []
        vocab_count = 0
        for line in file_:
            if line == '\n':
                if len(front) != 0:
                    vocab_count += len(front)
                    front = '<br>'.join(front)
                    back = '<br>'.join(back)
                    note = front + '\t' + back + '\n'
                    import_file.write(note)
                    front_count += 1
                front = []
                back = []
                note = None
            else:
                if line[0] == '#':
                    back.append(line.strip('\n'))
                else:
                    front.append(line.strip('\n'))
        if len(front) != 0:
            vocab_count += len(front)
            front = '<br>'.join(front)
            back = '<br>'.join(back)
            note = front + '\t' + back + '\n'
            import_file.write(note)
            front_count += 1
        all_vocab_count += vocab_count
        print('{} Done, vocab: {} front: {}'.format(
                text_pathname.name, vocab_count, front_count))
print(all_vocab_count)
