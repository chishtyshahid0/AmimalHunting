Shader "CameraFilterPack/FX_Drunk2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 2074
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tU_1;
					  highp vec4 tD_2;
					  highp vec4 tR_3;
					  highp vec4 tl_4;
					  highp vec4 tc_5;
					  highp vec2 uv_6;
					  uv_6 = xlv_TEXCOORD0;
					  highp float tmpvar_7;
					  tmpvar_7 = (sin(_TimeX) * 0.05);
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, uv_6);
					  tc_5 = tmpvar_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 0.0;
					  tmpvar_9.x = sin(tmpvar_7);
					  lowp vec4 tmpvar_10;
					  highp vec2 P_11;
					  P_11 = (uv_6 - tmpvar_9);
					  tmpvar_10 = texture2D (_MainTex, P_11);
					  tl_4 = tmpvar_10;
					  highp vec2 tmpvar_12;
					  tmpvar_12.y = 0.0;
					  tmpvar_12.x = sin(tmpvar_7);
					  lowp vec4 tmpvar_13;
					  highp vec2 P_14;
					  P_14 = (uv_6 + tmpvar_12);
					  tmpvar_13 = texture2D (_MainTex, P_14);
					  tR_3 = tmpvar_13;
					  highp vec2 tmpvar_15;
					  tmpvar_15.x = 0.0;
					  tmpvar_15.y = sin(tmpvar_7);
					  lowp vec4 tmpvar_16;
					  highp vec2 P_17;
					  P_17 = (uv_6 - tmpvar_15);
					  tmpvar_16 = texture2D (_MainTex, P_17);
					  tD_2 = tmpvar_16;
					  highp vec2 tmpvar_18;
					  tmpvar_18.x = 0.0;
					  tmpvar_18.y = sin(tmpvar_7);
					  lowp vec4 tmpvar_19;
					  highp vec2 P_20;
					  P_20 = (uv_6 + tmpvar_18);
					  tmpvar_19 = texture2D (_MainTex, P_20);
					  tU_1 = tmpvar_19;
					  highp vec4 tmpvar_21;
					  tmpvar_21 = (((tc_5 + tl_4) + (
					    (tR_3 + tD_2)
					   + tU_1)) / 5.0);
					  gl_FragData[0] = tmpvar_21;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tU_1;
					  highp vec4 tD_2;
					  highp vec4 tR_3;
					  highp vec4 tl_4;
					  highp vec4 tc_5;
					  highp vec2 uv_6;
					  uv_6 = xlv_TEXCOORD0;
					  highp float tmpvar_7;
					  tmpvar_7 = (sin(_TimeX) * 0.05);
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, uv_6);
					  tc_5 = tmpvar_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 0.0;
					  tmpvar_9.x = sin(tmpvar_7);
					  lowp vec4 tmpvar_10;
					  highp vec2 P_11;
					  P_11 = (uv_6 - tmpvar_9);
					  tmpvar_10 = texture2D (_MainTex, P_11);
					  tl_4 = tmpvar_10;
					  highp vec2 tmpvar_12;
					  tmpvar_12.y = 0.0;
					  tmpvar_12.x = sin(tmpvar_7);
					  lowp vec4 tmpvar_13;
					  highp vec2 P_14;
					  P_14 = (uv_6 + tmpvar_12);
					  tmpvar_13 = texture2D (_MainTex, P_14);
					  tR_3 = tmpvar_13;
					  highp vec2 tmpvar_15;
					  tmpvar_15.x = 0.0;
					  tmpvar_15.y = sin(tmpvar_7);
					  lowp vec4 tmpvar_16;
					  highp vec2 P_17;
					  P_17 = (uv_6 - tmpvar_15);
					  tmpvar_16 = texture2D (_MainTex, P_17);
					  tD_2 = tmpvar_16;
					  highp vec2 tmpvar_18;
					  tmpvar_18.x = 0.0;
					  tmpvar_18.y = sin(tmpvar_7);
					  lowp vec4 tmpvar_19;
					  highp vec2 P_20;
					  P_20 = (uv_6 + tmpvar_18);
					  tmpvar_19 = texture2D (_MainTex, P_20);
					  tU_1 = tmpvar_19;
					  highp vec4 tmpvar_21;
					  tmpvar_21 = (((tc_5 + tl_4) + (
					    (tR_3 + tD_2)
					   + tU_1)) / 5.0);
					  gl_FragData[0] = tmpvar_21;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tU_1;
					  highp vec4 tD_2;
					  highp vec4 tR_3;
					  highp vec4 tl_4;
					  highp vec4 tc_5;
					  highp vec2 uv_6;
					  uv_6 = xlv_TEXCOORD0;
					  highp float tmpvar_7;
					  tmpvar_7 = (sin(_TimeX) * 0.05);
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, uv_6);
					  tc_5 = tmpvar_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 0.0;
					  tmpvar_9.x = sin(tmpvar_7);
					  lowp vec4 tmpvar_10;
					  highp vec2 P_11;
					  P_11 = (uv_6 - tmpvar_9);
					  tmpvar_10 = texture2D (_MainTex, P_11);
					  tl_4 = tmpvar_10;
					  highp vec2 tmpvar_12;
					  tmpvar_12.y = 0.0;
					  tmpvar_12.x = sin(tmpvar_7);
					  lowp vec4 tmpvar_13;
					  highp vec2 P_14;
					  P_14 = (uv_6 + tmpvar_12);
					  tmpvar_13 = texture2D (_MainTex, P_14);
					  tR_3 = tmpvar_13;
					  highp vec2 tmpvar_15;
					  tmpvar_15.x = 0.0;
					  tmpvar_15.y = sin(tmpvar_7);
					  lowp vec4 tmpvar_16;
					  highp vec2 P_17;
					  P_17 = (uv_6 - tmpvar_15);
					  tmpvar_16 = texture2D (_MainTex, P_17);
					  tD_2 = tmpvar_16;
					  highp vec2 tmpvar_18;
					  tmpvar_18.x = 0.0;
					  tmpvar_18.y = sin(tmpvar_7);
					  lowp vec4 tmpvar_19;
					  highp vec2 P_20;
					  P_20 = (uv_6 + tmpvar_18);
					  tmpvar_19 = texture2D (_MainTex, P_20);
					  tU_1 = tmpvar_19;
					  highp vec4 tmpvar_21;
					  tmpvar_21 = (((tc_5 + tl_4) + (
					    (tR_3 + tD_2)
					   + tU_1)) / 5.0);
					  gl_FragData[0] = tmpvar_21;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					lowp vec4 u_xlat10_3;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.x = sin(_TimeX);
					    u_xlat1.x = u_xlat1.x * 0.0500000007;
					    u_xlat1.y = sin(u_xlat1.x);
					    u_xlat1.x = 0.0;
					    u_xlat2 = (-u_xlat1.yxxy) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = u_xlat1.yxxy + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_3;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_3;
					    u_xlat16_0 = u_xlat10_2 + u_xlat16_0;
					    u_xlat16_0 = u_xlat10_1 + u_xlat16_0;
					    SV_Target0 = u_xlat16_0 * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003);
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					lowp vec4 u_xlat10_3;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.x = sin(_TimeX);
					    u_xlat1.x = u_xlat1.x * 0.0500000007;
					    u_xlat1.y = sin(u_xlat1.x);
					    u_xlat1.x = 0.0;
					    u_xlat2 = (-u_xlat1.yxxy) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = u_xlat1.yxxy + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_3;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_3;
					    u_xlat16_0 = u_xlat10_2 + u_xlat16_0;
					    u_xlat16_0 = u_xlat10_1 + u_xlat16_0;
					    SV_Target0 = u_xlat16_0 * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003);
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					lowp vec4 u_xlat10_3;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.x = sin(_TimeX);
					    u_xlat1.x = u_xlat1.x * 0.0500000007;
					    u_xlat1.y = sin(u_xlat1.x);
					    u_xlat1.x = 0.0;
					    u_xlat2 = (-u_xlat1.yxxy) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = u_xlat1.yxxy + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_3;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_3;
					    u_xlat16_0 = u_xlat10_2 + u_xlat16_0;
					    u_xlat16_0 = u_xlat10_1 + u_xlat16_0;
					    SV_Target0 = u_xlat16_0 * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003);
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