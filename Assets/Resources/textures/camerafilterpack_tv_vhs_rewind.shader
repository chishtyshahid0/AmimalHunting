Shader "CameraFilterPack/TV_VHS_Rewind" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 4514
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
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec3 text_2;
					  highp vec3 aberration_3;
					  highp vec2 uv_4;
					  highp vec2 q_5;
					  q_5 = xlv_TEXCOORD0;
					  aberration_3 = (vec3(0.019, 0.0, -0.019) * (abs(
					    ((0.5 + ((q_5 - 0.5) * (0.9 + 
					      (0.1 * sin((0.2 * _TimeX)))
					    ))).x - 0.5)
					  ) * _Value));
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = (q_5.x * (_ScreenResolution.x / _ScreenResolution.y));
					  tmpvar_6.y = (q_5.y * _Value);
					  highp float tmpvar_7;
					  highp float tmpvar_8;
					  tmpvar_8 = -(_TimeX);
					  tmpvar_7 = (clamp ((
					    (tmpvar_6.y - fract((tmpvar_8 * _Value2)))
					   - 0.05), 0.0, 0.1) * 10.0);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 0.0;
					  tmpvar_9.x = ((sin(
					    (tmpvar_7 * 10.0)
					  ) * (
					    (-4.0 * (tmpvar_7 - 0.5))
					   + 2.0)) * 0.02);
					  uv_4 = (q_5 + tmpvar_9);
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = (uv_4.x + aberration_3.x);
					  tmpvar_10.y = uv_4.y;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, tmpvar_10);
					  text_2.x = tmpvar_11.x;
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = (uv_4.x + aberration_3.y);
					  tmpvar_12.y = uv_4.y;
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, tmpvar_12);
					  text_2.y = tmpvar_13.y;
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = (uv_4.x + aberration_3.z);
					  tmpvar_14.y = uv_4.y;
					  lowp vec4 tmpvar_15;
					  tmpvar_15 = texture2D (_MainTex, tmpvar_14);
					  text_2.z = tmpvar_15.z;
					  text_2 = mix (text_2, text_2.xxx, vec3(((
					    clamp (((tmpvar_6.y - fract(
					      (tmpvar_8 * _Value3)
					    )) - 0.05), 0.0, 0.1)
					   * 10.0) * (1.0 - uv_4.y))));
					  text_2 = mix (text_2, text_2.xxx, vec3((tmpvar_7 * (1.0 - uv_4.y))));
					  highp vec4 tmpvar_16;
					  tmpvar_16.w = 1.0;
					  tmpvar_16.xyz = text_2;
					  tmpvar_1 = tmpvar_16;
					  gl_FragData[0] = tmpvar_1;
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
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec3 text_2;
					  highp vec3 aberration_3;
					  highp vec2 uv_4;
					  highp vec2 q_5;
					  q_5 = xlv_TEXCOORD0;
					  aberration_3 = (vec3(0.019, 0.0, -0.019) * (abs(
					    ((0.5 + ((q_5 - 0.5) * (0.9 + 
					      (0.1 * sin((0.2 * _TimeX)))
					    ))).x - 0.5)
					  ) * _Value));
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = (q_5.x * (_ScreenResolution.x / _ScreenResolution.y));
					  tmpvar_6.y = (q_5.y * _Value);
					  highp float tmpvar_7;
					  highp float tmpvar_8;
					  tmpvar_8 = -(_TimeX);
					  tmpvar_7 = (clamp ((
					    (tmpvar_6.y - fract((tmpvar_8 * _Value2)))
					   - 0.05), 0.0, 0.1) * 10.0);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 0.0;
					  tmpvar_9.x = ((sin(
					    (tmpvar_7 * 10.0)
					  ) * (
					    (-4.0 * (tmpvar_7 - 0.5))
					   + 2.0)) * 0.02);
					  uv_4 = (q_5 + tmpvar_9);
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = (uv_4.x + aberration_3.x);
					  tmpvar_10.y = uv_4.y;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, tmpvar_10);
					  text_2.x = tmpvar_11.x;
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = (uv_4.x + aberration_3.y);
					  tmpvar_12.y = uv_4.y;
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, tmpvar_12);
					  text_2.y = tmpvar_13.y;
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = (uv_4.x + aberration_3.z);
					  tmpvar_14.y = uv_4.y;
					  lowp vec4 tmpvar_15;
					  tmpvar_15 = texture2D (_MainTex, tmpvar_14);
					  text_2.z = tmpvar_15.z;
					  text_2 = mix (text_2, text_2.xxx, vec3(((
					    clamp (((tmpvar_6.y - fract(
					      (tmpvar_8 * _Value3)
					    )) - 0.05), 0.0, 0.1)
					   * 10.0) * (1.0 - uv_4.y))));
					  text_2 = mix (text_2, text_2.xxx, vec3((tmpvar_7 * (1.0 - uv_4.y))));
					  highp vec4 tmpvar_16;
					  tmpvar_16.w = 1.0;
					  tmpvar_16.xyz = text_2;
					  tmpvar_1 = tmpvar_16;
					  gl_FragData[0] = tmpvar_1;
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
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec3 text_2;
					  highp vec3 aberration_3;
					  highp vec2 uv_4;
					  highp vec2 q_5;
					  q_5 = xlv_TEXCOORD0;
					  aberration_3 = (vec3(0.019, 0.0, -0.019) * (abs(
					    ((0.5 + ((q_5 - 0.5) * (0.9 + 
					      (0.1 * sin((0.2 * _TimeX)))
					    ))).x - 0.5)
					  ) * _Value));
					  highp vec2 tmpvar_6;
					  tmpvar_6.x = (q_5.x * (_ScreenResolution.x / _ScreenResolution.y));
					  tmpvar_6.y = (q_5.y * _Value);
					  highp float tmpvar_7;
					  highp float tmpvar_8;
					  tmpvar_8 = -(_TimeX);
					  tmpvar_7 = (clamp ((
					    (tmpvar_6.y - fract((tmpvar_8 * _Value2)))
					   - 0.05), 0.0, 0.1) * 10.0);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 0.0;
					  tmpvar_9.x = ((sin(
					    (tmpvar_7 * 10.0)
					  ) * (
					    (-4.0 * (tmpvar_7 - 0.5))
					   + 2.0)) * 0.02);
					  uv_4 = (q_5 + tmpvar_9);
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = (uv_4.x + aberration_3.x);
					  tmpvar_10.y = uv_4.y;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, tmpvar_10);
					  text_2.x = tmpvar_11.x;
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = (uv_4.x + aberration_3.y);
					  tmpvar_12.y = uv_4.y;
					  lowp vec4 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, tmpvar_12);
					  text_2.y = tmpvar_13.y;
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = (uv_4.x + aberration_3.z);
					  tmpvar_14.y = uv_4.y;
					  lowp vec4 tmpvar_15;
					  tmpvar_15 = texture2D (_MainTex, tmpvar_14);
					  text_2.z = tmpvar_15.z;
					  text_2 = mix (text_2, text_2.xxx, vec3(((
					    clamp (((tmpvar_6.y - fract(
					      (tmpvar_8 * _Value3)
					    )) - 0.05), 0.0, 0.1)
					   * 10.0) * (1.0 - uv_4.y))));
					  text_2 = mix (text_2, text_2.xxx, vec3((tmpvar_7 * (1.0 - uv_4.y))));
					  highp vec4 tmpvar_16;
					  tmpvar_16.w = 1.0;
					  tmpvar_16.xyz = text_2;
					  tmpvar_1 = tmpvar_16;
					  gl_FragData[0] = tmpvar_1;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					mediump float u_xlat16_3;
					vec2 u_xlat7;
					float u_xlat9;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.200000003;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001 + 0.899999976;
					    u_xlat16_3 = vs_TEXCOORD0.x + -0.5;
					    u_xlat0.x = u_xlat0.x * u_xlat16_3;
					    u_xlat0.x = abs(u_xlat0.x) * _Value;
					    u_xlat3.xyz = vec3(float(_Value3) * (-_TimeX), float(_Value2) * (-_TimeX), float(_Value2) * (-_TimeX));
					    u_xlat3.xyz = fract(u_xlat3.xyz);
					    u_xlat3.xyz = vs_TEXCOORD0.yyy * vec3(vec3(_Value, _Value, _Value)) + (-u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat3.xyz + vec3(-0.0500000007, -0.0500000007, -0.0500000007);
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
					    u_xlat1.x = u_xlat3.y * 10.0 + -0.5;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(10.0, 10.0, 100.0);
					    u_xlat1.x = u_xlat1.x * -4.0 + 2.0;
					    u_xlat9 = sin(u_xlat3.z);
					    u_xlat9 = u_xlat1.x * u_xlat9;
					    u_xlat7.x = u_xlat9 * 0.0199999996;
					    u_xlat7.y = 0.0;
					    u_xlat1.zw = u_xlat7.xy + vs_TEXCOORD0.xy;
					    u_xlat1.xy = u_xlat0.xx * vec2(0.0189999994, -0.0189999994) + u_xlat1.zz;
					    u_xlat2.z = texture(_MainTex, u_xlat1.yw).z;
					    u_xlat2.x = texture(_MainTex, u_xlat1.xw).x;
					    u_xlat2.y = texture(_MainTex, u_xlat1.zw).y;
					    u_xlat0.x = (-u_xlat1.w) + 1.0;
					    u_xlat0.xy = u_xlat0.xx * u_xlat3.xy;
					    u_xlat1.xyz = (-u_xlat2.xyz) + u_xlat2.xxx;
					    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat0.xxx;
					    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
					    SV_Target0.xyz = u_xlat0.xyz;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					mediump float u_xlat16_3;
					vec2 u_xlat7;
					float u_xlat9;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.200000003;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001 + 0.899999976;
					    u_xlat16_3 = vs_TEXCOORD0.x + -0.5;
					    u_xlat0.x = u_xlat0.x * u_xlat16_3;
					    u_xlat0.x = abs(u_xlat0.x) * _Value;
					    u_xlat3.xyz = vec3(float(_Value3) * (-_TimeX), float(_Value2) * (-_TimeX), float(_Value2) * (-_TimeX));
					    u_xlat3.xyz = fract(u_xlat3.xyz);
					    u_xlat3.xyz = vs_TEXCOORD0.yyy * vec3(vec3(_Value, _Value, _Value)) + (-u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat3.xyz + vec3(-0.0500000007, -0.0500000007, -0.0500000007);
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
					    u_xlat1.x = u_xlat3.y * 10.0 + -0.5;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(10.0, 10.0, 100.0);
					    u_xlat1.x = u_xlat1.x * -4.0 + 2.0;
					    u_xlat9 = sin(u_xlat3.z);
					    u_xlat9 = u_xlat1.x * u_xlat9;
					    u_xlat7.x = u_xlat9 * 0.0199999996;
					    u_xlat7.y = 0.0;
					    u_xlat1.zw = u_xlat7.xy + vs_TEXCOORD0.xy;
					    u_xlat1.xy = u_xlat0.xx * vec2(0.0189999994, -0.0189999994) + u_xlat1.zz;
					    u_xlat2.z = texture(_MainTex, u_xlat1.yw).z;
					    u_xlat2.x = texture(_MainTex, u_xlat1.xw).x;
					    u_xlat2.y = texture(_MainTex, u_xlat1.zw).y;
					    u_xlat0.x = (-u_xlat1.w) + 1.0;
					    u_xlat0.xy = u_xlat0.xx * u_xlat3.xy;
					    u_xlat1.xyz = (-u_xlat2.xyz) + u_xlat2.xxx;
					    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat0.xxx;
					    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
					    SV_Target0.xyz = u_xlat0.xyz;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					mediump float u_xlat16_3;
					vec2 u_xlat7;
					float u_xlat9;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.200000003;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001 + 0.899999976;
					    u_xlat16_3 = vs_TEXCOORD0.x + -0.5;
					    u_xlat0.x = u_xlat0.x * u_xlat16_3;
					    u_xlat0.x = abs(u_xlat0.x) * _Value;
					    u_xlat3.xyz = vec3(float(_Value3) * (-_TimeX), float(_Value2) * (-_TimeX), float(_Value2) * (-_TimeX));
					    u_xlat3.xyz = fract(u_xlat3.xyz);
					    u_xlat3.xyz = vs_TEXCOORD0.yyy * vec3(vec3(_Value, _Value, _Value)) + (-u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat3.xyz + vec3(-0.0500000007, -0.0500000007, -0.0500000007);
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3.xyz = min(u_xlat3.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
					    u_xlat1.x = u_xlat3.y * 10.0 + -0.5;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(10.0, 10.0, 100.0);
					    u_xlat1.x = u_xlat1.x * -4.0 + 2.0;
					    u_xlat9 = sin(u_xlat3.z);
					    u_xlat9 = u_xlat1.x * u_xlat9;
					    u_xlat7.x = u_xlat9 * 0.0199999996;
					    u_xlat7.y = 0.0;
					    u_xlat1.zw = u_xlat7.xy + vs_TEXCOORD0.xy;
					    u_xlat1.xy = u_xlat0.xx * vec2(0.0189999994, -0.0189999994) + u_xlat1.zz;
					    u_xlat2.z = texture(_MainTex, u_xlat1.yw).z;
					    u_xlat2.x = texture(_MainTex, u_xlat1.xw).x;
					    u_xlat2.y = texture(_MainTex, u_xlat1.zw).y;
					    u_xlat0.x = (-u_xlat1.w) + 1.0;
					    u_xlat0.xy = u_xlat0.xx * u_xlat3.xy;
					    u_xlat1.xyz = (-u_xlat2.xyz) + u_xlat2.xxx;
					    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat0.xxx;
					    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
					    SV_Target0.xyz = u_xlat0.xyz;
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