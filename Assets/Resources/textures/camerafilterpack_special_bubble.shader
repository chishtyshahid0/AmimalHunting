Shader "CameraFilterPack/Special_Bubble" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 8158
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 r_1;
					  highp vec2 v_2;
					  highp float a_3;
					  highp vec2 p_4;
					  mediump vec2 tmpvar_5;
					  tmpvar_5 = ((xlv_TEXCOORD0 * 2.0) - vec2(1.0, 1.0));
					  p_4 = tmpvar_5;
					  p_4 = (p_4 * 2.0);
					  highp float tmpvar_6;
					  tmpvar_6 = (p_4.x - _Value);
					  highp float tmpvar_7;
					  tmpvar_7 = (p_4.y - _Value2);
					  highp float tmpvar_8;
					  highp float tmpvar_9;
					  tmpvar_9 = (_TimeX * 3.0);
					  tmpvar_8 = (tmpvar_6 + (sin(
					    (tmpvar_9 * 3.0)
					  ) * 0.15));
					  highp float tmpvar_10;
					  tmpvar_10 = (tmpvar_7 + (cos(tmpvar_9) * 0.8));
					  highp float tmpvar_11;
					  highp float tmpvar_12;
					  tmpvar_12 = (_TimeX * 1.9);
					  tmpvar_11 = (tmpvar_6 + (sin(
					    (tmpvar_12 * 3.0)
					  ) * 0.2));
					  highp float tmpvar_13;
					  tmpvar_13 = (tmpvar_7 + (cos(tmpvar_12) * 0.8));
					  a_3 = ((inversesqrt(
					    ((tmpvar_8 * tmpvar_8) + (tmpvar_10 * tmpvar_10))
					  ) * sin(tmpvar_9)) + (inversesqrt(
					    ((tmpvar_11 * tmpvar_11) + (tmpvar_13 * tmpvar_13))
					  ) * sin(tmpvar_12)));
					  highp float tmpvar_14;
					  highp float tmpvar_15;
					  tmpvar_15 = (_TimeX * 0.6);
					  tmpvar_14 = (tmpvar_6 + (sin(
					    (tmpvar_15 * 3.0)
					  ) * 0.17));
					  highp float tmpvar_16;
					  tmpvar_16 = (tmpvar_7 + (cos(tmpvar_15) * 0.4));
					  a_3 = (a_3 + (inversesqrt(
					    ((tmpvar_14 * tmpvar_14) + (tmpvar_16 * tmpvar_16))
					  ) * sin(tmpvar_15)));
					  highp float tmpvar_17;
					  highp float tmpvar_18;
					  tmpvar_18 = (_TimeX * 1.3);
					  tmpvar_17 = (tmpvar_6 + (sin(
					    (tmpvar_18 * 3.0)
					  ) * 0.14));
					  highp float tmpvar_19;
					  tmpvar_19 = (tmpvar_7 + (cos(tmpvar_18) * 0.6));
					  a_3 = (a_3 + (inversesqrt(
					    ((tmpvar_17 * tmpvar_17) + (tmpvar_19 * tmpvar_19))
					  ) * sin(tmpvar_18)));
					  highp float tmpvar_20;
					  highp float tmpvar_21;
					  tmpvar_21 = (_TimeX * 1.8);
					  tmpvar_20 = (tmpvar_6 + (sin(
					    (tmpvar_21 * 3.0)
					  ) * 0.14));
					  highp float tmpvar_22;
					  tmpvar_22 = (tmpvar_7 + (cos(tmpvar_21) * 0.5));
					  a_3 = (a_3 + (inversesqrt(
					    ((tmpvar_20 * tmpvar_20) + (tmpvar_22 * tmpvar_22))
					  ) * sin(tmpvar_21)));
					  highp vec3 tmpvar_23;
					  tmpvar_23.x = a_3;
					  tmpvar_23.y = (a_3 - (tmpvar_7 * 32.0));
					  tmpvar_23.z = (a_3 - (tmpvar_7 * 50.0));
					  mediump vec2 tmpvar_24;
					  tmpvar_24 = (xlv_TEXCOORD0 * 0.8);
					  v_2 = tmpvar_24;
					  highp vec2 P_25;
					  P_25 = (v_2 - vec2(((tmpvar_23 / 32.0).x * _Value3)));
					  lowp vec3 tmpvar_26;
					  tmpvar_26 = texture2D (_MainTex, P_25).xyz;
					  r_1 = tmpvar_26;
					  highp vec4 tmpvar_27;
					  tmpvar_27.w = 0.0;
					  tmpvar_27.xyz = r_1;
					  gl_FragData[0] = tmpvar_27;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 r_1;
					  highp vec2 v_2;
					  highp float a_3;
					  highp vec2 p_4;
					  mediump vec2 tmpvar_5;
					  tmpvar_5 = ((xlv_TEXCOORD0 * 2.0) - vec2(1.0, 1.0));
					  p_4 = tmpvar_5;
					  p_4 = (p_4 * 2.0);
					  highp float tmpvar_6;
					  tmpvar_6 = (p_4.x - _Value);
					  highp float tmpvar_7;
					  tmpvar_7 = (p_4.y - _Value2);
					  highp float tmpvar_8;
					  highp float tmpvar_9;
					  tmpvar_9 = (_TimeX * 3.0);
					  tmpvar_8 = (tmpvar_6 + (sin(
					    (tmpvar_9 * 3.0)
					  ) * 0.15));
					  highp float tmpvar_10;
					  tmpvar_10 = (tmpvar_7 + (cos(tmpvar_9) * 0.8));
					  highp float tmpvar_11;
					  highp float tmpvar_12;
					  tmpvar_12 = (_TimeX * 1.9);
					  tmpvar_11 = (tmpvar_6 + (sin(
					    (tmpvar_12 * 3.0)
					  ) * 0.2));
					  highp float tmpvar_13;
					  tmpvar_13 = (tmpvar_7 + (cos(tmpvar_12) * 0.8));
					  a_3 = ((inversesqrt(
					    ((tmpvar_8 * tmpvar_8) + (tmpvar_10 * tmpvar_10))
					  ) * sin(tmpvar_9)) + (inversesqrt(
					    ((tmpvar_11 * tmpvar_11) + (tmpvar_13 * tmpvar_13))
					  ) * sin(tmpvar_12)));
					  highp float tmpvar_14;
					  highp float tmpvar_15;
					  tmpvar_15 = (_TimeX * 0.6);
					  tmpvar_14 = (tmpvar_6 + (sin(
					    (tmpvar_15 * 3.0)
					  ) * 0.17));
					  highp float tmpvar_16;
					  tmpvar_16 = (tmpvar_7 + (cos(tmpvar_15) * 0.4));
					  a_3 = (a_3 + (inversesqrt(
					    ((tmpvar_14 * tmpvar_14) + (tmpvar_16 * tmpvar_16))
					  ) * sin(tmpvar_15)));
					  highp float tmpvar_17;
					  highp float tmpvar_18;
					  tmpvar_18 = (_TimeX * 1.3);
					  tmpvar_17 = (tmpvar_6 + (sin(
					    (tmpvar_18 * 3.0)
					  ) * 0.14));
					  highp float tmpvar_19;
					  tmpvar_19 = (tmpvar_7 + (cos(tmpvar_18) * 0.6));
					  a_3 = (a_3 + (inversesqrt(
					    ((tmpvar_17 * tmpvar_17) + (tmpvar_19 * tmpvar_19))
					  ) * sin(tmpvar_18)));
					  highp float tmpvar_20;
					  highp float tmpvar_21;
					  tmpvar_21 = (_TimeX * 1.8);
					  tmpvar_20 = (tmpvar_6 + (sin(
					    (tmpvar_21 * 3.0)
					  ) * 0.14));
					  highp float tmpvar_22;
					  tmpvar_22 = (tmpvar_7 + (cos(tmpvar_21) * 0.5));
					  a_3 = (a_3 + (inversesqrt(
					    ((tmpvar_20 * tmpvar_20) + (tmpvar_22 * tmpvar_22))
					  ) * sin(tmpvar_21)));
					  highp vec3 tmpvar_23;
					  tmpvar_23.x = a_3;
					  tmpvar_23.y = (a_3 - (tmpvar_7 * 32.0));
					  tmpvar_23.z = (a_3 - (tmpvar_7 * 50.0));
					  mediump vec2 tmpvar_24;
					  tmpvar_24 = (xlv_TEXCOORD0 * 0.8);
					  v_2 = tmpvar_24;
					  highp vec2 P_25;
					  P_25 = (v_2 - vec2(((tmpvar_23 / 32.0).x * _Value3)));
					  lowp vec3 tmpvar_26;
					  tmpvar_26 = texture2D (_MainTex, P_25).xyz;
					  r_1 = tmpvar_26;
					  highp vec4 tmpvar_27;
					  tmpvar_27.w = 0.0;
					  tmpvar_27.xyz = r_1;
					  gl_FragData[0] = tmpvar_27;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 r_1;
					  highp vec2 v_2;
					  highp float a_3;
					  highp vec2 p_4;
					  mediump vec2 tmpvar_5;
					  tmpvar_5 = ((xlv_TEXCOORD0 * 2.0) - vec2(1.0, 1.0));
					  p_4 = tmpvar_5;
					  p_4 = (p_4 * 2.0);
					  highp float tmpvar_6;
					  tmpvar_6 = (p_4.x - _Value);
					  highp float tmpvar_7;
					  tmpvar_7 = (p_4.y - _Value2);
					  highp float tmpvar_8;
					  highp float tmpvar_9;
					  tmpvar_9 = (_TimeX * 3.0);
					  tmpvar_8 = (tmpvar_6 + (sin(
					    (tmpvar_9 * 3.0)
					  ) * 0.15));
					  highp float tmpvar_10;
					  tmpvar_10 = (tmpvar_7 + (cos(tmpvar_9) * 0.8));
					  highp float tmpvar_11;
					  highp float tmpvar_12;
					  tmpvar_12 = (_TimeX * 1.9);
					  tmpvar_11 = (tmpvar_6 + (sin(
					    (tmpvar_12 * 3.0)
					  ) * 0.2));
					  highp float tmpvar_13;
					  tmpvar_13 = (tmpvar_7 + (cos(tmpvar_12) * 0.8));
					  a_3 = ((inversesqrt(
					    ((tmpvar_8 * tmpvar_8) + (tmpvar_10 * tmpvar_10))
					  ) * sin(tmpvar_9)) + (inversesqrt(
					    ((tmpvar_11 * tmpvar_11) + (tmpvar_13 * tmpvar_13))
					  ) * sin(tmpvar_12)));
					  highp float tmpvar_14;
					  highp float tmpvar_15;
					  tmpvar_15 = (_TimeX * 0.6);
					  tmpvar_14 = (tmpvar_6 + (sin(
					    (tmpvar_15 * 3.0)
					  ) * 0.17));
					  highp float tmpvar_16;
					  tmpvar_16 = (tmpvar_7 + (cos(tmpvar_15) * 0.4));
					  a_3 = (a_3 + (inversesqrt(
					    ((tmpvar_14 * tmpvar_14) + (tmpvar_16 * tmpvar_16))
					  ) * sin(tmpvar_15)));
					  highp float tmpvar_17;
					  highp float tmpvar_18;
					  tmpvar_18 = (_TimeX * 1.3);
					  tmpvar_17 = (tmpvar_6 + (sin(
					    (tmpvar_18 * 3.0)
					  ) * 0.14));
					  highp float tmpvar_19;
					  tmpvar_19 = (tmpvar_7 + (cos(tmpvar_18) * 0.6));
					  a_3 = (a_3 + (inversesqrt(
					    ((tmpvar_17 * tmpvar_17) + (tmpvar_19 * tmpvar_19))
					  ) * sin(tmpvar_18)));
					  highp float tmpvar_20;
					  highp float tmpvar_21;
					  tmpvar_21 = (_TimeX * 1.8);
					  tmpvar_20 = (tmpvar_6 + (sin(
					    (tmpvar_21 * 3.0)
					  ) * 0.14));
					  highp float tmpvar_22;
					  tmpvar_22 = (tmpvar_7 + (cos(tmpvar_21) * 0.5));
					  a_3 = (a_3 + (inversesqrt(
					    ((tmpvar_20 * tmpvar_20) + (tmpvar_22 * tmpvar_22))
					  ) * sin(tmpvar_21)));
					  highp vec3 tmpvar_23;
					  tmpvar_23.x = a_3;
					  tmpvar_23.y = (a_3 - (tmpvar_7 * 32.0));
					  tmpvar_23.z = (a_3 - (tmpvar_7 * 50.0));
					  mediump vec2 tmpvar_24;
					  tmpvar_24 = (xlv_TEXCOORD0 * 0.8);
					  v_2 = tmpvar_24;
					  highp vec2 P_25;
					  P_25 = (v_2 - vec2(((tmpvar_23 / 32.0).x * _Value3)));
					  lowp vec3 tmpvar_26;
					  tmpvar_26 = texture2D (_MainTex, P_25).xyz;
					  r_1 = tmpvar_26;
					  highp vec4 tmpvar_27;
					  tmpvar_27.w = 0.0;
					  tmpvar_27.xyz = r_1;
					  gl_FragData[0] = tmpvar_27;
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
					layout(location = 0) out highp vec3 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					vec2 u_xlat7;
					mediump vec2 u_xlat16_7;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(9.0, 3.0, 5.69999981, 1.89999998);
					    u_xlat1.xy = cos(u_xlat0.yw);
					    u_xlat0 = sin(u_xlat0);
					    u_xlat16_7.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat7.xy = u_xlat16_7.xy * vec2(2.0, 2.0) + (-vec2(_Value, _Value2));
					    u_xlat1.xy = u_xlat1.xy * vec2(0.800000012, 0.800000012) + u_xlat7.yy;
					    u_xlat1.xy = u_xlat1.xy * u_xlat1.xy;
					    u_xlat0.xz = u_xlat0.xz * vec2(0.150000006, 0.200000003) + u_xlat7.xx;
					    u_xlat0.xz = u_xlat0.xz * u_xlat0.xz + u_xlat1.xy;
					    u_xlat0.xz = sqrt(u_xlat0.xz);
					    u_xlat0.xz = vec2(1.0, 1.0) / u_xlat0.xz;
					    u_xlat0.xy = vec2(u_xlat0.y * u_xlat0.x, u_xlat0.w * u_xlat0.z);
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlat2 = vec4(_TimeX) * vec4(1.80000007, 0.600000024, 3.89999986, 1.29999995);
					    u_xlat3.xy = cos(u_xlat2.yw);
					    u_xlat2 = sin(u_xlat2);
					    u_xlat3.xy = u_xlat3.xy * vec2(0.400000006, 0.600000024) + u_xlat7.yy;
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat1.xy = u_xlat2.xz * vec2(0.170000002, 0.140000001) + u_xlat7.xx;
					    u_xlat3.xy = u_xlat1.xy * u_xlat1.xy + u_xlat3.xy;
					    u_xlat3.xy = sqrt(u_xlat3.xy);
					    u_xlat3.xy = vec2(1.0, 1.0) / u_xlat3.xy;
					    u_xlat0.x = u_xlat3.x * u_xlat2.y + u_xlat0.x;
					    u_xlat0.x = u_xlat3.y * u_xlat2.w + u_xlat0.x;
					    u_xlat3.xy = vec2(_TimeX) * vec2(5.39999962, 1.79999995);
					    u_xlat9 = cos(u_xlat3.y);
					    u_xlat3.xy = sin(u_xlat3.xy);
					    u_xlat9 = u_xlat9 * 0.5 + u_xlat7.y;
					    u_xlat3.x = u_xlat3.x * 0.140000001 + u_xlat7.x;
					    u_xlat9 = u_xlat9 * u_xlat9;
					    u_xlat3.x = u_xlat3.x * u_xlat3.x + u_xlat9;
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat3.x = float(1.0) / u_xlat3.x;
					    u_xlat0.x = u_xlat3.x * u_xlat3.y + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat0.x = u_xlat0.x * 0.03125;
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.800000012, 0.800000012) + (-u_xlat0.xx);
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
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
					layout(location = 0) out highp vec3 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					vec2 u_xlat7;
					mediump vec2 u_xlat16_7;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(9.0, 3.0, 5.69999981, 1.89999998);
					    u_xlat1.xy = cos(u_xlat0.yw);
					    u_xlat0 = sin(u_xlat0);
					    u_xlat16_7.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat7.xy = u_xlat16_7.xy * vec2(2.0, 2.0) + (-vec2(_Value, _Value2));
					    u_xlat1.xy = u_xlat1.xy * vec2(0.800000012, 0.800000012) + u_xlat7.yy;
					    u_xlat1.xy = u_xlat1.xy * u_xlat1.xy;
					    u_xlat0.xz = u_xlat0.xz * vec2(0.150000006, 0.200000003) + u_xlat7.xx;
					    u_xlat0.xz = u_xlat0.xz * u_xlat0.xz + u_xlat1.xy;
					    u_xlat0.xz = sqrt(u_xlat0.xz);
					    u_xlat0.xz = vec2(1.0, 1.0) / u_xlat0.xz;
					    u_xlat0.xy = vec2(u_xlat0.y * u_xlat0.x, u_xlat0.w * u_xlat0.z);
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlat2 = vec4(_TimeX) * vec4(1.80000007, 0.600000024, 3.89999986, 1.29999995);
					    u_xlat3.xy = cos(u_xlat2.yw);
					    u_xlat2 = sin(u_xlat2);
					    u_xlat3.xy = u_xlat3.xy * vec2(0.400000006, 0.600000024) + u_xlat7.yy;
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat1.xy = u_xlat2.xz * vec2(0.170000002, 0.140000001) + u_xlat7.xx;
					    u_xlat3.xy = u_xlat1.xy * u_xlat1.xy + u_xlat3.xy;
					    u_xlat3.xy = sqrt(u_xlat3.xy);
					    u_xlat3.xy = vec2(1.0, 1.0) / u_xlat3.xy;
					    u_xlat0.x = u_xlat3.x * u_xlat2.y + u_xlat0.x;
					    u_xlat0.x = u_xlat3.y * u_xlat2.w + u_xlat0.x;
					    u_xlat3.xy = vec2(_TimeX) * vec2(5.39999962, 1.79999995);
					    u_xlat9 = cos(u_xlat3.y);
					    u_xlat3.xy = sin(u_xlat3.xy);
					    u_xlat9 = u_xlat9 * 0.5 + u_xlat7.y;
					    u_xlat3.x = u_xlat3.x * 0.140000001 + u_xlat7.x;
					    u_xlat9 = u_xlat9 * u_xlat9;
					    u_xlat3.x = u_xlat3.x * u_xlat3.x + u_xlat9;
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat3.x = float(1.0) / u_xlat3.x;
					    u_xlat0.x = u_xlat3.x * u_xlat3.y + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat0.x = u_xlat0.x * 0.03125;
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.800000012, 0.800000012) + (-u_xlat0.xx);
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
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
					layout(location = 0) out highp vec3 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					vec2 u_xlat7;
					mediump vec2 u_xlat16_7;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(9.0, 3.0, 5.69999981, 1.89999998);
					    u_xlat1.xy = cos(u_xlat0.yw);
					    u_xlat0 = sin(u_xlat0);
					    u_xlat16_7.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat7.xy = u_xlat16_7.xy * vec2(2.0, 2.0) + (-vec2(_Value, _Value2));
					    u_xlat1.xy = u_xlat1.xy * vec2(0.800000012, 0.800000012) + u_xlat7.yy;
					    u_xlat1.xy = u_xlat1.xy * u_xlat1.xy;
					    u_xlat0.xz = u_xlat0.xz * vec2(0.150000006, 0.200000003) + u_xlat7.xx;
					    u_xlat0.xz = u_xlat0.xz * u_xlat0.xz + u_xlat1.xy;
					    u_xlat0.xz = sqrt(u_xlat0.xz);
					    u_xlat0.xz = vec2(1.0, 1.0) / u_xlat0.xz;
					    u_xlat0.xy = vec2(u_xlat0.y * u_xlat0.x, u_xlat0.w * u_xlat0.z);
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlat2 = vec4(_TimeX) * vec4(1.80000007, 0.600000024, 3.89999986, 1.29999995);
					    u_xlat3.xy = cos(u_xlat2.yw);
					    u_xlat2 = sin(u_xlat2);
					    u_xlat3.xy = u_xlat3.xy * vec2(0.400000006, 0.600000024) + u_xlat7.yy;
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlat1.xy = u_xlat2.xz * vec2(0.170000002, 0.140000001) + u_xlat7.xx;
					    u_xlat3.xy = u_xlat1.xy * u_xlat1.xy + u_xlat3.xy;
					    u_xlat3.xy = sqrt(u_xlat3.xy);
					    u_xlat3.xy = vec2(1.0, 1.0) / u_xlat3.xy;
					    u_xlat0.x = u_xlat3.x * u_xlat2.y + u_xlat0.x;
					    u_xlat0.x = u_xlat3.y * u_xlat2.w + u_xlat0.x;
					    u_xlat3.xy = vec2(_TimeX) * vec2(5.39999962, 1.79999995);
					    u_xlat9 = cos(u_xlat3.y);
					    u_xlat3.xy = sin(u_xlat3.xy);
					    u_xlat9 = u_xlat9 * 0.5 + u_xlat7.y;
					    u_xlat3.x = u_xlat3.x * 0.140000001 + u_xlat7.x;
					    u_xlat9 = u_xlat9 * u_xlat9;
					    u_xlat3.x = u_xlat3.x * u_xlat3.x + u_xlat9;
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat3.x = float(1.0) / u_xlat3.x;
					    u_xlat0.x = u_xlat3.x * u_xlat3.y + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat0.x = u_xlat0.x * 0.03125;
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.800000012, 0.800000012) + (-u_xlat0.xx);
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
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