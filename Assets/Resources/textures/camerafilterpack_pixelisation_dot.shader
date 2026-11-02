Shader "CameraFilterPack/Pixelisation_Dot" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 6514
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
					uniform highp float _Value;
					uniform highp float _Value2;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 color_1;
					  highp vec3 texColor_2;
					  highp vec2 q_3;
					  highp vec3 tmpvar_4;
					  tmpvar_4.x = _Value2;
					  tmpvar_4.y = _Value2;
					  tmpvar_4.z = _Value2;
					  q_3 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (floor((xlv_TEXCOORD0 / _Value)) * _Value);
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, tmpvar_5).xyz;
					  texColor_2 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (texColor_2 - vec3(0.0, 1.0, 0.0));
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((pow (
					    sqrt(dot (tmpvar_7, tmpvar_7))
					  , 8.0) / 1.5), 0.0, 1.0);
					  highp vec3 tmpvar_9;
					  tmpvar_9 = mix (vec3(_Value2), texColor_2, vec3((tmpvar_8 * (tmpvar_8 * 
					    (3.0 - (2.0 * tmpvar_8))
					  ))));
					  texColor_2 = tmpvar_9;
					  highp float tmpvar_10;
					  tmpvar_10 = dot (vec3(0.2126, 0.7152, 0.0722), tmpvar_9);
					  color_1 = tmpvar_4;
					  highp vec2 tmpvar_11;
					  tmpvar_11 = ((q_3 - tmpvar_5) / vec2(_Value));
					  highp float tmpvar_12;
					  tmpvar_12 = ((tmpvar_10 * tmpvar_10) * 16.0);
					  highp float tmpvar_13;
					  tmpvar_13 = (pow (abs(
					    (tmpvar_11.x - 0.5)
					  ), tmpvar_12) + pow (abs(
					    (tmpvar_11.y - 0.5)
					  ), tmpvar_12));
					  highp float tmpvar_14;
					  tmpvar_14 = pow (0.5, tmpvar_12);
					  if ((tmpvar_13 < tmpvar_14)) {
					    color_1 = tmpvar_9;
					  };
					  highp vec4 tmpvar_15;
					  tmpvar_15.w = 1.0;
					  tmpvar_15.xyz = color_1;
					  gl_FragData[0] = tmpvar_15;
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
					uniform highp float _Value;
					uniform highp float _Value2;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 color_1;
					  highp vec3 texColor_2;
					  highp vec2 q_3;
					  highp vec3 tmpvar_4;
					  tmpvar_4.x = _Value2;
					  tmpvar_4.y = _Value2;
					  tmpvar_4.z = _Value2;
					  q_3 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (floor((xlv_TEXCOORD0 / _Value)) * _Value);
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, tmpvar_5).xyz;
					  texColor_2 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (texColor_2 - vec3(0.0, 1.0, 0.0));
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((pow (
					    sqrt(dot (tmpvar_7, tmpvar_7))
					  , 8.0) / 1.5), 0.0, 1.0);
					  highp vec3 tmpvar_9;
					  tmpvar_9 = mix (vec3(_Value2), texColor_2, vec3((tmpvar_8 * (tmpvar_8 * 
					    (3.0 - (2.0 * tmpvar_8))
					  ))));
					  texColor_2 = tmpvar_9;
					  highp float tmpvar_10;
					  tmpvar_10 = dot (vec3(0.2126, 0.7152, 0.0722), tmpvar_9);
					  color_1 = tmpvar_4;
					  highp vec2 tmpvar_11;
					  tmpvar_11 = ((q_3 - tmpvar_5) / vec2(_Value));
					  highp float tmpvar_12;
					  tmpvar_12 = ((tmpvar_10 * tmpvar_10) * 16.0);
					  highp float tmpvar_13;
					  tmpvar_13 = (pow (abs(
					    (tmpvar_11.x - 0.5)
					  ), tmpvar_12) + pow (abs(
					    (tmpvar_11.y - 0.5)
					  ), tmpvar_12));
					  highp float tmpvar_14;
					  tmpvar_14 = pow (0.5, tmpvar_12);
					  if ((tmpvar_13 < tmpvar_14)) {
					    color_1 = tmpvar_9;
					  };
					  highp vec4 tmpvar_15;
					  tmpvar_15.w = 1.0;
					  tmpvar_15.xyz = color_1;
					  gl_FragData[0] = tmpvar_15;
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
					uniform highp float _Value;
					uniform highp float _Value2;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 color_1;
					  highp vec3 texColor_2;
					  highp vec2 q_3;
					  highp vec3 tmpvar_4;
					  tmpvar_4.x = _Value2;
					  tmpvar_4.y = _Value2;
					  tmpvar_4.z = _Value2;
					  q_3 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_5;
					  tmpvar_5 = (floor((xlv_TEXCOORD0 / _Value)) * _Value);
					  lowp vec3 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, tmpvar_5).xyz;
					  texColor_2 = tmpvar_6;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = (texColor_2 - vec3(0.0, 1.0, 0.0));
					  highp float tmpvar_8;
					  tmpvar_8 = clamp ((pow (
					    sqrt(dot (tmpvar_7, tmpvar_7))
					  , 8.0) / 1.5), 0.0, 1.0);
					  highp vec3 tmpvar_9;
					  tmpvar_9 = mix (vec3(_Value2), texColor_2, vec3((tmpvar_8 * (tmpvar_8 * 
					    (3.0 - (2.0 * tmpvar_8))
					  ))));
					  texColor_2 = tmpvar_9;
					  highp float tmpvar_10;
					  tmpvar_10 = dot (vec3(0.2126, 0.7152, 0.0722), tmpvar_9);
					  color_1 = tmpvar_4;
					  highp vec2 tmpvar_11;
					  tmpvar_11 = ((q_3 - tmpvar_5) / vec2(_Value));
					  highp float tmpvar_12;
					  tmpvar_12 = ((tmpvar_10 * tmpvar_10) * 16.0);
					  highp float tmpvar_13;
					  tmpvar_13 = (pow (abs(
					    (tmpvar_11.x - 0.5)
					  ), tmpvar_12) + pow (abs(
					    (tmpvar_11.y - 0.5)
					  ), tmpvar_12));
					  highp float tmpvar_14;
					  tmpvar_14 = pow (0.5, tmpvar_12);
					  if ((tmpvar_13 < tmpvar_14)) {
					    color_1 = tmpvar_9;
					  };
					  highp vec4 tmpvar_15;
					  tmpvar_15.w = 1.0;
					  tmpvar_15.xyz = color_1;
					  gl_FragData[0] = tmpvar_15;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec2 u_xlat6;
					mediump float u_xlat16_6;
					mediump float u_xlat16_9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy / vec2(vec2(_Value, _Value));
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat6.xy = u_xlat0.xy * vec2(vec2(_Value, _Value));
					    u_xlat0.xy = (-u_xlat0.xy) * vec2(vec2(_Value, _Value)) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(_Value, _Value));
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xy = log2(abs(u_xlat0.xy));
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat6.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-0.0, -1.0, -0.0);
					    u_xlat1.xyz = u_xlat10_1.xyz + (-vec3(vec3(_Value2, _Value2, _Value2)));
					    u_xlat16_6 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
					    u_xlat16_6 = u_xlat16_6 * 0.666666687;
					    u_xlat16_6 = min(u_xlat16_6, 1.0);
					    u_xlat16_9 = u_xlat16_6 * -2.0 + 3.0;
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_9;
					    u_xlat1.xyz = vec3(u_xlat16_6) * u_xlat1.xyz + vec3(vec3(_Value2, _Value2, _Value2));
					    u_xlat6.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat1.xyz);
					    u_xlat6.x = u_xlat6.x * u_xlat6.x;
					    u_xlat6.xy = u_xlat6.xx * vec2(16.0, -16.0);
					    u_xlat0.xy = u_xlat0.xy * u_xlat6.xx;
					    u_xlat6.x = exp2(u_xlat6.y);
					    u_xlat0.xy = exp2(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat0.x<u_xlat6.x);
					#else
					    u_xlatb0 = u_xlat0.x<u_xlat6.x;
					#endif
					    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : vec3(vec4(_Value2, _Value2, _Value2, _Value2));
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec2 u_xlat6;
					mediump float u_xlat16_6;
					mediump float u_xlat16_9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy / vec2(vec2(_Value, _Value));
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat6.xy = u_xlat0.xy * vec2(vec2(_Value, _Value));
					    u_xlat0.xy = (-u_xlat0.xy) * vec2(vec2(_Value, _Value)) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(_Value, _Value));
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xy = log2(abs(u_xlat0.xy));
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat6.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-0.0, -1.0, -0.0);
					    u_xlat1.xyz = u_xlat10_1.xyz + (-vec3(vec3(_Value2, _Value2, _Value2)));
					    u_xlat16_6 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
					    u_xlat16_6 = u_xlat16_6 * 0.666666687;
					    u_xlat16_6 = min(u_xlat16_6, 1.0);
					    u_xlat16_9 = u_xlat16_6 * -2.0 + 3.0;
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_9;
					    u_xlat1.xyz = vec3(u_xlat16_6) * u_xlat1.xyz + vec3(vec3(_Value2, _Value2, _Value2));
					    u_xlat6.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat1.xyz);
					    u_xlat6.x = u_xlat6.x * u_xlat6.x;
					    u_xlat6.xy = u_xlat6.xx * vec2(16.0, -16.0);
					    u_xlat0.xy = u_xlat0.xy * u_xlat6.xx;
					    u_xlat6.x = exp2(u_xlat6.y);
					    u_xlat0.xy = exp2(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat0.x<u_xlat6.x);
					#else
					    u_xlatb0 = u_xlat0.x<u_xlat6.x;
					#endif
					    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : vec3(vec4(_Value2, _Value2, _Value2, _Value2));
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					vec2 u_xlat6;
					mediump float u_xlat16_6;
					mediump float u_xlat16_9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy / vec2(vec2(_Value, _Value));
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat6.xy = u_xlat0.xy * vec2(vec2(_Value, _Value));
					    u_xlat0.xy = (-u_xlat0.xy) * vec2(vec2(_Value, _Value)) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(_Value, _Value));
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xy = log2(abs(u_xlat0.xy));
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat6.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-0.0, -1.0, -0.0);
					    u_xlat1.xyz = u_xlat10_1.xyz + (-vec3(vec3(_Value2, _Value2, _Value2)));
					    u_xlat16_6 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
					    u_xlat16_6 = u_xlat16_6 * 0.666666687;
					    u_xlat16_6 = min(u_xlat16_6, 1.0);
					    u_xlat16_9 = u_xlat16_6 * -2.0 + 3.0;
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_9;
					    u_xlat1.xyz = vec3(u_xlat16_6) * u_xlat1.xyz + vec3(vec3(_Value2, _Value2, _Value2));
					    u_xlat6.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat1.xyz);
					    u_xlat6.x = u_xlat6.x * u_xlat6.x;
					    u_xlat6.xy = u_xlat6.xx * vec2(16.0, -16.0);
					    u_xlat0.xy = u_xlat0.xy * u_xlat6.xx;
					    u_xlat6.x = exp2(u_xlat6.y);
					    u_xlat0.xy = exp2(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat0.x<u_xlat6.x);
					#else
					    u_xlatb0 = u_xlat0.x<u_xlat6.x;
					#endif
					    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : vec3(vec4(_Value2, _Value2, _Value2, _Value2));
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