Shader "CameraFilterPack/Drawing_Laplacian" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 32203
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
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 color_1;
					  highp vec2 uv_2;
					  highp vec2 tmpvar_3;
					  tmpvar_3 = (1.0/(_ScreenResolution.xy));
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (2.0 / _ScreenResolution.xy);
					  uv_2 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_5;
					  tmpvar_5.y = 0.0;
					  tmpvar_5.x = -(tmpvar_4.x);
					  highp vec2 P_6;
					  P_6 = (uv_2 + tmpvar_5);
					  color_1 = -(texture2D (_MainTex, P_6));
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = -(tmpvar_4.x);
					  tmpvar_7.y = tmpvar_3.y;
					  highp vec2 P_8;
					  P_8 = (uv_2 + tmpvar_7);
					  color_1 = (color_1 - texture2D (_MainTex, P_8));
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = -(tmpvar_4.x);
					  tmpvar_9.y = tmpvar_4.y;
					  highp vec2 P_10;
					  P_10 = (uv_2 + tmpvar_9);
					  color_1 = (color_1 - texture2D (_MainTex, P_10));
					  highp vec2 tmpvar_11;
					  tmpvar_11.x = -(tmpvar_3.x);
					  tmpvar_11.y = -(tmpvar_4.y);
					  highp vec2 P_12;
					  P_12 = (uv_2 + tmpvar_11);
					  color_1 = (color_1 - texture2D (_MainTex, P_12));
					  highp vec2 P_13;
					  P_13 = (uv_2 - tmpvar_3);
					  color_1 = (color_1 - texture2D (_MainTex, P_13));
					  highp vec2 tmpvar_14;
					  tmpvar_14.y = 0.0;
					  tmpvar_14.x = -(tmpvar_3.x);
					  highp vec2 P_15;
					  P_15 = (uv_2 + tmpvar_14);
					  color_1 = (color_1 - texture2D (_MainTex, P_15));
					  highp vec2 tmpvar_16;
					  tmpvar_16.x = 0.0;
					  tmpvar_16.y = -(tmpvar_4.y);
					  highp vec2 P_17;
					  P_17 = (uv_2 + tmpvar_16);
					  color_1 = (color_1 - texture2D (_MainTex, P_17));
					  highp vec2 tmpvar_18;
					  tmpvar_18.x = 0.0;
					  tmpvar_18.y = -(tmpvar_3.y);
					  highp vec2 P_19;
					  P_19 = (uv_2 + tmpvar_18);
					  color_1 = (color_1 - texture2D (_MainTex, P_19));
					  color_1 = (color_1 + (16.0 * texture2D (_MainTex, uv_2)));
					  highp vec2 tmpvar_20;
					  tmpvar_20.x = 0.0;
					  tmpvar_20.y = tmpvar_3.y;
					  highp vec2 P_21;
					  P_21 = (uv_2 + tmpvar_20);
					  color_1 = (color_1 - texture2D (_MainTex, P_21));
					  highp vec2 tmpvar_22;
					  tmpvar_22.x = 0.0;
					  tmpvar_22.y = tmpvar_4.y;
					  highp vec2 P_23;
					  P_23 = (uv_2 + tmpvar_22);
					  color_1 = (color_1 - texture2D (_MainTex, P_23));
					  highp vec2 tmpvar_24;
					  tmpvar_24.x = tmpvar_3.x;
					  tmpvar_24.y = -(tmpvar_4.y);
					  highp vec2 P_25;
					  P_25 = (uv_2 + tmpvar_24);
					  color_1 = (color_1 - texture2D (_MainTex, P_25));
					  highp vec2 tmpvar_26;
					  tmpvar_26.x = tmpvar_3.x;
					  tmpvar_26.y = -(tmpvar_3.y);
					  highp vec2 P_27;
					  P_27 = (uv_2 + tmpvar_26);
					  color_1 = (color_1 - texture2D (_MainTex, P_27));
					  highp vec2 tmpvar_28;
					  tmpvar_28.y = 0.0;
					  tmpvar_28.x = tmpvar_3.x;
					  highp vec2 P_29;
					  P_29 = (uv_2 + tmpvar_28);
					  color_1 = (color_1 - texture2D (_MainTex, P_29));
					  highp vec2 tmpvar_30;
					  tmpvar_30.x = tmpvar_4.x;
					  tmpvar_30.y = -(tmpvar_4.y);
					  highp vec2 P_31;
					  P_31 = (uv_2 + tmpvar_30);
					  color_1 = (color_1 - texture2D (_MainTex, P_31));
					  highp vec2 tmpvar_32;
					  tmpvar_32.x = tmpvar_4.x;
					  tmpvar_32.y = -(tmpvar_3.y);
					  highp vec2 P_33;
					  P_33 = (uv_2 + tmpvar_32);
					  color_1 = (color_1 - texture2D (_MainTex, P_33));
					  highp vec2 tmpvar_34;
					  tmpvar_34.y = 0.0;
					  tmpvar_34.x = tmpvar_4.x;
					  highp vec2 P_35;
					  P_35 = (uv_2 + tmpvar_34);
					  color_1 = (color_1 - texture2D (_MainTex, P_35));
					  if ((((
					    (color_1.x + color_1.y)
					   + color_1.z) / 3.0) < 0.8)) {
					    color_1 = vec4(0.0, 0.0, 0.0, 0.0);
					  };
					  gl_FragData[0] = color_1;
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
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 color_1;
					  highp vec2 uv_2;
					  highp vec2 tmpvar_3;
					  tmpvar_3 = (1.0/(_ScreenResolution.xy));
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (2.0 / _ScreenResolution.xy);
					  uv_2 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_5;
					  tmpvar_5.y = 0.0;
					  tmpvar_5.x = -(tmpvar_4.x);
					  highp vec2 P_6;
					  P_6 = (uv_2 + tmpvar_5);
					  color_1 = -(texture2D (_MainTex, P_6));
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = -(tmpvar_4.x);
					  tmpvar_7.y = tmpvar_3.y;
					  highp vec2 P_8;
					  P_8 = (uv_2 + tmpvar_7);
					  color_1 = (color_1 - texture2D (_MainTex, P_8));
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = -(tmpvar_4.x);
					  tmpvar_9.y = tmpvar_4.y;
					  highp vec2 P_10;
					  P_10 = (uv_2 + tmpvar_9);
					  color_1 = (color_1 - texture2D (_MainTex, P_10));
					  highp vec2 tmpvar_11;
					  tmpvar_11.x = -(tmpvar_3.x);
					  tmpvar_11.y = -(tmpvar_4.y);
					  highp vec2 P_12;
					  P_12 = (uv_2 + tmpvar_11);
					  color_1 = (color_1 - texture2D (_MainTex, P_12));
					  highp vec2 P_13;
					  P_13 = (uv_2 - tmpvar_3);
					  color_1 = (color_1 - texture2D (_MainTex, P_13));
					  highp vec2 tmpvar_14;
					  tmpvar_14.y = 0.0;
					  tmpvar_14.x = -(tmpvar_3.x);
					  highp vec2 P_15;
					  P_15 = (uv_2 + tmpvar_14);
					  color_1 = (color_1 - texture2D (_MainTex, P_15));
					  highp vec2 tmpvar_16;
					  tmpvar_16.x = 0.0;
					  tmpvar_16.y = -(tmpvar_4.y);
					  highp vec2 P_17;
					  P_17 = (uv_2 + tmpvar_16);
					  color_1 = (color_1 - texture2D (_MainTex, P_17));
					  highp vec2 tmpvar_18;
					  tmpvar_18.x = 0.0;
					  tmpvar_18.y = -(tmpvar_3.y);
					  highp vec2 P_19;
					  P_19 = (uv_2 + tmpvar_18);
					  color_1 = (color_1 - texture2D (_MainTex, P_19));
					  color_1 = (color_1 + (16.0 * texture2D (_MainTex, uv_2)));
					  highp vec2 tmpvar_20;
					  tmpvar_20.x = 0.0;
					  tmpvar_20.y = tmpvar_3.y;
					  highp vec2 P_21;
					  P_21 = (uv_2 + tmpvar_20);
					  color_1 = (color_1 - texture2D (_MainTex, P_21));
					  highp vec2 tmpvar_22;
					  tmpvar_22.x = 0.0;
					  tmpvar_22.y = tmpvar_4.y;
					  highp vec2 P_23;
					  P_23 = (uv_2 + tmpvar_22);
					  color_1 = (color_1 - texture2D (_MainTex, P_23));
					  highp vec2 tmpvar_24;
					  tmpvar_24.x = tmpvar_3.x;
					  tmpvar_24.y = -(tmpvar_4.y);
					  highp vec2 P_25;
					  P_25 = (uv_2 + tmpvar_24);
					  color_1 = (color_1 - texture2D (_MainTex, P_25));
					  highp vec2 tmpvar_26;
					  tmpvar_26.x = tmpvar_3.x;
					  tmpvar_26.y = -(tmpvar_3.y);
					  highp vec2 P_27;
					  P_27 = (uv_2 + tmpvar_26);
					  color_1 = (color_1 - texture2D (_MainTex, P_27));
					  highp vec2 tmpvar_28;
					  tmpvar_28.y = 0.0;
					  tmpvar_28.x = tmpvar_3.x;
					  highp vec2 P_29;
					  P_29 = (uv_2 + tmpvar_28);
					  color_1 = (color_1 - texture2D (_MainTex, P_29));
					  highp vec2 tmpvar_30;
					  tmpvar_30.x = tmpvar_4.x;
					  tmpvar_30.y = -(tmpvar_4.y);
					  highp vec2 P_31;
					  P_31 = (uv_2 + tmpvar_30);
					  color_1 = (color_1 - texture2D (_MainTex, P_31));
					  highp vec2 tmpvar_32;
					  tmpvar_32.x = tmpvar_4.x;
					  tmpvar_32.y = -(tmpvar_3.y);
					  highp vec2 P_33;
					  P_33 = (uv_2 + tmpvar_32);
					  color_1 = (color_1 - texture2D (_MainTex, P_33));
					  highp vec2 tmpvar_34;
					  tmpvar_34.y = 0.0;
					  tmpvar_34.x = tmpvar_4.x;
					  highp vec2 P_35;
					  P_35 = (uv_2 + tmpvar_34);
					  color_1 = (color_1 - texture2D (_MainTex, P_35));
					  if ((((
					    (color_1.x + color_1.y)
					   + color_1.z) / 3.0) < 0.8)) {
					    color_1 = vec4(0.0, 0.0, 0.0, 0.0);
					  };
					  gl_FragData[0] = color_1;
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
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 color_1;
					  highp vec2 uv_2;
					  highp vec2 tmpvar_3;
					  tmpvar_3 = (1.0/(_ScreenResolution.xy));
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (2.0 / _ScreenResolution.xy);
					  uv_2 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_5;
					  tmpvar_5.y = 0.0;
					  tmpvar_5.x = -(tmpvar_4.x);
					  highp vec2 P_6;
					  P_6 = (uv_2 + tmpvar_5);
					  color_1 = -(texture2D (_MainTex, P_6));
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = -(tmpvar_4.x);
					  tmpvar_7.y = tmpvar_3.y;
					  highp vec2 P_8;
					  P_8 = (uv_2 + tmpvar_7);
					  color_1 = (color_1 - texture2D (_MainTex, P_8));
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = -(tmpvar_4.x);
					  tmpvar_9.y = tmpvar_4.y;
					  highp vec2 P_10;
					  P_10 = (uv_2 + tmpvar_9);
					  color_1 = (color_1 - texture2D (_MainTex, P_10));
					  highp vec2 tmpvar_11;
					  tmpvar_11.x = -(tmpvar_3.x);
					  tmpvar_11.y = -(tmpvar_4.y);
					  highp vec2 P_12;
					  P_12 = (uv_2 + tmpvar_11);
					  color_1 = (color_1 - texture2D (_MainTex, P_12));
					  highp vec2 P_13;
					  P_13 = (uv_2 - tmpvar_3);
					  color_1 = (color_1 - texture2D (_MainTex, P_13));
					  highp vec2 tmpvar_14;
					  tmpvar_14.y = 0.0;
					  tmpvar_14.x = -(tmpvar_3.x);
					  highp vec2 P_15;
					  P_15 = (uv_2 + tmpvar_14);
					  color_1 = (color_1 - texture2D (_MainTex, P_15));
					  highp vec2 tmpvar_16;
					  tmpvar_16.x = 0.0;
					  tmpvar_16.y = -(tmpvar_4.y);
					  highp vec2 P_17;
					  P_17 = (uv_2 + tmpvar_16);
					  color_1 = (color_1 - texture2D (_MainTex, P_17));
					  highp vec2 tmpvar_18;
					  tmpvar_18.x = 0.0;
					  tmpvar_18.y = -(tmpvar_3.y);
					  highp vec2 P_19;
					  P_19 = (uv_2 + tmpvar_18);
					  color_1 = (color_1 - texture2D (_MainTex, P_19));
					  color_1 = (color_1 + (16.0 * texture2D (_MainTex, uv_2)));
					  highp vec2 tmpvar_20;
					  tmpvar_20.x = 0.0;
					  tmpvar_20.y = tmpvar_3.y;
					  highp vec2 P_21;
					  P_21 = (uv_2 + tmpvar_20);
					  color_1 = (color_1 - texture2D (_MainTex, P_21));
					  highp vec2 tmpvar_22;
					  tmpvar_22.x = 0.0;
					  tmpvar_22.y = tmpvar_4.y;
					  highp vec2 P_23;
					  P_23 = (uv_2 + tmpvar_22);
					  color_1 = (color_1 - texture2D (_MainTex, P_23));
					  highp vec2 tmpvar_24;
					  tmpvar_24.x = tmpvar_3.x;
					  tmpvar_24.y = -(tmpvar_4.y);
					  highp vec2 P_25;
					  P_25 = (uv_2 + tmpvar_24);
					  color_1 = (color_1 - texture2D (_MainTex, P_25));
					  highp vec2 tmpvar_26;
					  tmpvar_26.x = tmpvar_3.x;
					  tmpvar_26.y = -(tmpvar_3.y);
					  highp vec2 P_27;
					  P_27 = (uv_2 + tmpvar_26);
					  color_1 = (color_1 - texture2D (_MainTex, P_27));
					  highp vec2 tmpvar_28;
					  tmpvar_28.y = 0.0;
					  tmpvar_28.x = tmpvar_3.x;
					  highp vec2 P_29;
					  P_29 = (uv_2 + tmpvar_28);
					  color_1 = (color_1 - texture2D (_MainTex, P_29));
					  highp vec2 tmpvar_30;
					  tmpvar_30.x = tmpvar_4.x;
					  tmpvar_30.y = -(tmpvar_4.y);
					  highp vec2 P_31;
					  P_31 = (uv_2 + tmpvar_30);
					  color_1 = (color_1 - texture2D (_MainTex, P_31));
					  highp vec2 tmpvar_32;
					  tmpvar_32.x = tmpvar_4.x;
					  tmpvar_32.y = -(tmpvar_3.y);
					  highp vec2 P_33;
					  P_33 = (uv_2 + tmpvar_32);
					  color_1 = (color_1 - texture2D (_MainTex, P_33));
					  highp vec2 tmpvar_34;
					  tmpvar_34.y = 0.0;
					  tmpvar_34.x = tmpvar_4.x;
					  highp vec2 P_35;
					  P_35 = (uv_2 + tmpvar_34);
					  color_1 = (color_1 - texture2D (_MainTex, P_35));
					  if ((((
					    (color_1.x + color_1.y)
					   + color_1.z) / 3.0) < 0.8)) {
					    color_1 = vec4(0.0, 0.0, 0.0, 0.0);
					  };
					  gl_FragData[0] = color_1;
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
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					vec4 u_xlat4;
					lowp vec4 u_xlat10_4;
					vec4 u_xlat5;
					lowp vec4 u_xlat10_5;
					lowp vec4 u_xlat10_6;
					lowp vec4 u_xlat10_7;
					lowp float u_xlat10_8;
					vec2 u_xlat9;
					vec2 u_xlat18;
					void main()
					{
					    u_xlat0.xy = vec2(2.0, 2.0) / _ScreenResolution.xy;
					    u_xlat0.z = (-u_xlat0.x);
					    u_xlat1.xy = vec2(u_xlat0.z + vs_TEXCOORD0.x, u_xlat0.y + vs_TEXCOORD0.y);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat2.y = 0.0;
					    u_xlat2.xz = (-u_xlat0.xy);
					    u_xlat3.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
					    u_xlat10_3 = texture(_MainTex, u_xlat3.xy);
					    u_xlat4.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat2.w = u_xlat4.y;
					    u_xlat5 = u_xlat2.xwyw + vs_TEXCOORD0.xyxy;
					    u_xlat10_6 = texture(_MainTex, u_xlat5.xy);
					    u_xlat10_5 = texture(_MainTex, u_xlat5.zw);
					    u_xlat16_3 = (-u_xlat10_3) + (-u_xlat10_6);
					    u_xlat16_1 = (-u_xlat10_1) + u_xlat16_3;
					    u_xlat2.xy = (-u_xlat4.xy);
					    u_xlat3 = u_xlat2.xzxy + vs_TEXCOORD0.xyxy;
					    u_xlat10_6 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_1 = u_xlat16_1 + (-u_xlat10_6);
					    u_xlat16_1 = (-u_xlat10_3) + u_xlat16_1;
					    u_xlat2.w = 0.0;
					    u_xlat3 = u_xlat2.xwwz + vs_TEXCOORD0.xyxy;
					    u_xlat2.xy = vec2(u_xlat2.w + vs_TEXCOORD0.x, u_xlat2.y + vs_TEXCOORD0.y);
					    u_xlat10_6 = texture(_MainTex, u_xlat2.xy);
					    u_xlat4.z = u_xlat2.z;
					    u_xlat2.xy = u_xlat4.xz + vs_TEXCOORD0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_7 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_1 = u_xlat16_1 + (-u_xlat10_7);
					    u_xlat16_1 = (-u_xlat10_3) + u_xlat16_1;
					    u_xlat16_1 = (-u_xlat10_6) + u_xlat16_1;
					    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat10_3 * vec4(16.0, 16.0, 16.0, 16.0) + u_xlat16_1;
					    u_xlat16_1 = (-u_xlat10_5) + u_xlat16_1;
					    u_xlat0.w = 0.0;
					    u_xlat3 = u_xlat0.wyxw + vs_TEXCOORD0.xyxy;
					    u_xlat10_5 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_1 = u_xlat16_1 + (-u_xlat10_5);
					    u_xlat16_1 = (-u_xlat10_2) + u_xlat16_1;
					    u_xlat4.w = (-u_xlat4.y);
					    u_xlat18.xy = u_xlat4.xw + vs_TEXCOORD0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat18.xy);
					    u_xlat16_1 = u_xlat16_1 + (-u_xlat10_2);
					    u_xlat2.z = (-u_xlat4.y);
					    u_xlat4.y = 0.0;
					    u_xlat18.xy = u_xlat4.xy + vs_TEXCOORD0.xy;
					    u_xlat10_4 = texture(_MainTex, u_xlat18.xy);
					    u_xlat16_1 = u_xlat16_1 + (-u_xlat10_4);
					    u_xlat9.xy = u_xlat0.xy * vec2(1.0, -1.0) + vs_TEXCOORD0.xy;
					    u_xlat2.x = u_xlat0.x * 1.0;
					    u_xlat0.xw = u_xlat2.xz + vs_TEXCOORD0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xw);
					    u_xlat10_0 = texture(_MainTex, u_xlat9.xy);
					    u_xlat16_0 = (-u_xlat10_0) + u_xlat16_1;
					    u_xlat16_0 = (-u_xlat10_2) + u_xlat16_0;
					    u_xlat0 = (-u_xlat10_3) + u_xlat16_0;
					    u_xlat10_8 = u_xlat0.y + u_xlat0.x;
					    u_xlat10_8 = u_xlat0.z + u_xlat10_8;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat10_8<2.39999986);
					#else
					    u_xlatb1 = u_xlat10_8<2.39999986;
					#endif
					    SV_Target0 = (bool(u_xlatb1)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat0;
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
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					vec4 u_xlat4;
					lowp vec4 u_xlat10_4;
					vec4 u_xlat5;
					lowp vec4 u_xlat10_5;
					lowp vec4 u_xlat10_6;
					lowp vec4 u_xlat10_7;
					lowp float u_xlat10_8;
					vec2 u_xlat9;
					vec2 u_xlat18;
					void main()
					{
					    u_xlat0.xy = vec2(2.0, 2.0) / _ScreenResolution.xy;
					    u_xlat0.z = (-u_xlat0.x);
					    u_xlat1.xy = vec2(u_xlat0.z + vs_TEXCOORD0.x, u_xlat0.y + vs_TEXCOORD0.y);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat2.y = 0.0;
					    u_xlat2.xz = (-u_xlat0.xy);
					    u_xlat3.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
					    u_xlat10_3 = texture(_MainTex, u_xlat3.xy);
					    u_xlat4.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat2.w = u_xlat4.y;
					    u_xlat5 = u_xlat2.xwyw + vs_TEXCOORD0.xyxy;
					    u_xlat10_6 = texture(_MainTex, u_xlat5.xy);
					    u_xlat10_5 = texture(_MainTex, u_xlat5.zw);
					    u_xlat16_3 = (-u_xlat10_3) + (-u_xlat10_6);
					    u_xlat16_1 = (-u_xlat10_1) + u_xlat16_3;
					    u_xlat2.xy = (-u_xlat4.xy);
					    u_xlat3 = u_xlat2.xzxy + vs_TEXCOORD0.xyxy;
					    u_xlat10_6 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_1 = u_xlat16_1 + (-u_xlat10_6);
					    u_xlat16_1 = (-u_xlat10_3) + u_xlat16_1;
					    u_xlat2.w = 0.0;
					    u_xlat3 = u_xlat2.xwwz + vs_TEXCOORD0.xyxy;
					    u_xlat2.xy = vec2(u_xlat2.w + vs_TEXCOORD0.x, u_xlat2.y + vs_TEXCOORD0.y);
					    u_xlat10_6 = texture(_MainTex, u_xlat2.xy);
					    u_xlat4.z = u_xlat2.z;
					    u_xlat2.xy = u_xlat4.xz + vs_TEXCOORD0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_7 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_1 = u_xlat16_1 + (-u_xlat10_7);
					    u_xlat16_1 = (-u_xlat10_3) + u_xlat16_1;
					    u_xlat16_1 = (-u_xlat10_6) + u_xlat16_1;
					    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat10_3 * vec4(16.0, 16.0, 16.0, 16.0) + u_xlat16_1;
					    u_xlat16_1 = (-u_xlat10_5) + u_xlat16_1;
					    u_xlat0.w = 0.0;
					    u_xlat3 = u_xlat0.wyxw + vs_TEXCOORD0.xyxy;
					    u_xlat10_5 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_1 = u_xlat16_1 + (-u_xlat10_5);
					    u_xlat16_1 = (-u_xlat10_2) + u_xlat16_1;
					    u_xlat4.w = (-u_xlat4.y);
					    u_xlat18.xy = u_xlat4.xw + vs_TEXCOORD0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat18.xy);
					    u_xlat16_1 = u_xlat16_1 + (-u_xlat10_2);
					    u_xlat2.z = (-u_xlat4.y);
					    u_xlat4.y = 0.0;
					    u_xlat18.xy = u_xlat4.xy + vs_TEXCOORD0.xy;
					    u_xlat10_4 = texture(_MainTex, u_xlat18.xy);
					    u_xlat16_1 = u_xlat16_1 + (-u_xlat10_4);
					    u_xlat9.xy = u_xlat0.xy * vec2(1.0, -1.0) + vs_TEXCOORD0.xy;
					    u_xlat2.x = u_xlat0.x * 1.0;
					    u_xlat0.xw = u_xlat2.xz + vs_TEXCOORD0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xw);
					    u_xlat10_0 = texture(_MainTex, u_xlat9.xy);
					    u_xlat16_0 = (-u_xlat10_0) + u_xlat16_1;
					    u_xlat16_0 = (-u_xlat10_2) + u_xlat16_0;
					    u_xlat0 = (-u_xlat10_3) + u_xlat16_0;
					    u_xlat10_8 = u_xlat0.y + u_xlat0.x;
					    u_xlat10_8 = u_xlat0.z + u_xlat10_8;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat10_8<2.39999986);
					#else
					    u_xlatb1 = u_xlat10_8<2.39999986;
					#endif
					    SV_Target0 = (bool(u_xlatb1)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat0;
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
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					vec4 u_xlat3;
					mediump vec4 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					vec4 u_xlat4;
					lowp vec4 u_xlat10_4;
					vec4 u_xlat5;
					lowp vec4 u_xlat10_5;
					lowp vec4 u_xlat10_6;
					lowp vec4 u_xlat10_7;
					lowp float u_xlat10_8;
					vec2 u_xlat9;
					vec2 u_xlat18;
					void main()
					{
					    u_xlat0.xy = vec2(2.0, 2.0) / _ScreenResolution.xy;
					    u_xlat0.z = (-u_xlat0.x);
					    u_xlat1.xy = vec2(u_xlat0.z + vs_TEXCOORD0.x, u_xlat0.y + vs_TEXCOORD0.y);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat2.y = 0.0;
					    u_xlat2.xz = (-u_xlat0.xy);
					    u_xlat3.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
					    u_xlat10_3 = texture(_MainTex, u_xlat3.xy);
					    u_xlat4.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat2.w = u_xlat4.y;
					    u_xlat5 = u_xlat2.xwyw + vs_TEXCOORD0.xyxy;
					    u_xlat10_6 = texture(_MainTex, u_xlat5.xy);
					    u_xlat10_5 = texture(_MainTex, u_xlat5.zw);
					    u_xlat16_3 = (-u_xlat10_3) + (-u_xlat10_6);
					    u_xlat16_1 = (-u_xlat10_1) + u_xlat16_3;
					    u_xlat2.xy = (-u_xlat4.xy);
					    u_xlat3 = u_xlat2.xzxy + vs_TEXCOORD0.xyxy;
					    u_xlat10_6 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_1 = u_xlat16_1 + (-u_xlat10_6);
					    u_xlat16_1 = (-u_xlat10_3) + u_xlat16_1;
					    u_xlat2.w = 0.0;
					    u_xlat3 = u_xlat2.xwwz + vs_TEXCOORD0.xyxy;
					    u_xlat2.xy = vec2(u_xlat2.w + vs_TEXCOORD0.x, u_xlat2.y + vs_TEXCOORD0.y);
					    u_xlat10_6 = texture(_MainTex, u_xlat2.xy);
					    u_xlat4.z = u_xlat2.z;
					    u_xlat2.xy = u_xlat4.xz + vs_TEXCOORD0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_7 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_1 = u_xlat16_1 + (-u_xlat10_7);
					    u_xlat16_1 = (-u_xlat10_3) + u_xlat16_1;
					    u_xlat16_1 = (-u_xlat10_6) + u_xlat16_1;
					    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat10_3 * vec4(16.0, 16.0, 16.0, 16.0) + u_xlat16_1;
					    u_xlat16_1 = (-u_xlat10_5) + u_xlat16_1;
					    u_xlat0.w = 0.0;
					    u_xlat3 = u_xlat0.wyxw + vs_TEXCOORD0.xyxy;
					    u_xlat10_5 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_1 = u_xlat16_1 + (-u_xlat10_5);
					    u_xlat16_1 = (-u_xlat10_2) + u_xlat16_1;
					    u_xlat4.w = (-u_xlat4.y);
					    u_xlat18.xy = u_xlat4.xw + vs_TEXCOORD0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat18.xy);
					    u_xlat16_1 = u_xlat16_1 + (-u_xlat10_2);
					    u_xlat2.z = (-u_xlat4.y);
					    u_xlat4.y = 0.0;
					    u_xlat18.xy = u_xlat4.xy + vs_TEXCOORD0.xy;
					    u_xlat10_4 = texture(_MainTex, u_xlat18.xy);
					    u_xlat16_1 = u_xlat16_1 + (-u_xlat10_4);
					    u_xlat9.xy = u_xlat0.xy * vec2(1.0, -1.0) + vs_TEXCOORD0.xy;
					    u_xlat2.x = u_xlat0.x * 1.0;
					    u_xlat0.xw = u_xlat2.xz + vs_TEXCOORD0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xw);
					    u_xlat10_0 = texture(_MainTex, u_xlat9.xy);
					    u_xlat16_0 = (-u_xlat10_0) + u_xlat16_1;
					    u_xlat16_0 = (-u_xlat10_2) + u_xlat16_0;
					    u_xlat0 = (-u_xlat10_3) + u_xlat16_0;
					    u_xlat10_8 = u_xlat0.y + u_xlat0.x;
					    u_xlat10_8 = u_xlat0.z + u_xlat10_8;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat10_8<2.39999986);
					#else
					    u_xlatb1 = u_xlat10_8<2.39999986;
					#endif
					    SV_Target0 = (bool(u_xlatb1)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat0;
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