################################################################################################

## Dépendances recommandées ##

#```bash
# Prévisualisation améliorée
#sudo apt install atool poppler-utils w3m lynx mediainfo exiftool odt2txt

# Outils optionnels
#sudo apt install bat fzf ripgrep highlight glow

# Pour les images
#sudo apt install ffmpegthumbnailer imagemagick
#```

## Utilisation

#Après avoir créé ces 4 fichiers, lancez simplement :
#```bash
#ranger
#```

#Les fichiers de configuration seront automatiquement chargés !

################################################################################################

## 4. commands.py (~/.config/ranger/commands.py)

**Commandes personnalisées en Python**

```python
from ranger.api.commands import Command

class fzf_select(Command):
    """
    :fzf_select
    Recherche de fichiers avec fzf
    """
    def execute(self):
        import subprocess
        import os.path
        if self.quantifier:
            command="find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -type f -print 2> /dev/null | sed 1d | cut -b3- | fzf +m --reverse --header='Jump to file'"
        else:
            command="find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -print 2> /dev/null | sed 1d | cut -b3- | fzf +m --reverse --header='Jump to file or directory'"
        fzf = self.fm.execute_command(command, universal_newlines=True, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)


class compress(Command):
    """
    :compress <filename>
    Compresse les fichiers sélectionnés
    """
    def execute(self):
        import os
        from os.path import join, basename, splitext

        cwd = self.fm.thisdir
        marked_files = tuple(cwd.get_selection())

        if not marked_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        original_path = cwd.path
        parts = self.line.split()
        au_flags = parts[1:]

        descr = "compressing files in: " + os.path.basename(parts[1])
        obj = CommandLoader(args=['apack'] + au_flags + \
                [os.path.relpath(f.path, cwd.path) for f in marked_files], descr=descr, read=True)

        obj.signal_bind('after', refresh)
        self.fm.loader.add(obj)

    def tab(self, tabnum):
        return self._tab_directory_content()


class extract(Command):
    """
    :extract
    Extrait les archives sélectionnées
    """
    def execute(self):
        import os
        from os.path import basename

        cwd = self.fm.thisdir
        marked_files = tuple(cwd.get_selection())

        if not marked_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        one_file = marked_files[0]
        cwd = self.fm.thisdir
        original_path = cwd.path
        au_flags = ['-X', cwd.path]
        au_flags += self.line.split()[1:]
        au_flags += ['-e']

        self.fm.copy_buffer.clear()
        self.fm.cut_buffer = False
        if len(marked_files) == 1:
            descr = "extracting: " + basename(one_file.path)
        else:
            descr = "extracting files from: " + basename(one_file.dirname)
        obj = CommandLoader(args=['aunpack'] + au_flags \
                + [f.path for f in marked_files], descr=descr, read=True)

        obj.signal_bind('after', refresh)
        self.fm.loader.add(obj)


class mkcd(Command):
    """
    :mkcd <dirname>
    Crée un répertoire et se déplace dedans
    """
    def execute(self):
        from os.path import join, expanduser, lexists
        from os import makedirs
        import re

        dirname = join(self.fm.thisdir.path, expanduser(self.rest(1)))
        if not lexists(dirname):
            makedirs(dirname)

            match = re.search('^/|^~[^/]*/', dirname)
            if match:
                self.fm.cd(match.group(0))
                dirname = dirname[match.end(0):]

            for m in re.finditer('[^/]+', dirname):
                s = m.group(0)
                if s == '..' or (s.startswith('.') and not self.fm.settings['show_hidden']):
                    self.fm.cd(s)
                else:
                    self.fm.cd(s)
        else:
            self.fm.notify("file/directory exists!", bad=True)

    def tab(self, tabnum):
        return self._tab_directory_content()


from ranger.core.loader import CommandLoader

class paste_as_root(Command):
    """
    :paste_as_root
    Colle les fichiers avec les privilèges root
    """
    def execute(self):
        if self.fm.do_cut:
            self.fm.execute_console('shell sudo mv %c .')
        else:
            self.fm.execute_console('shell sudo cp -r %c .')


class fzf_rga(Command):
    """
    :fzf_rga
    Recherche dans le contenu des fichiers avec ripgrep et fzf
    """
    def execute(self):
        import subprocess
        command="rga-fzf"
        fzf = self.fm.execute_command(command, universal_newlines=True, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            import os.path
            fzf_file = os.path.abspath(stdout.rstrip('\n'))
            self.fm.select_file(fzf_file)
```
