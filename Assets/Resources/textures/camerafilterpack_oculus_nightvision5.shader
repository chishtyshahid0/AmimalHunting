Shader "CameraFilterPack/Oculus_NightVision5" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 10342
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					varying mediump vec2 xlv_TEXCOORD0;
					varying lowp vec4 xlv_COLOR;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp vec2 tmpvar_2;
					  tmpvar_2 = _glesMultiTexCoord0.xy;
					  mediump vec2 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_3 = tmpvar_2;
					  tmpvar_4 = tmpvar_1;
					  xlv_TEXCOORD0 = tmpvar_3;
					  gl_Position = (glstate_matrix_mvp * _glesVertex);
					  xlv_COLOR = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp float _TimeX;
					uniform highp float _Red_R;
					uniform highp float _Red_G;
					uniform highp float _Red_B;
					uniform highp float _Green_R;
					uniform highp float _Green_G;
					uniform highp float _Green_B;
					uniform highp float _Blue_R;
					uniform highp float _Blue_G;
					uniform highp float _Blue_B;
					uniform highp float _Red_C;
					uniform highp float _Green_C;
					uniform highp float _Blue_C;
					uniform highp float _FadeFX;
					uniform highp float _Size;
					uniform highp float _Dist;
					uniform highp float _Smooth;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 rgb_1;
					  highp vec4 col_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, uv_3);
					  col_2 = tmpvar_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5.x = _Red_R;
					  tmpvar_5.y = (_Red_G - _Smooth);
					  tmpvar_5.z = _Red_B;
					  highp vec3 tmpvar_6;
					  tmpvar_6.x = _Green_R;
					  tmpvar_6.y = (_Green_G - _Smooth);
					  tmpvar_6.z = _Green_B;
					  highp vec3 tmpvar_7;
					  tmpvar_7.x = _Blue_R;
					  tmpvar_7.y = (_Blue_G - _Smooth);
					  tmpvar_7.z = _Blue_B;
					  highp vec3 tmpvar_8;
					  tmpvar_8.x = (dot (col_2.xyz, tmpvar_5) + _Red_C);
					  tmpvar_8.y = (dot (col_2.xyz, tmpvar_6) + _Green_C);
					  tmpvar_8.z = (dot (col_2.xyz, tmpvar_7) + _Blue_C);
					  highp float xlat_varsample_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = 1.0;
					  tmpvar_10.y = (2.0 * cos(_TimeX));
					  highp vec2 P_11;
					  P_11 = (((tmpvar_10 * _TimeX) * 8.0) + ((uv_3 * vec2(0.5, 1.0)) + vec2(1.0, 3.0)));
					  lowp float tmpvar_12;
					  tmpvar_12 = texture2D (_MainTex, P_11).x;
					  xlat_varsample_9 = tmpvar_12;
					  xlat_varsample_9 = (xlat_varsample_9 * xlat_varsample_9);
					  highp float tmpvar_13;
					  highp float x_14;
					  x_14 = (((uv_3.y * 2.0) + (_TimeX / 4.0)) + sin((_TimeX + 
					    sin((_TimeX * 0.23))
					  )));
					  tmpvar_13 = (x_14 - floor(x_14));
					  highp float tmpvar_15;
					  tmpvar_15 = (float((tmpvar_13 >= 0.4)) - float((tmpvar_13 >= 0.6)));
					  rgb_1 = (tmpvar_8 + ((
					    ((1.0 - ((
					      (tmpvar_13 - 0.4)
					     / 0.2) * tmpvar_15)) * tmpvar_15)
					   * xlat_varsample_9) / 8.0));
					  highp float x_16;
					  x_16 = ((uv_3.y * 30.0) + _TimeX);
					  rgb_1 = (rgb_1 * ((12.0 + 
					    (x_16 - floor(x_16))
					  ) / 13.0));
					  rgb_1 = (rgb_1 * (0.5 + (
					    (((6.0 * uv_3.x) * uv_3.y) * (1.5 - uv_3.x))
					   * 
					    (1.5 - uv_3.y)
					  )));
					  rgb_1 = (rgb_1 * (0.9 + (0.1 * 
					    sin(((10.0 * _TimeX) + (uv_3.y * 250.0)))
					  )));
					  rgb_1 = (rgb_1 * (0.79 + (0.01 * 
					    sin((110.0 * _TimeX))
					  )));
					  uv_3.x = (uv_3.x / 0.72);
					  highp float tmpvar_17;
					  tmpvar_17 = (_Size - _Smooth);
					  highp vec2 tmpvar_18;
					  tmpvar_18.y = 0.5;
					  tmpvar_18.x = (0.694 + _Dist);
					  highp vec2 x_19;
					  x_19 = (tmpvar_18 - uv_3);
					  highp float tmpvar_20;
					  tmpvar_20 = clamp (((
					    sqrt(dot (x_19, x_19))
					   - _Size) / (tmpvar_17 - _Size)), 0.0, 1.0);
					  highp vec2 tmpvar_21;
					  tmpvar_21.y = 0.5;
					  tmpvar_21.x = (0.694 - _Dist);
					  highp vec2 x_22;
					  x_22 = (tmpvar_21 - uv_3);
					  highp float tmpvar_23;
					  tmpvar_23 = clamp (((
					    sqrt(dot (x_22, x_22))
					   - _Size) / (tmpvar_17 - _Size)), 0.0, 1.0);
					  highp vec4 tmpvar_24;
					  tmpvar_24.w = 0.0;
					  tmpvar_24.xyz = (rgb_1 * (vec3(1.0, 1.0, 1.0) - vec3((
					    (1.0 - (tmpvar_20 * (tmpvar_20 * (3.0 - 
					      (2.0 * tmpvar_20)
					    ))))
					   * 
					    (1.0 - (tmpvar_23 * (tmpvar_23 * (3.0 - 
					      (2.0 * tmpvar_23)
					    ))))
					  ))));
					  highp vec3 tmpvar_25;
					  tmpvar_25 = mix (col_2, tmpvar_24, vec4(_FadeFX)).xyz;
					  rgb_1 = tmpvar_25;
					  highp vec4 tmpvar_26;
					  tmpvar_26.w = 1.0;
					  tmpvar_26.xyz = tmpvar_25;
					  gl_FragData[0] = tmpvar_26;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					varying mediump vec2 xlv_TEXCOORD0;
					varying lowp vec4 xlv_COLOR;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp vec2 tmpvar_2;
					  tmpvar_2 = _glesMultiTexCoord0.xy;
					  mediump vec2 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_3 = tmpvar_2;
					  tmpvar_4 = tmpvar_1;
					  xlv_TEXCOORD0 = tmpvar_3;
					  gl_Position = (glstate_matrix_mvp * _glesVertex);
					  xlv_COLOR = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp float _TimeX;
					uniform highp float _Red_R;
					uniform highp float _Red_G;
					uniform highp float _Red_B;
					uniform highp float _Green_R;
					uniform highp float _Green_G;
					uniform highp float _Green_B;
					uniform highp float _Blue_R;
					uniform highp float _Blue_G;
					uniform highp float _Blue_B;
					uniform highp float _Red_C;
					uniform highp float _Green_C;
					uniform highp float _Blue_C;
					uniform highp float _FadeFX;
					uniform highp float _Size;
					uniform highp float _Dist;
					uniform highp float _Smooth;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 rgb_1;
					  highp vec4 col_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, uv_3);
					  col_2 = tmpvar_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5.x = _Red_R;
					  tmpvar_5.y = (_Red_G - _Smooth);
					  tmpvar_5.z = _Red_B;
					  highp vec3 tmpvar_6;
					  tmpvar_6.x = _Green_R;
					  tmpvar_6.y = (_Green_G - _Smooth);
					  tmpvar_6.z = _Green_B;
					  highp vec3 tmpvar_7;
					  tmpvar_7.x = _Blue_R;
					  tmpvar_7.y = (_Blue_G - _Smooth);
					  tmpvar_7.z = _Blue_B;
					  highp vec3 tmpvar_8;
					  tmpvar_8.x = (dot (col_2.xyz, tmpvar_5) + _Red_C);
					  tmpvar_8.y = (dot (col_2.xyz, tmpvar_6) + _Green_C);
					  tmpvar_8.z = (dot (col_2.xyz, tmpvar_7) + _Blue_C);
					  highp float xlat_varsample_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = 1.0;
					  tmpvar_10.y = (2.0 * cos(_TimeX));
					  highp vec2 P_11;
					  P_11 = (((tmpvar_10 * _TimeX) * 8.0) + ((uv_3 * vec2(0.5, 1.0)) + vec2(1.0, 3.0)));
					  lowp float tmpvar_12;
					  tmpvar_12 = texture2D (_MainTex, P_11).x;
					  xlat_varsample_9 = tmpvar_12;
					  xlat_varsample_9 = (xlat_varsample_9 * xlat_varsample_9);
					  highp float tmpvar_13;
					  highp float x_14;
					  x_14 = (((uv_3.y * 2.0) + (_TimeX / 4.0)) + sin((_TimeX + 
					    sin((_TimeX * 0.23))
					  )));
					  tmpvar_13 = (x_14 - floor(x_14));
					  highp float tmpvar_15;
					  tmpvar_15 = (float((tmpvar_13 >= 0.4)) - float((tmpvar_13 >= 0.6)));
					  rgb_1 = (tmpvar_8 + ((
					    ((1.0 - ((
					      (tmpvar_13 - 0.4)
					     / 0.2) * tmpvar_15)) * tmpvar_15)
					   * xlat_varsample_9) / 8.0));
					  highp float x_16;
					  x_16 = ((uv_3.y * 30.0) + _TimeX);
					  rgb_1 = (rgb_1 * ((12.0 + 
					    (x_16 - floor(x_16))
					  ) / 13.0));
					  rgb_1 = (rgb_1 * (0.5 + (
					    (((6.0 * uv_3.x) * uv_3.y) * (1.5 - uv_3.x))
					   * 
					    (1.5 - uv_3.y)
					  )));
					  rgb_1 = (rgb_1 * (0.9 + (0.1 * 
					    sin(((10.0 * _TimeX) + (uv_3.y * 250.0)))
					  )));
					  rgb_1 = (rgb_1 * (0.79 + (0.01 * 
					    sin((110.0 * _TimeX))
					  )));
					  uv_3.x = (uv_3.x / 0.72);
					  highp float tmpvar_17;
					  tmpvar_17 = (_Size - _Smooth);
					  highp vec2 tmpvar_18;
					  tmpvar_18.y = 0.5;
					  tmpvar_18.x = (0.694 + _Dist);
					  highp vec2 x_19;
					  x_19 = (tmpvar_18 - uv_3);
					  highp float tmpvar_20;
					  tmpvar_20 = clamp (((
					    sqrt(dot (x_19, x_19))
					   - _Size) / (tmpvar_17 - _Size)), 0.0, 1.0);
					  highp vec2 tmpvar_21;
					  tmpvar_21.y = 0.5;
					  tmpvar_21.x = (0.694 - _Dist);
					  highp vec2 x_22;
					  x_22 = (tmpvar_21 - uv_3);
					  highp float tmpvar_23;
					  tmpvar_23 = clamp (((
					    sqrt(dot (x_22, x_22))
					   - _Size) / (tmpvar_17 - _Size)), 0.0, 1.0);
					  highp vec4 tmpvar_24;
					  tmpvar_24.w = 0.0;
					  tmpvar_24.xyz = (rgb_1 * (vec3(1.0, 1.0, 1.0) - vec3((
					    (1.0 - (tmpvar_20 * (tmpvar_20 * (3.0 - 
					      (2.0 * tmpvar_20)
					    ))))
					   * 
					    (1.0 - (tmpvar_23 * (tmpvar_23 * (3.0 - 
					      (2.0 * tmpvar_23)
					    ))))
					  ))));
					  highp vec3 tmpvar_25;
					  tmpvar_25 = mix (col_2, tmpvar_24, vec4(_FadeFX)).xyz;
					  rgb_1 = tmpvar_25;
					  highp vec4 tmpvar_26;
					  tmpvar_26.w = 1.0;
					  tmpvar_26.xyz = tmpvar_25;
					  gl_FragData[0] = tmpvar_26;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 glstate_matrix_mvp;
					varying mediump vec2 xlv_TEXCOORD0;
					varying lowp vec4 xlv_COLOR;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp vec2 tmpvar_2;
					  tmpvar_2 = _glesMultiTexCoord0.xy;
					  mediump vec2 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_3 = tmpvar_2;
					  tmpvar_4 = tmpvar_1;
					  xlv_TEXCOORD0 = tmpvar_3;
					  gl_Position = (glstate_matrix_mvp * _glesVertex);
					  xlv_COLOR = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp float _TimeX;
					uniform highp float _Red_R;
					uniform highp float _Red_G;
					uniform highp float _Red_B;
					uniform highp float _Green_R;
					uniform highp float _Green_G;
					uniform highp float _Green_B;
					uniform highp float _Blue_R;
					uniform highp float _Blue_G;
					uniform highp float _Blue_B;
					uniform highp float _Red_C;
					uniform highp float _Green_C;
					uniform highp float _Blue_C;
					uniform highp float _FadeFX;
					uniform highp float _Size;
					uniform highp float _Dist;
					uniform highp float _Smooth;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 rgb_1;
					  highp vec4 col_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, uv_3);
					  col_2 = tmpvar_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5.x = _Red_R;
					  tmpvar_5.y = (_Red_G - _Smooth);
					  tmpvar_5.z = _Red_B;
					  highp vec3 tmpvar_6;
					  tmpvar_6.x = _Green_R;
					  tmpvar_6.y = (_Green_G - _Smooth);
					  tmpvar_6.z = _Green_B;
					  highp vec3 tmpvar_7;
					  tmpvar_7.x = _Blue_R;
					  tmpvar_7.y = (_Blue_G - _Smooth);
					  tmpvar_7.z = _Blue_B;
					  highp vec3 tmpvar_8;
					  tmpvar_8.x = (dot (col_2.xyz, tmpvar_5) + _Red_C);
					  tmpvar_8.y = (dot (col_2.xyz, tmpvar_6) + _Green_C);
					  tmpvar_8.z = (dot (col_2.xyz, tmpvar_7) + _Blue_C);
					  highp float xlat_varsample_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = 1.0;
					  tmpvar_10.y = (2.0 * cos(_TimeX));
					  highp vec2 P_11;
					  P_11 = (((tmpvar_10 * _TimeX) * 8.0) + ((uv_3 * vec2(0.5, 1.0)) + vec2(1.0, 3.0)));
					  lowp float tmpvar_12;
					  tmpvar_12 = texture2D (_MainTex, P_11).x;
					  xlat_varsample_9 = tmpvar_12;
					  xlat_varsample_9 = (xlat_varsample_9 * xlat_varsample_9);
					  highp float tmpvar_13;
					  highp float x_14;
					  x_14 = (((uv_3.y * 2.0) + (_TimeX / 4.0)) + sin((_TimeX + 
					    sin((_TimeX * 0.23))
					  )));
					  tmpvar_13 = (x_14 - floor(x_14));
					  highp float tmpvar_15;
					  tmpvar_15 = (float((tmpvar_13 >= 0.4)) - float((tmpvar_13 >= 0.6)));
					  rgb_1 = (tmpvar_8 + ((
					    ((1.0 - ((
					      (tmpvar_13 - 0.4)
					     / 0.2) * tmpvar_15)) * tmpvar_15)
					   * xlat_varsample_9) / 8.0));
					  highp float x_16;
					  x_16 = ((uv_3.y * 30.0) + _TimeX);
					  rgb_1 = (rgb_1 * ((12.0 + 
					    (x_16 - floor(x_16))
					  ) / 13.0));
					  rgb_1 = (rgb_1 * (0.5 + (
					    (((6.0 * uv_3.x) * uv_3.y) * (1.5 - uv_3.x))
					   * 
					    (1.5 - uv_3.y)
					  )));
					  rgb_1 = (rgb_1 * (0.9 + (0.1 * 
					    sin(((10.0 * _TimeX) + (uv_3.y * 250.0)))
					  )));
					  rgb_1 = (rgb_1 * (0.79 + (0.01 * 
					    sin((110.0 * _TimeX))
					  )));
					  uv_3.x = (uv_3.x / 0.72);
					  highp float tmpvar_17;
					  tmpvar_17 = (_Size - _Smooth);
					  highp vec2 tmpvar_18;
					  tmpvar_18.y = 0.5;
					  tmpvar_18.x = (0.694 + _Dist);
					  highp vec2 x_19;
					  x_19 = (tmpvar_18 - uv_3);
					  highp float tmpvar_20;
					  tmpvar_20 = clamp (((
					    sqrt(dot (x_19, x_19))
					   - _Size) / (tmpvar_17 - _Size)), 0.0, 1.0);
					  highp vec2 tmpvar_21;
					  tmpvar_21.y = 0.5;
					  tmpvar_21.x = (0.694 - _Dist);
					  highp vec2 x_22;
					  x_22 = (tmpvar_21 - uv_3);
					  highp float tmpvar_23;
					  tmpvar_23 = clamp (((
					    sqrt(dot (x_22, x_22))
					   - _Size) / (tmpvar_17 - _Size)), 0.0, 1.0);
					  highp vec4 tmpvar_24;
					  tmpvar_24.w = 0.0;
					  tmpvar_24.xyz = (rgb_1 * (vec3(1.0, 1.0, 1.0) - vec3((
					    (1.0 - (tmpvar_20 * (tmpvar_20 * (3.0 - 
					      (2.0 * tmpvar_20)
					    ))))
					   * 
					    (1.0 - (tmpvar_23 * (tmpvar_23 * (3.0 - 
					      (2.0 * tmpvar_23)
					    ))))
					  ))));
					  highp vec3 tmpvar_25;
					  tmpvar_25 = mix (col_2, tmpvar_24, vec4(_FadeFX)).xyz;
					  rgb_1 = tmpvar_25;
					  highp vec4 tmpvar_26;
					  tmpvar_26.w = 1.0;
					  tmpvar_26.xyz = tmpvar_25;
					  gl_FragData[0] = tmpvar_26;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					in highp vec4 in_POSITION0;
					in highp vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out lowp vec4 vs_COLOR0;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	float _TimeX;
					uniform 	float _Red_R;
					uniform 	float _Red_G;
					uniform 	float _Red_B;
					uniform 	float _Green_R;
					uniform 	float _Green_G;
					uniform 	float _Green_B;
					uniform 	float _Blue_R;
					uniform 	float _Blue_G;
					uniform 	float _Blue_B;
					uniform 	float _Red_C;
					uniform 	float _Green_C;
					uniform 	float _Blue_C;
					uniform 	float _FadeFX;
					uniform 	float _Size;
					uniform 	float _Dist;
					uniform 	float _Smooth;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					lowp vec3 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					mediump vec3 u_xlat16_4;
					lowp float u_xlat10_4;
					vec2 u_xlat5;
					mediump vec2 u_xlat16_5;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xyz = vec3(_TimeX) * vec3(0.25, 0.230000004, 110.0);
					    u_xlat4.xy = sin(u_xlat0.yz);
					    u_xlat0.x = vs_TEXCOORD0.y * 2.0 + u_xlat0.x;
					    u_xlat4.x = u_xlat4.x + _TimeX;
					    u_xlat8 = u_xlat4.y * 0.00999999978 + 0.790000021;
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat0.x = u_xlat4.x + u_xlat0.x;
					    u_xlat4.x = floor(u_xlat0.x);
					    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
					    u_xlat4.x = u_xlat0.x + -0.400000006;
					    u_xlatb0.xw = greaterThanEqual(u_xlat0.xxxx, vec4(0.400000006, 0.0, 0.0, 0.600000024)).xw;
					    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
					    u_xlat12 = (u_xlatb0.w) ? -1.0 : -0.0;
					    u_xlat0.x = u_xlat12 + u_xlat0.x;
					    u_xlat4.x = u_xlat0.x * u_xlat4.x;
					    u_xlat4.x = (-u_xlat4.x) * 4.99999952 + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat4.x;
					    u_xlat4.x = cos(_TimeX);
					    u_xlat1.y = u_xlat4.x * _TimeX;
					    u_xlat16_4.xz = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat1.x = _TimeX;
					    u_xlat4.xz = u_xlat1.xy * vec2(8.0, 16.0) + u_xlat16_4.xz;
					    u_xlat10_4 = texture(_MainTex, u_xlat4.xz).x;
					    u_xlat16_4.x = u_xlat10_4 * u_xlat10_4;
					    u_xlat0.x = u_xlat16_4.x * u_xlat0.x;
					    u_xlat1.y = _Blue_G + (-_Smooth);
					    u_xlat1.x = _Blue_R;
					    u_xlat1.z = _Blue_B;
					    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat4.x = dot(u_xlat10_2.xyz, u_xlat1.xyz);
					    u_xlat1.z = u_xlat4.x + _Blue_C;
					    u_xlat3.y = _Red_G + (-_Smooth);
					    u_xlat3.xz = vec2(_Red_R, _Red_B);
					    u_xlat4.x = dot(u_xlat10_2.xyz, u_xlat3.xyz);
					    u_xlat1.x = u_xlat4.x + _Red_C;
					    u_xlat3.y = _Green_G + (-_Smooth);
					    u_xlat3.xz = vec2(_Green_R, _Green_B);
					    u_xlat4.x = dot(u_xlat10_2.xyz, u_xlat3.xyz);
					    u_xlat1.y = u_xlat4.x + _Green_C;
					    u_xlat0.xyw = u_xlat0.xxx * vec3(0.125, 0.125, 0.125) + u_xlat1.xyz;
					    u_xlat1.x = vs_TEXCOORD0.y * 30.0 + _TimeX;
					    u_xlat5.x = floor(u_xlat1.x);
					    u_xlat1.x = (-u_xlat5.x) + u_xlat1.x;
					    u_xlat1.x = u_xlat1.x + 12.0;
					    u_xlat1.x = u_xlat1.x * 0.0769230798;
					    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
					    u_xlat16_1.x = vs_TEXCOORD0.x * 6.0;
					    u_xlat16_1.x = u_xlat16_1.x * vs_TEXCOORD0.y;
					    u_xlat16_5.xy = (-vs_TEXCOORD0.xy) + vec2(1.5, 1.5);
					    u_xlat16_1.x = u_xlat16_5.x * u_xlat16_1.x;
					    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5.y + 0.5;
					    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_1.xxx;
					    u_xlat16_1.xy = vs_TEXCOORD0.yx * vec2(250.0, 1.38888884);
					    u_xlat1.x = _TimeX * 10.0 + u_xlat16_1.x;
					    u_xlat3.y = (-u_xlat16_1.y);
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 0.100000001 + 0.899999976;
					    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
					    u_xlat0.xyz = vec3(u_xlat8) * u_xlat0.xyw;
					    u_xlat1.x = _Dist + 0.694000006;
					    u_xlat1.y = 0.5;
					    u_xlat3.z = (-vs_TEXCOORD0.y);
					    u_xlat1.xy = vec2(u_xlat1.x + u_xlat3.y, u_xlat1.y + u_xlat3.z);
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 + (-_Size);
					    u_xlat1.x = float(1.0) / (-_Smooth);
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat5.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = (-u_xlat5.x) * u_xlat12 + 1.0;
					    u_xlat3.x = (-vs_TEXCOORD0.x) * 1.38888884 + (-_Dist);
					    u_xlat5.xy = u_xlat3.xz + vec2(0.694000006, 0.5);
					    u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
					    u_xlat5.x = sqrt(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x + (-_Size);
					    u_xlat1.x = u_xlat1.x * u_xlat5.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat5.x = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = (-u_xlat5.x) * u_xlat1.x + 1.0;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat0.xyz = vec3(u_xlat12) * (-u_xlat0.xyz) + u_xlat0.xyz;
					    u_xlat0.xyz = (-u_xlat10_2.xyz) + u_xlat0.xyz;
					    SV_Target0.xyz = vec3(vec3(_FadeFX, _FadeFX, _FadeFX)) * u_xlat0.xyz + u_xlat10_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					in highp vec4 in_POSITION0;
					in highp vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out lowp vec4 vs_COLOR0;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	float _TimeX;
					uniform 	float _Red_R;
					uniform 	float _Red_G;
					uniform 	float _Red_B;
					uniform 	float _Green_R;
					uniform 	float _Green_G;
					uniform 	float _Green_B;
					uniform 	float _Blue_R;
					uniform 	float _Blue_G;
					uniform 	float _Blue_B;
					uniform 	float _Red_C;
					uniform 	float _Green_C;
					uniform 	float _Blue_C;
					uniform 	float _FadeFX;
					uniform 	float _Size;
					uniform 	float _Dist;
					uniform 	float _Smooth;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					lowp vec3 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					mediump vec3 u_xlat16_4;
					lowp float u_xlat10_4;
					vec2 u_xlat5;
					mediump vec2 u_xlat16_5;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xyz = vec3(_TimeX) * vec3(0.25, 0.230000004, 110.0);
					    u_xlat4.xy = sin(u_xlat0.yz);
					    u_xlat0.x = vs_TEXCOORD0.y * 2.0 + u_xlat0.x;
					    u_xlat4.x = u_xlat4.x + _TimeX;
					    u_xlat8 = u_xlat4.y * 0.00999999978 + 0.790000021;
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat0.x = u_xlat4.x + u_xlat0.x;
					    u_xlat4.x = floor(u_xlat0.x);
					    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
					    u_xlat4.x = u_xlat0.x + -0.400000006;
					    u_xlatb0.xw = greaterThanEqual(u_xlat0.xxxx, vec4(0.400000006, 0.0, 0.0, 0.600000024)).xw;
					    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
					    u_xlat12 = (u_xlatb0.w) ? -1.0 : -0.0;
					    u_xlat0.x = u_xlat12 + u_xlat0.x;
					    u_xlat4.x = u_xlat0.x * u_xlat4.x;
					    u_xlat4.x = (-u_xlat4.x) * 4.99999952 + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat4.x;
					    u_xlat4.x = cos(_TimeX);
					    u_xlat1.y = u_xlat4.x * _TimeX;
					    u_xlat16_4.xz = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat1.x = _TimeX;
					    u_xlat4.xz = u_xlat1.xy * vec2(8.0, 16.0) + u_xlat16_4.xz;
					    u_xlat10_4 = texture(_MainTex, u_xlat4.xz).x;
					    u_xlat16_4.x = u_xlat10_4 * u_xlat10_4;
					    u_xlat0.x = u_xlat16_4.x * u_xlat0.x;
					    u_xlat1.y = _Blue_G + (-_Smooth);
					    u_xlat1.x = _Blue_R;
					    u_xlat1.z = _Blue_B;
					    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat4.x = dot(u_xlat10_2.xyz, u_xlat1.xyz);
					    u_xlat1.z = u_xlat4.x + _Blue_C;
					    u_xlat3.y = _Red_G + (-_Smooth);
					    u_xlat3.xz = vec2(_Red_R, _Red_B);
					    u_xlat4.x = dot(u_xlat10_2.xyz, u_xlat3.xyz);
					    u_xlat1.x = u_xlat4.x + _Red_C;
					    u_xlat3.y = _Green_G + (-_Smooth);
					    u_xlat3.xz = vec2(_Green_R, _Green_B);
					    u_xlat4.x = dot(u_xlat10_2.xyz, u_xlat3.xyz);
					    u_xlat1.y = u_xlat4.x + _Green_C;
					    u_xlat0.xyw = u_xlat0.xxx * vec3(0.125, 0.125, 0.125) + u_xlat1.xyz;
					    u_xlat1.x = vs_TEXCOORD0.y * 30.0 + _TimeX;
					    u_xlat5.x = floor(u_xlat1.x);
					    u_xlat1.x = (-u_xlat5.x) + u_xlat1.x;
					    u_xlat1.x = u_xlat1.x + 12.0;
					    u_xlat1.x = u_xlat1.x * 0.0769230798;
					    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
					    u_xlat16_1.x = vs_TEXCOORD0.x * 6.0;
					    u_xlat16_1.x = u_xlat16_1.x * vs_TEXCOORD0.y;
					    u_xlat16_5.xy = (-vs_TEXCOORD0.xy) + vec2(1.5, 1.5);
					    u_xlat16_1.x = u_xlat16_5.x * u_xlat16_1.x;
					    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5.y + 0.5;
					    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_1.xxx;
					    u_xlat16_1.xy = vs_TEXCOORD0.yx * vec2(250.0, 1.38888884);
					    u_xlat1.x = _TimeX * 10.0 + u_xlat16_1.x;
					    u_xlat3.y = (-u_xlat16_1.y);
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 0.100000001 + 0.899999976;
					    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
					    u_xlat0.xyz = vec3(u_xlat8) * u_xlat0.xyw;
					    u_xlat1.x = _Dist + 0.694000006;
					    u_xlat1.y = 0.5;
					    u_xlat3.z = (-vs_TEXCOORD0.y);
					    u_xlat1.xy = vec2(u_xlat1.x + u_xlat3.y, u_xlat1.y + u_xlat3.z);
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 + (-_Size);
					    u_xlat1.x = float(1.0) / (-_Smooth);
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat5.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = (-u_xlat5.x) * u_xlat12 + 1.0;
					    u_xlat3.x = (-vs_TEXCOORD0.x) * 1.38888884 + (-_Dist);
					    u_xlat5.xy = u_xlat3.xz + vec2(0.694000006, 0.5);
					    u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
					    u_xlat5.x = sqrt(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x + (-_Size);
					    u_xlat1.x = u_xlat1.x * u_xlat5.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat5.x = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = (-u_xlat5.x) * u_xlat1.x + 1.0;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat0.xyz = vec3(u_xlat12) * (-u_xlat0.xyz) + u_xlat0.xyz;
					    u_xlat0.xyz = (-u_xlat10_2.xyz) + u_xlat0.xyz;
					    SV_Target0.xyz = vec3(vec3(_FadeFX, _FadeFX, _FadeFX)) * u_xlat0.xyz + u_xlat10_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4glstate_matrix_mvp[4];
					in highp vec4 in_POSITION0;
					in highp vec4 in_COLOR0;
					in highp vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out lowp vec4 vs_COLOR0;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4glstate_matrix_mvp[1];
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	float _TimeX;
					uniform 	float _Red_R;
					uniform 	float _Red_G;
					uniform 	float _Red_B;
					uniform 	float _Green_R;
					uniform 	float _Green_G;
					uniform 	float _Green_B;
					uniform 	float _Blue_R;
					uniform 	float _Blue_G;
					uniform 	float _Blue_B;
					uniform 	float _Red_C;
					uniform 	float _Green_C;
					uniform 	float _Blue_C;
					uniform 	float _FadeFX;
					uniform 	float _Size;
					uniform 	float _Dist;
					uniform 	float _Smooth;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					lowp vec3 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					mediump vec3 u_xlat16_4;
					lowp float u_xlat10_4;
					vec2 u_xlat5;
					mediump vec2 u_xlat16_5;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xyz = vec3(_TimeX) * vec3(0.25, 0.230000004, 110.0);
					    u_xlat4.xy = sin(u_xlat0.yz);
					    u_xlat0.x = vs_TEXCOORD0.y * 2.0 + u_xlat0.x;
					    u_xlat4.x = u_xlat4.x + _TimeX;
					    u_xlat8 = u_xlat4.y * 0.00999999978 + 0.790000021;
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat0.x = u_xlat4.x + u_xlat0.x;
					    u_xlat4.x = floor(u_xlat0.x);
					    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
					    u_xlat4.x = u_xlat0.x + -0.400000006;
					    u_xlatb0.xw = greaterThanEqual(u_xlat0.xxxx, vec4(0.400000006, 0.0, 0.0, 0.600000024)).xw;
					    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
					    u_xlat12 = (u_xlatb0.w) ? -1.0 : -0.0;
					    u_xlat0.x = u_xlat12 + u_xlat0.x;
					    u_xlat4.x = u_xlat0.x * u_xlat4.x;
					    u_xlat4.x = (-u_xlat4.x) * 4.99999952 + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat4.x;
					    u_xlat4.x = cos(_TimeX);
					    u_xlat1.y = u_xlat4.x * _TimeX;
					    u_xlat16_4.xz = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat1.x = _TimeX;
					    u_xlat4.xz = u_xlat1.xy * vec2(8.0, 16.0) + u_xlat16_4.xz;
					    u_xlat10_4 = texture(_MainTex, u_xlat4.xz).x;
					    u_xlat16_4.x = u_xlat10_4 * u_xlat10_4;
					    u_xlat0.x = u_xlat16_4.x * u_xlat0.x;
					    u_xlat1.y = _Blue_G + (-_Smooth);
					    u_xlat1.x = _Blue_R;
					    u_xlat1.z = _Blue_B;
					    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat4.x = dot(u_xlat10_2.xyz, u_xlat1.xyz);
					    u_xlat1.z = u_xlat4.x + _Blue_C;
					    u_xlat3.y = _Red_G + (-_Smooth);
					    u_xlat3.xz = vec2(_Red_R, _Red_B);
					    u_xlat4.x = dot(u_xlat10_2.xyz, u_xlat3.xyz);
					    u_xlat1.x = u_xlat4.x + _Red_C;
					    u_xlat3.y = _Green_G + (-_Smooth);
					    u_xlat3.xz = vec2(_Green_R, _Green_B);
					    u_xlat4.x = dot(u_xlat10_2.xyz, u_xlat3.xyz);
					    u_xlat1.y = u_xlat4.x + _Green_C;
					    u_xlat0.xyw = u_xlat0.xxx * vec3(0.125, 0.125, 0.125) + u_xlat1.xyz;
					    u_xlat1.x = vs_TEXCOORD0.y * 30.0 + _TimeX;
					    u_xlat5.x = floor(u_xlat1.x);
					    u_xlat1.x = (-u_xlat5.x) + u_xlat1.x;
					    u_xlat1.x = u_xlat1.x + 12.0;
					    u_xlat1.x = u_xlat1.x * 0.0769230798;
					    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
					    u_xlat16_1.x = vs_TEXCOORD0.x * 6.0;
					    u_xlat16_1.x = u_xlat16_1.x * vs_TEXCOORD0.y;
					    u_xlat16_5.xy = (-vs_TEXCOORD0.xy) + vec2(1.5, 1.5);
					    u_xlat16_1.x = u_xlat16_5.x * u_xlat16_1.x;
					    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5.y + 0.5;
					    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_1.xxx;
					    u_xlat16_1.xy = vs_TEXCOORD0.yx * vec2(250.0, 1.38888884);
					    u_xlat1.x = _TimeX * 10.0 + u_xlat16_1.x;
					    u_xlat3.y = (-u_xlat16_1.y);
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 0.100000001 + 0.899999976;
					    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
					    u_xlat0.xyz = vec3(u_xlat8) * u_xlat0.xyw;
					    u_xlat1.x = _Dist + 0.694000006;
					    u_xlat1.y = 0.5;
					    u_xlat3.z = (-vs_TEXCOORD0.y);
					    u_xlat1.xy = vec2(u_xlat1.x + u_xlat3.y, u_xlat1.y + u_xlat3.z);
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 + (-_Size);
					    u_xlat1.x = float(1.0) / (-_Smooth);
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
					#else
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					#endif
					    u_xlat5.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = (-u_xlat5.x) * u_xlat12 + 1.0;
					    u_xlat3.x = (-vs_TEXCOORD0.x) * 1.38888884 + (-_Dist);
					    u_xlat5.xy = u_xlat3.xz + vec2(0.694000006, 0.5);
					    u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
					    u_xlat5.x = sqrt(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x + (-_Size);
					    u_xlat1.x = u_xlat1.x * u_xlat5.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat5.x = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = (-u_xlat5.x) * u_xlat1.x + 1.0;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat0.xyz = vec3(u_xlat12) * (-u_xlat0.xyz) + u_xlat0.xyz;
					    u_xlat0.xyz = (-u_xlat10_2.xyz) + u_xlat0.xyz;
					    SV_Target0.xyz = vec3(vec3(_FadeFX, _FadeFX, _FadeFX)) * u_xlat0.xyz + u_xlat10_2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!GLES3"
				}
			}
		}
	}
}