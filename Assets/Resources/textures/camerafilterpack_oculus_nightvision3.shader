Shader "CameraFilterPack/Oculus_NightVision3" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_BinocularSize ("_BinocularSize", Range(0, 1)) = 0.5
		_BinocularDistance ("_BinocularDistance", Range(0, 1)) = 0.5
		_Greenness ("_Greenness", Range(0, 1)) = 0.4
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 31620
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
					uniform highp float _Greenness;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp vec2 uv_2;
					  mediump vec2 tmpvar_3;
					  tmpvar_3 = (0.5 + (xlv_TEXCOORD0 - 0.5));
					  uv_2 = tmpvar_3;
					  highp vec3 video_4;
					  highp vec2 look_5;
					  look_5.y = uv_2.y;
					  look_5.x = (uv_2.x + ((
					    (sin(((uv_2.y * 20.0) + _TimeX)) / 250.0)
					   * 
					    float((sin((_TimeX + 
					      (2.0 * cos((_TimeX * 2.0)))
					    )) >= 0.9))
					  ) * (1.0 + 
					    cos((_TimeX * 80.0))
					  )));
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, look_5).xyz;
					  video_4 = tmpvar_6;
					  highp float xlat_varsample_7;
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = 1.0;
					  tmpvar_8.y = (2.0 * cos(_TimeX));
					  highp vec2 P_9;
					  P_9 = (((tmpvar_8 * _TimeX) * 8.0) + ((uv_2 * vec2(0.5, 1.0)) + vec2(1.0, 3.0)));
					  lowp float tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, P_9).x;
					  xlat_varsample_7 = tmpvar_10;
					  xlat_varsample_7 = (xlat_varsample_7 * xlat_varsample_7);
					  highp float tmpvar_11;
					  highp float x_12;
					  x_12 = (((uv_2.y * 2.0) + (_TimeX / 4.0)) + sin((_TimeX + 
					    sin((_TimeX * 0.23))
					  )));
					  tmpvar_11 = (x_12 - floor(x_12));
					  highp float tmpvar_13;
					  tmpvar_13 = (float((tmpvar_11 >= 0.4)) - float((tmpvar_11 >= 0.6)));
					  col_1 = (video_4.xxx + ((
					    (1.0 - (((tmpvar_11 - 0.4) / 0.2) * tmpvar_13))
					   * tmpvar_13) * xlat_varsample_7));
					  highp float x_14;
					  x_14 = ((uv_2.y * 30.0) + _TimeX);
					  col_1 = (col_1 * ((12.0 + 
					    (x_14 - floor(x_14))
					  ) / 13.0));
					  col_1 = (col_1 * (0.5 + (
					    ((((6.0 * uv_2.x) * uv_2.y) * (1.5 - uv_2.x)) * (1.5 - uv_2.y))
					   * _Greenness)));
					  highp vec3 tmpvar_15;
					  tmpvar_15.xz = vec2(0.55, 0.55);
					  tmpvar_15.y = (1.55 + (_Greenness / 4.0));
					  col_1 = (col_1 * (tmpvar_15 * _Greenness));
					  col_1 = (col_1 * (0.9 + (0.1 * 
					    sin(((10.0 * _TimeX) + (uv_2.y * 300.0)))
					  )));
					  col_1 = (col_1 * (0.79 + (0.01 * 
					    sin((110.0 * _TimeX))
					  )));
					  highp vec4 tmpvar_16;
					  tmpvar_16.w = 1.0;
					  tmpvar_16.xyz = col_1;
					  gl_FragData[0] = tmpvar_16;
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
					uniform highp float _Greenness;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp vec2 uv_2;
					  mediump vec2 tmpvar_3;
					  tmpvar_3 = (0.5 + (xlv_TEXCOORD0 - 0.5));
					  uv_2 = tmpvar_3;
					  highp vec3 video_4;
					  highp vec2 look_5;
					  look_5.y = uv_2.y;
					  look_5.x = (uv_2.x + ((
					    (sin(((uv_2.y * 20.0) + _TimeX)) / 250.0)
					   * 
					    float((sin((_TimeX + 
					      (2.0 * cos((_TimeX * 2.0)))
					    )) >= 0.9))
					  ) * (1.0 + 
					    cos((_TimeX * 80.0))
					  )));
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, look_5).xyz;
					  video_4 = tmpvar_6;
					  highp float xlat_varsample_7;
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = 1.0;
					  tmpvar_8.y = (2.0 * cos(_TimeX));
					  highp vec2 P_9;
					  P_9 = (((tmpvar_8 * _TimeX) * 8.0) + ((uv_2 * vec2(0.5, 1.0)) + vec2(1.0, 3.0)));
					  lowp float tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, P_9).x;
					  xlat_varsample_7 = tmpvar_10;
					  xlat_varsample_7 = (xlat_varsample_7 * xlat_varsample_7);
					  highp float tmpvar_11;
					  highp float x_12;
					  x_12 = (((uv_2.y * 2.0) + (_TimeX / 4.0)) + sin((_TimeX + 
					    sin((_TimeX * 0.23))
					  )));
					  tmpvar_11 = (x_12 - floor(x_12));
					  highp float tmpvar_13;
					  tmpvar_13 = (float((tmpvar_11 >= 0.4)) - float((tmpvar_11 >= 0.6)));
					  col_1 = (video_4.xxx + ((
					    (1.0 - (((tmpvar_11 - 0.4) / 0.2) * tmpvar_13))
					   * tmpvar_13) * xlat_varsample_7));
					  highp float x_14;
					  x_14 = ((uv_2.y * 30.0) + _TimeX);
					  col_1 = (col_1 * ((12.0 + 
					    (x_14 - floor(x_14))
					  ) / 13.0));
					  col_1 = (col_1 * (0.5 + (
					    ((((6.0 * uv_2.x) * uv_2.y) * (1.5 - uv_2.x)) * (1.5 - uv_2.y))
					   * _Greenness)));
					  highp vec3 tmpvar_15;
					  tmpvar_15.xz = vec2(0.55, 0.55);
					  tmpvar_15.y = (1.55 + (_Greenness / 4.0));
					  col_1 = (col_1 * (tmpvar_15 * _Greenness));
					  col_1 = (col_1 * (0.9 + (0.1 * 
					    sin(((10.0 * _TimeX) + (uv_2.y * 300.0)))
					  )));
					  col_1 = (col_1 * (0.79 + (0.01 * 
					    sin((110.0 * _TimeX))
					  )));
					  highp vec4 tmpvar_16;
					  tmpvar_16.w = 1.0;
					  tmpvar_16.xyz = col_1;
					  gl_FragData[0] = tmpvar_16;
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
					uniform highp float _Greenness;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp vec2 uv_2;
					  mediump vec2 tmpvar_3;
					  tmpvar_3 = (0.5 + (xlv_TEXCOORD0 - 0.5));
					  uv_2 = tmpvar_3;
					  highp vec3 video_4;
					  highp vec2 look_5;
					  look_5.y = uv_2.y;
					  look_5.x = (uv_2.x + ((
					    (sin(((uv_2.y * 20.0) + _TimeX)) / 250.0)
					   * 
					    float((sin((_TimeX + 
					      (2.0 * cos((_TimeX * 2.0)))
					    )) >= 0.9))
					  ) * (1.0 + 
					    cos((_TimeX * 80.0))
					  )));
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, look_5).xyz;
					  video_4 = tmpvar_6;
					  highp float xlat_varsample_7;
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = 1.0;
					  tmpvar_8.y = (2.0 * cos(_TimeX));
					  highp vec2 P_9;
					  P_9 = (((tmpvar_8 * _TimeX) * 8.0) + ((uv_2 * vec2(0.5, 1.0)) + vec2(1.0, 3.0)));
					  lowp float tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, P_9).x;
					  xlat_varsample_7 = tmpvar_10;
					  xlat_varsample_7 = (xlat_varsample_7 * xlat_varsample_7);
					  highp float tmpvar_11;
					  highp float x_12;
					  x_12 = (((uv_2.y * 2.0) + (_TimeX / 4.0)) + sin((_TimeX + 
					    sin((_TimeX * 0.23))
					  )));
					  tmpvar_11 = (x_12 - floor(x_12));
					  highp float tmpvar_13;
					  tmpvar_13 = (float((tmpvar_11 >= 0.4)) - float((tmpvar_11 >= 0.6)));
					  col_1 = (video_4.xxx + ((
					    (1.0 - (((tmpvar_11 - 0.4) / 0.2) * tmpvar_13))
					   * tmpvar_13) * xlat_varsample_7));
					  highp float x_14;
					  x_14 = ((uv_2.y * 30.0) + _TimeX);
					  col_1 = (col_1 * ((12.0 + 
					    (x_14 - floor(x_14))
					  ) / 13.0));
					  col_1 = (col_1 * (0.5 + (
					    ((((6.0 * uv_2.x) * uv_2.y) * (1.5 - uv_2.x)) * (1.5 - uv_2.y))
					   * _Greenness)));
					  highp vec3 tmpvar_15;
					  tmpvar_15.xz = vec2(0.55, 0.55);
					  tmpvar_15.y = (1.55 + (_Greenness / 4.0));
					  col_1 = (col_1 * (tmpvar_15 * _Greenness));
					  col_1 = (col_1 * (0.9 + (0.1 * 
					    sin(((10.0 * _TimeX) + (uv_2.y * 300.0)))
					  )));
					  col_1 = (col_1 * (0.79 + (0.01 * 
					    sin((110.0 * _TimeX))
					  )));
					  highp vec4 tmpvar_16;
					  tmpvar_16.w = 1.0;
					  tmpvar_16.xyz = col_1;
					  gl_FragData[0] = tmpvar_16;
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
					uniform 	float _Greenness;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp float u_xlat10_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					float u_xlat3;
					mediump vec2 u_xlat16_3;
					bvec3 u_xlatb3;
					vec2 u_xlat6;
					mediump vec2 u_xlat16_6;
					lowp float u_xlat10_6;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat0.xyz = vec3(_TimeX) * vec3(80.0, 0.25, 0.230000004);
					    u_xlat6.x = sin(u_xlat0.z);
					    u_xlat6.x = u_xlat6.x + _TimeX;
					    u_xlat6.x = sin(u_xlat6.x);
					    u_xlat3 = vs_TEXCOORD0.y * 2.0 + u_xlat0.y;
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat3 = u_xlat6.x + u_xlat3;
					    u_xlat6.x = floor(u_xlat3);
					    u_xlat3 = (-u_xlat6.x) + u_xlat3;
					    u_xlat6.x = u_xlat3 + -0.400000006;
					    u_xlatb3.xz = greaterThanEqual(vec4(u_xlat3), vec4(0.400000006, 0.0, 0.600000024, 0.600000024)).xz;
					    u_xlat3 = u_xlatb3.x ? 1.0 : float(0.0);
					    u_xlat9 = (u_xlatb3.z) ? -1.0 : -0.0;
					    u_xlat3 = u_xlat9 + u_xlat3;
					    u_xlat6.x = u_xlat3 * u_xlat6.x;
					    u_xlat6.x = (-u_xlat6.x) * 4.99999952 + 1.0;
					    u_xlat3 = u_xlat3 * u_xlat6.x;
					    u_xlat6.x = cos(_TimeX);
					    u_xlat1.y = u_xlat6.x * _TimeX;
					    u_xlat16_6.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat1.x = _TimeX;
					    u_xlat6.xy = u_xlat1.xy * vec2(8.0, 16.0) + u_xlat16_6.xy;
					    u_xlat10_6 = texture(_MainTex, u_xlat6.xy).x;
					    u_xlat16_6.x = u_xlat10_6 * u_xlat10_6;
					    u_xlat9 = _TimeX + _TimeX;
					    u_xlat9 = cos(u_xlat9);
					    u_xlat9 = u_xlat9 * 2.0 + _TimeX;
					    u_xlat9 = sin(u_xlat9);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(u_xlat9>=0.899999976);
					#else
					    u_xlatb9 = u_xlat9>=0.899999976;
					#endif
					    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
					    u_xlat1.xy = vs_TEXCOORD0.yy * vec2(20.0, 30.0) + vec2(_TimeX);
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 0.00400000019;
					    u_xlat9 = u_xlat9 * u_xlat1.x;
					    u_xlat2.x = u_xlat9 * u_xlat0.x + vs_TEXCOORD0.x;
					    u_xlat2.y = vs_TEXCOORD0.y;
					    u_xlat10_0 = texture(_MainTex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat3 * u_xlat16_6.x + u_xlat10_0;
					    u_xlat3 = floor(u_xlat1.y);
					    u_xlat3 = (-u_xlat3) + u_xlat1.y;
					    u_xlat3 = u_xlat3 + 12.0;
					    u_xlat0.x = u_xlat0.x * u_xlat3;
					    u_xlat0.x = u_xlat0.x * 0.0769230798;
					    u_xlat16_3.xy = vs_TEXCOORD0.xy * vec2(6.0, 300.0);
					    u_xlat16_3.x = u_xlat16_3.x * vs_TEXCOORD0.y;
					    u_xlat6.x = _TimeX * 10.0 + u_xlat16_3.y;
					    u_xlat6.x = sin(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x * 0.100000001 + 0.899999976;
					    u_xlat16_1.xy = (-vs_TEXCOORD0.xy) + vec2(1.5, 1.5);
					    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_1.x;
					    u_xlat16_3.x = u_xlat16_1.y * u_xlat16_3.x;
					    u_xlat3 = u_xlat16_3.x * _Greenness + 0.5;
					    u_xlat1.x = u_xlat3 * u_xlat0.x;
					    u_xlat1.y = _Greenness * 0.25 + 1.54999995;
					    u_xlat0.xyw = u_xlat1.xyx * vec3(_Greenness);
					    u_xlat1.z = 0.550000012;
					    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.zxz;
					    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xyw;
					    u_xlat9 = _TimeX * 110.0;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat9 = u_xlat9 * 0.00999999978 + 0.790000021;
					    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
					uniform 	float _Greenness;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp float u_xlat10_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					float u_xlat3;
					mediump vec2 u_xlat16_3;
					bvec3 u_xlatb3;
					vec2 u_xlat6;
					mediump vec2 u_xlat16_6;
					lowp float u_xlat10_6;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat0.xyz = vec3(_TimeX) * vec3(80.0, 0.25, 0.230000004);
					    u_xlat6.x = sin(u_xlat0.z);
					    u_xlat6.x = u_xlat6.x + _TimeX;
					    u_xlat6.x = sin(u_xlat6.x);
					    u_xlat3 = vs_TEXCOORD0.y * 2.0 + u_xlat0.y;
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat3 = u_xlat6.x + u_xlat3;
					    u_xlat6.x = floor(u_xlat3);
					    u_xlat3 = (-u_xlat6.x) + u_xlat3;
					    u_xlat6.x = u_xlat3 + -0.400000006;
					    u_xlatb3.xz = greaterThanEqual(vec4(u_xlat3), vec4(0.400000006, 0.0, 0.600000024, 0.600000024)).xz;
					    u_xlat3 = u_xlatb3.x ? 1.0 : float(0.0);
					    u_xlat9 = (u_xlatb3.z) ? -1.0 : -0.0;
					    u_xlat3 = u_xlat9 + u_xlat3;
					    u_xlat6.x = u_xlat3 * u_xlat6.x;
					    u_xlat6.x = (-u_xlat6.x) * 4.99999952 + 1.0;
					    u_xlat3 = u_xlat3 * u_xlat6.x;
					    u_xlat6.x = cos(_TimeX);
					    u_xlat1.y = u_xlat6.x * _TimeX;
					    u_xlat16_6.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat1.x = _TimeX;
					    u_xlat6.xy = u_xlat1.xy * vec2(8.0, 16.0) + u_xlat16_6.xy;
					    u_xlat10_6 = texture(_MainTex, u_xlat6.xy).x;
					    u_xlat16_6.x = u_xlat10_6 * u_xlat10_6;
					    u_xlat9 = _TimeX + _TimeX;
					    u_xlat9 = cos(u_xlat9);
					    u_xlat9 = u_xlat9 * 2.0 + _TimeX;
					    u_xlat9 = sin(u_xlat9);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(u_xlat9>=0.899999976);
					#else
					    u_xlatb9 = u_xlat9>=0.899999976;
					#endif
					    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
					    u_xlat1.xy = vs_TEXCOORD0.yy * vec2(20.0, 30.0) + vec2(_TimeX);
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 0.00400000019;
					    u_xlat9 = u_xlat9 * u_xlat1.x;
					    u_xlat2.x = u_xlat9 * u_xlat0.x + vs_TEXCOORD0.x;
					    u_xlat2.y = vs_TEXCOORD0.y;
					    u_xlat10_0 = texture(_MainTex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat3 * u_xlat16_6.x + u_xlat10_0;
					    u_xlat3 = floor(u_xlat1.y);
					    u_xlat3 = (-u_xlat3) + u_xlat1.y;
					    u_xlat3 = u_xlat3 + 12.0;
					    u_xlat0.x = u_xlat0.x * u_xlat3;
					    u_xlat0.x = u_xlat0.x * 0.0769230798;
					    u_xlat16_3.xy = vs_TEXCOORD0.xy * vec2(6.0, 300.0);
					    u_xlat16_3.x = u_xlat16_3.x * vs_TEXCOORD0.y;
					    u_xlat6.x = _TimeX * 10.0 + u_xlat16_3.y;
					    u_xlat6.x = sin(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x * 0.100000001 + 0.899999976;
					    u_xlat16_1.xy = (-vs_TEXCOORD0.xy) + vec2(1.5, 1.5);
					    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_1.x;
					    u_xlat16_3.x = u_xlat16_1.y * u_xlat16_3.x;
					    u_xlat3 = u_xlat16_3.x * _Greenness + 0.5;
					    u_xlat1.x = u_xlat3 * u_xlat0.x;
					    u_xlat1.y = _Greenness * 0.25 + 1.54999995;
					    u_xlat0.xyw = u_xlat1.xyx * vec3(_Greenness);
					    u_xlat1.z = 0.550000012;
					    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.zxz;
					    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xyw;
					    u_xlat9 = _TimeX * 110.0;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat9 = u_xlat9 * 0.00999999978 + 0.790000021;
					    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
					uniform 	float _Greenness;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp float u_xlat10_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec2 u_xlat2;
					float u_xlat3;
					mediump vec2 u_xlat16_3;
					bvec3 u_xlatb3;
					vec2 u_xlat6;
					mediump vec2 u_xlat16_6;
					lowp float u_xlat10_6;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat0.xyz = vec3(_TimeX) * vec3(80.0, 0.25, 0.230000004);
					    u_xlat6.x = sin(u_xlat0.z);
					    u_xlat6.x = u_xlat6.x + _TimeX;
					    u_xlat6.x = sin(u_xlat6.x);
					    u_xlat3 = vs_TEXCOORD0.y * 2.0 + u_xlat0.y;
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat3 = u_xlat6.x + u_xlat3;
					    u_xlat6.x = floor(u_xlat3);
					    u_xlat3 = (-u_xlat6.x) + u_xlat3;
					    u_xlat6.x = u_xlat3 + -0.400000006;
					    u_xlatb3.xz = greaterThanEqual(vec4(u_xlat3), vec4(0.400000006, 0.0, 0.600000024, 0.600000024)).xz;
					    u_xlat3 = u_xlatb3.x ? 1.0 : float(0.0);
					    u_xlat9 = (u_xlatb3.z) ? -1.0 : -0.0;
					    u_xlat3 = u_xlat9 + u_xlat3;
					    u_xlat6.x = u_xlat3 * u_xlat6.x;
					    u_xlat6.x = (-u_xlat6.x) * 4.99999952 + 1.0;
					    u_xlat3 = u_xlat3 * u_xlat6.x;
					    u_xlat6.x = cos(_TimeX);
					    u_xlat1.y = u_xlat6.x * _TimeX;
					    u_xlat16_6.xy = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat1.x = _TimeX;
					    u_xlat6.xy = u_xlat1.xy * vec2(8.0, 16.0) + u_xlat16_6.xy;
					    u_xlat10_6 = texture(_MainTex, u_xlat6.xy).x;
					    u_xlat16_6.x = u_xlat10_6 * u_xlat10_6;
					    u_xlat9 = _TimeX + _TimeX;
					    u_xlat9 = cos(u_xlat9);
					    u_xlat9 = u_xlat9 * 2.0 + _TimeX;
					    u_xlat9 = sin(u_xlat9);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb9 = !!(u_xlat9>=0.899999976);
					#else
					    u_xlatb9 = u_xlat9>=0.899999976;
					#endif
					    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
					    u_xlat1.xy = vs_TEXCOORD0.yy * vec2(20.0, 30.0) + vec2(_TimeX);
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 0.00400000019;
					    u_xlat9 = u_xlat9 * u_xlat1.x;
					    u_xlat2.x = u_xlat9 * u_xlat0.x + vs_TEXCOORD0.x;
					    u_xlat2.y = vs_TEXCOORD0.y;
					    u_xlat10_0 = texture(_MainTex, u_xlat2.xy).x;
					    u_xlat0.x = u_xlat3 * u_xlat16_6.x + u_xlat10_0;
					    u_xlat3 = floor(u_xlat1.y);
					    u_xlat3 = (-u_xlat3) + u_xlat1.y;
					    u_xlat3 = u_xlat3 + 12.0;
					    u_xlat0.x = u_xlat0.x * u_xlat3;
					    u_xlat0.x = u_xlat0.x * 0.0769230798;
					    u_xlat16_3.xy = vs_TEXCOORD0.xy * vec2(6.0, 300.0);
					    u_xlat16_3.x = u_xlat16_3.x * vs_TEXCOORD0.y;
					    u_xlat6.x = _TimeX * 10.0 + u_xlat16_3.y;
					    u_xlat6.x = sin(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x * 0.100000001 + 0.899999976;
					    u_xlat16_1.xy = (-vs_TEXCOORD0.xy) + vec2(1.5, 1.5);
					    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_1.x;
					    u_xlat16_3.x = u_xlat16_1.y * u_xlat16_3.x;
					    u_xlat3 = u_xlat16_3.x * _Greenness + 0.5;
					    u_xlat1.x = u_xlat3 * u_xlat0.x;
					    u_xlat1.y = _Greenness * 0.25 + 1.54999995;
					    u_xlat0.xyw = u_xlat1.xyx * vec3(_Greenness);
					    u_xlat1.z = 0.550000012;
					    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.zxz;
					    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xyw;
					    u_xlat9 = _TimeX * 110.0;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat9 = u_xlat9 * 0.00999999978 + 0.790000021;
					    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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