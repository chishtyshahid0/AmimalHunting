Shader "CameraFilterPack/BlurHole" {
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
			GpuProgramID 54151
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
					uniform highp float _Radius;
					uniform highp float _SpotSize;
					uniform highp float _CenterX;
					uniform highp float _CenterY;
					uniform highp float _Alpha;
					uniform highp float _Alpha2;
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = xlv_TEXCOORD0;
					  highp vec3 cm_2;
					  highp float Z_4;
					  highp vec3 final_colour_5;
					  highp float kernel_6[6];
					  final_colour_5 = vec3(0.0, 0.0, 0.0);
					  kernel_6[0] = 0.0;
					  kernel_6[1] = 0.0;
					  kernel_6[2] = 0.0;
					  kernel_6[3] = 0.0;
					  kernel_6[4] = 0.0;
					  kernel_6[5] = 0.0;
					  kernel_6[2] = 0.4;
					  kernel_6[2] = 0.4;
					  kernel_6[(2 - 1)] = 0.4;
					  kernel_6[(2 + 1)] = 0.4;
					  kernel_6[(2 - 2)] = 0.4;
					  kernel_6[(2 + 2)] = 0.4;
					  Z_4 = kernel_6[0];
					  Z_4 = (Z_4 + kernel_6[1]);
					  Z_4 = (Z_4 + kernel_6[2]);
					  Z_4 = (Z_4 + kernel_6[3]);
					  Z_4 = (Z_4 + kernel_6[4]);
					  Z_4 = (Z_4 + kernel_6[5]);
					  for (highp int u_3 = -2; u_3 <= 2; u_3++) {
					    highp vec2 tmpvar_7;
					    tmpvar_7.x = (float(u_3) * _Distortion);
					    tmpvar_7.y = (-2.0 * _Distortion);
					    lowp vec4 tmpvar_8;
					    highp vec2 P_9;
					    P_9 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_7) / _ScreenResolution.xy);
					    tmpvar_8 = texture2D (_MainTex, P_9);
					    final_colour_5 = (final_colour_5 + ((kernel_6[0] * kernel_6[
					      (2 + u_3)
					    ]) * tmpvar_8.xyz));
					    highp vec2 tmpvar_10;
					    tmpvar_10.x = (float(u_3) * _Distortion);
					    tmpvar_10.y = -(_Distortion);
					    lowp vec4 tmpvar_11;
					    highp vec2 P_12;
					    P_12 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_10) / _ScreenResolution.xy);
					    tmpvar_11 = texture2D (_MainTex, P_12);
					    final_colour_5 = (final_colour_5 + ((kernel_6[1] * kernel_6[
					      (2 + u_3)
					    ]) * tmpvar_11.xyz));
					    highp vec2 tmpvar_13;
					    tmpvar_13.x = (float(u_3) * _Distortion);
					    tmpvar_13.y = 0.0;
					    lowp vec4 tmpvar_14;
					    highp vec2 P_15;
					    P_15 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_13) / _ScreenResolution.xy);
					    tmpvar_14 = texture2D (_MainTex, P_15);
					    final_colour_5 = (final_colour_5 + ((kernel_6[2] * kernel_6[
					      (2 + u_3)
					    ]) * tmpvar_14.xyz));
					    highp vec2 tmpvar_16;
					    tmpvar_16.x = (float(u_3) * _Distortion);
					    tmpvar_16.y = _Distortion;
					    lowp vec4 tmpvar_17;
					    highp vec2 P_18;
					    P_18 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_16) / _ScreenResolution.xy);
					    tmpvar_17 = texture2D (_MainTex, P_18);
					    final_colour_5 = (final_colour_5 + ((kernel_6[3] * kernel_6[
					      (2 + u_3)
					    ]) * tmpvar_17.xyz));
					    highp vec2 tmpvar_19;
					    tmpvar_19.x = (float(u_3) * _Distortion);
					    tmpvar_19.y = (2.0 * _Distortion);
					    lowp vec4 tmpvar_20;
					    highp vec2 P_21;
					    P_21 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_19) / _ScreenResolution.xy);
					    tmpvar_20 = texture2D (_MainTex, P_21);
					    final_colour_5 = (final_colour_5 + ((kernel_6[4] * kernel_6[
					      (2 + u_3)
					    ]) * tmpvar_20.xyz));
					  };
					  highp vec2 tmpvar_22;
					  tmpvar_22.x = _CenterX;
					  tmpvar_22.y = _CenterY;
					  highp vec2 x_23;
					  x_23 = (tmpvar_22 - xlv_TEXCOORD0);
					  highp float tmpvar_24;
					  tmpvar_24 = clamp (((
					    sqrt(dot (x_23, x_23))
					   - _Radius) / (
					    (_Radius + (0.15 * _SpotSize))
					   - _Radius)), 0.0, 1.0);
					  highp vec3 tmpvar_25;
					  tmpvar_25 = (final_colour_5 / (Z_4 * Z_4));
					  lowp vec3 tmpvar_26;
					  tmpvar_26 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  cm_2 = tmpvar_26;
					  highp vec4 tmpvar_27;
					  tmpvar_27.w = 1.0;
					  tmpvar_27.xyz = mix (mix (cm_2, tmpvar_25, vec3(_Alpha2)), tmpvar_25, vec3(((1.0 - 
					    (1.0 - (tmpvar_24 * (tmpvar_24 * (3.0 - 
					      (2.0 * tmpvar_24)
					    ))))
					  ) * _Alpha)));
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
					uniform highp float _Distortion;
					uniform highp float _Radius;
					uniform highp float _SpotSize;
					uniform highp float _CenterX;
					uniform highp float _CenterY;
					uniform highp float _Alpha;
					uniform highp float _Alpha2;
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = xlv_TEXCOORD0;
					  highp vec3 cm_2;
					  highp float Z_4;
					  highp vec3 final_colour_5;
					  highp float kernel_6[6];
					  final_colour_5 = vec3(0.0, 0.0, 0.0);
					  kernel_6[0] = 0.0;
					  kernel_6[1] = 0.0;
					  kernel_6[2] = 0.0;
					  kernel_6[3] = 0.0;
					  kernel_6[4] = 0.0;
					  kernel_6[5] = 0.0;
					  kernel_6[2] = 0.4;
					  kernel_6[2] = 0.4;
					  kernel_6[(2 - 1)] = 0.4;
					  kernel_6[(2 + 1)] = 0.4;
					  kernel_6[(2 - 2)] = 0.4;
					  kernel_6[(2 + 2)] = 0.4;
					  Z_4 = kernel_6[0];
					  Z_4 = (Z_4 + kernel_6[1]);
					  Z_4 = (Z_4 + kernel_6[2]);
					  Z_4 = (Z_4 + kernel_6[3]);
					  Z_4 = (Z_4 + kernel_6[4]);
					  Z_4 = (Z_4 + kernel_6[5]);
					  for (highp int u_3 = -2; u_3 <= 2; u_3++) {
					    highp vec2 tmpvar_7;
					    tmpvar_7.x = (float(u_3) * _Distortion);
					    tmpvar_7.y = (-2.0 * _Distortion);
					    lowp vec4 tmpvar_8;
					    highp vec2 P_9;
					    P_9 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_7) / _ScreenResolution.xy);
					    tmpvar_8 = texture2D (_MainTex, P_9);
					    final_colour_5 = (final_colour_5 + ((kernel_6[0] * kernel_6[
					      (2 + u_3)
					    ]) * tmpvar_8.xyz));
					    highp vec2 tmpvar_10;
					    tmpvar_10.x = (float(u_3) * _Distortion);
					    tmpvar_10.y = -(_Distortion);
					    lowp vec4 tmpvar_11;
					    highp vec2 P_12;
					    P_12 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_10) / _ScreenResolution.xy);
					    tmpvar_11 = texture2D (_MainTex, P_12);
					    final_colour_5 = (final_colour_5 + ((kernel_6[1] * kernel_6[
					      (2 + u_3)
					    ]) * tmpvar_11.xyz));
					    highp vec2 tmpvar_13;
					    tmpvar_13.x = (float(u_3) * _Distortion);
					    tmpvar_13.y = 0.0;
					    lowp vec4 tmpvar_14;
					    highp vec2 P_15;
					    P_15 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_13) / _ScreenResolution.xy);
					    tmpvar_14 = texture2D (_MainTex, P_15);
					    final_colour_5 = (final_colour_5 + ((kernel_6[2] * kernel_6[
					      (2 + u_3)
					    ]) * tmpvar_14.xyz));
					    highp vec2 tmpvar_16;
					    tmpvar_16.x = (float(u_3) * _Distortion);
					    tmpvar_16.y = _Distortion;
					    lowp vec4 tmpvar_17;
					    highp vec2 P_18;
					    P_18 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_16) / _ScreenResolution.xy);
					    tmpvar_17 = texture2D (_MainTex, P_18);
					    final_colour_5 = (final_colour_5 + ((kernel_6[3] * kernel_6[
					      (2 + u_3)
					    ]) * tmpvar_17.xyz));
					    highp vec2 tmpvar_19;
					    tmpvar_19.x = (float(u_3) * _Distortion);
					    tmpvar_19.y = (2.0 * _Distortion);
					    lowp vec4 tmpvar_20;
					    highp vec2 P_21;
					    P_21 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_19) / _ScreenResolution.xy);
					    tmpvar_20 = texture2D (_MainTex, P_21);
					    final_colour_5 = (final_colour_5 + ((kernel_6[4] * kernel_6[
					      (2 + u_3)
					    ]) * tmpvar_20.xyz));
					  };
					  highp vec2 tmpvar_22;
					  tmpvar_22.x = _CenterX;
					  tmpvar_22.y = _CenterY;
					  highp vec2 x_23;
					  x_23 = (tmpvar_22 - xlv_TEXCOORD0);
					  highp float tmpvar_24;
					  tmpvar_24 = clamp (((
					    sqrt(dot (x_23, x_23))
					   - _Radius) / (
					    (_Radius + (0.15 * _SpotSize))
					   - _Radius)), 0.0, 1.0);
					  highp vec3 tmpvar_25;
					  tmpvar_25 = (final_colour_5 / (Z_4 * Z_4));
					  lowp vec3 tmpvar_26;
					  tmpvar_26 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  cm_2 = tmpvar_26;
					  highp vec4 tmpvar_27;
					  tmpvar_27.w = 1.0;
					  tmpvar_27.xyz = mix (mix (cm_2, tmpvar_25, vec3(_Alpha2)), tmpvar_25, vec3(((1.0 - 
					    (1.0 - (tmpvar_24 * (tmpvar_24 * (3.0 - 
					      (2.0 * tmpvar_24)
					    ))))
					  ) * _Alpha)));
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
					uniform highp float _Distortion;
					uniform highp float _Radius;
					uniform highp float _SpotSize;
					uniform highp float _CenterX;
					uniform highp float _CenterY;
					uniform highp float _Alpha;
					uniform highp float _Alpha2;
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = xlv_TEXCOORD0;
					  highp vec3 cm_2;
					  highp float Z_4;
					  highp vec3 final_colour_5;
					  highp float kernel_6[6];
					  final_colour_5 = vec3(0.0, 0.0, 0.0);
					  kernel_6[0] = 0.0;
					  kernel_6[1] = 0.0;
					  kernel_6[2] = 0.0;
					  kernel_6[3] = 0.0;
					  kernel_6[4] = 0.0;
					  kernel_6[5] = 0.0;
					  kernel_6[2] = 0.4;
					  kernel_6[2] = 0.4;
					  kernel_6[(2 - 1)] = 0.4;
					  kernel_6[(2 + 1)] = 0.4;
					  kernel_6[(2 - 2)] = 0.4;
					  kernel_6[(2 + 2)] = 0.4;
					  Z_4 = kernel_6[0];
					  Z_4 = (Z_4 + kernel_6[1]);
					  Z_4 = (Z_4 + kernel_6[2]);
					  Z_4 = (Z_4 + kernel_6[3]);
					  Z_4 = (Z_4 + kernel_6[4]);
					  Z_4 = (Z_4 + kernel_6[5]);
					  for (highp int u_3 = -2; u_3 <= 2; u_3++) {
					    highp vec2 tmpvar_7;
					    tmpvar_7.x = (float(u_3) * _Distortion);
					    tmpvar_7.y = (-2.0 * _Distortion);
					    lowp vec4 tmpvar_8;
					    highp vec2 P_9;
					    P_9 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_7) / _ScreenResolution.xy);
					    tmpvar_8 = texture2D (_MainTex, P_9);
					    final_colour_5 = (final_colour_5 + ((kernel_6[0] * kernel_6[
					      (2 + u_3)
					    ]) * tmpvar_8.xyz));
					    highp vec2 tmpvar_10;
					    tmpvar_10.x = (float(u_3) * _Distortion);
					    tmpvar_10.y = -(_Distortion);
					    lowp vec4 tmpvar_11;
					    highp vec2 P_12;
					    P_12 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_10) / _ScreenResolution.xy);
					    tmpvar_11 = texture2D (_MainTex, P_12);
					    final_colour_5 = (final_colour_5 + ((kernel_6[1] * kernel_6[
					      (2 + u_3)
					    ]) * tmpvar_11.xyz));
					    highp vec2 tmpvar_13;
					    tmpvar_13.x = (float(u_3) * _Distortion);
					    tmpvar_13.y = 0.0;
					    lowp vec4 tmpvar_14;
					    highp vec2 P_15;
					    P_15 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_13) / _ScreenResolution.xy);
					    tmpvar_14 = texture2D (_MainTex, P_15);
					    final_colour_5 = (final_colour_5 + ((kernel_6[2] * kernel_6[
					      (2 + u_3)
					    ]) * tmpvar_14.xyz));
					    highp vec2 tmpvar_16;
					    tmpvar_16.x = (float(u_3) * _Distortion);
					    tmpvar_16.y = _Distortion;
					    lowp vec4 tmpvar_17;
					    highp vec2 P_18;
					    P_18 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_16) / _ScreenResolution.xy);
					    tmpvar_17 = texture2D (_MainTex, P_18);
					    final_colour_5 = (final_colour_5 + ((kernel_6[3] * kernel_6[
					      (2 + u_3)
					    ]) * tmpvar_17.xyz));
					    highp vec2 tmpvar_19;
					    tmpvar_19.x = (float(u_3) * _Distortion);
					    tmpvar_19.y = (2.0 * _Distortion);
					    lowp vec4 tmpvar_20;
					    highp vec2 P_21;
					    P_21 = (((tmpvar_1 * _ScreenResolution.xy) + tmpvar_19) / _ScreenResolution.xy);
					    tmpvar_20 = texture2D (_MainTex, P_21);
					    final_colour_5 = (final_colour_5 + ((kernel_6[4] * kernel_6[
					      (2 + u_3)
					    ]) * tmpvar_20.xyz));
					  };
					  highp vec2 tmpvar_22;
					  tmpvar_22.x = _CenterX;
					  tmpvar_22.y = _CenterY;
					  highp vec2 x_23;
					  x_23 = (tmpvar_22 - xlv_TEXCOORD0);
					  highp float tmpvar_24;
					  tmpvar_24 = clamp (((
					    sqrt(dot (x_23, x_23))
					   - _Radius) / (
					    (_Radius + (0.15 * _SpotSize))
					   - _Radius)), 0.0, 1.0);
					  highp vec3 tmpvar_25;
					  tmpvar_25 = (final_colour_5 / (Z_4 * Z_4));
					  lowp vec3 tmpvar_26;
					  tmpvar_26 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  cm_2 = tmpvar_26;
					  highp vec4 tmpvar_27;
					  tmpvar_27.w = 1.0;
					  tmpvar_27.xyz = mix (mix (cm_2, tmpvar_25, vec3(_Alpha2)), tmpvar_25, vec3(((1.0 - 
					    (1.0 - (tmpvar_24 * (tmpvar_24 * (3.0 - 
					      (2.0 * tmpvar_24)
					    ))))
					  ) * _Alpha)));
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
					uniform 	float _Distortion;
					uniform 	float _Radius;
					uniform 	float _SpotSize;
					uniform 	float _CenterX;
					uniform 	float _CenterY;
					uniform 	float _Alpha;
					uniform 	float _Alpha2;
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					ivec2 u_xlati1;
					bool u_xlatb1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					lowp vec3 u_xlat10_4;
					vec2 u_xlat7;
					float u_xlat11;
					int u_xlati11;
					float u_xlat12;
					ivec2 u_xlati12;
					float u_xlat15;
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
					        u_xlat1.x = TempArray0[u_xlati1.x].x;
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
					            u_xlat16 = u_xlat1.x * u_xlat16;
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
					    u_xlat15 = _SpotSize * 0.150000006;
					    u_xlat1.xy = (-vs_TEXCOORD0.xy) + vec2(_CenterX, _CenterY);
					    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + (-_Radius);
					    u_xlat15 = float(1.0) / u_xlat15;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
					#else
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat15 * -2.0 + 3.0;
					    u_xlat15 = u_xlat15 * u_xlat15;
					    u_xlat15 = (-u_xlat1.x) * u_xlat15 + 1.0;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat2.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat10_1.xyz);
					    u_xlat1.xyz = vec3(vec3(_Alpha2, _Alpha2, _Alpha2)) * u_xlat2.xyz + u_xlat10_1.xyz;
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat15 = u_xlat15 * _Alpha;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat1.xyz);
					    SV_Target0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat1.xyz;
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
					uniform 	float _Radius;
					uniform 	float _SpotSize;
					uniform 	float _CenterX;
					uniform 	float _CenterY;
					uniform 	float _Alpha;
					uniform 	float _Alpha2;
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					ivec2 u_xlati1;
					bool u_xlatb1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					lowp vec3 u_xlat10_4;
					vec2 u_xlat7;
					float u_xlat11;
					int u_xlati11;
					float u_xlat12;
					ivec2 u_xlati12;
					float u_xlat15;
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
					        u_xlat1.x = TempArray0[u_xlati1.x].x;
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
					            u_xlat16 = u_xlat1.x * u_xlat16;
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
					    u_xlat15 = _SpotSize * 0.150000006;
					    u_xlat1.xy = (-vs_TEXCOORD0.xy) + vec2(_CenterX, _CenterY);
					    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + (-_Radius);
					    u_xlat15 = float(1.0) / u_xlat15;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
					#else
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat15 * -2.0 + 3.0;
					    u_xlat15 = u_xlat15 * u_xlat15;
					    u_xlat15 = (-u_xlat1.x) * u_xlat15 + 1.0;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat2.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat10_1.xyz);
					    u_xlat1.xyz = vec3(vec3(_Alpha2, _Alpha2, _Alpha2)) * u_xlat2.xyz + u_xlat10_1.xyz;
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat15 = u_xlat15 * _Alpha;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat1.xyz);
					    SV_Target0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat1.xyz;
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
					uniform 	float _Radius;
					uniform 	float _SpotSize;
					uniform 	float _CenterX;
					uniform 	float _CenterY;
					uniform 	float _Alpha;
					uniform 	float _Alpha2;
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					ivec2 u_xlati1;
					bool u_xlatb1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					lowp vec3 u_xlat10_4;
					vec2 u_xlat7;
					float u_xlat11;
					int u_xlati11;
					float u_xlat12;
					ivec2 u_xlati12;
					float u_xlat15;
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
					        u_xlat1.x = TempArray0[u_xlati1.x].x;
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
					            u_xlat16 = u_xlat1.x * u_xlat16;
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
					    u_xlat15 = _SpotSize * 0.150000006;
					    u_xlat1.xy = (-vs_TEXCOORD0.xy) + vec2(_CenterX, _CenterY);
					    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + (-_Radius);
					    u_xlat15 = float(1.0) / u_xlat15;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
					#else
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat15 * -2.0 + 3.0;
					    u_xlat15 = u_xlat15 * u_xlat15;
					    u_xlat15 = (-u_xlat1.x) * u_xlat15 + 1.0;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat2.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat10_1.xyz);
					    u_xlat1.xyz = vec3(vec3(_Alpha2, _Alpha2, _Alpha2)) * u_xlat2.xyz + u_xlat10_1.xyz;
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat15 = u_xlat15 * _Alpha;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat1.xyz);
					    SV_Target0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat1.xyz;
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