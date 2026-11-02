Shader "CameraFilterPack/Edge_Neon" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_EdgeWeight ("_EdgeWeight", Range(1, 10)) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 3832
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
					uniform highp float _EdgeWeight;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 t_2;
					  lowp vec4 gy_3;
					  lowp vec4 gx_4;
					  highp vec2 uv_5;
					  uv_5 = xlv_TEXCOORD0;
					  highp float tmpvar_6;
					  tmpvar_6 = (1.0/((_EdgeWeight * 100.0)));
					  highp vec3 tmpvar_7;
					  tmpvar_7.y = 0.0;
					  tmpvar_7.x = -(tmpvar_6);
					  tmpvar_7.z = tmpvar_6;
					  highp vec2 P_8;
					  P_8 = (uv_5 + tmpvar_7.xz);
					  gx_4 = texture2D (_MainTex, P_8);
					  gy_3 = gx_4;
					  highp vec2 P_9;
					  P_9 = (uv_5 + tmpvar_7.xy);
					  gx_4 = (gx_4 + (2.0 * texture2D (_MainTex, P_9)));
					  lowp vec4 tmpvar_10;
					  highp vec2 P_11;
					  P_11 = (uv_5 + tmpvar_7.xx);
					  tmpvar_10 = texture2D (_MainTex, P_11);
					  t_2 = tmpvar_10;
					  gx_4 = (gx_4 + t_2);
					  gy_3 = (gy_3 - t_2);
					  highp vec2 P_12;
					  P_12 = (uv_5 + tmpvar_7.yz);
					  gy_3 = (gy_3 + (2.0 * texture2D (_MainTex, P_12)));
					  highp vec2 P_13;
					  P_13 = (uv_5 + tmpvar_7.yx);
					  gy_3 = (gy_3 - (2.0 * texture2D (_MainTex, P_13)));
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_5 + vec2(tmpvar_6));
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  t_2 = tmpvar_14;
					  gx_4 = (gx_4 - t_2);
					  gy_3 = (gy_3 + t_2);
					  highp vec2 P_16;
					  P_16 = (uv_5 + tmpvar_7.zy);
					  gx_4 = (gx_4 - (2.0 * texture2D (_MainTex, P_16)));
					  lowp vec4 tmpvar_17;
					  highp vec2 P_18;
					  P_18 = (uv_5 + tmpvar_7.zx);
					  tmpvar_17 = texture2D (_MainTex, P_18);
					  t_2 = tmpvar_17;
					  gx_4 = (gx_4 - t_2);
					  gy_3 = (gy_3 - t_2);
					  lowp vec4 tmpvar_19;
					  tmpvar_19 = sqrt(((gx_4 * gx_4) + (gy_3 * gy_3)));
					  tmpvar_1 = tmpvar_19;
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
					uniform highp float _EdgeWeight;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 t_2;
					  lowp vec4 gy_3;
					  lowp vec4 gx_4;
					  highp vec2 uv_5;
					  uv_5 = xlv_TEXCOORD0;
					  highp float tmpvar_6;
					  tmpvar_6 = (1.0/((_EdgeWeight * 100.0)));
					  highp vec3 tmpvar_7;
					  tmpvar_7.y = 0.0;
					  tmpvar_7.x = -(tmpvar_6);
					  tmpvar_7.z = tmpvar_6;
					  highp vec2 P_8;
					  P_8 = (uv_5 + tmpvar_7.xz);
					  gx_4 = texture2D (_MainTex, P_8);
					  gy_3 = gx_4;
					  highp vec2 P_9;
					  P_9 = (uv_5 + tmpvar_7.xy);
					  gx_4 = (gx_4 + (2.0 * texture2D (_MainTex, P_9)));
					  lowp vec4 tmpvar_10;
					  highp vec2 P_11;
					  P_11 = (uv_5 + tmpvar_7.xx);
					  tmpvar_10 = texture2D (_MainTex, P_11);
					  t_2 = tmpvar_10;
					  gx_4 = (gx_4 + t_2);
					  gy_3 = (gy_3 - t_2);
					  highp vec2 P_12;
					  P_12 = (uv_5 + tmpvar_7.yz);
					  gy_3 = (gy_3 + (2.0 * texture2D (_MainTex, P_12)));
					  highp vec2 P_13;
					  P_13 = (uv_5 + tmpvar_7.yx);
					  gy_3 = (gy_3 - (2.0 * texture2D (_MainTex, P_13)));
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_5 + vec2(tmpvar_6));
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  t_2 = tmpvar_14;
					  gx_4 = (gx_4 - t_2);
					  gy_3 = (gy_3 + t_2);
					  highp vec2 P_16;
					  P_16 = (uv_5 + tmpvar_7.zy);
					  gx_4 = (gx_4 - (2.0 * texture2D (_MainTex, P_16)));
					  lowp vec4 tmpvar_17;
					  highp vec2 P_18;
					  P_18 = (uv_5 + tmpvar_7.zx);
					  tmpvar_17 = texture2D (_MainTex, P_18);
					  t_2 = tmpvar_17;
					  gx_4 = (gx_4 - t_2);
					  gy_3 = (gy_3 - t_2);
					  lowp vec4 tmpvar_19;
					  tmpvar_19 = sqrt(((gx_4 * gx_4) + (gy_3 * gy_3)));
					  tmpvar_1 = tmpvar_19;
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
					uniform highp float _EdgeWeight;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 t_2;
					  lowp vec4 gy_3;
					  lowp vec4 gx_4;
					  highp vec2 uv_5;
					  uv_5 = xlv_TEXCOORD0;
					  highp float tmpvar_6;
					  tmpvar_6 = (1.0/((_EdgeWeight * 100.0)));
					  highp vec3 tmpvar_7;
					  tmpvar_7.y = 0.0;
					  tmpvar_7.x = -(tmpvar_6);
					  tmpvar_7.z = tmpvar_6;
					  highp vec2 P_8;
					  P_8 = (uv_5 + tmpvar_7.xz);
					  gx_4 = texture2D (_MainTex, P_8);
					  gy_3 = gx_4;
					  highp vec2 P_9;
					  P_9 = (uv_5 + tmpvar_7.xy);
					  gx_4 = (gx_4 + (2.0 * texture2D (_MainTex, P_9)));
					  lowp vec4 tmpvar_10;
					  highp vec2 P_11;
					  P_11 = (uv_5 + tmpvar_7.xx);
					  tmpvar_10 = texture2D (_MainTex, P_11);
					  t_2 = tmpvar_10;
					  gx_4 = (gx_4 + t_2);
					  gy_3 = (gy_3 - t_2);
					  highp vec2 P_12;
					  P_12 = (uv_5 + tmpvar_7.yz);
					  gy_3 = (gy_3 + (2.0 * texture2D (_MainTex, P_12)));
					  highp vec2 P_13;
					  P_13 = (uv_5 + tmpvar_7.yx);
					  gy_3 = (gy_3 - (2.0 * texture2D (_MainTex, P_13)));
					  lowp vec4 tmpvar_14;
					  highp vec2 P_15;
					  P_15 = (uv_5 + vec2(tmpvar_6));
					  tmpvar_14 = texture2D (_MainTex, P_15);
					  t_2 = tmpvar_14;
					  gx_4 = (gx_4 - t_2);
					  gy_3 = (gy_3 + t_2);
					  highp vec2 P_16;
					  P_16 = (uv_5 + tmpvar_7.zy);
					  gx_4 = (gx_4 - (2.0 * texture2D (_MainTex, P_16)));
					  lowp vec4 tmpvar_17;
					  highp vec2 P_18;
					  P_18 = (uv_5 + tmpvar_7.zx);
					  tmpvar_17 = texture2D (_MainTex, P_18);
					  t_2 = tmpvar_17;
					  gx_4 = (gx_4 - t_2);
					  gy_3 = (gy_3 - t_2);
					  lowp vec4 tmpvar_19;
					  tmpvar_19 = sqrt(((gx_4 * gx_4) + (gy_3 * gy_3)));
					  tmpvar_1 = tmpvar_19;
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
					uniform 	float _EdgeWeight;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					mediump vec4 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					mediump vec4 u_xlat16_4;
					vec4 u_xlat5;
					lowp vec4 u_xlat10_5;
					vec4 u_xlat6;
					lowp vec4 u_xlat10_7;
					void main()
					{
					    u_xlat0.x = _EdgeWeight * 100.0;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat1.xy = (-u_xlat0.xx) + vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat0.yz = (-u_xlat0.xx);
					    u_xlat2 = u_xlat0.yxxx + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_4 = (-u_xlat10_1) + u_xlat10_3;
					    u_xlat0.w = 0.0;
					    u_xlat5 = u_xlat0.zwwx + vs_TEXCOORD0.xyxy;
					    u_xlat6 = u_xlat0.xwxz + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.wx * vec2(1.0, -1.0) + vs_TEXCOORD0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_7 = texture(_MainTex, u_xlat5.zw);
					    u_xlat10_5 = texture(_MainTex, u_xlat5.xy);
					    u_xlat16_3 = u_xlat10_5 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat10_3;
					    u_xlat16_1 = u_xlat10_1 + u_xlat16_3;
					    u_xlat16_1 = (-u_xlat10_2) + u_xlat16_1;
					    u_xlat16_3 = u_xlat10_7 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat16_4;
					    u_xlat16_0 = (-u_xlat10_0) * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat16_3;
					    u_xlat16_0 = u_xlat10_2 + u_xlat16_0;
					    u_xlat10_2 = texture(_MainTex, u_xlat6.zw);
					    u_xlat10_3 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_1 = (-u_xlat10_3) * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat16_1;
					    u_xlat16_1 = (-u_xlat10_2) + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat10_2);
					    u_xlat10_0 = u_xlat16_0 * u_xlat16_0;
					    u_xlat10_0 = u_xlat16_1 * u_xlat16_1 + u_xlat10_0;
					    u_xlat10_0 = sqrt(u_xlat10_0);
					    SV_Target0 = u_xlat10_0;
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
					uniform 	float _EdgeWeight;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					mediump vec4 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					mediump vec4 u_xlat16_4;
					vec4 u_xlat5;
					lowp vec4 u_xlat10_5;
					vec4 u_xlat6;
					lowp vec4 u_xlat10_7;
					void main()
					{
					    u_xlat0.x = _EdgeWeight * 100.0;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat1.xy = (-u_xlat0.xx) + vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat0.yz = (-u_xlat0.xx);
					    u_xlat2 = u_xlat0.yxxx + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_4 = (-u_xlat10_1) + u_xlat10_3;
					    u_xlat0.w = 0.0;
					    u_xlat5 = u_xlat0.zwwx + vs_TEXCOORD0.xyxy;
					    u_xlat6 = u_xlat0.xwxz + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.wx * vec2(1.0, -1.0) + vs_TEXCOORD0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_7 = texture(_MainTex, u_xlat5.zw);
					    u_xlat10_5 = texture(_MainTex, u_xlat5.xy);
					    u_xlat16_3 = u_xlat10_5 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat10_3;
					    u_xlat16_1 = u_xlat10_1 + u_xlat16_3;
					    u_xlat16_1 = (-u_xlat10_2) + u_xlat16_1;
					    u_xlat16_3 = u_xlat10_7 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat16_4;
					    u_xlat16_0 = (-u_xlat10_0) * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat16_3;
					    u_xlat16_0 = u_xlat10_2 + u_xlat16_0;
					    u_xlat10_2 = texture(_MainTex, u_xlat6.zw);
					    u_xlat10_3 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_1 = (-u_xlat10_3) * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat16_1;
					    u_xlat16_1 = (-u_xlat10_2) + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat10_2);
					    u_xlat10_0 = u_xlat16_0 * u_xlat16_0;
					    u_xlat10_0 = u_xlat16_1 * u_xlat16_1 + u_xlat10_0;
					    u_xlat10_0 = sqrt(u_xlat10_0);
					    SV_Target0 = u_xlat10_0;
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
					uniform 	float _EdgeWeight;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					mediump vec4 u_xlat16_3;
					lowp vec4 u_xlat10_3;
					mediump vec4 u_xlat16_4;
					vec4 u_xlat5;
					lowp vec4 u_xlat10_5;
					vec4 u_xlat6;
					lowp vec4 u_xlat10_7;
					void main()
					{
					    u_xlat0.x = _EdgeWeight * 100.0;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat1.xy = (-u_xlat0.xx) + vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat0.yz = (-u_xlat0.xx);
					    u_xlat2 = u_xlat0.yxxx + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_4 = (-u_xlat10_1) + u_xlat10_3;
					    u_xlat0.w = 0.0;
					    u_xlat5 = u_xlat0.zwwx + vs_TEXCOORD0.xyxy;
					    u_xlat6 = u_xlat0.xwxz + vs_TEXCOORD0.xyxy;
					    u_xlat0.xy = u_xlat0.wx * vec2(1.0, -1.0) + vs_TEXCOORD0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_7 = texture(_MainTex, u_xlat5.zw);
					    u_xlat10_5 = texture(_MainTex, u_xlat5.xy);
					    u_xlat16_3 = u_xlat10_5 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat10_3;
					    u_xlat16_1 = u_xlat10_1 + u_xlat16_3;
					    u_xlat16_1 = (-u_xlat10_2) + u_xlat16_1;
					    u_xlat16_3 = u_xlat10_7 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat16_4;
					    u_xlat16_0 = (-u_xlat10_0) * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat16_3;
					    u_xlat16_0 = u_xlat10_2 + u_xlat16_0;
					    u_xlat10_2 = texture(_MainTex, u_xlat6.zw);
					    u_xlat10_3 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_1 = (-u_xlat10_3) * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat16_1;
					    u_xlat16_1 = (-u_xlat10_2) + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat10_2);
					    u_xlat10_0 = u_xlat16_0 * u_xlat16_0;
					    u_xlat10_0 = u_xlat16_1 * u_xlat16_1 + u_xlat10_0;
					    u_xlat10_0 = sqrt(u_xlat10_0);
					    SV_Target0 = u_xlat10_0;
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