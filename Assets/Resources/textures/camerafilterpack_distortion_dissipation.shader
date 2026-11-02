Shader "CameraFilterPack/Distortion_Dissipation" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 39780
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 uv_1;
					  uv_1 = xlv_TEXCOORD0;
					  highp float tmpvar_2;
					  tmpvar_2 = max (0.0, ((
					    ((fract((_Value / 3.0)) * 6.0) - uv_1.x)
					   - 1.0) + uv_1.y));
					  highp vec2 p_3;
					  p_3 = uv_1;
					  highp float t_4;
					  t_4 = (tmpvar_2 * tmpvar_2);
					  highp vec3 col_6;
					  col_6 = vec3(0.0, 0.0, 0.0);
					  for (highp int i_5 = 1; i_5 < 10; i_5++) {
					    highp vec2 p_7;
					    p_7 = (p_3 + vec2(0.5, 0.5));
					    highp vec2 x_8;
					    lowp vec4 tmpvar_9;
					    highp vec2 P_10;
					    P_10 = (p_7 * 0.001);
					    tmpvar_9 = texture2D (_MainTex, P_10);
					    x_8 = (tmpvar_9.xy - 0.5);
					    lowp vec4 tmpvar_11;
					    highp vec2 P_12;
					    P_12 = (0.002 * p_7);
					    tmpvar_11 = texture2D (_MainTex, P_12);
					    x_8 = (x_8 + ((tmpvar_11.xy - 0.5) / 2.0));
					    lowp vec4 tmpvar_13;
					    highp vec2 P_14;
					    P_14 = (0.004 * p_7);
					    tmpvar_13 = texture2D (_MainTex, P_14);
					    x_8 = (x_8 + ((tmpvar_13.xy - 0.5) / 4.0));
					    lowp vec4 tmpvar_15;
					    highp vec2 P_16;
					    P_16 = (0.008 * p_7);
					    tmpvar_15 = texture2D (_MainTex, P_16);
					    x_8 = (x_8 + ((tmpvar_15.xy - 0.5) / 8.0));
					    lowp vec4 tmpvar_17;
					    highp vec2 P_18;
					    P_18 = (0.016 * p_7);
					    tmpvar_17 = texture2D (_MainTex, P_18);
					    x_8 = (x_8 + ((tmpvar_17.xy - 0.5) / 16.0));
					    lowp vec4 tmpvar_19;
					    highp vec2 P_20;
					    P_20 = (0.032 * p_7);
					    tmpvar_19 = texture2D (_MainTex, P_20);
					    x_8 = (x_8 + ((tmpvar_19.xy - 0.5) / 32.0));
					    p_3 = (p_3 + ((
					      (x_8 * t_4)
					     * 0.01) / float(i_5)));
					    p_3.y = (p_3.y - (t_4 * 0.003));
					    highp vec3 col_21;
					    lowp vec3 tmpvar_22;
					    tmpvar_22 = texture2D (_MainTex, p_3).xyz;
					    col_21 = tmpvar_22;
					    col_6 = (col_6 + col_21);
					  };
					  highp vec4 tmpvar_23;
					  tmpvar_23.w = 1.0;
					  tmpvar_23.xyz = (col_6 / 10.0);
					  gl_FragData[0] = tmpvar_23;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 uv_1;
					  uv_1 = xlv_TEXCOORD0;
					  highp float tmpvar_2;
					  tmpvar_2 = max (0.0, ((
					    ((fract((_Value / 3.0)) * 6.0) - uv_1.x)
					   - 1.0) + uv_1.y));
					  highp vec2 p_3;
					  p_3 = uv_1;
					  highp float t_4;
					  t_4 = (tmpvar_2 * tmpvar_2);
					  highp vec3 col_6;
					  col_6 = vec3(0.0, 0.0, 0.0);
					  for (highp int i_5 = 1; i_5 < 10; i_5++) {
					    highp vec2 p_7;
					    p_7 = (p_3 + vec2(0.5, 0.5));
					    highp vec2 x_8;
					    lowp vec4 tmpvar_9;
					    highp vec2 P_10;
					    P_10 = (p_7 * 0.001);
					    tmpvar_9 = texture2D (_MainTex, P_10);
					    x_8 = (tmpvar_9.xy - 0.5);
					    lowp vec4 tmpvar_11;
					    highp vec2 P_12;
					    P_12 = (0.002 * p_7);
					    tmpvar_11 = texture2D (_MainTex, P_12);
					    x_8 = (x_8 + ((tmpvar_11.xy - 0.5) / 2.0));
					    lowp vec4 tmpvar_13;
					    highp vec2 P_14;
					    P_14 = (0.004 * p_7);
					    tmpvar_13 = texture2D (_MainTex, P_14);
					    x_8 = (x_8 + ((tmpvar_13.xy - 0.5) / 4.0));
					    lowp vec4 tmpvar_15;
					    highp vec2 P_16;
					    P_16 = (0.008 * p_7);
					    tmpvar_15 = texture2D (_MainTex, P_16);
					    x_8 = (x_8 + ((tmpvar_15.xy - 0.5) / 8.0));
					    lowp vec4 tmpvar_17;
					    highp vec2 P_18;
					    P_18 = (0.016 * p_7);
					    tmpvar_17 = texture2D (_MainTex, P_18);
					    x_8 = (x_8 + ((tmpvar_17.xy - 0.5) / 16.0));
					    lowp vec4 tmpvar_19;
					    highp vec2 P_20;
					    P_20 = (0.032 * p_7);
					    tmpvar_19 = texture2D (_MainTex, P_20);
					    x_8 = (x_8 + ((tmpvar_19.xy - 0.5) / 32.0));
					    p_3 = (p_3 + ((
					      (x_8 * t_4)
					     * 0.01) / float(i_5)));
					    p_3.y = (p_3.y - (t_4 * 0.003));
					    highp vec3 col_21;
					    lowp vec3 tmpvar_22;
					    tmpvar_22 = texture2D (_MainTex, p_3).xyz;
					    col_21 = tmpvar_22;
					    col_6 = (col_6 + col_21);
					  };
					  highp vec4 tmpvar_23;
					  tmpvar_23.w = 1.0;
					  tmpvar_23.xyz = (col_6 / 10.0);
					  gl_FragData[0] = tmpvar_23;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 uv_1;
					  uv_1 = xlv_TEXCOORD0;
					  highp float tmpvar_2;
					  tmpvar_2 = max (0.0, ((
					    ((fract((_Value / 3.0)) * 6.0) - uv_1.x)
					   - 1.0) + uv_1.y));
					  highp vec2 p_3;
					  p_3 = uv_1;
					  highp float t_4;
					  t_4 = (tmpvar_2 * tmpvar_2);
					  highp vec3 col_6;
					  col_6 = vec3(0.0, 0.0, 0.0);
					  for (highp int i_5 = 1; i_5 < 10; i_5++) {
					    highp vec2 p_7;
					    p_7 = (p_3 + vec2(0.5, 0.5));
					    highp vec2 x_8;
					    lowp vec4 tmpvar_9;
					    highp vec2 P_10;
					    P_10 = (p_7 * 0.001);
					    tmpvar_9 = texture2D (_MainTex, P_10);
					    x_8 = (tmpvar_9.xy - 0.5);
					    lowp vec4 tmpvar_11;
					    highp vec2 P_12;
					    P_12 = (0.002 * p_7);
					    tmpvar_11 = texture2D (_MainTex, P_12);
					    x_8 = (x_8 + ((tmpvar_11.xy - 0.5) / 2.0));
					    lowp vec4 tmpvar_13;
					    highp vec2 P_14;
					    P_14 = (0.004 * p_7);
					    tmpvar_13 = texture2D (_MainTex, P_14);
					    x_8 = (x_8 + ((tmpvar_13.xy - 0.5) / 4.0));
					    lowp vec4 tmpvar_15;
					    highp vec2 P_16;
					    P_16 = (0.008 * p_7);
					    tmpvar_15 = texture2D (_MainTex, P_16);
					    x_8 = (x_8 + ((tmpvar_15.xy - 0.5) / 8.0));
					    lowp vec4 tmpvar_17;
					    highp vec2 P_18;
					    P_18 = (0.016 * p_7);
					    tmpvar_17 = texture2D (_MainTex, P_18);
					    x_8 = (x_8 + ((tmpvar_17.xy - 0.5) / 16.0));
					    lowp vec4 tmpvar_19;
					    highp vec2 P_20;
					    P_20 = (0.032 * p_7);
					    tmpvar_19 = texture2D (_MainTex, P_20);
					    x_8 = (x_8 + ((tmpvar_19.xy - 0.5) / 32.0));
					    p_3 = (p_3 + ((
					      (x_8 * t_4)
					     * 0.01) / float(i_5)));
					    p_3.y = (p_3.y - (t_4 * 0.003));
					    highp vec3 col_21;
					    lowp vec3 tmpvar_22;
					    tmpvar_22 = texture2D (_MainTex, p_3).xyz;
					    col_21 = tmpvar_22;
					    col_6 = (col_6 + col_21);
					  };
					  highp vec4 tmpvar_23;
					  tmpvar_23.w = 1.0;
					  tmpvar_23.xyz = (col_6 / 10.0);
					  gl_FragData[0] = tmpvar_23;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					vec3 u_xlat1;
					vec2 u_xlat2;
					bool u_xlatb2;
					float u_xlat3;
					lowp vec3 u_xlat10_3;
					int u_xlati3;
					vec3 u_xlat4;
					vec2 u_xlat7;
					bool u_xlatb7;
					vec2 u_xlat10;
					vec2 u_xlat11;
					mediump vec2 u_xlat16_11;
					lowp vec2 u_xlat10_11;
					int u_xlati13;
					void main()
					{
					    u_xlat0 = _Value * 0.333333343;
					    u_xlat0 = fract(u_xlat0);
					    u_xlat0 = u_xlat0 * 6.0 + (-vs_TEXCOORD0.x);
					    u_xlat0 = u_xlat0 + -1.0;
					    u_xlat0 = u_xlat0 + vs_TEXCOORD0.y;
					    u_xlat0 = max(u_xlat0, 0.0);
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat1.xy = vs_TEXCOORD0.xy;
					    for(int u_xlati_loop_1 = 1 ; u_xlati_loop_1<10 ; u_xlati_loop_1++)
					    {
					        u_xlat2.xy = u_xlat1.xy + vec2(0.5, 0.5);
					        u_xlat10.x = float(0.0);
					        u_xlat10.y = float(0.0);
					        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<6 ; u_xlati_loop_2++)
					        {
					            u_xlat7.x = float(u_xlati_loop_2);
					            u_xlat7.x = exp2(u_xlat7.x);
					            u_xlat11.xy = u_xlat2.xy * u_xlat7.xx;
					            u_xlat11.xy = u_xlat11.xy * vec2(0.00100000005, 0.00100000005);
					            u_xlat10_11.xy = texture(_MainTex, u_xlat11.xy).xy;
					            u_xlat16_11.xy = u_xlat10_11.xy + vec2(-0.5, -0.5);
					            u_xlat7.xy = u_xlat16_11.xy / u_xlat7.xx;
					            u_xlat10.xy = u_xlat10.xy + u_xlat7.xy;
					        }
					        u_xlat2.xy = vec2(u_xlat0) * u_xlat10.xy;
					        u_xlat2.xy = u_xlat2.xy * vec2(0.00999999978, 0.00999999978);
					        u_xlat3 = float(u_xlati_loop_1);
					        u_xlat2.xy = u_xlat2.xy / vec2(u_xlat3);
					        u_xlat1.xz = u_xlat1.xy + u_xlat2.xy;
					        u_xlat1.y = (-u_xlat0) * 0.00300000003 + u_xlat1.z;
					        u_xlat10_3.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					        u_xlat4.xyz = u_xlat4.xyz + u_xlat10_3.xyz;
					    }
					    SV_Target0.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					vec3 u_xlat1;
					vec2 u_xlat2;
					bool u_xlatb2;
					float u_xlat3;
					lowp vec3 u_xlat10_3;
					int u_xlati3;
					vec3 u_xlat4;
					vec2 u_xlat7;
					bool u_xlatb7;
					vec2 u_xlat10;
					vec2 u_xlat11;
					mediump vec2 u_xlat16_11;
					lowp vec2 u_xlat10_11;
					int u_xlati13;
					void main()
					{
					    u_xlat0 = _Value * 0.333333343;
					    u_xlat0 = fract(u_xlat0);
					    u_xlat0 = u_xlat0 * 6.0 + (-vs_TEXCOORD0.x);
					    u_xlat0 = u_xlat0 + -1.0;
					    u_xlat0 = u_xlat0 + vs_TEXCOORD0.y;
					    u_xlat0 = max(u_xlat0, 0.0);
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat1.xy = vs_TEXCOORD0.xy;
					    for(int u_xlati_loop_1 = 1 ; u_xlati_loop_1<10 ; u_xlati_loop_1++)
					    {
					        u_xlat2.xy = u_xlat1.xy + vec2(0.5, 0.5);
					        u_xlat10.x = float(0.0);
					        u_xlat10.y = float(0.0);
					        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<6 ; u_xlati_loop_2++)
					        {
					            u_xlat7.x = float(u_xlati_loop_2);
					            u_xlat7.x = exp2(u_xlat7.x);
					            u_xlat11.xy = u_xlat2.xy * u_xlat7.xx;
					            u_xlat11.xy = u_xlat11.xy * vec2(0.00100000005, 0.00100000005);
					            u_xlat10_11.xy = texture(_MainTex, u_xlat11.xy).xy;
					            u_xlat16_11.xy = u_xlat10_11.xy + vec2(-0.5, -0.5);
					            u_xlat7.xy = u_xlat16_11.xy / u_xlat7.xx;
					            u_xlat10.xy = u_xlat10.xy + u_xlat7.xy;
					        }
					        u_xlat2.xy = vec2(u_xlat0) * u_xlat10.xy;
					        u_xlat2.xy = u_xlat2.xy * vec2(0.00999999978, 0.00999999978);
					        u_xlat3 = float(u_xlati_loop_1);
					        u_xlat2.xy = u_xlat2.xy / vec2(u_xlat3);
					        u_xlat1.xz = u_xlat1.xy + u_xlat2.xy;
					        u_xlat1.y = (-u_xlat0) * 0.00300000003 + u_xlat1.z;
					        u_xlat10_3.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					        u_xlat4.xyz = u_xlat4.xyz + u_xlat10_3.xyz;
					    }
					    SV_Target0.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					vec3 u_xlat1;
					vec2 u_xlat2;
					bool u_xlatb2;
					float u_xlat3;
					lowp vec3 u_xlat10_3;
					int u_xlati3;
					vec3 u_xlat4;
					vec2 u_xlat7;
					bool u_xlatb7;
					vec2 u_xlat10;
					vec2 u_xlat11;
					mediump vec2 u_xlat16_11;
					lowp vec2 u_xlat10_11;
					int u_xlati13;
					void main()
					{
					    u_xlat0 = _Value * 0.333333343;
					    u_xlat0 = fract(u_xlat0);
					    u_xlat0 = u_xlat0 * 6.0 + (-vs_TEXCOORD0.x);
					    u_xlat0 = u_xlat0 + -1.0;
					    u_xlat0 = u_xlat0 + vs_TEXCOORD0.y;
					    u_xlat0 = max(u_xlat0, 0.0);
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat1.xy = vs_TEXCOORD0.xy;
					    for(int u_xlati_loop_1 = 1 ; u_xlati_loop_1<10 ; u_xlati_loop_1++)
					    {
					        u_xlat2.xy = u_xlat1.xy + vec2(0.5, 0.5);
					        u_xlat10.x = float(0.0);
					        u_xlat10.y = float(0.0);
					        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<6 ; u_xlati_loop_2++)
					        {
					            u_xlat7.x = float(u_xlati_loop_2);
					            u_xlat7.x = exp2(u_xlat7.x);
					            u_xlat11.xy = u_xlat2.xy * u_xlat7.xx;
					            u_xlat11.xy = u_xlat11.xy * vec2(0.00100000005, 0.00100000005);
					            u_xlat10_11.xy = texture(_MainTex, u_xlat11.xy).xy;
					            u_xlat16_11.xy = u_xlat10_11.xy + vec2(-0.5, -0.5);
					            u_xlat7.xy = u_xlat16_11.xy / u_xlat7.xx;
					            u_xlat10.xy = u_xlat10.xy + u_xlat7.xy;
					        }
					        u_xlat2.xy = vec2(u_xlat0) * u_xlat10.xy;
					        u_xlat2.xy = u_xlat2.xy * vec2(0.00999999978, 0.00999999978);
					        u_xlat3 = float(u_xlati_loop_1);
					        u_xlat2.xy = u_xlat2.xy / vec2(u_xlat3);
					        u_xlat1.xz = u_xlat1.xy + u_xlat2.xy;
					        u_xlat1.y = (-u_xlat0) * 0.00300000003 + u_xlat1.z;
					        u_xlat10_3.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					        u_xlat4.xyz = u_xlat4.xyz + u_xlat10_3.xyz;
					    }
					    SV_Target0.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
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