Shader "CameraFilterPack/Blur_GaussianBlur" {
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
			GpuProgramID 11665
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
					uniform highp float _Distortion;
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = xlv_TEXCOORD0;
					  highp float Z_3;
					  highp vec3 final_colour_4;
					  highp float kernel_5[6];
					  final_colour_4 = vec3(0.0, 0.0, 0.0);
					  kernel_5[0] = 0.0;
					  kernel_5[1] = 0.0;
					  kernel_5[2] = 0.0;
					  kernel_5[3] = 0.0;
					  kernel_5[4] = 0.0;
					  kernel_5[5] = 0.0;
					  kernel_5[2] = 0.4;
					  kernel_5[2] = 0.4;
					  kernel_5[(2 - 1)] = 0.4;
					  kernel_5[(2 + 1)] = 0.4;
					  kernel_5[(2 - 2)] = 0.4;
					  kernel_5[(2 + 2)] = 0.4;
					  Z_3 = kernel_5[0];
					  Z_3 = (Z_3 + kernel_5[1]);
					  Z_3 = (Z_3 + kernel_5[2]);
					  Z_3 = (Z_3 + kernel_5[3]);
					  Z_3 = (Z_3 + kernel_5[4]);
					  Z_3 = (Z_3 + kernel_5[5]);
					  for (highp int u_2 = -2; u_2 <= 2; u_2++) {
					    highp vec2 tmpvar_6;
					    tmpvar_6.x = (float(u_2) * _Distortion);
					    tmpvar_6.y = (-2.0 * _Distortion);
					    lowp vec4 tmpvar_7;
					    highp vec2 P_8;
					    P_8 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_6) / _ScreenResolution.xy);
					    tmpvar_7 = texture2D (_MainTex, P_8);
					    final_colour_4 = (final_colour_4 + ((kernel_5[0] * kernel_5[
					      (2 + u_2)
					    ]) * tmpvar_7.xyz));
					    highp vec2 tmpvar_9;
					    tmpvar_9.x = (float(u_2) * _Distortion);
					    tmpvar_9.y = -(_Distortion);
					    lowp vec4 tmpvar_10;
					    highp vec2 P_11;
					    P_11 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_9) / _ScreenResolution.xy);
					    tmpvar_10 = texture2D (_MainTex, P_11);
					    final_colour_4 = (final_colour_4 + ((kernel_5[1] * kernel_5[
					      (2 + u_2)
					    ]) * tmpvar_10.xyz));
					    highp vec2 tmpvar_12;
					    tmpvar_12.x = (float(u_2) * _Distortion);
					    tmpvar_12.y = 0.0;
					    lowp vec4 tmpvar_13;
					    highp vec2 P_14;
					    P_14 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_12) / _ScreenResolution.xy);
					    tmpvar_13 = texture2D (_MainTex, P_14);
					    final_colour_4 = (final_colour_4 + ((kernel_5[2] * kernel_5[
					      (2 + u_2)
					    ]) * tmpvar_13.xyz));
					    highp vec2 tmpvar_15;
					    tmpvar_15.x = (float(u_2) * _Distortion);
					    tmpvar_15.y = _Distortion;
					    lowp vec4 tmpvar_16;
					    highp vec2 P_17;
					    P_17 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_15) / _ScreenResolution.xy);
					    tmpvar_16 = texture2D (_MainTex, P_17);
					    final_colour_4 = (final_colour_4 + ((kernel_5[3] * kernel_5[
					      (2 + u_2)
					    ]) * tmpvar_16.xyz));
					    highp vec2 tmpvar_18;
					    tmpvar_18.x = (float(u_2) * _Distortion);
					    tmpvar_18.y = (2.0 * _Distortion);
					    lowp vec4 tmpvar_19;
					    highp vec2 P_20;
					    P_20 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_18) / _ScreenResolution.xy);
					    tmpvar_19 = texture2D (_MainTex, P_20);
					    final_colour_4 = (final_colour_4 + ((kernel_5[4] * kernel_5[
					      (2 + u_2)
					    ]) * tmpvar_19.xyz));
					  };
					  highp vec4 tmpvar_21;
					  tmpvar_21.w = 1.0;
					  tmpvar_21.xyz = (final_colour_4 / (Z_3 * Z_3));
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
					uniform highp float _Distortion;
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = xlv_TEXCOORD0;
					  highp float Z_3;
					  highp vec3 final_colour_4;
					  highp float kernel_5[6];
					  final_colour_4 = vec3(0.0, 0.0, 0.0);
					  kernel_5[0] = 0.0;
					  kernel_5[1] = 0.0;
					  kernel_5[2] = 0.0;
					  kernel_5[3] = 0.0;
					  kernel_5[4] = 0.0;
					  kernel_5[5] = 0.0;
					  kernel_5[2] = 0.4;
					  kernel_5[2] = 0.4;
					  kernel_5[(2 - 1)] = 0.4;
					  kernel_5[(2 + 1)] = 0.4;
					  kernel_5[(2 - 2)] = 0.4;
					  kernel_5[(2 + 2)] = 0.4;
					  Z_3 = kernel_5[0];
					  Z_3 = (Z_3 + kernel_5[1]);
					  Z_3 = (Z_3 + kernel_5[2]);
					  Z_3 = (Z_3 + kernel_5[3]);
					  Z_3 = (Z_3 + kernel_5[4]);
					  Z_3 = (Z_3 + kernel_5[5]);
					  for (highp int u_2 = -2; u_2 <= 2; u_2++) {
					    highp vec2 tmpvar_6;
					    tmpvar_6.x = (float(u_2) * _Distortion);
					    tmpvar_6.y = (-2.0 * _Distortion);
					    lowp vec4 tmpvar_7;
					    highp vec2 P_8;
					    P_8 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_6) / _ScreenResolution.xy);
					    tmpvar_7 = texture2D (_MainTex, P_8);
					    final_colour_4 = (final_colour_4 + ((kernel_5[0] * kernel_5[
					      (2 + u_2)
					    ]) * tmpvar_7.xyz));
					    highp vec2 tmpvar_9;
					    tmpvar_9.x = (float(u_2) * _Distortion);
					    tmpvar_9.y = -(_Distortion);
					    lowp vec4 tmpvar_10;
					    highp vec2 P_11;
					    P_11 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_9) / _ScreenResolution.xy);
					    tmpvar_10 = texture2D (_MainTex, P_11);
					    final_colour_4 = (final_colour_4 + ((kernel_5[1] * kernel_5[
					      (2 + u_2)
					    ]) * tmpvar_10.xyz));
					    highp vec2 tmpvar_12;
					    tmpvar_12.x = (float(u_2) * _Distortion);
					    tmpvar_12.y = 0.0;
					    lowp vec4 tmpvar_13;
					    highp vec2 P_14;
					    P_14 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_12) / _ScreenResolution.xy);
					    tmpvar_13 = texture2D (_MainTex, P_14);
					    final_colour_4 = (final_colour_4 + ((kernel_5[2] * kernel_5[
					      (2 + u_2)
					    ]) * tmpvar_13.xyz));
					    highp vec2 tmpvar_15;
					    tmpvar_15.x = (float(u_2) * _Distortion);
					    tmpvar_15.y = _Distortion;
					    lowp vec4 tmpvar_16;
					    highp vec2 P_17;
					    P_17 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_15) / _ScreenResolution.xy);
					    tmpvar_16 = texture2D (_MainTex, P_17);
					    final_colour_4 = (final_colour_4 + ((kernel_5[3] * kernel_5[
					      (2 + u_2)
					    ]) * tmpvar_16.xyz));
					    highp vec2 tmpvar_18;
					    tmpvar_18.x = (float(u_2) * _Distortion);
					    tmpvar_18.y = (2.0 * _Distortion);
					    lowp vec4 tmpvar_19;
					    highp vec2 P_20;
					    P_20 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_18) / _ScreenResolution.xy);
					    tmpvar_19 = texture2D (_MainTex, P_20);
					    final_colour_4 = (final_colour_4 + ((kernel_5[4] * kernel_5[
					      (2 + u_2)
					    ]) * tmpvar_19.xyz));
					  };
					  highp vec4 tmpvar_21;
					  tmpvar_21.w = 1.0;
					  tmpvar_21.xyz = (final_colour_4 / (Z_3 * Z_3));
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
					uniform highp float _Distortion;
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = xlv_TEXCOORD0;
					  highp float Z_3;
					  highp vec3 final_colour_4;
					  highp float kernel_5[6];
					  final_colour_4 = vec3(0.0, 0.0, 0.0);
					  kernel_5[0] = 0.0;
					  kernel_5[1] = 0.0;
					  kernel_5[2] = 0.0;
					  kernel_5[3] = 0.0;
					  kernel_5[4] = 0.0;
					  kernel_5[5] = 0.0;
					  kernel_5[2] = 0.4;
					  kernel_5[2] = 0.4;
					  kernel_5[(2 - 1)] = 0.4;
					  kernel_5[(2 + 1)] = 0.4;
					  kernel_5[(2 - 2)] = 0.4;
					  kernel_5[(2 + 2)] = 0.4;
					  Z_3 = kernel_5[0];
					  Z_3 = (Z_3 + kernel_5[1]);
					  Z_3 = (Z_3 + kernel_5[2]);
					  Z_3 = (Z_3 + kernel_5[3]);
					  Z_3 = (Z_3 + kernel_5[4]);
					  Z_3 = (Z_3 + kernel_5[5]);
					  for (highp int u_2 = -2; u_2 <= 2; u_2++) {
					    highp vec2 tmpvar_6;
					    tmpvar_6.x = (float(u_2) * _Distortion);
					    tmpvar_6.y = (-2.0 * _Distortion);
					    lowp vec4 tmpvar_7;
					    highp vec2 P_8;
					    P_8 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_6) / _ScreenResolution.xy);
					    tmpvar_7 = texture2D (_MainTex, P_8);
					    final_colour_4 = (final_colour_4 + ((kernel_5[0] * kernel_5[
					      (2 + u_2)
					    ]) * tmpvar_7.xyz));
					    highp vec2 tmpvar_9;
					    tmpvar_9.x = (float(u_2) * _Distortion);
					    tmpvar_9.y = -(_Distortion);
					    lowp vec4 tmpvar_10;
					    highp vec2 P_11;
					    P_11 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_9) / _ScreenResolution.xy);
					    tmpvar_10 = texture2D (_MainTex, P_11);
					    final_colour_4 = (final_colour_4 + ((kernel_5[1] * kernel_5[
					      (2 + u_2)
					    ]) * tmpvar_10.xyz));
					    highp vec2 tmpvar_12;
					    tmpvar_12.x = (float(u_2) * _Distortion);
					    tmpvar_12.y = 0.0;
					    lowp vec4 tmpvar_13;
					    highp vec2 P_14;
					    P_14 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_12) / _ScreenResolution.xy);
					    tmpvar_13 = texture2D (_MainTex, P_14);
					    final_colour_4 = (final_colour_4 + ((kernel_5[2] * kernel_5[
					      (2 + u_2)
					    ]) * tmpvar_13.xyz));
					    highp vec2 tmpvar_15;
					    tmpvar_15.x = (float(u_2) * _Distortion);
					    tmpvar_15.y = _Distortion;
					    lowp vec4 tmpvar_16;
					    highp vec2 P_17;
					    P_17 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_15) / _ScreenResolution.xy);
					    tmpvar_16 = texture2D (_MainTex, P_17);
					    final_colour_4 = (final_colour_4 + ((kernel_5[3] * kernel_5[
					      (2 + u_2)
					    ]) * tmpvar_16.xyz));
					    highp vec2 tmpvar_18;
					    tmpvar_18.x = (float(u_2) * _Distortion);
					    tmpvar_18.y = (2.0 * _Distortion);
					    lowp vec4 tmpvar_19;
					    highp vec2 P_20;
					    P_20 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_18) / _ScreenResolution.xy);
					    tmpvar_19 = texture2D (_MainTex, P_20);
					    final_colour_4 = (final_colour_4 + ((kernel_5[4] * kernel_5[
					      (2 + u_2)
					    ]) * tmpvar_19.xyz));
					  };
					  highp vec4 tmpvar_21;
					  tmpvar_21.w = 1.0;
					  tmpvar_21.xyz = (final_colour_4 / (Z_3 * Z_3));
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
					uniform 	float _Distortion;
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					float u_xlat1;
					ivec2 u_xlati1;
					bool u_xlatb1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					lowp vec3 u_xlat10_4;
					vec2 u_xlat7;
					float u_xlat11;
					int u_xlati11;
					float u_xlat12;
					ivec2 u_xlati12;
					int u_xlati15;
					float u_xlat16;
					bool u_xlatb16;
					vec4 TempArray0[6];
					void main()
					{
					    TempArray0[5].x = 0.0;
					    TempArray0[2].x = 0.400000006;
					    TempArray0[1].x = 0.400000006;
					    TempArray0[3].x = 0.400000006;
					    TempArray0[0].x = 0.400000006;
					    TempArray0[4].x = 0.400000006;
					    u_xlat0.x = float(0.0);
					    u_xlat0.y = float(0.0);
					    u_xlat0.z = float(0.0);
					    u_xlati15 = int(int(0xFFFFFFFEu));
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb1 = !!(2<u_xlati15);
					#else
					        u_xlatb1 = 2<u_xlati15;
					#endif
					        if(u_xlatb1){break;}
					        u_xlati1.xy = ivec2(u_xlati15) + ivec2(2, 1);
					        u_xlat1 = TempArray0[u_xlati1.x].x;
					        u_xlat11 = float(u_xlati15);
					        u_xlat2.x = u_xlat11 * _Distortion;
					        u_xlat3.xyz = u_xlat0.xyz;
					        u_xlati11 = int(0xFFFFFFFEu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb16 = !!(2<u_xlati11);
					#else
					            u_xlatb16 = 2<u_xlati11;
					#endif
					            if(u_xlatb16){break;}
					            u_xlati12.xy = ivec2(u_xlati11) + ivec2(2, 1);
					            u_xlat16 = TempArray0[u_xlati12.x].x;
					            u_xlat16 = u_xlat1 * u_xlat16;
					            u_xlat12 = float(u_xlati11);
					            u_xlat2.y = u_xlat12 * _Distortion;
					            u_xlat7.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat2.xy;
					            u_xlat7.xy = u_xlat7.xy / _ScreenResolution.xy;
					            u_xlat10_4.xyz = texture(_MainTex, u_xlat7.xy).xyz;
					            u_xlat3.xyz = vec3(u_xlat16) * u_xlat10_4.xyz + u_xlat3.xyz;
					            u_xlati11 = u_xlati12.y;
					        }
					        u_xlat0.xyz = u_xlat3.xyz;
					        u_xlati15 = u_xlati1.y;
					    }
					    SV_Target0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
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
					uniform 	float _Distortion;
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					float u_xlat1;
					ivec2 u_xlati1;
					bool u_xlatb1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					lowp vec3 u_xlat10_4;
					vec2 u_xlat7;
					float u_xlat11;
					int u_xlati11;
					float u_xlat12;
					ivec2 u_xlati12;
					int u_xlati15;
					float u_xlat16;
					bool u_xlatb16;
					vec4 TempArray0[6];
					void main()
					{
					    TempArray0[5].x = 0.0;
					    TempArray0[2].x = 0.400000006;
					    TempArray0[1].x = 0.400000006;
					    TempArray0[3].x = 0.400000006;
					    TempArray0[0].x = 0.400000006;
					    TempArray0[4].x = 0.400000006;
					    u_xlat0.x = float(0.0);
					    u_xlat0.y = float(0.0);
					    u_xlat0.z = float(0.0);
					    u_xlati15 = int(int(0xFFFFFFFEu));
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb1 = !!(2<u_xlati15);
					#else
					        u_xlatb1 = 2<u_xlati15;
					#endif
					        if(u_xlatb1){break;}
					        u_xlati1.xy = ivec2(u_xlati15) + ivec2(2, 1);
					        u_xlat1 = TempArray0[u_xlati1.x].x;
					        u_xlat11 = float(u_xlati15);
					        u_xlat2.x = u_xlat11 * _Distortion;
					        u_xlat3.xyz = u_xlat0.xyz;
					        u_xlati11 = int(0xFFFFFFFEu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb16 = !!(2<u_xlati11);
					#else
					            u_xlatb16 = 2<u_xlati11;
					#endif
					            if(u_xlatb16){break;}
					            u_xlati12.xy = ivec2(u_xlati11) + ivec2(2, 1);
					            u_xlat16 = TempArray0[u_xlati12.x].x;
					            u_xlat16 = u_xlat1 * u_xlat16;
					            u_xlat12 = float(u_xlati11);
					            u_xlat2.y = u_xlat12 * _Distortion;
					            u_xlat7.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat2.xy;
					            u_xlat7.xy = u_xlat7.xy / _ScreenResolution.xy;
					            u_xlat10_4.xyz = texture(_MainTex, u_xlat7.xy).xyz;
					            u_xlat3.xyz = vec3(u_xlat16) * u_xlat10_4.xyz + u_xlat3.xyz;
					            u_xlati11 = u_xlati12.y;
					        }
					        u_xlat0.xyz = u_xlat3.xyz;
					        u_xlati15 = u_xlati1.y;
					    }
					    SV_Target0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
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
					uniform 	float _Distortion;
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					float u_xlat1;
					ivec2 u_xlati1;
					bool u_xlatb1;
					vec2 u_xlat2;
					vec3 u_xlat3;
					lowp vec3 u_xlat10_4;
					vec2 u_xlat7;
					float u_xlat11;
					int u_xlati11;
					float u_xlat12;
					ivec2 u_xlati12;
					int u_xlati15;
					float u_xlat16;
					bool u_xlatb16;
					vec4 TempArray0[6];
					void main()
					{
					    TempArray0[5].x = 0.0;
					    TempArray0[2].x = 0.400000006;
					    TempArray0[1].x = 0.400000006;
					    TempArray0[3].x = 0.400000006;
					    TempArray0[0].x = 0.400000006;
					    TempArray0[4].x = 0.400000006;
					    u_xlat0.x = float(0.0);
					    u_xlat0.y = float(0.0);
					    u_xlat0.z = float(0.0);
					    u_xlati15 = int(int(0xFFFFFFFEu));
					    while(true){
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb1 = !!(2<u_xlati15);
					#else
					        u_xlatb1 = 2<u_xlati15;
					#endif
					        if(u_xlatb1){break;}
					        u_xlati1.xy = ivec2(u_xlati15) + ivec2(2, 1);
					        u_xlat1 = TempArray0[u_xlati1.x].x;
					        u_xlat11 = float(u_xlati15);
					        u_xlat2.x = u_xlat11 * _Distortion;
					        u_xlat3.xyz = u_xlat0.xyz;
					        u_xlati11 = int(0xFFFFFFFEu);
					        while(true){
					#ifdef UNITY_ADRENO_ES3
					            u_xlatb16 = !!(2<u_xlati11);
					#else
					            u_xlatb16 = 2<u_xlati11;
					#endif
					            if(u_xlatb16){break;}
					            u_xlati12.xy = ivec2(u_xlati11) + ivec2(2, 1);
					            u_xlat16 = TempArray0[u_xlati12.x].x;
					            u_xlat16 = u_xlat1 * u_xlat16;
					            u_xlat12 = float(u_xlati11);
					            u_xlat2.y = u_xlat12 * _Distortion;
					            u_xlat7.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat2.xy;
					            u_xlat7.xy = u_xlat7.xy / _ScreenResolution.xy;
					            u_xlat10_4.xyz = texture(_MainTex, u_xlat7.xy).xyz;
					            u_xlat3.xyz = vec3(u_xlat16) * u_xlat10_4.xyz + u_xlat3.xyz;
					            u_xlati11 = u_xlati12.y;
					        }
					        u_xlat0.xyz = u_xlat3.xyz;
					        u_xlati15 = u_xlati1.y;
					    }
					    SV_Target0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
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