Shader "CameraFilterPack/Blur_Radial" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 63666
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
					uniform highp float _Value3;
					highp float xlat_mutable_Value;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float scale_1;
					  highp vec4 color_2;
					  highp vec2 uv_3;
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = _Value2;
					  tmpvar_4.y = _Value3;
					  uv_3 = xlv_TEXCOORD0;
					  uv_3 = (uv_3 - tmpvar_4);
					  xlat_mutable_Value = (_Value * 0.075);
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = (uv_3 + tmpvar_4);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  color_2 = tmpvar_5;
					  scale_1 = (1.0 + xlat_mutable_Value);
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_7 = texture2D (_MainTex, P_8);
					  color_2 = (color_2 + tmpvar_7);
					  scale_1 = (1.0 + (2.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_9;
					  highp vec2 P_10;
					  P_10 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_9 = texture2D (_MainTex, P_10);
					  color_2 = (color_2 + tmpvar_9);
					  scale_1 = (1.0 + (3.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_11;
					  highp vec2 P_12;
					  P_12 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_11 = texture2D (_MainTex, P_12);
					  color_2 = (color_2 + tmpvar_11);
					  scale_1 = (1.0 + (4.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_13;
					  highp vec2 P_14;
					  P_14 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_13 = texture2D (_MainTex, P_14);
					  color_2 = (color_2 + tmpvar_13);
					  scale_1 = (1.0 + (5.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_15;
					  highp vec2 P_16;
					  P_16 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_15 = texture2D (_MainTex, P_16);
					  color_2 = (color_2 + tmpvar_15);
					  scale_1 = (1.0 + (6.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_17;
					  highp vec2 P_18;
					  P_18 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_17 = texture2D (_MainTex, P_18);
					  color_2 = (color_2 + tmpvar_17);
					  scale_1 = (1.0 + (7.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_19;
					  highp vec2 P_20;
					  P_20 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_19 = texture2D (_MainTex, P_20);
					  color_2 = (color_2 + tmpvar_19);
					  scale_1 = (1.0 + (8.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_21;
					  highp vec2 P_22;
					  P_22 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_21 = texture2D (_MainTex, P_22);
					  color_2 = (color_2 + tmpvar_21);
					  scale_1 = (1.0 + (9.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_23;
					  highp vec2 P_24;
					  P_24 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_23 = texture2D (_MainTex, P_24);
					  color_2 = (color_2 + tmpvar_23);
					  scale_1 = (1.0 + (10.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_25;
					  highp vec2 P_26;
					  P_26 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_25 = texture2D (_MainTex, P_26);
					  color_2 = (color_2 + tmpvar_25);
					  scale_1 = (1.0 + (11.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_27;
					  highp vec2 P_28;
					  P_28 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_27 = texture2D (_MainTex, P_28);
					  color_2 = (color_2 + tmpvar_27);
					  scale_1 = (1.0 + (12.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_29;
					  highp vec2 P_30;
					  P_30 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_29 = texture2D (_MainTex, P_30);
					  color_2 = (color_2 + tmpvar_29);
					  scale_1 = (1.0 + (13.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_31;
					  highp vec2 P_32;
					  P_32 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_31 = texture2D (_MainTex, P_32);
					  color_2 = (color_2 + tmpvar_31);
					  scale_1 = (1.0 + (14.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_33;
					  highp vec2 P_34;
					  P_34 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_33 = texture2D (_MainTex, P_34);
					  color_2 = (color_2 + tmpvar_33);
					  scale_1 = (1.0 + (15.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_35;
					  highp vec2 P_36;
					  P_36 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_35 = texture2D (_MainTex, P_36);
					  color_2 = (color_2 + tmpvar_35);
					  color_2 = (color_2 / 16.0);
					  gl_FragData[0] = color_2;
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
					uniform highp float _Value3;
					highp float xlat_mutable_Value;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float scale_1;
					  highp vec4 color_2;
					  highp vec2 uv_3;
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = _Value2;
					  tmpvar_4.y = _Value3;
					  uv_3 = xlv_TEXCOORD0;
					  uv_3 = (uv_3 - tmpvar_4);
					  xlat_mutable_Value = (_Value * 0.075);
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = (uv_3 + tmpvar_4);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  color_2 = tmpvar_5;
					  scale_1 = (1.0 + xlat_mutable_Value);
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_7 = texture2D (_MainTex, P_8);
					  color_2 = (color_2 + tmpvar_7);
					  scale_1 = (1.0 + (2.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_9;
					  highp vec2 P_10;
					  P_10 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_9 = texture2D (_MainTex, P_10);
					  color_2 = (color_2 + tmpvar_9);
					  scale_1 = (1.0 + (3.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_11;
					  highp vec2 P_12;
					  P_12 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_11 = texture2D (_MainTex, P_12);
					  color_2 = (color_2 + tmpvar_11);
					  scale_1 = (1.0 + (4.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_13;
					  highp vec2 P_14;
					  P_14 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_13 = texture2D (_MainTex, P_14);
					  color_2 = (color_2 + tmpvar_13);
					  scale_1 = (1.0 + (5.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_15;
					  highp vec2 P_16;
					  P_16 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_15 = texture2D (_MainTex, P_16);
					  color_2 = (color_2 + tmpvar_15);
					  scale_1 = (1.0 + (6.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_17;
					  highp vec2 P_18;
					  P_18 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_17 = texture2D (_MainTex, P_18);
					  color_2 = (color_2 + tmpvar_17);
					  scale_1 = (1.0 + (7.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_19;
					  highp vec2 P_20;
					  P_20 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_19 = texture2D (_MainTex, P_20);
					  color_2 = (color_2 + tmpvar_19);
					  scale_1 = (1.0 + (8.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_21;
					  highp vec2 P_22;
					  P_22 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_21 = texture2D (_MainTex, P_22);
					  color_2 = (color_2 + tmpvar_21);
					  scale_1 = (1.0 + (9.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_23;
					  highp vec2 P_24;
					  P_24 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_23 = texture2D (_MainTex, P_24);
					  color_2 = (color_2 + tmpvar_23);
					  scale_1 = (1.0 + (10.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_25;
					  highp vec2 P_26;
					  P_26 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_25 = texture2D (_MainTex, P_26);
					  color_2 = (color_2 + tmpvar_25);
					  scale_1 = (1.0 + (11.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_27;
					  highp vec2 P_28;
					  P_28 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_27 = texture2D (_MainTex, P_28);
					  color_2 = (color_2 + tmpvar_27);
					  scale_1 = (1.0 + (12.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_29;
					  highp vec2 P_30;
					  P_30 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_29 = texture2D (_MainTex, P_30);
					  color_2 = (color_2 + tmpvar_29);
					  scale_1 = (1.0 + (13.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_31;
					  highp vec2 P_32;
					  P_32 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_31 = texture2D (_MainTex, P_32);
					  color_2 = (color_2 + tmpvar_31);
					  scale_1 = (1.0 + (14.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_33;
					  highp vec2 P_34;
					  P_34 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_33 = texture2D (_MainTex, P_34);
					  color_2 = (color_2 + tmpvar_33);
					  scale_1 = (1.0 + (15.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_35;
					  highp vec2 P_36;
					  P_36 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_35 = texture2D (_MainTex, P_36);
					  color_2 = (color_2 + tmpvar_35);
					  color_2 = (color_2 / 16.0);
					  gl_FragData[0] = color_2;
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
					uniform highp float _Value3;
					highp float xlat_mutable_Value;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float scale_1;
					  highp vec4 color_2;
					  highp vec2 uv_3;
					  highp vec2 tmpvar_4;
					  tmpvar_4.x = _Value2;
					  tmpvar_4.y = _Value3;
					  uv_3 = xlv_TEXCOORD0;
					  uv_3 = (uv_3 - tmpvar_4);
					  xlat_mutable_Value = (_Value * 0.075);
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = (uv_3 + tmpvar_4);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  color_2 = tmpvar_5;
					  scale_1 = (1.0 + xlat_mutable_Value);
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_7 = texture2D (_MainTex, P_8);
					  color_2 = (color_2 + tmpvar_7);
					  scale_1 = (1.0 + (2.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_9;
					  highp vec2 P_10;
					  P_10 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_9 = texture2D (_MainTex, P_10);
					  color_2 = (color_2 + tmpvar_9);
					  scale_1 = (1.0 + (3.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_11;
					  highp vec2 P_12;
					  P_12 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_11 = texture2D (_MainTex, P_12);
					  color_2 = (color_2 + tmpvar_11);
					  scale_1 = (1.0 + (4.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_13;
					  highp vec2 P_14;
					  P_14 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_13 = texture2D (_MainTex, P_14);
					  color_2 = (color_2 + tmpvar_13);
					  scale_1 = (1.0 + (5.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_15;
					  highp vec2 P_16;
					  P_16 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_15 = texture2D (_MainTex, P_16);
					  color_2 = (color_2 + tmpvar_15);
					  scale_1 = (1.0 + (6.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_17;
					  highp vec2 P_18;
					  P_18 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_17 = texture2D (_MainTex, P_18);
					  color_2 = (color_2 + tmpvar_17);
					  scale_1 = (1.0 + (7.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_19;
					  highp vec2 P_20;
					  P_20 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_19 = texture2D (_MainTex, P_20);
					  color_2 = (color_2 + tmpvar_19);
					  scale_1 = (1.0 + (8.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_21;
					  highp vec2 P_22;
					  P_22 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_21 = texture2D (_MainTex, P_22);
					  color_2 = (color_2 + tmpvar_21);
					  scale_1 = (1.0 + (9.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_23;
					  highp vec2 P_24;
					  P_24 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_23 = texture2D (_MainTex, P_24);
					  color_2 = (color_2 + tmpvar_23);
					  scale_1 = (1.0 + (10.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_25;
					  highp vec2 P_26;
					  P_26 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_25 = texture2D (_MainTex, P_26);
					  color_2 = (color_2 + tmpvar_25);
					  scale_1 = (1.0 + (11.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_27;
					  highp vec2 P_28;
					  P_28 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_27 = texture2D (_MainTex, P_28);
					  color_2 = (color_2 + tmpvar_27);
					  scale_1 = (1.0 + (12.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_29;
					  highp vec2 P_30;
					  P_30 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_29 = texture2D (_MainTex, P_30);
					  color_2 = (color_2 + tmpvar_29);
					  scale_1 = (1.0 + (13.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_31;
					  highp vec2 P_32;
					  P_32 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_31 = texture2D (_MainTex, P_32);
					  color_2 = (color_2 + tmpvar_31);
					  scale_1 = (1.0 + (14.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_33;
					  highp vec2 P_34;
					  P_34 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_33 = texture2D (_MainTex, P_34);
					  color_2 = (color_2 + tmpvar_33);
					  scale_1 = (1.0 + (15.0 * xlat_mutable_Value));
					  lowp vec4 tmpvar_35;
					  highp vec2 P_36;
					  P_36 = ((uv_3 * scale_1) + tmpvar_4);
					  tmpvar_35 = texture2D (_MainTex, P_36);
					  color_2 = (color_2 + tmpvar_35);
					  color_2 = (color_2 / 16.0);
					  gl_FragData[0] = color_2;
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
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					lowp vec4 u_xlat10_2;
					vec4 u_xlat3;
					lowp vec4 u_xlat10_3;
					lowp vec4 u_xlat10_4;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = vec4(vec4(_Value, _Value, _Value, _Value)) * vec4(0.075000003, 0.150000006, 0.225000009, 0.300000012) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2.xy = vec2(vs_TEXCOORD0.x + (-float(_Value2)), vs_TEXCOORD0.y + (-float(_Value3)));
					    u_xlat3 = u_xlat2.xyxy * u_xlat1.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat1 = u_xlat2.xyxy * u_xlat1.zzww + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_4;
					    u_xlat16_0 = u_xlat10_3 + u_xlat16_0;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_3;
					    u_xlat16_0 = u_xlat10_1 + u_xlat16_0;
					    u_xlat1 = vec4(vec4(_Value, _Value, _Value, _Value)) * vec4(0.375, 0.450000018, 0.525000036, 0.600000024) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat2.xyxy * u_xlat1.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat1 = u_xlat2.xyxy * u_xlat1.zzww + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_4;
					    u_xlat16_0 = u_xlat10_3 + u_xlat16_0;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_3;
					    u_xlat16_0 = u_xlat10_1 + u_xlat16_0;
					    u_xlat1 = vec4(vec4(_Value, _Value, _Value, _Value)) * vec4(0.675000012, 0.75, 0.825000048, 0.900000036) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat2.xyxy * u_xlat1.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat1 = u_xlat2.xyxy * u_xlat1.zzww + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_4;
					    u_xlat16_0 = u_xlat10_3 + u_xlat16_0;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_3;
					    u_xlat16_0 = u_xlat10_1 + u_xlat16_0;
					    u_xlat1.xyz = vec3(vec3(_Value, _Value, _Value)) * vec3(0.975000024, 1.05000007, 1.125) + vec3(1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat2.xyxy * u_xlat1.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.zz + vec2(_Value2, _Value3);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_2;
					    u_xlat16_0 = u_xlat10_3 + u_xlat16_0;
					    u_xlat16_0 = u_xlat10_1 + u_xlat16_0;
					    SV_Target0 = u_xlat16_0 * vec4(0.0625, 0.0625, 0.0625, 0.0625);
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
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					lowp vec4 u_xlat10_2;
					vec4 u_xlat3;
					lowp vec4 u_xlat10_3;
					lowp vec4 u_xlat10_4;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = vec4(vec4(_Value, _Value, _Value, _Value)) * vec4(0.075000003, 0.150000006, 0.225000009, 0.300000012) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2.xy = vec2(vs_TEXCOORD0.x + (-float(_Value2)), vs_TEXCOORD0.y + (-float(_Value3)));
					    u_xlat3 = u_xlat2.xyxy * u_xlat1.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat1 = u_xlat2.xyxy * u_xlat1.zzww + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_4;
					    u_xlat16_0 = u_xlat10_3 + u_xlat16_0;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_3;
					    u_xlat16_0 = u_xlat10_1 + u_xlat16_0;
					    u_xlat1 = vec4(vec4(_Value, _Value, _Value, _Value)) * vec4(0.375, 0.450000018, 0.525000036, 0.600000024) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat2.xyxy * u_xlat1.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat1 = u_xlat2.xyxy * u_xlat1.zzww + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_4;
					    u_xlat16_0 = u_xlat10_3 + u_xlat16_0;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_3;
					    u_xlat16_0 = u_xlat10_1 + u_xlat16_0;
					    u_xlat1 = vec4(vec4(_Value, _Value, _Value, _Value)) * vec4(0.675000012, 0.75, 0.825000048, 0.900000036) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat2.xyxy * u_xlat1.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat1 = u_xlat2.xyxy * u_xlat1.zzww + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_4;
					    u_xlat16_0 = u_xlat10_3 + u_xlat16_0;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_3;
					    u_xlat16_0 = u_xlat10_1 + u_xlat16_0;
					    u_xlat1.xyz = vec3(vec3(_Value, _Value, _Value)) * vec3(0.975000024, 1.05000007, 1.125) + vec3(1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat2.xyxy * u_xlat1.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.zz + vec2(_Value2, _Value3);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_2;
					    u_xlat16_0 = u_xlat10_3 + u_xlat16_0;
					    u_xlat16_0 = u_xlat10_1 + u_xlat16_0;
					    SV_Target0 = u_xlat16_0 * vec4(0.0625, 0.0625, 0.0625, 0.0625);
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
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					lowp vec4 u_xlat10_2;
					vec4 u_xlat3;
					lowp vec4 u_xlat10_3;
					lowp vec4 u_xlat10_4;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = vec4(vec4(_Value, _Value, _Value, _Value)) * vec4(0.075000003, 0.150000006, 0.225000009, 0.300000012) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2.xy = vec2(vs_TEXCOORD0.x + (-float(_Value2)), vs_TEXCOORD0.y + (-float(_Value3)));
					    u_xlat3 = u_xlat2.xyxy * u_xlat1.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat1 = u_xlat2.xyxy * u_xlat1.zzww + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_4;
					    u_xlat16_0 = u_xlat10_3 + u_xlat16_0;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_3;
					    u_xlat16_0 = u_xlat10_1 + u_xlat16_0;
					    u_xlat1 = vec4(vec4(_Value, _Value, _Value, _Value)) * vec4(0.375, 0.450000018, 0.525000036, 0.600000024) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat2.xyxy * u_xlat1.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat1 = u_xlat2.xyxy * u_xlat1.zzww + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_4;
					    u_xlat16_0 = u_xlat10_3 + u_xlat16_0;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_3;
					    u_xlat16_0 = u_xlat10_1 + u_xlat16_0;
					    u_xlat1 = vec4(vec4(_Value, _Value, _Value, _Value)) * vec4(0.675000012, 0.75, 0.825000048, 0.900000036) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat2.xyxy * u_xlat1.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat1 = u_xlat2.xyxy * u_xlat1.zzww + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_4;
					    u_xlat16_0 = u_xlat10_3 + u_xlat16_0;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_3;
					    u_xlat16_0 = u_xlat10_1 + u_xlat16_0;
					    u_xlat1.xyz = vec3(vec3(_Value, _Value, _Value)) * vec3(0.975000024, 1.05000007, 1.125) + vec3(1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat2.xyxy * u_xlat1.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.zz + vec2(_Value2, _Value3);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_2;
					    u_xlat16_0 = u_xlat10_3 + u_xlat16_0;
					    u_xlat16_0 = u_xlat10_1 + u_xlat16_0;
					    SV_Target0 = u_xlat16_0 * vec4(0.0625, 0.0625, 0.0625, 0.0625);
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