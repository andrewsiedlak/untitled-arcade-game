GDPC                                                                                <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex�      �      �p��<f��r�g��.�@   res://.import/shell.png-3f1fd60968df623c4055312ee6946f4a.stex   �%      �       #�%~3woWn�<   res://.import/tank.png-df5e9fed772773b995fab2b58735640c.stex)      �      -�`��7����T�d	��@   res://.import/tank_v2.png-815283d913b05fe3059f4dc77a28978c.stex  6      �       Q�g�8�.	�gu�JHD   res://.import/tank_v2_2.png-b8b1d0332be5f3b7b4a54aea63a3086c.stex   �9      �       ���\�]އ_��{Cs�H   res://.import/tank_v2_right.png-f7cbbc22f96d501229abb8c688971ff7.stex   P=      �       �S�ʇ)�t��L�ьH   res://.import/tank_v2_right_2.png-1818595b7e9bdcca39df41f08b897cf6.stex �@      �       Mj9C W��q�Y��!    res://KinematicBody2D.gd.remap  �D      *       �9�^L�TDv [   res://KinematicBody2D.gdc   @      ~      P+>�4�}��w�V&
   res://Tank.tscn �      �      �1�Oڝ�\t���r��s   res://TestScene.tscn`      �      Ml�+�g�r�k-�_��   res://default_env.tres  �      �       um�`�N��<*ỳ�8   res://icon.png  �D      i      ����󈘥Ey��
