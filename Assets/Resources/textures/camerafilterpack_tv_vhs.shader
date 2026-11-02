Shader "CameraFilterPack/TV_VHS" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 45468
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
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 uv_1;
					  highp vec4 text_2;
					  uv_1 = xlv_TEXCOORD0;
					  uv_1.y = (1.0 - uv_1.y);
					  highp float x_3;
					  x_3 = (uv_1.y + (_TimeX * _Value3));
					  uv_1.y = (x_3 - floor(x_3));
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = _TimeX;
					  tmpvar_4.y = xlv_TEXCOORD0.y;
					  uv_1.x = (uv_1.x + ((
					    fract((sin(dot (tmpvar_4, vec2(11.9898, 75.133))) * 43528.15))
					   - 0.5) / _Value));
					  uv_1.y = (uv_1.y + ((
					    fract((sin(dot (vec2(_TimeX), vec2(11.9898, 75.133))) * 43528.15))
					   - 0.5) / _Value2));
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = xlv_TEXCOORD0.y;
					  tmpvar_5.y = _TimeX;
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = xlv_TEXCOORD0.y;
					  tmpvar_6.y = (_TimeX + 1.0);
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = xlv_TEXCOORD0.y;
					  tmpvar_7.y = (_TimeX + 2.0);
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 0.0;
					  tmpvar_8.x = fract((sin(
					    dot (tmpvar_5, vec2(11.9898, 75.133))
					  ) * 43528.15));
					  tmpvar_8.y = fract((sin(
					    dot (tmpvar_6, vec2(11.9898, 75.133))
					  ) * 43528.15));
					  tmpvar_8.z = fract((sin(
					    dot (tmpvar_7, vec2(11.9898, 75.133))
					  ) * 43528.15));
					  text_2 = ((vec4(-0.5, -0.5, -0.5, -0.5) + tmpvar_8) * 0.1);
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = floor((uv_1.y * 80.0));
					  tmpvar_9.y = floor((uv_1.x * 50.0));
					  highp vec2 tmpvar_10;
					  tmpvar_10.y = 0.0;
					  tmpvar_10.x = _TimeX;
					  highp float tmpvar_11;
					  tmpvar_11 = fract((sin(
					    dot ((tmpvar_9 + tmpvar_10), vec2(11.9898, 75.133))
					  ) * 43528.15));
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_MainTex, uv_1);
					  text_2 = (text_2 + tmpvar_12);
					  if (!(((tmpvar_11 > 
					    (11.5 - (30.0 * uv_1.y))
					  ) || (tmpvar_11 < 
					    (1.5 - (5.0 * uv_1.y))
					  )))) {
					    text_2 = (text_2 + vec4(_Value4));
					  };
					  gl_FragData[0] = text_2;
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
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 uv_1;
					  highp vec4 text_2;
					  uv_1 = xlv_TEXCOORD0;
					  uv_1.y = (1.0 - uv_1.y);
					  highp float x_3;
					  x_3 = (uv_1.y + (_TimeX * _Value3));
					  uv_1.y = (x_3 - floor(x_3));
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = _TimeX;
					  tmpvar_4.y = xlv_TEXCOORD0.y;
					  uv_1.x = (uv_1.x + ((
					    fract((sin(dot (tmpvar_4, vec2(11.9898, 75.133))) * 43528.15))
					   - 0.5) / _Value));
					  uv_1.y = (uv_1.y + ((
					    fract((sin(dot (vec2(_TimeX), vec2(11.9898, 75.133))) * 43528.15))
					   - 0.5) / _Value2));
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = xlv_TEXCOORD0.y;
					  tmpvar_5.y = _TimeX;
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = xlv_TEXCOORD0.y;
					  tmpvar_6.y = (_TimeX + 1.0);
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = xlv_TEXCOORD0.y;
					  tmpvar_7.y = (_TimeX + 2.0);
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 0.0;
					  tmpvar_8.x = fract((sin(
					    dot (tmpvar_5, vec2(11.9898, 75.133))
					  ) * 43528.15));
					  tmpvar_8.y = fract((sin(
					    dot (tmpvar_6, vec2(11.9898, 75.133))
					  ) * 43528.15));
					  tmpvar_8.z = fract((sin(
					    dot (tmpvar_7, vec2(11.9898, 75.133))
					  ) * 43528.15));
					  text_2 = ((vec4(-0.5, -0.5, -0.5, -0.5) + tmpvar_8) * 0.1);
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = floor((uv_1.y * 80.0));
					  tmpvar_9.y = floor((uv_1.x * 50.0));
					  highp vec2 tmpvar_10;
					  tmpvar_10.y = 0.0;
					  tmpvar_10.x = _TimeX;
					  highp float tmpvar_11;
					  tmpvar_11 = fract((sin(
					    dot ((tmpvar_9 + tmpvar_10), vec2(11.9898, 75.133))
					  ) * 43528.15));
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_MainTex, uv_1);
					  text_2 = (text_2 + tmpvar_12);
					  if (!(((tmpvar_11 > 
					    (11.5 - (30.0 * uv_1.y))
					  ) || (tmpvar_11 < 
					    (1.5 - (5.0 * uv_1.y))
					  )))) {
					    text_2 = (text_2 + vec4(_Value4));
					  };
					  gl_FragData[0] = text_2;
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
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 uv_1;
					  highp vec4 text_2;
					  uv_1 = xlv_TEXCOORD0;
					  uv_1.y = (1.0 - uv_1.y);
					  highp float x_3;
					  x_3 = (uv_1.y + (_TimeX * _Value3));
					  uv_1.y = (x_3 - floor(x_3));
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = _TimeX;
					  tmpvar_4.y = xlv_TEXCOORD0.y;
					  uv_1.x = (uv_1.x + ((
					    fract((sin(dot (tmpvar_4, vec2(11.9898, 75.133))) * 43528.15))
					   - 0.5) / _Value));
					  uv_1.y = (uv_1.y + ((
					    fract((sin(dot (vec2(_TimeX), vec2(11.9898, 75.133))) * 43528.15))
					   - 0.5) / _Value2));
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = xlv_TEXCOORD0.y;
					  tmpvar_5.y = _TimeX;
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = xlv_TEXCOORD0.y;
					  tmpvar_6.y = (_TimeX + 1.0);
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = xlv_TEXCOORD0.y;
					  tmpvar_7.y = (_TimeX + 2.0);
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 0.0;
					  tmpvar_8.x = fract((sin(
					    dot (tmpvar_5, vec2(11.9898, 75.133))
					  ) * 43528.15));
					  tmpvar_8.y = fract((sin(
					    dot (tmpvar_6, vec2(11.9898, 75.133))
					  ) * 43528.15));
					  tmpvar_8.z = fract((sin(
					    dot (tmpvar_7, vec2(11.9898, 75.133))
					  ) * 43528.15));
					  text_2 = ((vec4(-0.5, -0.5, -0.5, -0.5) + tmpvar_8) * 0.1);
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = floor((uv_1.y * 80.0));
					  tmpvar_9.y = floor((uv_1.x * 50.0));
					  highp vec2 tmpvar_10;
					  tmpvar_10.y = 0.0;
					  tmpvar_10.x = _TimeX;
					  highp float tmpvar_11;
					  tmpvar_11 = fract((sin(
					    dot ((tmpvar_9 + tmpvar_10), vec2(11.9898, 75.133))
					  ) * 43528.15));
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_MainTex, uv_1);
					  text_2 = (text_2 + tmpvar_12);
					  if (!(((tmpvar_11 > 
					    (11.5 - (30.0 * uv_1.y))
					  ) || (tmpvar_11 < 
					    (1.5 - (5.0 * uv_1.y))
					  )))) {
					    text_2 = (text_2 + vec4(_Value4));
					  };
					  gl_FragData[0] = text_2;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					int u_xlati4;
					vec2 u_xlat8;
					float u_xlat12;
					mediump float u_xlat16_12;
					void main()
					{
					    u_xlat0.xw = vec2(_TimeX);
					    u_xlat0.yz = vs_TEXCOORD0.yy;
					    u_xlat0.z = dot(u_xlat0.zw, vec2(11.9898005, 75.1330032));
					    u_xlat0.x = dot(u_xlat0.xy, vec2(11.9898005, 75.1330032));
					    u_xlat0.xz = sin(u_xlat0.xz);
					    u_xlat0.xz = u_xlat0.xz * vec2(43528.1484, 43528.1484);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + -0.5;
					    u_xlat0.x = u_xlat0.x / _Value;
					    u_xlat0.x = u_xlat0.x + vs_TEXCOORD0.x;
					    u_xlat1.x = fract(u_xlat0.z);
					    u_xlat2.xz = vs_TEXCOORD0.yy;
					    u_xlat2.yw = vec2(_TimeX) + vec2(1.0, 2.0);
					    u_xlat8.x = dot(u_xlat2.xy, vec2(11.9898005, 75.1330032));
					    u_xlat8.y = dot(u_xlat2.zw, vec2(11.9898005, 75.1330032));
					    u_xlat8.xy = sin(u_xlat8.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(43528.1484, 43528.1484);
					    u_xlat1.yz = fract(u_xlat8.xy);
					    u_xlat1.w = 0.0;
					    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat8.x = dot(vec2(_TimeX), vec2(11.9898005, 75.1330032));
					    u_xlat8.x = sin(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * 43528.1484;
					    u_xlat8.x = fract(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x + -0.5;
					    u_xlat8.x = u_xlat8.x / _Value2;
					    u_xlat16_12 = (-vs_TEXCOORD0.y) + 1.0;
					    u_xlat12 = _TimeX * _Value3 + u_xlat16_12;
					    u_xlat2.x = floor(u_xlat12);
					    u_xlat12 = u_xlat12 + (-u_xlat2.x);
					    u_xlat0.y = u_xlat8.x + u_xlat12;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xz = u_xlat0.yx * vec2(80.0, 50.0);
					    u_xlat4.xz = (-u_xlat0.yy) * vec2(30.0, 5.0) + vec2(11.5, 1.5);
					    u_xlat0.xz = floor(u_xlat0.xz);
					    u_xlat1 = u_xlat1 * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat10_2;
					    u_xlat2 = u_xlat1 + vec4(_Value4);
					    u_xlat3.x = _TimeX;
					    u_xlat3.y = 0.0;
					    u_xlat0.xz = u_xlat0.xz + u_xlat3.xy;
					    u_xlat0.x = dot(u_xlat0.xz, vec2(11.9898005, 75.1330032));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43528.1484;
					    u_xlat0.x = fract(u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat4.x<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati4 = int((u_xlat4.x<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
					#endif
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat0.x<u_xlat4.z; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati0 = int((u_xlat0.x<u_xlat4.z) ? 0xFFFFFFFFu : uint(0u));
					#endif
					    u_xlati0 = int(uint(u_xlati0) | uint(u_xlati4));
					    SV_Target0 = (int(u_xlati0) != 0) ? u_xlat1 : u_xlat2;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					int u_xlati4;
					vec2 u_xlat8;
					float u_xlat12;
					mediump float u_xlat16_12;
					void main()
					{
					    u_xlat0.xw = vec2(_TimeX);
					    u_xlat0.yz = vs_TEXCOORD0.yy;
					    u_xlat0.z = dot(u_xlat0.zw, vec2(11.9898005, 75.1330032));
					    u_xlat0.x = dot(u_xlat0.xy, vec2(11.9898005, 75.1330032));
					    u_xlat0.xz = sin(u_xlat0.xz);
					    u_xlat0.xz = u_xlat0.xz * vec2(43528.1484, 43528.1484);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + -0.5;
					    u_xlat0.x = u_xlat0.x / _Value;
					    u_xlat0.x = u_xlat0.x + vs_TEXCOORD0.x;
					    u_xlat1.x = fract(u_xlat0.z);
					    u_xlat2.xz = vs_TEXCOORD0.yy;
					    u_xlat2.yw = vec2(_TimeX) + vec2(1.0, 2.0);
					    u_xlat8.x = dot(u_xlat2.xy, vec2(11.9898005, 75.1330032));
					    u_xlat8.y = dot(u_xlat2.zw, vec2(11.9898005, 75.1330032));
					    u_xlat8.xy = sin(u_xlat8.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(43528.1484, 43528.1484);
					    u_xlat1.yz = fract(u_xlat8.xy);
					    u_xlat1.w = 0.0;
					    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat8.x = dot(vec2(_TimeX), vec2(11.9898005, 75.1330032));
					    u_xlat8.x = sin(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * 43528.1484;
					    u_xlat8.x = fract(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x + -0.5;
					    u_xlat8.x = u_xlat8.x / _Value2;
					    u_xlat16_12 = (-vs_TEXCOORD0.y) + 1.0;
					    u_xlat12 = _TimeX * _Value3 + u_xlat16_12;
					    u_xlat2.x = floor(u_xlat12);
					    u_xlat12 = u_xlat12 + (-u_xlat2.x);
					    u_xlat0.y = u_xlat8.x + u_xlat12;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xz = u_xlat0.yx * vec2(80.0, 50.0);
					    u_xlat4.xz = (-u_xlat0.yy) * vec2(30.0, 5.0) + vec2(11.5, 1.5);
					    u_xlat0.xz = floor(u_xlat0.xz);
					    u_xlat1 = u_xlat1 * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat10_2;
					    u_xlat2 = u_xlat1 + vec4(_Value4);
					    u_xlat3.x = _TimeX;
					    u_xlat3.y = 0.0;
					    u_xlat0.xz = u_xlat0.xz + u_xlat3.xy;
					    u_xlat0.x = dot(u_xlat0.xz, vec2(11.9898005, 75.1330032));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43528.1484;
					    u_xlat0.x = fract(u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat4.x<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati4 = int((u_xlat4.x<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
					#endif
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat0.x<u_xlat4.z; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati0 = int((u_xlat0.x<u_xlat4.z) ? 0xFFFFFFFFu : uint(0u));
					#endif
					    u_xlati0 = int(uint(u_xlati0) | uint(u_xlati4));
					    SV_Target0 = (int(u_xlati0) != 0) ? u_xlat1 : u_xlat2;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					int u_xlati4;
					vec2 u_xlat8;
					float u_xlat12;
					mediump float u_xlat16_12;
					void main()
					{
					    u_xlat0.xw = vec2(_TimeX);
					    u_xlat0.yz = vs_TEXCOORD0.yy;
					    u_xlat0.z = dot(u_xlat0.zw, vec2(11.9898005, 75.1330032));
					    u_xlat0.x = dot(u_xlat0.xy, vec2(11.9898005, 75.1330032));
					    u_xlat0.xz = sin(u_xlat0.xz);
					    u_xlat0.xz = u_xlat0.xz * vec2(43528.1484, 43528.1484);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + -0.5;
					    u_xlat0.x = u_xlat0.x / _Value;
					    u_xlat0.x = u_xlat0.x + vs_TEXCOORD0.x;
					    u_xlat1.x = fract(u_xlat0.z);
					    u_xlat2.xz = vs_TEXCOORD0.yy;
					    u_xlat2.yw = vec2(_TimeX) + vec2(1.0, 2.0);
					    u_xlat8.x = dot(u_xlat2.xy, vec2(11.9898005, 75.1330032));
					    u_xlat8.y = dot(u_xlat2.zw, vec2(11.9898005, 75.1330032));
					    u_xlat8.xy = sin(u_xlat8.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(43528.1484, 43528.1484);
					    u_xlat1.yz = fract(u_xlat8.xy);
					    u_xlat1.w = 0.0;
					    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat8.x = dot(vec2(_TimeX), vec2(11.9898005, 75.1330032));
					    u_xlat8.x = sin(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * 43528.1484;
					    u_xlat8.x = fract(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x + -0.5;
					    u_xlat8.x = u_xlat8.x / _Value2;
					    u_xlat16_12 = (-vs_TEXCOORD0.y) + 1.0;
					    u_xlat12 = _TimeX * _Value3 + u_xlat16_12;
					    u_xlat2.x = floor(u_xlat12);
					    u_xlat12 = u_xlat12 + (-u_xlat2.x);
					    u_xlat0.y = u_xlat8.x + u_xlat12;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xz = u_xlat0.yx * vec2(80.0, 50.0);
					    u_xlat4.xz = (-u_xlat0.yy) * vec2(30.0, 5.0) + vec2(11.5, 1.5);
					    u_xlat0.xz = floor(u_xlat0.xz);
					    u_xlat1 = u_xlat1 * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat10_2;
					    u_xlat2 = u_xlat1 + vec4(_Value4);
					    u_xlat3.x = _TimeX;
					    u_xlat3.y = 0.0;
					    u_xlat0.xz = u_xlat0.xz + u_xlat3.xy;
					    u_xlat0.x = dot(u_xlat0.xz, vec2(11.9898005, 75.1330032));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43528.1484;
					    u_xlat0.x = fract(u_xlat0.x);
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat4.x<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati4 = int((u_xlat4.x<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
					#endif
					#ifdef UNITY_ADRENO_ES3
					    { bool cond = u_xlat0.x<u_xlat4.z; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					    u_xlati0 = int((u_xlat0.x<u_xlat4.z) ? 0xFFFFFFFFu : uint(0u));
					#endif
					    u_xlati0 = int(uint(u_xlati0) | uint(u_xlati4));
					    SV_Target0 = (int(u_xlati0) != 0) ? u_xlat1 : u_xlat2;
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