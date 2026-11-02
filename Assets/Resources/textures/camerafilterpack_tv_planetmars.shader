Shader "CameraFilterPack/TV_PlanetMars" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 49302
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
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 noise_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, uv_2).xyz;
					  noise_1 = tmpvar_3;
					  highp float _t_4;
					  _t_4 = (dot (noise_1, vec3(0.2126, 0.7152, 0.0722)) * 4000.0);
					  highp vec3 RGB_5;
					  highp float tmpvar_6;
					  tmpvar_6 = (((0.8601177 + 
					    (0.0001541183 * _t_4)
					  ) + (
					    (1.286412e-07 * _t_4)
					   * _t_4)) / ((1.0 + 
					    (0.0008424202 * _t_4)
					  ) + (
					    (7.081451e-07 * _t_4)
					   * _t_4)));
					  highp float tmpvar_7;
					  tmpvar_7 = (((0.3173987 + 
					    (4.228063e-05 * _t_4)
					  ) + (
					    (4.204817e-08 * _t_4)
					   * _t_4)) / ((1.0 - 
					    (2.897418e-05 * _t_4)
					  ) + (
					    (1.614561e-07 * _t_4)
					   * _t_4)));
					  highp float tmpvar_8;
					  tmpvar_8 = ((3.0 * tmpvar_6) / ((
					    (2.0 * tmpvar_6)
					   - 
					    (8.0 * tmpvar_7)
					  ) + 4.0));
					  highp float tmpvar_9;
					  tmpvar_9 = ((2.0 * tmpvar_7) / ((
					    (2.0 * tmpvar_6)
					   - 
					    (8.0 * tmpvar_7)
					  ) + 4.0));
					  highp float tmpvar_10;
					  tmpvar_10 = ((1.0/(tmpvar_9)) * tmpvar_8);
					  highp vec3 tmpvar_11;
					  tmpvar_11.x = tmpvar_10;
					  tmpvar_11.y = 1.0;
					  tmpvar_11.z = ((1.0/(tmpvar_9)) * ((1.0 - tmpvar_8) - tmpvar_9));
					  RGB_5.x = ((tmpvar_10 * pow (
					    ((0.0006 * _t_4) * _Distortion)
					  , 4.0)) / _Distortion);
					  RGB_5.y = (pow ((
					    (0.0004 * _t_4)
					   * _Distortion), 4.0) / _Distortion);
					  RGB_5.z = ((tmpvar_11.z * pow (
					    ((0.0004 * _t_4) * _Distortion)
					  , 4.0)) * _Distortion);
					  highp vec4 tmpvar_12;
					  tmpvar_12.w = 1.0;
					  tmpvar_12.xyz = RGB_5;
					  gl_FragData[0] = tmpvar_12;
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
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 noise_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, uv_2).xyz;
					  noise_1 = tmpvar_3;
					  highp float _t_4;
					  _t_4 = (dot (noise_1, vec3(0.2126, 0.7152, 0.0722)) * 4000.0);
					  highp vec3 RGB_5;
					  highp float tmpvar_6;
					  tmpvar_6 = (((0.8601177 + 
					    (0.0001541183 * _t_4)
					  ) + (
					    (1.286412e-07 * _t_4)
					   * _t_4)) / ((1.0 + 
					    (0.0008424202 * _t_4)
					  ) + (
					    (7.081451e-07 * _t_4)
					   * _t_4)));
					  highp float tmpvar_7;
					  tmpvar_7 = (((0.3173987 + 
					    (4.228063e-05 * _t_4)
					  ) + (
					    (4.204817e-08 * _t_4)
					   * _t_4)) / ((1.0 - 
					    (2.897418e-05 * _t_4)
					  ) + (
					    (1.614561e-07 * _t_4)
					   * _t_4)));
					  highp float tmpvar_8;
					  tmpvar_8 = ((3.0 * tmpvar_6) / ((
					    (2.0 * tmpvar_6)
					   - 
					    (8.0 * tmpvar_7)
					  ) + 4.0));
					  highp float tmpvar_9;
					  tmpvar_9 = ((2.0 * tmpvar_7) / ((
					    (2.0 * tmpvar_6)
					   - 
					    (8.0 * tmpvar_7)
					  ) + 4.0));
					  highp float tmpvar_10;
					  tmpvar_10 = ((1.0/(tmpvar_9)) * tmpvar_8);
					  highp vec3 tmpvar_11;
					  tmpvar_11.x = tmpvar_10;
					  tmpvar_11.y = 1.0;
					  tmpvar_11.z = ((1.0/(tmpvar_9)) * ((1.0 - tmpvar_8) - tmpvar_9));
					  RGB_5.x = ((tmpvar_10 * pow (
					    ((0.0006 * _t_4) * _Distortion)
					  , 4.0)) / _Distortion);
					  RGB_5.y = (pow ((
					    (0.0004 * _t_4)
					   * _Distortion), 4.0) / _Distortion);
					  RGB_5.z = ((tmpvar_11.z * pow (
					    ((0.0004 * _t_4) * _Distortion)
					  , 4.0)) * _Distortion);
					  highp vec4 tmpvar_12;
					  tmpvar_12.w = 1.0;
					  tmpvar_12.xyz = RGB_5;
					  gl_FragData[0] = tmpvar_12;
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
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 noise_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, uv_2).xyz;
					  noise_1 = tmpvar_3;
					  highp float _t_4;
					  _t_4 = (dot (noise_1, vec3(0.2126, 0.7152, 0.0722)) * 4000.0);
					  highp vec3 RGB_5;
					  highp float tmpvar_6;
					  tmpvar_6 = (((0.8601177 + 
					    (0.0001541183 * _t_4)
					  ) + (
					    (1.286412e-07 * _t_4)
					   * _t_4)) / ((1.0 + 
					    (0.0008424202 * _t_4)
					  ) + (
					    (7.081451e-07 * _t_4)
					   * _t_4)));
					  highp float tmpvar_7;
					  tmpvar_7 = (((0.3173987 + 
					    (4.228063e-05 * _t_4)
					  ) + (
					    (4.204817e-08 * _t_4)
					   * _t_4)) / ((1.0 - 
					    (2.897418e-05 * _t_4)
					  ) + (
					    (1.614561e-07 * _t_4)
					   * _t_4)));
					  highp float tmpvar_8;
					  tmpvar_8 = ((3.0 * tmpvar_6) / ((
					    (2.0 * tmpvar_6)
					   - 
					    (8.0 * tmpvar_7)
					  ) + 4.0));
					  highp float tmpvar_9;
					  tmpvar_9 = ((2.0 * tmpvar_7) / ((
					    (2.0 * tmpvar_6)
					   - 
					    (8.0 * tmpvar_7)
					  ) + 4.0));
					  highp float tmpvar_10;
					  tmpvar_10 = ((1.0/(tmpvar_9)) * tmpvar_8);
					  highp vec3 tmpvar_11;
					  tmpvar_11.x = tmpvar_10;
					  tmpvar_11.y = 1.0;
					  tmpvar_11.z = ((1.0/(tmpvar_9)) * ((1.0 - tmpvar_8) - tmpvar_9));
					  RGB_5.x = ((tmpvar_10 * pow (
					    ((0.0006 * _t_4) * _Distortion)
					  , 4.0)) / _Distortion);
					  RGB_5.y = (pow ((
					    (0.0004 * _t_4)
					   * _Distortion), 4.0) / _Distortion);
					  RGB_5.z = ((tmpvar_11.z * pow (
					    ((0.0004 * _t_4) * _Distortion)
					  , 4.0)) * _Distortion);
					  highp vec4 tmpvar_12;
					  tmpvar_12.w = 1.0;
					  tmpvar_12.xyz = RGB_5;
					  gl_FragData[0] = tmpvar_12;
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
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_0;
					float u_xlat1;
					mediump vec3 u_xlat16_1;
					vec2 u_xlat2;
					mediump float u_xlat16_2;
					mediump float u_xlat16_4;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_2 = (-u_xlat16_0) * 0.115896732 + 1.0;
					    u_xlat16_4 = u_xlat16_0 * u_xlat16_0;
					    u_xlat16_2 = u_xlat16_4 * 2.58329701 + u_xlat16_2;
					    u_xlat16_1.xyz = vec3(u_xlat16_0) * vec3(0.616473019, 3.36968088, 0.169122502) + vec3(0.860117733, 1.0, 0.317398727);
					    u_xlat0.x = u_xlat16_0 * _Distortion;
					    u_xlat0.xw = u_xlat0.xx * vec2(2.4000001, 1.5999999);
					    u_xlat0.xw = u_xlat0.xw * u_xlat0.xw;
					    u_xlat16_1.xyz = vec3(u_xlat16_4) * vec3(2.05825949, 11.3303223, 0.672770679) + u_xlat16_1.xyz;
					    u_xlat16_2 = u_xlat16_1.z / u_xlat16_2;
					    u_xlat16_4 = u_xlat16_1.x / u_xlat16_1.y;
					    u_xlat16_1.x = u_xlat16_4 + u_xlat16_4;
					    u_xlat2.y = u_xlat16_4 * 3.0;
					    u_xlat16_1.x = (-u_xlat16_2) * 8.0 + u_xlat16_1.x;
					    u_xlat2.x = u_xlat16_2 + u_xlat16_2;
					    u_xlat16_1.x = u_xlat16_1.x + 4.0;
					    u_xlat0.yz = u_xlat2.xy / u_xlat16_1.xx;
					    u_xlat1 = (-u_xlat0.z) + 1.0;
					    u_xlat1 = (-u_xlat0.y) + u_xlat1;
					    u_xlat0.y = float(1.0) / u_xlat0.y;
					    u_xlat1 = u_xlat1 * u_xlat0.y;
					    u_xlat0.xyw = u_xlat0.xzw * u_xlat0.xyw;
					    u_xlat0.x = u_xlat0.x * u_xlat0.y;
					    SV_Target0.xy = u_xlat0.xw / vec2(vec2(_Distortion, _Distortion));
					    u_xlat0.x = u_xlat0.w * u_xlat1;
					    SV_Target0.z = u_xlat0.x * _Distortion;
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
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_0;
					float u_xlat1;
					mediump vec3 u_xlat16_1;
					vec2 u_xlat2;
					mediump float u_xlat16_2;
					mediump float u_xlat16_4;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_2 = (-u_xlat16_0) * 0.115896732 + 1.0;
					    u_xlat16_4 = u_xlat16_0 * u_xlat16_0;
					    u_xlat16_2 = u_xlat16_4 * 2.58329701 + u_xlat16_2;
					    u_xlat16_1.xyz = vec3(u_xlat16_0) * vec3(0.616473019, 3.36968088, 0.169122502) + vec3(0.860117733, 1.0, 0.317398727);
					    u_xlat0.x = u_xlat16_0 * _Distortion;
					    u_xlat0.xw = u_xlat0.xx * vec2(2.4000001, 1.5999999);
					    u_xlat0.xw = u_xlat0.xw * u_xlat0.xw;
					    u_xlat16_1.xyz = vec3(u_xlat16_4) * vec3(2.05825949, 11.3303223, 0.672770679) + u_xlat16_1.xyz;
					    u_xlat16_2 = u_xlat16_1.z / u_xlat16_2;
					    u_xlat16_4 = u_xlat16_1.x / u_xlat16_1.y;
					    u_xlat16_1.x = u_xlat16_4 + u_xlat16_4;
					    u_xlat2.y = u_xlat16_4 * 3.0;
					    u_xlat16_1.x = (-u_xlat16_2) * 8.0 + u_xlat16_1.x;
					    u_xlat2.x = u_xlat16_2 + u_xlat16_2;
					    u_xlat16_1.x = u_xlat16_1.x + 4.0;
					    u_xlat0.yz = u_xlat2.xy / u_xlat16_1.xx;
					    u_xlat1 = (-u_xlat0.z) + 1.0;
					    u_xlat1 = (-u_xlat0.y) + u_xlat1;
					    u_xlat0.y = float(1.0) / u_xlat0.y;
					    u_xlat1 = u_xlat1 * u_xlat0.y;
					    u_xlat0.xyw = u_xlat0.xzw * u_xlat0.xyw;
					    u_xlat0.x = u_xlat0.x * u_xlat0.y;
					    SV_Target0.xy = u_xlat0.xw / vec2(vec2(_Distortion, _Distortion));
					    u_xlat0.x = u_xlat0.w * u_xlat1;
					    SV_Target0.z = u_xlat0.x * _Distortion;
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
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump float u_xlat16_0;
					lowp vec3 u_xlat10_0;
					float u_xlat1;
					mediump vec3 u_xlat16_1;
					vec2 u_xlat2;
					mediump float u_xlat16_2;
					mediump float u_xlat16_4;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_2 = (-u_xlat16_0) * 0.115896732 + 1.0;
					    u_xlat16_4 = u_xlat16_0 * u_xlat16_0;
					    u_xlat16_2 = u_xlat16_4 * 2.58329701 + u_xlat16_2;
					    u_xlat16_1.xyz = vec3(u_xlat16_0) * vec3(0.616473019, 3.36968088, 0.169122502) + vec3(0.860117733, 1.0, 0.317398727);
					    u_xlat0.x = u_xlat16_0 * _Distortion;
					    u_xlat0.xw = u_xlat0.xx * vec2(2.4000001, 1.5999999);
					    u_xlat0.xw = u_xlat0.xw * u_xlat0.xw;
					    u_xlat16_1.xyz = vec3(u_xlat16_4) * vec3(2.05825949, 11.3303223, 0.672770679) + u_xlat16_1.xyz;
					    u_xlat16_2 = u_xlat16_1.z / u_xlat16_2;
					    u_xlat16_4 = u_xlat16_1.x / u_xlat16_1.y;
					    u_xlat16_1.x = u_xlat16_4 + u_xlat16_4;
					    u_xlat2.y = u_xlat16_4 * 3.0;
					    u_xlat16_1.x = (-u_xlat16_2) * 8.0 + u_xlat16_1.x;
					    u_xlat2.x = u_xlat16_2 + u_xlat16_2;
					    u_xlat16_1.x = u_xlat16_1.x + 4.0;
					    u_xlat0.yz = u_xlat2.xy / u_xlat16_1.xx;
					    u_xlat1 = (-u_xlat0.z) + 1.0;
					    u_xlat1 = (-u_xlat0.y) + u_xlat1;
					    u_xlat0.y = float(1.0) / u_xlat0.y;
					    u_xlat1 = u_xlat1 * u_xlat0.y;
					    u_xlat0.xyw = u_xlat0.xzw * u_xlat0.xyw;
					    u_xlat0.x = u_xlat0.x * u_xlat0.y;
					    SV_Target0.xy = u_xlat0.xw / vec2(vec2(_Distortion, _Distortion));
					    u_xlat0.x = u_xlat0.w * u_xlat1;
					    SV_Target0.z = u_xlat0.x * _Distortion;
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