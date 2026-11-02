Shader "CameraFilterPack/Sharpen_Sharpen" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Value ("Value", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 16523
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
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 uv_1;
					  uv_1 = xlv_TEXCOORD0;
					  highp vec4 c4_2;
					  highp vec4 c3_3;
					  highp vec4 c2_4;
					  highp vec4 c1_5;
					  highp vec4 c0_6;
					  highp float tmpvar_7;
					  tmpvar_7 = (1.0/(_ScreenResolution.x));
					  highp float tmpvar_8;
					  tmpvar_8 = (9.0 * _Value);
					  lowp vec4 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, uv_1);
					  c0_6 = tmpvar_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10.y = 0.0;
					  tmpvar_10.x = tmpvar_7;
					  lowp vec4 tmpvar_11;
					  highp vec2 P_12;
					  P_12 = (uv_1 - tmpvar_10);
					  tmpvar_11 = texture2D (_MainTex, P_12);
					  c1_5 = tmpvar_11;
					  highp vec2 tmpvar_13;
					  tmpvar_13.y = 0.0;
					  tmpvar_13.x = tmpvar_7;
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_1 + tmpvar_13);
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  c2_4 = tmpvar_14;
					  highp vec2 tmpvar_16;
					  tmpvar_16.x = 0.0;
					  tmpvar_16.y = tmpvar_7;
					  lowp vec4 tmpvar_17;
					  highp vec2 P_18;
					  P_18 = (uv_1 - tmpvar_16);
					  tmpvar_17 = texture2D (_MainTex, P_18);
					  c3_3 = tmpvar_17;
					  highp vec2 tmpvar_19;
					  tmpvar_19.x = 0.0;
					  tmpvar_19.y = tmpvar_7;
					  lowp vec4 tmpvar_20;
					  highp vec2 P_21;
					  P_21 = (uv_1 + tmpvar_19);
					  tmpvar_20 = texture2D (_MainTex, P_21);
					  c4_2 = tmpvar_20;
					  highp vec4 tmpvar_22;
					  tmpvar_22 = clamp (min (min (c0_6, c1_5), min (
					    min (c2_4, c3_3)
					  , c4_2)), ((
					    (tmpvar_8 + 1.0)
					   * c0_6) - (
					    (((c0_6 + c1_5) + ((c2_4 + c3_3) + c4_2)) * 0.2)
					   * tmpvar_8)), max (max (c0_6, c1_5), max (
					    max (c2_4, c3_3)
					  , c4_2)));
					  gl_FragData[0] = tmpvar_22;
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
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 uv_1;
					  uv_1 = xlv_TEXCOORD0;
					  highp vec4 c4_2;
					  highp vec4 c3_3;
					  highp vec4 c2_4;
					  highp vec4 c1_5;
					  highp vec4 c0_6;
					  highp float tmpvar_7;
					  tmpvar_7 = (1.0/(_ScreenResolution.x));
					  highp float tmpvar_8;
					  tmpvar_8 = (9.0 * _Value);
					  lowp vec4 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, uv_1);
					  c0_6 = tmpvar_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10.y = 0.0;
					  tmpvar_10.x = tmpvar_7;
					  lowp vec4 tmpvar_11;
					  highp vec2 P_12;
					  P_12 = (uv_1 - tmpvar_10);
					  tmpvar_11 = texture2D (_MainTex, P_12);
					  c1_5 = tmpvar_11;
					  highp vec2 tmpvar_13;
					  tmpvar_13.y = 0.0;
					  tmpvar_13.x = tmpvar_7;
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_1 + tmpvar_13);
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  c2_4 = tmpvar_14;
					  highp vec2 tmpvar_16;
					  tmpvar_16.x = 0.0;
					  tmpvar_16.y = tmpvar_7;
					  lowp vec4 tmpvar_17;
					  highp vec2 P_18;
					  P_18 = (uv_1 - tmpvar_16);
					  tmpvar_17 = texture2D (_MainTex, P_18);
					  c3_3 = tmpvar_17;
					  highp vec2 tmpvar_19;
					  tmpvar_19.x = 0.0;
					  tmpvar_19.y = tmpvar_7;
					  lowp vec4 tmpvar_20;
					  highp vec2 P_21;
					  P_21 = (uv_1 + tmpvar_19);
					  tmpvar_20 = texture2D (_MainTex, P_21);
					  c4_2 = tmpvar_20;
					  highp vec4 tmpvar_22;
					  tmpvar_22 = clamp (min (min (c0_6, c1_5), min (
					    min (c2_4, c3_3)
					  , c4_2)), ((
					    (tmpvar_8 + 1.0)
					   * c0_6) - (
					    (((c0_6 + c1_5) + ((c2_4 + c3_3) + c4_2)) * 0.2)
					   * tmpvar_8)), max (max (c0_6, c1_5), max (
					    max (c2_4, c3_3)
					  , c4_2)));
					  gl_FragData[0] = tmpvar_22;
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
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 uv_1;
					  uv_1 = xlv_TEXCOORD0;
					  highp vec4 c4_2;
					  highp vec4 c3_3;
					  highp vec4 c2_4;
					  highp vec4 c1_5;
					  highp vec4 c0_6;
					  highp float tmpvar_7;
					  tmpvar_7 = (1.0/(_ScreenResolution.x));
					  highp float tmpvar_8;
					  tmpvar_8 = (9.0 * _Value);
					  lowp vec4 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, uv_1);
					  c0_6 = tmpvar_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10.y = 0.0;
					  tmpvar_10.x = tmpvar_7;
					  lowp vec4 tmpvar_11;
					  highp vec2 P_12;
					  P_12 = (uv_1 - tmpvar_10);
					  tmpvar_11 = texture2D (_MainTex, P_12);
					  c1_5 = tmpvar_11;
					  highp vec2 tmpvar_13;
					  tmpvar_13.y = 0.0;
					  tmpvar_13.x = tmpvar_7;
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_1 + tmpvar_13);
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  c2_4 = tmpvar_14;
					  highp vec2 tmpvar_16;
					  tmpvar_16.x = 0.0;
					  tmpvar_16.y = tmpvar_7;
					  lowp vec4 tmpvar_17;
					  highp vec2 P_18;
					  P_18 = (uv_1 - tmpvar_16);
					  tmpvar_17 = texture2D (_MainTex, P_18);
					  c3_3 = tmpvar_17;
					  highp vec2 tmpvar_19;
					  tmpvar_19.x = 0.0;
					  tmpvar_19.y = tmpvar_7;
					  lowp vec4 tmpvar_20;
					  highp vec2 P_21;
					  P_21 = (uv_1 + tmpvar_19);
					  tmpvar_20 = texture2D (_MainTex, P_21);
					  c4_2 = tmpvar_20;
					  highp vec4 tmpvar_22;
					  tmpvar_22 = clamp (min (min (c0_6, c1_5), min (
					    min (c2_4, c3_3)
					  , c4_2)), ((
					    (tmpvar_8 + 1.0)
					   * c0_6) - (
					    (((c0_6 + c1_5) + ((c2_4 + c3_3) + c4_2)) * 0.2)
					   * tmpvar_8)), max (max (c0_6, c1_5), max (
					    max (c2_4, c3_3)
					  , c4_2)));
					  gl_FragData[0] = tmpvar_22;
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
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					mediump vec4 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					mediump vec4 u_xlat16_4;
					lowp vec4 u_xlat10_4;
					lowp vec4 u_xlat10_5;
					vec4 u_xlat6;
					mediump vec4 u_xlat16_6;
					float u_xlat7;
					void main()
					{
					    u_xlat0.x = _Value * 9.0 + 1.0;
					    u_xlat7 = _Value * 9.0;
					    u_xlat1.y = float(1.0) / _ScreenResolution.x;
					    u_xlat1.x = 0.0;
					    u_xlat2 = u_xlat1.yxxy + vs_TEXCOORD0.xyxy;
					    u_xlat1 = (-u_xlat1.yxxy) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat10_4 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat10_5 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_6 = u_xlat10_4 + u_xlat10_5;
					    u_xlat16_6 = u_xlat10_3 + u_xlat16_6;
					    u_xlat16_6 = u_xlat10_1 + u_xlat16_6;
					    u_xlat16_6 = u_xlat10_2 + u_xlat16_6;
					    u_xlat6 = vec4(u_xlat7) * u_xlat16_6;
					    u_xlat6 = u_xlat6 * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003);
					    u_xlat0 = u_xlat0.xxxx * u_xlat10_5 + (-u_xlat6);
					    u_xlat16_6 = min(u_xlat10_4, u_xlat10_5);
					    u_xlat16_4 = max(u_xlat10_4, u_xlat10_5);
					    u_xlat16_4 = max(u_xlat10_3, u_xlat16_4);
					    u_xlat16_3 = min(u_xlat10_3, u_xlat16_6);
					    u_xlat16_3 = min(u_xlat10_1, u_xlat16_3);
					    u_xlat16_1 = max(u_xlat10_1, u_xlat16_4);
					    u_xlat16_1 = max(u_xlat10_2, u_xlat16_1);
					    u_xlat16_2 = min(u_xlat10_2, u_xlat16_3);
					    u_xlat0 = max(u_xlat0, u_xlat16_2);
					    SV_Target0 = min(u_xlat16_1, u_xlat0);
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
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					mediump vec4 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					mediump vec4 u_xlat16_4;
					lowp vec4 u_xlat10_4;
					lowp vec4 u_xlat10_5;
					vec4 u_xlat6;
					mediump vec4 u_xlat16_6;
					float u_xlat7;
					void main()
					{
					    u_xlat0.x = _Value * 9.0 + 1.0;
					    u_xlat7 = _Value * 9.0;
					    u_xlat1.y = float(1.0) / _ScreenResolution.x;
					    u_xlat1.x = 0.0;
					    u_xlat2 = u_xlat1.yxxy + vs_TEXCOORD0.xyxy;
					    u_xlat1 = (-u_xlat1.yxxy) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat10_4 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat10_5 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_6 = u_xlat10_4 + u_xlat10_5;
					    u_xlat16_6 = u_xlat10_3 + u_xlat16_6;
					    u_xlat16_6 = u_xlat10_1 + u_xlat16_6;
					    u_xlat16_6 = u_xlat10_2 + u_xlat16_6;
					    u_xlat6 = vec4(u_xlat7) * u_xlat16_6;
					    u_xlat6 = u_xlat6 * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003);
					    u_xlat0 = u_xlat0.xxxx * u_xlat10_5 + (-u_xlat6);
					    u_xlat16_6 = min(u_xlat10_4, u_xlat10_5);
					    u_xlat16_4 = max(u_xlat10_4, u_xlat10_5);
					    u_xlat16_4 = max(u_xlat10_3, u_xlat16_4);
					    u_xlat16_3 = min(u_xlat10_3, u_xlat16_6);
					    u_xlat16_3 = min(u_xlat10_1, u_xlat16_3);
					    u_xlat16_1 = max(u_xlat10_1, u_xlat16_4);
					    u_xlat16_1 = max(u_xlat10_2, u_xlat16_1);
					    u_xlat16_2 = min(u_xlat10_2, u_xlat16_3);
					    u_xlat0 = max(u_xlat0, u_xlat16_2);
					    SV_Target0 = min(u_xlat16_1, u_xlat0);
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
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					mediump vec4 u_xlat16_2;
					lowp vec4 u_xlat10_2;
					mediump vec4 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					mediump vec4 u_xlat16_4;
					lowp vec4 u_xlat10_4;
					lowp vec4 u_xlat10_5;
					vec4 u_xlat6;
					mediump vec4 u_xlat16_6;
					float u_xlat7;
					void main()
					{
					    u_xlat0.x = _Value * 9.0 + 1.0;
					    u_xlat7 = _Value * 9.0;
					    u_xlat1.y = float(1.0) / _ScreenResolution.x;
					    u_xlat1.x = 0.0;
					    u_xlat2 = u_xlat1.yxxy + vs_TEXCOORD0.xyxy;
					    u_xlat1 = (-u_xlat1.yxxy) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat10_4 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat10_5 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_6 = u_xlat10_4 + u_xlat10_5;
					    u_xlat16_6 = u_xlat10_3 + u_xlat16_6;
					    u_xlat16_6 = u_xlat10_1 + u_xlat16_6;
					    u_xlat16_6 = u_xlat10_2 + u_xlat16_6;
					    u_xlat6 = vec4(u_xlat7) * u_xlat16_6;
					    u_xlat6 = u_xlat6 * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003);
					    u_xlat0 = u_xlat0.xxxx * u_xlat10_5 + (-u_xlat6);
					    u_xlat16_6 = min(u_xlat10_4, u_xlat10_5);
					    u_xlat16_4 = max(u_xlat10_4, u_xlat10_5);
					    u_xlat16_4 = max(u_xlat10_3, u_xlat16_4);
					    u_xlat16_3 = min(u_xlat10_3, u_xlat16_6);
					    u_xlat16_3 = min(u_xlat10_1, u_xlat16_3);
					    u_xlat16_1 = max(u_xlat10_1, u_xlat16_4);
					    u_xlat16_1 = max(u_xlat10_2, u_xlat16_1);
					    u_xlat16_2 = min(u_xlat10_2, u_xlat16_3);
					    u_xlat0 = max(u_xlat0, u_xlat16_2);
					    SV_Target0 = min(u_xlat16_1, u_xlat0);
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