�   res://icon.png.import   @#      �      "�Պ����$��㹌   res://project.binary`R      �      \�cd�����#f-$   res://shell.png.import  �&      �      pw�=w��b�\r�g[   res://tank.png.import   +      �      �`)�O��[�Q�GL���    res://tank_projectile.gd.remap  �D      *       ����cl�"�x�.���   res://tank_projectile.gdc   �-      �      ���!!2@�,I=%cDI   res://tank_projectile.tscn  p2      �      ^ކ�Xy7�,����   res://tank_v2.png.import 7      �      UW�F�: =���b�   res://tank_v2_2.png.import  �:      �      ��k:	n;��3�����    res://tank_v2_right.png.import  0>      �      �#�?���ݹ�?��&    res://tank_v2_right_2.png.import�A      �      7�q»�#��p*�G            GDSC         4   $     ������������τ�   �������϶���   ������������������ض   �嶶   �������������ն�   ���������Ķ�   ����������   ��������������������   ����򶶶   ��������¶��   ����¶��   ����������������Ҷ��   ζ��   �������������Ӷ�   ���϶���   ����������������������Ŷ   ϶��   �������������Ҷ�   ��������󶶶   ���������Ӷ�   �������Ӷ���   ������������ض��   ���������¶�   ��������Ҷ��   �������ض���   �������؄�   ��������������ض   ���������Ҷ�   ���������������Ŷ���   ����׶��   �������������Ӷ�          res://tank_projectile.tscn     ,     F         ui_right            moving     Z         right         ui_left       left      ui_down    �         down      ui_up                up        idle                   
                        !      &   	   +   
   ,      2      3      9      B      H      P      T      X      a      g      o      t      x      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,     -     .     /     0     1     2     3     4   3YY;�  �  PQY;�  �  T�  PQY;�  YY:�  ?P�  QY:�  �  Y:�  �  YY0�	  PQV�  �  �  �  PQ�  &�
  T�  P�  QV�  �  T�  �  �  W�  T�  P�  Q�  �  �  �  �  �  �  '�
  T�  P�	  QV�  �  T�  �  �  W�  T�  P�  Q�  �  �  �  �  �
  �  '�
  T�  P�  QV�  �  T�  �  �  W�  T�  P�  Q�  �  �  �  �  �  �  '�
  T�  P�  QV�  �  T�  �  �  W�  T�  P�  Q�  �  �  �  �  �  �  (V�  W�  T�  P�  Q�  �  &�
  T�  P�  QV�  �  &�  P�  �  T�  PQQ�  V�  �  �  T�  PQ�  ;�  �  T�  PQ�  �  T�  P�  Q�  �  PQT�  P�  Q�  �  T�  W�  T�  �  �  �  �  �  �  T�  PQ�  YY0�  P�  QV�  �	  PQ�  �  P�  Q`  [gd_scene load_steps=6 format=2]

[ext_resource path="res://KinematicBody2D.gd" type="Script" id=1]
[ext_resource path="res://tank_v2.png" type="Texture" id=2]
[ext_resource path="res://tank_v2_2.png" type="Texture" id=3]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 7, 6 )

[sub_resource type="SpriteFrames" id=2]
animations = [ {
"frames": [ ExtResource( 2 ) ],
"loop": false,
"name": "idle",
"speed": 0.0
}, {
"frames": [ ExtResource( 3 ), ExtResource( 2 ) ],
"loop": true,
"name": "moving",
"speed": 2.0
} ]

[node name="Tank" type="KinematicBody2D"]
script = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )

[node name="AnimatedSprite" type="AnimatedSprite" parent="."]
frames = SubResource( 2 )
animation = "idle"

[node name="Position2D" type="Position2D" parent="."]
position = Vector2( 0, -10 )
          [gd_scene load_steps=4 format=2]

[ext_resource path="res://icon.png" type="Texture" id=1]
[ext_resource path="res://Tank.tscn" type="PackedScene" id=2]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 31.7646, 32.1757 )

[node name="Node2D" type="Node2D"]

[node name="StaticBody2D" type="StaticBody2D" parent="."]
position = Vector2( 215.382, 49.9862 )

[node name="Sprite" type="Sprite" parent="StaticBody2D"]
texture = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="StaticBody2D"]
shape = SubResource( 1 )

[node name="KinematicBody2D" parent="." instance=ExtResource( 2 )]
          [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @           |  PNG �PNG

   IHDR   @   @   �iq�  ?IDATx��{pTU�����;�N7	�����%"fyN�8��r\]fEgةf���X�g��F�Y@Wp\]|,�D@��	$$���	��I�n���ҝt����JW�s��}�=���|�D(���W@T0^����f��	��q!��!i��7�C���V�P4}! ���t�ŀx��dB.��x^��x�ɏN��贚�E�2�Z�R�EP(�6�<0dYF���}^Ѡ�,	�3=�_<��(P&�
tF3j�Q���Q�B�7�3�D�@�G�U��ĠU=� �M2!*��[�ACT(�&�@0hUO�u��U�O�J��^FT(Qit �V!>%���9 J���jv	�R�@&��g���t�5S��A��R��OO^vz�u�L�2�����lM��>tH
�R6��������dk��=b�K�љ�]�י�F*W�볃�\m=�13� �Є,�ˏy��Ic��&G��k�t�M��/Q]�أ]Q^6o��r�h����Lʳpw���,�,���)��O{�:א=]� :LF�[�*���'/���^�d�Pqw�>>��k��G�g���No���\��r����/���q�̾��	�G��O���t%L�:`Ƶww�+���}��ݾ ۿ��SeŔ����  �b⾻ǰ��<n_�G��/��8�Σ�l]z/3��g����sB��tm�tjvw�:��5���l~�O���v��]ǚ��֩=�H	u���54�:�{"������}k����d���^��`�6�ev�#Q$�ήǞ��[�Ặ�e�e��Hqo{�59i˲����O+��e������4�u�r��z�q~8c
 �G���7vr��tZ5�X�7����_qQc�[����uR��?/���+d��x�>r2����P6����`�k��,7�8�ɿ��O<Ė��}AM�E%�;�SI�BF���}��@P�yK�@��_:����R{��C_���9������
M��~����i����������s���������6�,�c�������q�����`����9���W�pXW]���:�n�aұt~9�[���~e�;��f���G���v0ԣ� ݈���y�,��:j%gox�T
�����kְ�����%<��A`���Jk?���� gm���x�*o4����o��.�����逊i�L����>���-���c�����5L����i�}�����4����usB������67��}����Z�ȶ�)+����)+H#ۢ�RK�AW�xww%��5�lfC�A���bP�lf��5����>���`0ċ/oA-�,�]ĝ�$�峋P2/���`���;����[Y��.&�Y�QlM���ƌb+��,�s�[��S ��}<;���]�:��y��1>'�AMm����7q���RY%9)���ȡI�]>�_l�C����-z�� ;>�-g�dt5іT�Aͺy�2w9���d�T��J�}u�}���X�Ks���<@��t��ebL������w�aw�N����c����F���3
�2먭�e���PQ�s�`��m<1u8�3�#����XMڈe�3�yb�p�m��܇+��x�%O?CmM-Yf��(�K�h�بU1%?I�X�r��� ��n^y�U�����1�玒�6..e��RJrRz�Oc������ʫ��]9���ZV�\�$IL�OŨ��{��M�p�L56��Wy��J�R{���FDA@
��^�y�������l6���{�=��ή�V�hM�V���JK��:��\�+��@�l/���ʧ����pQ��������׷Q^^�(�T������|.���9�?I�M���>���5�f欙X�VƎ-f͚ո���9����=�m���Y���c��Z�̚5��k~���gHHR�Ls/l9²���+ ����:��杧��"9�@��ad�ŝ��ѽ�Y���]O�W_�`Ֆ#Դ8�z��5-N^�r�Z����h���ʆY���=�`�M���Ty�l���.	�/z��fH���������֗�H�9�f������G� ̛<��q��|�]>ں}�N�3�;i�r"�(2RtY���4X���F�
�����8 �[�\锰�b`�0s�:���v���2�f��k�Zp��Ω&G���=��6em.mN�o.u�fԐc��i����C���u=~{�����a^�UH������¡,�t(jy�Q�ɋ����5�Gaw��/�Kv?�|K��(��SF�h�����V��xȩ2St쯹���{6b�M/�t��@0�{�Ԫ�"�v7�Q�A�(�ľR�<	�w�H1D�|8�]�]�Ո%����jҢ꯸hs�"~꯸P�B�� �%I}}��+f�����O�cg�3rd���P�������qIڻ]�h�c9��xh )z5��� �ƾ"1:3���j���'1;��#U�失g���0I}�u3.)@�Q�A�ĠQ`I�`�(1h��t*�:�>'��&v��!I?�/.)@�S�%q�\���l�TWq�������լ�G�5zy6w��[��5�r���L`�^���/x}�>��t4���cݦ�(�H�g��C�EA�g�)�Hfݦ��5�;q-���?ư�4�����K����XQ*�av�F��������񵏷�;>��l�\F��Þs�c�hL�5�G�c�������=q�P����E �.���'��8Us�{Ǎ���#������q�HDA`b��%����F�hog���|�������]K�n��UJ�}������Dk��g��8q���&G����A�RP�e�$'�i��I3j�w8������?�G�&<	&䪬R��lb1�J����B$�9�꤮�ES���[�������8�]��I�B!
�T
L:5�����d���K30"-	�(��D5�v��#U�����jԔ�QR�GIaó�I3�nJVk���&'��q����ux��AP<�"�Q�����H�`Jң�jP(D��]�����`0��+�p�inm�r�)��,^�_�rI�,��H>?M-44���x���"� �H�T��zIty����^B�.��%9?E����П�($@H!�D��#m�e���vB(��t �2.��8!���s2Tʡ �N;>w'����dq�"�2����O�9$�P	<(��z�Ff�<�z�N��/yD�t�/?�B.��A��>��i%�ǋ"�p n� ���]~!�W�J���a�q!n��V X*�c �TJT*%�6�<d[�    IEND�B`�        [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
              GDST               o   PNG �PNG

   IHDR         ���   2IDAT�c��/`�/���?cU��d+0 c}V+X�� ���l���    IEND�B`�     [remap]

importer="texture"
type="StreamTexture"
path="res://.import/shell.png-3f1fd60968df623c4055312ee6946f4a.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://shell.png"
dest_files=[ "res://.import/shell.png-3f1fd60968df623c4055312ee6946f4a.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
           GDST@   @            �  PNG �PNG

   IHDR   @   @   �iq�  �IDATx��An�0E�U�ބ.r�ܠ����rv� �!�؞��y
����8�!�(3�B�qh4n -���мZ��#����9~�2}�� �(�ur�¢�0�f�"��yY�6NG�F�b��t���b�:��z^VI:A=`���C�7�i���S�Owz_r�AD.�6?����O��'^�(�ۅ����ׯ������]L:8/�]ai![Pc$�� 7�@��h� Z ����<����t@�p���+�����o��)�W�u'L�n -����Lo��e�f)�XNpj��ph4C3 �� ̟�̎��� "1-��f(1kk�.�����Ag�A�k�.��K_j�>�X,b��E�HJ��-��x�h� Z �@�qh4n -����|�t���E5    IEND�B`�   [remap]

importer="texture"
type="StreamTexture"
path="res://.import/tank.png-df5e9fed772773b995fab2b58735640c.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://tank.png"
dest_files=[ "res://.import/tank.png-df5e9fed772773b995fab2b58735640c.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
            GDSC      
   #   �      ���ׄ�   ����򶶶   �������϶���   ��������ض��   ������������ض��   ���������Ķ�   ���������Ķ�   �������������Ӷ�   ����������������������Ŷ   ���������������Ŷ���   ����׶��   ζ��   ���������Ҷ�   ϶��   ��������Ӷ��(   ���������������������Ą��������������Ҷ�   ���������Ӷ�   �������ׄ�������������Ҷ   ���϶���   x             right                   Z         left      up        down   �                                                       	       
   &      /      6      <      F      N      T      ^      d      m      t      u      y      z      �      �      �      �      �      �      �      �       �   !   �   "   �   #   3YY:�  Y;�  �  PQY;�  �  YY0�  P�  QV�  �  ;�  �  &�  �  V�  �  �  P�  R�  Q�  W�  T�  �  �  '�  �  V�  �  �  P�  R�  Q�  W�  T�  �  �  '�  �  V�  �  �  P�  R�  Q�  '�  �  V�  �  �  P�  R�  Q�  W�  T�  �	  �  �  �  �  YY0�	  P�
  QV�  �  T�  �  T�  PQT�  �  �
  �  �  T�  �  T�  PQT�  �  �
  �  �  P�  Q�  Y0�  PQV�  �  PQYYY0�  P�  QV�  �  PQY`       [gd_scene load_steps=5 format=2]

[ext_resource path="res://tank_projectile.gd" type="Script" id=1]
[ext_resource path="res://shell.png" type="Texture" id=2]

[sub_resource type="SpriteFrames" id=1]
animations = [ {
"frames": [ ExtResource( 2 ) ],
"loop": false,
"name": "up",
"speed": 0.0
} ]

[sub_resource type="RectangleShape2D" id=2]
extents = Vector2( 2, 2 )

[node name="Area2D" type="Area2D"]
script = ExtResource( 1 )

[node name="AnimatedSprite" type="AnimatedSprite" parent="."]
frames = SubResource( 1 )
animation = "up"

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 2 )

[node name="VisibilityNotifier2D" type="VisibilityNotifier2D" parent="."]
[connection signal="body_entered" from="." to="." method="_on_Area2D_body_entered"]
[connection signal="screen_exited" from="VisibilityNotifier2D" to="." method="_on_VisibilityNotifier2D_screen_exited"]
            GDST               �   PNG �PNG

   IHDR         ��a   IDAT8��SA� +�?1ٯ�t��.Kl�;l=Ih���y!Cw�E�#�� @yS-⩃*D&����Z� ���q�ܸ�%Rp���
�:���A��.�vD-�B��B�~��F*^�`�8L��6n�2M!"�=�n    IEND�B`�        [remap]

importer="texture"
type="StreamTexture"
path="res://.import/tank_v2.png-815283d913b05fe3059f4dc77a28978c.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://tank_v2.png"
dest_files=[ "res://.import/tank_v2.png-815283d913b05fe3059f4dc77a28978c.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
   GDST               �   PNG �PNG

   IHDR         ��a   {IDAT8��S[� �ś��V;:ga?[�J�~l�#}PM���Y3�A��!5����m��5�����-�Q!�gY qm0ÿ�/�hP���dO��܂�D��ґ� v�o =���]�nT�!"5�
C    IEND�B`�            [remap]

importer="texture"
type="StreamTexture"
path="res://.import/tank_v2_2.png-b8b1d0332be5f3b7b4a54aea63a3086c.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://tank_v2_2.png"
dest_files=[ "res://.import/tank_v2_2.png-b8b1d0332be5f3b7b4a54aea63a3086c.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
             GDST               �   PNG �PNG

   IHDR         ��a   xIDAT8��R[
�0�Ûv��gq?-�h�nˏE�&!t��Vo)� �u&������]�4��$�kȌf`ٗ/a�4��Z�Ű�fPDd�/zO�	yPLb�@�4��A2�1ʙ4*���2�D���[r    IEND�B`�               [remap]

importer="texture"
type="StreamTexture"
path="res://.import/tank_v2_right.png-f7cbbc22f96d501229abb8c688971ff7.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://tank_v2_right.png"
dest_files=[ "res://.import/tank_v2_right.png-f7cbbc22f96d501229abb8c688971ff7.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
 GDST               �   PNG �PNG

   IHDR         ��a   vIDAT8��RA�0�?Y�|:o��э����i[7|�o+�6 Xhݓ��L�hb�2�^Y�0/���1e� �0�����vYA����3�3���G�&�4�M,��	2-t$�7���D�e*]�    IEND�B`� [remap]

importer="texture"
type="StreamTexture"
path="res://.import/tank_v2_right_2.png-1818595b7e9bdcca39df41f08b897cf6.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://tank_v2_right_2.png"
dest_files=[ "res://.import/tank_v2_right_2.png-1818595b7e9bdcca39df41f08b897cf6.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
           [remap]

path="res://KinematicBody2D.gdc"
      [remap]

path="res://tank_projectile.gdc"
      �PNG

   IHDR   @   @   �iq�  0IDATx��}pTU����L����W�$�@HA�%"fa��Yw�)��A��Egةf���X�g˱��tQ���Eq�!�|K�@BHH:�t>�;�����1!ݝn�A�_UWw����{λ��sϽO�q汤��X,�q�z�<�q{cG.;��]�_�`9s��|o���:��1�E�V� ~=�	��ݮ����g[N�u�5$M��NI��-
�"(U*��@��"oqdYF�y�x�N�e�2���s����KҦ`L��Z)=,�Z}"
�A�n{�A@%$��R���F@�$m������[��H���"�VoD��v����Kw�d��v	�D�$>	�J��;�<�()P�� �F��
�< �R����&�կ��� ����������%�u̚VLNfڠus2�̚VL�~�>���mOMJ���J'R��������X����׬X�Ϲ虾��6Pq������j���S?�1@gL���±����(�2A�l��h��õm��Nb�l_�U���+����_����p�)9&&e)�0 �2{��������1���@LG�A��+���d�W|x�2-����Fk7�2x��y,_�_��}z��rzy��%n�-]l����L��;
�s���:��1�sL0�ڳ���X����m_]���BJ��im�  �d��I��Pq���N'�����lYz7�����}1�sL��v�UIX���<��Ó3���}���nvk)[����+bj�[���k�������cݮ��4t:= $h�4w:qz|A��٧�XSt�zn{�&��õmQ���+�^�j�*��S��e���o�V,	��q=Y�)hԪ��F5~����h�4 *�T�o��R���z�o)��W�]�Sm銺#�Qm�]�c�����v��JO��?D��B v|z�կ��܈�'�z6?[� ���p�X<-���o%�32����Ρz�>��5�BYX2���ʦ�b��>ǣ������SI,�6���|���iXYQ���U�҅e�9ma��:d`�iO����{��|��~����!+��Ϧ�u�n��7���t>�l捊Z�7�nвta�Z���Ae:��F���g�.~����_y^���K�5��.2�Zt*�{ܔ���G��6�Y����|%�M	���NPV.]��P���3�8g���COTy�� ����AP({�>�"/��g�0��<^��K���V����ϫ�zG�3K��k���t����)�������6���a�5��62Mq����oeJ�R�4�q�%|�� ������z���ä�>���0�T,��ǩ�����"lݰ���<��fT����IrX>� � ��K��q�}4���ʋo�dJ��م�X�sؘ]hfJ�����Ŧ�A�Gm߽�g����YG��X0u$�Y�u*jZl|p������*�Jd~qcR�����λ�.�
�r�4���zپ;��AD�eЪU��R�:��I���@�.��&3}l
o�坃7��ZX��O�� 2v����3��O���j�t	�W�0�n5����#è����%?}����`9۶n���7"!�uf��A�l܈�>��[�2��r��b�O�������gg�E��PyX�Q2-7���ʕ������p��+���~f��;����T	�*�(+q@���f��ϫ����ѓ���a��U�\.��&��}�=dd'�p�l�e@y��
r�����zDA@����9�:��8�Y,�����=�l�֮��F|kM�R��GJK��*�V_k+��P�,N.�9��K~~~�HYY��O��k���Q�����|rss�����1��ILN��~�YDV��-s�lfB֬Y�#.�=�>���G\k֬fB�f3��?��k~���f�IR�lS'�m>²9y���+ �v��y��M;NlF���A���w���w�b���Л�j�d��#T��b���e��[l<��(Z�D�NMC���k|Zi�������Ɗl��@�1��v��Щ�!曣�n��S������<@̠7�w�4X�D<A`�ԑ�ML����jw���c��8��ES��X��������ƤS�~�׾�%n�@��( Zm\�raҩ���x��_���n�n���2&d(�6�,8^o�TcG���3���emv7m6g.w��W�e
�h���|��Wy��~���̽�!c� �ݟO�)|�6#?�%�,O֫9y������w��{r�2e��7Dl �ׇB�2�@���ĬD4J)�&�$
�HԲ��
/�߹�m��<JF'!�>���S��PJ"V5!�A�(��F>SD�ۻ�$�B/>lΞ�.Ϭ�?p�l6h�D��+v�l�+v$Q�B0ūz����aԩh�|9�p����cƄ,��=Z�����������Dc��,P��� $ƩЩ�]��o+�F$p�|uM���8R��L�0�@e'���M�]^��jt*:��)^�N�@�V`�*�js�up��X�n���tt{�t:�����\�]>�n/W�\|q.x��0���D-���T��7G5jzi���[��4�r���Ij������p�=a�G�5���ͺ��S���/��#�B�EA�s�)HO`���U�/QM���cdz
�,�!�(���g�m+<R��?�-`�4^}�#>�<��mp��Op{�,[<��iz^�s�cü-�;���쾱d����xk瞨eH)��x@���h�ɪZNU_��cxx�hƤ�cwzi�p]��Q��cbɽcx��t�����M|�����x�=S�N���
Ͽ�Ee3HL�����gg,���NecG�S_ѠQJf(�Jd�4R�j��6�|�6��s<Q��N0&Ge
��Ʌ��,ᮢ$I�痹�j���Nc���'�N�n�=>|~�G��2�)�D�R U���&ՠ!#1���S�D��Ǘ'��ೃT��E�7��F��(?�����s��F��pC�Z�:�m�p�l-'�j9QU��:��a3@0�*%�#�)&�q�i�H��1�'��vv���q8]t�4����j��t-}IـxY�����C}c��-�"?Z�o�8�4Ⱦ���J]/�v�g���Cȷ2]�.�Ǣ ��Ս�{0
�>/^W7�_�����mV铲�
i���FR��$>��}^��dُ�۵�����%��*C�'�x�d9��v�ߏ � ���ۣ�Wg=N�n�~������/�}�_��M��[���uR�N���(E�	� ������z��~���.m9w����c����
�?���{�    IEND�B`�       ECFG      _global_script_classes             _global_script_class_icons             application/config/name          Untitiled-Arcade-Project   application/run/main_scene         res://TestScene.tscn   application/config/icon         res://icon.png     display/window/size/width      @     display/window/size/height      �      display/window/size/test_width            display/window/size/test_height      �     display/window/stretch/mode         2d     display/window/stretch/aspect         keep#   rendering/quality/2d/use_pixel_snap         )   rendering/environment/default_environment          res://default_env.tres  GDPC