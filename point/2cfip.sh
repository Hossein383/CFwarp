#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename '2cfip.sh' encrypted at Fri Jan 19 08:28:30 UTC 2024
# I try invoking the compressed executable with the original name
# (for programs looking at their name).  We also try to retain the original
# file permissions on the compressed file.  For safety reasons, bzsh will
# not create setuid or setgid shell scripts.
#
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Don't forget to follow me on <https://github.com/FajarKim>
skip=75

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

bztmpdir=
trap 'res=$?
  test -n "$bztmpdir" && rm -fr "$bztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  bztmpdir=`mktemp -d "${TMPDIR}bztmpXXXXXXXXX"`
else
  bztmpdir=${TMPDIR}bztmp$$; mkdir $bztmpdir
fi || { (exit 127); exit 127; }

bztmp=$bztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$bztmp" && rm -r "$bztmp";;
*/*) bztmp=$bztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | bzip2 -cd > "$bztmp"; then
  umask $umask
  chmod 700 "$bztmp"
  (sleep 5; rm -fr "$bztmpdir") 2>/dev/null &
  "$bztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
BZh91AY&SY�^�S �_�0}����������w����������
�4QF���� �� 4  �NPIB"`����6�Ѵ��#'��M6�M=#M=5 M44�   A�Jh�Sؚ��S�==M2��  h4 �4�    � �i�&@�C#C&�0�C 0F#&�h0F#�F � FM2h�=?�U4 h @i�@  �hF����    � b���bm�	� & 4�Ɂ4�0 ɓ&!�ah�$@L�&#SzL"~�!�S51�Hژ'��4�b ѐ    4�B�M�w���{��/�#��*�W��ME�����ʣޝ���'O�FvXꭗ�"W��C��
6�a��՘@��m���v���Z�B�cRQ,(�N�M��mµ��,\9A�"�������:��{AeXa\�6����������b�􏄩&��/<�@f/9X���
�hH7��ʪj�sO����/�b���k���B@���z�rko�����*P��� ]O=S��)���@zjK�A!�{����j������(-s�m��m��-��Ŷ�m��]��wС7�靪�+�h:^����,��%t����0.$,Y@b)y,��(D�#pGP�#6����؞�`F� � ��c��R�@.1��k��u��P��@��e�T�,3v���c��� ]����sd�8�99��f����(��^7��o��%͓�.������Q�>l���dv|#��������O�Q�{�w�p�O,���H��`�Y��m.�Ɓ�y ]I�ߌ%BsP��D�Lp���&�qj$�+h��W����7i��(p��q(�9�fa$�kt:���a|�"�e}��)~n 7C�`� ^Z@��;�B�
2Ԅ�v�]��	1�\��lLa:��<ni�
�������8b�JPJR�-�G���T� L&��.^nàӫ	1�c��`��[.�-�e�r9d���.���l ���/o�.�n7Ful�el A��Q�R�
���C�        �d���+V�\�� �hE��b�U
j�}N�"�}+T�ZT�B�5�Bi�B�Z���\���k��ۑ�]M�e\5 =N��%ֆ�6�1��A5^�E�9LT��ʖ�.j��IY=\$�EhV"�4�(�``�ۄ�+PP�Z�
kC�-����[�_��PaY����!4������+;�;�Pv}R#v�\��X��=w��R�� ���JzV�Zѷ��l�܀ܘQUmh)1�ZW]�
�^,+ �ħ燻��C�g�G�W.�K_�D#�]^���@3���G����4W�� �D�Zfc�PP.�!��ㄎ�s������LH6��1��Qs��A����W�yZI}�@�ȩ ���E�Y�\�?����ߛ?b������2�\���IP0�u��mu�o�.~mc����%�B(2% P@�@]�E�
(P(�Q@��E�
(P(�Qz�B�Ü��� �:˴�ã@
��Wo�p�G�tn�"]S-��y,�������Ő�}�Po<���!-z�F� pJ_$t���$@�&`�(���p��H��YY�kehH��xX�ZwM�R�*B��OZ �v���Ѿ�ĭ�
�y���[U��诨 �^��eK(6%�л�L�3 ��* �ɕ8�F ���TԌH�P͆�L�ea]\�B��)k�l`�kyNȎ�w'�ꬸ��6�m��Ui4�E"�E�@�]�"�9Ƀ,\"[�[�S3$$	�m61{ԞM�Â��i)���v-��l��rj��ZZ���? �t�tv kU�(�d�KM���a�H�ESy���$|�Wi�r. �T� ��-ݤ����<�z����U4X ����	�\*R�P*S�J$�N@���R�K]��pm 0HX��n	�����f�\v��_X![������cI��m!I@OP#j�ʃ<�T��l� ��V�tf�H�ihH�fV�ƈz�oh�-!2�ci^q!F����=?�У&;Q��XS0��n�}<���:�@0��K~`����nv���l����V	�.�!#	�xT�����Z* C��h�����1%V�>8q�/!�6���5"[RO�ƙ��-�1�`m�k�$�݀��@�[�4ZBZ�_�A-EY��&[���} \�#*78[�Bv-S�����z��,0���p�j�@dV�jt���C*@��#<!�&�s���l<N�@OϘB^�S`��T��*E��X���>�ܒ�	T���R�H`��c~>خH���)z��g�s�i]�x�^�4* ���g�:Yb#�����c�ϓE���v/����Z'�:5 7w�U/h���/��h�(a�-!���ɇ�aS�.�M����Xz�!��ʄ��;bϸ~��	`�+���Z�h��sm	���BKo�o&g�����g�{Vm�c����xy�E�jLH�/�ql�P�(���5?���i�Lb��@Dw^ϋ��~7�92�a����)�*Z�!�<���g�%�G�#��^60�E����R�v�A�LR.U��2)�E+����˧���	 ;��i�
ݍSE[+�xJz^B���.��B��w�$��)�G�������R���EҰ�VF�De�D$P2����}R`��bm�Z�/���)�"���