Shader "CameraFilterPack/FX_Plasma" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 44293
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
					  highp vec4 origine_1;
					  highp vec4 t2_2;
					  highp vec4 t_3;
					  highp vec2 uv_4;
					  highp float tmpvar_5;
					  tmpvar_5 = (1000.0 + (sin(
					    (_TimeX * 0.11)
					  ) * 20.0));
					  highp float tmpvar_6;
					  tmpvar_6 = (800.0 + (sin(
					    (_TimeX * 0.15)
					  ) * 22.0));
					  uv_4 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = (sin((uv_4.x + 
					    (tmpvar_5 * 0.005)
					  )) * cos((tmpvar_5 * 0.01)));
					  tmpvar_7.y = (cos((uv_4.y + 
					    (tmpvar_5 * 0.001)
					  )) * cos((tmpvar_5 * 0.02)));
					  lowp vec4 tmpvar_8;
					  highp vec2 P_9;
					  P_9 = (tmpvar_7 * 5.0);
					  tmpvar_8 = texture2D (_MainTex, P_9);
					  t_3 = tmpvar_8;
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = sin((uv_4.x + (tmpvar_5 * 0.001)));
					  tmpvar_10.y = cos((uv_4.y + (tmpvar_5 * 0.005)));
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, tmpvar_10);
					  t2_2 = tmpvar_11;
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_MainTex, uv_4);
					  origine_1 = tmpvar_12;
					  highp vec4 tmpvar_13;
					  tmpvar_13.xw = vec2(0.0, 1.0);
					  tmpvar_13.y = (((
					    ((t_3.x * sin((tmpvar_5 * 
					      (sin((uv_4.y * 0.5)) + (0.01 * sin((
					        (uv_4.x * 5.0)
					       + tmpvar_6))))
					    ))) * sin(((
					      (((tmpvar_5 * 0.1) * t2_2.x) * (uv_4.x - sin((tmpvar_6 * 0.05))))
					     * 
					      sin(((uv_4.y - sin(
					        (tmpvar_5 * 0.035)
					      )) * 5.0))
					    ) + sin(
					      (0.1 * tmpvar_6)
					    ))))
					   * 0.5) + (
					    (t2_2.x * abs(sin((
					      (tmpvar_5 * (uv_4.x - 0.5))
					     * 
					      sin((uv_4.y + 0.5))
					    ))))
					   * 0.5)) + ((t_3.x * 
					    sin((((tmpvar_5 * 
					      (uv_4.x - sin((tmpvar_5 * 0.1)))
					    ) * sin(
					      (uv_4.y - sin((tmpvar_5 * 0.1)))
					    )) * 0.2))
					  ) * 0.1));
					  tmpvar_13.z = (((
					    ((t_3.x * sin((tmpvar_6 * 
					      (sin((uv_4.y * 0.25)) + (0.01 * sin((
					        (uv_4.x * 3.0)
					       + tmpvar_6))))
					    ))) * abs(sin((
					      ((((tmpvar_5 * 0.09) * t2_2.x) * (uv_4.x - sin(
					        (tmpvar_6 * 0.04)
					      ))) * sin(((uv_4.y - 
					        sin((tmpvar_5 * 0.035))
					      ) * 5.0)))
					     + 
					      sin((0.1 * tmpvar_6))
					    ))))
					   * 0.5) + (
					    (t2_2.x * abs(sin((
					      (tmpvar_5 * (uv_4.x - 0.5))
					     * 
					      sin((uv_4.y + 0.5))
					    ))))
					   * 0.5)) + ((t_3.x * 
					    abs(sin(((
					      (tmpvar_5 * (uv_4.x - sin((tmpvar_5 * 0.1))))
					     * 
					      sin((uv_4.y - sin((tmpvar_5 * 0.1))))
					    ) * 0.2)))
					  ) * 0.1));
					  highp vec4 tmpvar_14;
					  tmpvar_14 = (tmpvar_13 + origine_1);
					  gl_FragData[0] = tmpvar_14;
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
					  highp vec4 origine_1;
					  highp vec4 t2_2;
					  highp vec4 t_3;
					  highp vec2 uv_4;
					  highp float tmpvar_5;
					  tmpvar_5 = (1000.0 + (sin(
					    (_TimeX * 0.11)
					  ) * 20.0));
					  highp float tmpvar_6;
					  tmpvar_6 = (800.0 + (sin(
					    (_TimeX * 0.15)
					  ) * 22.0));
					  uv_4 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = (sin((uv_4.x + 
					    (tmpvar_5 * 0.005)
					  )) * cos((tmpvar_5 * 0.01)));
					  tmpvar_7.y = (cos((uv_4.y + 
					    (tmpvar_5 * 0.001)
					  )) * cos((tmpvar_5 * 0.02)));
					  lowp vec4 tmpvar_8;
					  highp vec2 P_9;
					  P_9 = (tmpvar_7 * 5.0);
					  tmpvar_8 = texture2D (_MainTex, P_9);
					  t_3 = tmpvar_8;
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = sin((uv_4.x + (tmpvar_5 * 0.001)));
					  tmpvar_10.y = cos((uv_4.y + (tmpvar_5 * 0.005)));
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, tmpvar_10);
					  t2_2 = tmpvar_11;
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_MainTex, uv_4);
					  origine_1 = tmpvar_12;
					  highp vec4 tmpvar_13;
					  tmpvar_13.xw = vec2(0.0, 1.0);
					  tmpvar_13.y = (((
					    ((t_3.x * sin((tmpvar_5 * 
					      (sin((uv_4.y * 0.5)) + (0.01 * sin((
					        (uv_4.x * 5.0)
					       + tmpvar_6))))
					    ))) * sin(((
					      (((tmpvar_5 * 0.1) * t2_2.x) * (uv_4.x - sin((tmpvar_6 * 0.05))))
					     * 
					      sin(((uv_4.y - sin(
					        (tmpvar_5 * 0.035)
					      )) * 5.0))
					    ) + sin(
					      (0.1 * tmpvar_6)
					    ))))
					   * 0.5) + (
					    (t2_2.x * abs(sin((
					      (tmpvar_5 * (uv_4.x - 0.5))
					     * 
					      sin((uv_4.y + 0.5))
					    ))))
					   * 0.5)) + ((t_3.x * 
					    sin((((tmpvar_5 * 
					      (uv_4.x - sin((tmpvar_5 * 0.1)))
					    ) * sin(
					      (uv_4.y - sin((tmpvar_5 * 0.1)))
					    )) * 0.2))
					  ) * 0.1));
					  tmpvar_13.z = (((
					    ((t_3.x * sin((tmpvar_6 * 
					      (sin((uv_4.y * 0.25)) + (0.01 * sin((
					        (uv_4.x * 3.0)
					       + tmpvar_6))))
					    ))) * abs(sin((
					      ((((tmpvar_5 * 0.09) * t2_2.x) * (uv_4.x - sin(
					        (tmpvar_6 * 0.04)
					      ))) * sin(((uv_4.y - 
					        sin((tmpvar_5 * 0.035))
					      ) * 5.0)))
					     + 
					      sin((0.1 * tmpvar_6))
					    ))))
					   * 0.5) + (
					    (t2_2.x * abs(sin((
					      (tmpvar_5 * (uv_4.x - 0.5))
					     * 
					      sin((uv_4.y + 0.5))
					    ))))
					   * 0.5)) + ((t_3.x * 
					    abs(sin(((
					      (tmpvar_5 * (uv_4.x - sin((tmpvar_5 * 0.1))))
					     * 
					      sin((uv_4.y - sin((tmpvar_5 * 0.1))))
					    ) * 0.2)))
					  ) * 0.1));
					  highp vec4 tmpvar_14;
					  tmpvar_14 = (tmpvar_13 + origine_1);
					  gl_FragData[0] = tmpvar_14;
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
					  highp vec4 origine_1;
					  highp vec4 t2_2;
					  highp vec4 t_3;
					  highp vec2 uv_4;
					  highp float tmpvar_5;
					  tmpvar_5 = (1000.0 + (sin(
					    (_TimeX * 0.11)
					  ) * 20.0));
					  highp float tmpvar_6;
					  tmpvar_6 = (800.0 + (sin(
					    (_TimeX * 0.15)
					  ) * 22.0));
					  uv_4 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = (sin((uv_4.x + 
					    (tmpvar_5 * 0.005)
					  )) * cos((tmpvar_5 * 0.01)));
					  tmpvar_7.y = (cos((uv_4.y + 
					    (tmpvar_5 * 0.001)
					  )) * cos((tmpvar_5 * 0.02)));
					  lowp vec4 tmpvar_8;
					  highp vec2 P_9;
					  P_9 = (tmpvar_7 * 5.0);
					  tmpvar_8 = texture2D (_MainTex, P_9);
					  t_3 = tmpvar_8;
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = sin((uv_4.x + (tmpvar_5 * 0.001)));
					  tmpvar_10.y = cos((uv_4.y + (tmpvar_5 * 0.005)));
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, tmpvar_10);
					  t2_2 = tmpvar_11;
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_MainTex, uv_4);
					  origine_1 = tmpvar_12;
					  highp vec4 tmpvar_13;
					  tmpvar_13.xw = vec2(0.0, 1.0);
					  tmpvar_13.y = (((
					    ((t_3.x * sin((tmpvar_5 * 
					      (sin((uv_4.y * 0.5)) + (0.01 * sin((
					        (uv_4.x * 5.0)
					       + tmpvar_6))))
					    ))) * sin(((
					      (((tmpvar_5 * 0.1) * t2_2.x) * (uv_4.x - sin((tmpvar_6 * 0.05))))
					     * 
					      sin(((uv_4.y - sin(
					        (tmpvar_5 * 0.035)
					      )) * 5.0))
					    ) + sin(
					      (0.1 * tmpvar_6)
					    ))))
					   * 0.5) + (
					    (t2_2.x * abs(sin((
					      (tmpvar_5 * (uv_4.x - 0.5))
					     * 
					      sin((uv_4.y + 0.5))
					    ))))
					   * 0.5)) + ((t_3.x * 
					    sin((((tmpvar_5 * 
					      (uv_4.x - sin((tmpvar_5 * 0.1)))
					    ) * sin(
					      (uv_4.y - sin((tmpvar_5 * 0.1)))
					    )) * 0.2))
					  ) * 0.1));
					  tmpvar_13.z = (((
					    ((t_3.x * sin((tmpvar_6 * 
					      (sin((uv_4.y * 0.25)) + (0.01 * sin((
					        (uv_4.x * 3.0)
					       + tmpvar_6))))
					    ))) * abs(sin((
					      ((((tmpvar_5 * 0.09) * t2_2.x) * (uv_4.x - sin(
					        (tmpvar_6 * 0.04)
					      ))) * sin(((uv_4.y - 
					        sin((tmpvar_5 * 0.035))
					      ) * 5.0)))
					     + 
					      sin((0.1 * tmpvar_6))
					    ))))
					   * 0.5) + (
					    (t2_2.x * abs(sin((
					      (tmpvar_5 * (uv_4.x - 0.5))
					     * 
					      sin((uv_4.y + 0.5))
					    ))))
					   * 0.5)) + ((t_3.x * 
					    abs(sin(((
					      (tmpvar_5 * (uv_4.x - sin((tmpvar_5 * 0.1))))
					     * 
					      sin((uv_4.y - sin((tmpvar_5 * 0.1))))
					    ) * 0.2)))
					  ) * 0.1));
					  highp vec4 tmpvar_14;
					  tmpvar_14 = (tmpvar_13 + origine_1);
					  gl_FragData[0] = tmpvar_14;
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
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					lowp float u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					vec2 u_xlat10;
					lowp float u_xlat10_10;
					float u_xlat11;
					float u_xlat15;
					float u_xlat16;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.yy * vec2(0.5, 0.25);
					    u_xlat1 = vec4(_TimeX) * vec4(0.109999999, 0.150000006, 0.109999999, 0.150000006);
					    u_xlat1 = sin(u_xlat1);
					    u_xlat1 = u_xlat1 * vec4(20.0, 22.0, 20.0, 22.0) + vec4(1000.0, 800.0, 1000.0, 800.0);
					    u_xlat0.zw = vs_TEXCOORD0.xx * vec2(5.0, 3.0) + u_xlat1.ww;
					    u_xlat0 = sin(u_xlat0);
					    u_xlat0.xy = u_xlat0.zw * vec2(0.00999999978, 0.00999999978) + u_xlat0.xy;
					    u_xlat0.xy = vec2(u_xlat0.x * u_xlat1.z, u_xlat0.y * u_xlat1.w);
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat10.xy = u_xlat1.zz * vec2(0.00999999978, 0.0199999996);
					    u_xlat10.xy = cos(u_xlat10.xy);
					    u_xlat2 = u_xlat1.zzzz * vec4(0.00499999989, 0.00100000005, 0.00100000005, 0.00499999989) + vs_TEXCOORD0.xyxy;
					    u_xlat3.xy = sin(u_xlat2.xz);
					    u_xlat3.zw = cos(u_xlat2.yw);
					    u_xlat10.xy = u_xlat10.xy * u_xlat3.xz;
					    u_xlat10_2 = texture(_MainTex, u_xlat3.yw).x;
					    u_xlat10.xy = u_xlat10.xy * vec2(5.0, 5.0);
					    u_xlat10_10 = texture(_MainTex, u_xlat10.xy).x;
					    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat10_10);
					    u_xlat15 = u_xlat1.z * u_xlat10_2;
					    u_xlat15 = u_xlat15 * 0.0900000036;
					    u_xlat7 = u_xlat1.w * 0.0399999991;
					    u_xlat7 = sin((-u_xlat7));
					    u_xlat7 = u_xlat7 + vs_TEXCOORD0.x;
					    u_xlat15 = u_xlat15 * u_xlat7;
					    u_xlat3 = u_xlat1 * vec4(0.100000001, 0.0500000007, 0.0350000001, 0.100000001);
					    u_xlat4 = sin((-u_xlat3.yzxx));
					    u_xlat4 = u_xlat4 + vs_TEXCOORD0.xyxy;
					    u_xlat1.x = u_xlat4.y * 5.0;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat6 = sin(u_xlat3.w);
					    u_xlat16 = u_xlat10_2 * u_xlat3.x;
					    u_xlat16 = u_xlat4.x * u_xlat16;
					    u_xlat16 = u_xlat16 * u_xlat1.x + u_xlat6;
					    u_xlat15 = u_xlat15 * u_xlat1.x + u_xlat6;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat5 = abs(u_xlat15) * u_xlat0.y;
					    u_xlat15 = sin(u_xlat16);
					    u_xlat0.x = u_xlat15 * u_xlat0.x;
					    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, 0.5);
					    u_xlat15 = u_xlat1.x * u_xlat1.z;
					    u_xlat1.x = u_xlat1.z * u_xlat4.z;
					    u_xlat11 = sin(u_xlat4.w);
					    u_xlat1.x = u_xlat11 * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 0.200000003;
					    u_xlat1.xy = sin(u_xlat1.xy);
					    u_xlat15 = u_xlat15 * u_xlat1.y;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat15 = abs(u_xlat15) * u_xlat10_2;
					    u_xlat15 = u_xlat15 * 0.5;
					    u_xlat5 = u_xlat5 * 0.5 + u_xlat15;
					    u_xlat0.x = u_xlat0.x * 0.5 + u_xlat15;
					    u_xlat15 = u_xlat10_10 * abs(u_xlat1.x);
					    u_xlat10.x = u_xlat10_10 * u_xlat1.x;
					    u_xlat1.y = u_xlat10.x * 0.100000001 + u_xlat0.x;
					    u_xlat1.z = u_xlat15 * 0.100000001 + u_xlat5;
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.x = float(0.0);
					    u_xlat1.w = float(1.0);
					    SV_Target0 = u_xlat10_0 + u_xlat1;
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
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					lowp float u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					vec2 u_xlat10;
					lowp float u_xlat10_10;
					float u_xlat11;
					float u_xlat15;
					float u_xlat16;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.yy * vec2(0.5, 0.25);
					    u_xlat1 = vec4(_TimeX) * vec4(0.109999999, 0.150000006, 0.109999999, 0.150000006);
					    u_xlat1 = sin(u_xlat1);
					    u_xlat1 = u_xlat1 * vec4(20.0, 22.0, 20.0, 22.0) + vec4(1000.0, 800.0, 1000.0, 800.0);
					    u_xlat0.zw = vs_TEXCOORD0.xx * vec2(5.0, 3.0) + u_xlat1.ww;
					    u_xlat0 = sin(u_xlat0);
					    u_xlat0.xy = u_xlat0.zw * vec2(0.00999999978, 0.00999999978) + u_xlat0.xy;
					    u_xlat0.xy = vec2(u_xlat0.x * u_xlat1.z, u_xlat0.y * u_xlat1.w);
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat10.xy = u_xlat1.zz * vec2(0.00999999978, 0.0199999996);
					    u_xlat10.xy = cos(u_xlat10.xy);
					    u_xlat2 = u_xlat1.zzzz * vec4(0.00499999989, 0.00100000005, 0.00100000005, 0.00499999989) + vs_TEXCOORD0.xyxy;
					    u_xlat3.xy = sin(u_xlat2.xz);
					    u_xlat3.zw = cos(u_xlat2.yw);
					    u_xlat10.xy = u_xlat10.xy * u_xlat3.xz;
					    u_xlat10_2 = texture(_MainTex, u_xlat3.yw).x;
					    u_xlat10.xy = u_xlat10.xy * vec2(5.0, 5.0);
					    u_xlat10_10 = texture(_MainTex, u_xlat10.xy).x;
					    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat10_10);
					    u_xlat15 = u_xlat1.z * u_xlat10_2;
					    u_xlat15 = u_xlat15 * 0.0900000036;
					    u_xlat7 = u_xlat1.w * 0.0399999991;
					    u_xlat7 = sin((-u_xlat7));
					    u_xlat7 = u_xlat7 + vs_TEXCOORD0.x;
					    u_xlat15 = u_xlat15 * u_xlat7;
					    u_xlat3 = u_xlat1 * vec4(0.100000001, 0.0500000007, 0.0350000001, 0.100000001);
					    u_xlat4 = sin((-u_xlat3.yzxx));
					    u_xlat4 = u_xlat4 + vs_TEXCOORD0.xyxy;
					    u_xlat1.x = u_xlat4.y * 5.0;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat6 = sin(u_xlat3.w);
					    u_xlat16 = u_xlat10_2 * u_xlat3.x;
					    u_xlat16 = u_xlat4.x * u_xlat16;
					    u_xlat16 = u_xlat16 * u_xlat1.x + u_xlat6;
					    u_xlat15 = u_xlat15 * u_xlat1.x + u_xlat6;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat5 = abs(u_xlat15) * u_xlat0.y;
					    u_xlat15 = sin(u_xlat16);
					    u_xlat0.x = u_xlat15 * u_xlat0.x;
					    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, 0.5);
					    u_xlat15 = u_xlat1.x * u_xlat1.z;
					    u_xlat1.x = u_xlat1.z * u_xlat4.z;
					    u_xlat11 = sin(u_xlat4.w);
					    u_xlat1.x = u_xlat11 * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 0.200000003;
					    u_xlat1.xy = sin(u_xlat1.xy);
					    u_xlat15 = u_xlat15 * u_xlat1.y;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat15 = abs(u_xlat15) * u_xlat10_2;
					    u_xlat15 = u_xlat15 * 0.5;
					    u_xlat5 = u_xlat5 * 0.5 + u_xlat15;
					    u_xlat0.x = u_xlat0.x * 0.5 + u_xlat15;
					    u_xlat15 = u_xlat10_10 * abs(u_xlat1.x);
					    u_xlat10.x = u_xlat10_10 * u_xlat1.x;
					    u_xlat1.y = u_xlat10.x * 0.100000001 + u_xlat0.x;
					    u_xlat1.z = u_xlat15 * 0.100000001 + u_xlat5;
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.x = float(0.0);
					    u_xlat1.w = float(1.0);
					    SV_Target0 = u_xlat10_0 + u_xlat1;
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
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					lowp float u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					vec2 u_xlat10;
					lowp float u_xlat10_10;
					float u_xlat11;
					float u_xlat15;
					float u_xlat16;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.yy * vec2(0.5, 0.25);
					    u_xlat1 = vec4(_TimeX) * vec4(0.109999999, 0.150000006, 0.109999999, 0.150000006);
					    u_xlat1 = sin(u_xlat1);
					    u_xlat1 = u_xlat1 * vec4(20.0, 22.0, 20.0, 22.0) + vec4(1000.0, 800.0, 1000.0, 800.0);
					    u_xlat0.zw = vs_TEXCOORD0.xx * vec2(5.0, 3.0) + u_xlat1.ww;
					    u_xlat0 = sin(u_xlat0);
					    u_xlat0.xy = u_xlat0.zw * vec2(0.00999999978, 0.00999999978) + u_xlat0.xy;
					    u_xlat0.xy = vec2(u_xlat0.x * u_xlat1.z, u_xlat0.y * u_xlat1.w);
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat10.xy = u_xlat1.zz * vec2(0.00999999978, 0.0199999996);
					    u_xlat10.xy = cos(u_xlat10.xy);
					    u_xlat2 = u_xlat1.zzzz * vec4(0.00499999989, 0.00100000005, 0.00100000005, 0.00499999989) + vs_TEXCOORD0.xyxy;
					    u_xlat3.xy = sin(u_xlat2.xz);
					    u_xlat3.zw = cos(u_xlat2.yw);
					    u_xlat10.xy = u_xlat10.xy * u_xlat3.xz;
					    u_xlat10_2 = texture(_MainTex, u_xlat3.yw).x;
					    u_xlat10.xy = u_xlat10.xy * vec2(5.0, 5.0);
					    u_xlat10_10 = texture(_MainTex, u_xlat10.xy).x;
					    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat10_10);
					    u_xlat15 = u_xlat1.z * u_xlat10_2;
					    u_xlat15 = u_xlat15 * 0.0900000036;
					    u_xlat7 = u_xlat1.w * 0.0399999991;
					    u_xlat7 = sin((-u_xlat7));
					    u_xlat7 = u_xlat7 + vs_TEXCOORD0.x;
					    u_xlat15 = u_xlat15 * u_xlat7;
					    u_xlat3 = u_xlat1 * vec4(0.100000001, 0.0500000007, 0.0350000001, 0.100000001);
					    u_xlat4 = sin((-u_xlat3.yzxx));
					    u_xlat4 = u_xlat4 + vs_TEXCOORD0.xyxy;
					    u_xlat1.x = u_xlat4.y * 5.0;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat6 = sin(u_xlat3.w);
					    u_xlat16 = u_xlat10_2 * u_xlat3.x;
					    u_xlat16 = u_xlat4.x * u_xlat16;
					    u_xlat16 = u_xlat16 * u_xlat1.x + u_xlat6;
					    u_xlat15 = u_xlat15 * u_xlat1.x + u_xlat6;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat5 = abs(u_xlat15) * u_xlat0.y;
					    u_xlat15 = sin(u_xlat16);
					    u_xlat0.x = u_xlat15 * u_xlat0.x;
					    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, 0.5);
					    u_xlat15 = u_xlat1.x * u_xlat1.z;
					    u_xlat1.x = u_xlat1.z * u_xlat4.z;
					    u_xlat11 = sin(u_xlat4.w);
					    u_xlat1.x = u_xlat11 * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 0.200000003;
					    u_xlat1.xy = sin(u_xlat1.xy);
					    u_xlat15 = u_xlat15 * u_xlat1.y;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat15 = abs(u_xlat15) * u_xlat10_2;
					    u_xlat15 = u_xlat15 * 0.5;
					    u_xlat5 = u_xlat5 * 0.5 + u_xlat15;
					    u_xlat0.x = u_xlat0.x * 0.5 + u_xlat15;
					    u_xlat15 = u_xlat10_10 * abs(u_xlat1.x);
					    u_xlat10.x = u_xlat10_10 * u_xlat1.x;
					    u_xlat1.y = u_xlat10.x * 0.100000001 + u_xlat0.x;
					    u_xlat1.z = u_xlat15 * 0.100000001 + u_xlat5;
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.x = float(0.0);
					    u_xlat1.w = float(1.0);
					    SV_Target0 = u_xlat10_0 + u_xlat1;
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