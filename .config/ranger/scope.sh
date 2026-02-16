## 3. scope.sh (~/.config/ranger/scope.sh)

**Script de prévisualisation des fichiers**

```bash
#!/usr/bin/env bash

set -o noclobber -o noglob -o nounset -o pipefail
IFS=$'\n'

FILE_PATH="${1}"
PV_WIDTH="${2}"
PV_HEIGHT="${3}"
IMAGE_CACHE_PATH="${4}"
PV_IMAGE_ENABLED="${5}"

FILE_EXTENSION="${FILE_PATH##*.}"
FILE_EXTENSION_LOWER="$(printf "%s" "${FILE_EXTENSION}" | tr '[:upper:]' '[:lower:]')"
MIMETYPE="$(file --dereference --brief --mime-type -- "${FILE_PATH}")"

handle_extension() {
    case "${FILE_EXTENSION_LOWER}" in
        # Archives
        a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|\
        rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
            atool --list -- "${FILE_PATH}" && exit 0
            bsdtar --list --file "${FILE_PATH}" && exit 0
            exit 1;;
        rar)
            unrar lt -p- -- "${FILE_PATH}" && exit 0
            exit 1;;
        7z)
            7z l -p -- "${FILE_PATH}" && exit 0
            exit 1;;

        # PDF
        pdf)
            pdftotext -l 10 -nopgbrk -q -- "${FILE_PATH}" - | \
              fmt -w "${PV_WIDTH}" && exit 0
            mutool draw -F txt -i -- "${FILE_PATH}" 1-10 | \
              fmt -w "${PV_WIDTH}" && exit 0
            exiftool "${FILE_PATH}" && exit 0
            exit 1;;

        # BitTorrent
        torrent)
            transmission-show -- "${FILE_PATH}" && exit 0
            exit 1;;

        # OpenDocument
        odt|ods|odp|sxw)
            odt2txt "${FILE_PATH}" && exit 0
            pandoc -s -t markdown -- "${FILE_PATH}" && exit 0
            exit 1;;

        # HTML
        htm|html|xhtml)
            w3m -dump "${FILE_PATH}" && exit 0
            lynx -dump -- "${FILE_PATH}" && exit 0
            elinks -dump "${FILE_PATH}" && exit 0
            pandoc -s -t markdown -- "${FILE_PATH}" && exit 0
            ;;

        # JSON
        json)
            jq --color-output . "${FILE_PATH}" && exit 0
            python -m json.tool -- "${FILE_PATH}" && exit 0
            ;;

        # Markdown
        md)
            glow -s dark "${FILE_PATH}" && exit 0
            pandoc -s -t plain -- "${FILE_PATH}" && exit 0
            ;;

        # DOCX, XLSX, PPTX
        docx|xlsx|pptx)
            pandoc -s -t markdown -- "${FILE_PATH}" && exit 0
            exit 1;;
    esac
}

handle_image() {
    local mimetype="${1}"
    case "${mimetype}" in
        image/svg+xml|image/svg)
            convert -- "${FILE_PATH}" "${IMAGE_CACHE_PATH}" && exit 6
            exit 1;;
        image/*)
            local orientation
            orientation="$( identify -format '%[EXIF:Orientation]\n' -- "${FILE_PATH}" )"
            if [[ -n "$orientation" && "$orientation" != 1 ]]; then
                convert -- "${FILE_PATH}" -auto-orient "${IMAGE_CACHE_PATH}" && exit 6
            fi
            exit 7;;
        video/*)
            ffmpegthumbnailer -i "${FILE_PATH}" -o "${IMAGE_CACHE_PATH}" -s 0 && exit 6
            exit 1;;
    esac
}

handle_mime() {
    local mimetype="${1}"
    case "${mimetype}" in
        # Texte
        text/* | */xml)
            bat --color=always --style=plain \
                --pager=never "${FILE_PATH}" && exit 0
            cat "${FILE_PATH}" && exit 0
            exit 2;;

        # Images
        image/*)
            exiftool "${FILE_PATH}" && exit 0
            exit 1;;

        # Vidéo et audio
        video/* | audio/*)
            mediainfo "${FILE_PATH}" && exit 0
            exiftool "${FILE_PATH}" && exit 0
            exit 1;;
    esac
}

handle_fallback() {
    echo '----- Informations du fichier -----' && file --dereference --brief -- "${FILE_PATH}" && exit 0
    exit 1
}

MIMETYPE="$( file --dereference --brief --mime-type -- "${FILE_PATH}" )"
if [[ "${PV_IMAGE_ENABLED}" == 'True' ]]; then
    handle_image "${MIMETYPE}"
fi
handle_extension
handle_mime "${MIMETYPE}"
handle_fallback

exit 1
```

**Rendez-le exécutable :**
```bash
chmod +x ~/.config/ranger/scope.sh
```
