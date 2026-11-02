Shader "CameraFilterPack/TV_Vcr" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 57842
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
					  highp vec3 video_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp vec2 uv_3;
					  uv_3 = (uv_2 - vec2(0.5, 0.5));
					  uv_3 = ((uv_3 * 1.2) * (0.8333333 + (
					    (2.0 * uv_3.x)
					   * 
					    ((uv_3.x * uv_3.y) * uv_3.y)
					  )));
					  uv_3 = (uv_3 + vec2(0.5, 0.5));
					  uv_2 = uv_3;
					  highp vec3 video_4;
					  highp vec2 look_5;
					  highp float tmpvar_6;
					  tmpvar_6 = (_TimeX / 4.0);
					  look_5.x = (uv_3.x + ((
					    ((sin((
					      (uv_3.y * 10.0)
					     + _TimeX)) / 50.0) * float((sin(
					      (_TimeX + (4.0 * cos((_TimeX * 4.0))))
					    ) >= 0.3)))
					   * 
					    (1.0 + cos((_TimeX * 80.0)))
					  ) * (1.0/(
					    (1.0 + ((20.0 * (uv_3.y - 
					      (tmpvar_6 - floor(tmpvar_6))
					    )) * (uv_3.y - (tmpvar_6 - 
					      floor(tmpvar_6)
					    ))))
					  ))));
					  highp float x_7;
					  highp float tmpvar_8;
					  tmpvar_8 = cos(_TimeX);
					  x_7 = (uv_3.y + ((0.4 * 
					    float((sin((_TimeX + 
					      (2.0 * cos((_TimeX * 3.0)))
					    )) >= 0.9))
					  ) * (
					    (sin(_TimeX) * sin((_TimeX * 20.0)))
					   + 
					    (0.5 + ((0.1 * sin(
					      (_TimeX * 200.0)
					    )) * tmpvar_8))
					  )));
					  look_5.y = (x_7 - floor(x_7));
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, look_5).xyz;
					  video_4 = tmpvar_9;
					  highp float tmpvar_10;
					  tmpvar_10 = (3.0 + (0.3 * sin(
					    (_TimeX + (5.0 * cos((_TimeX * 5.0))))
					  )));
					  highp float xlat_varsample_11;
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = 1.0;
					  tmpvar_12.y = (2.0 * tmpvar_8);
					  highp vec2 P_13;
					  P_13 = (((tmpvar_12 * _TimeX) * 8.0) + ((uv_3 * vec2(0.5, 1.0)) + vec2(1.0, 3.0)));
					  lowp float tmpvar_14;
					  tmpvar_14 = texture2D (_MainTex, P_13).x;
					  xlat_varsample_11 = tmpvar_14;
					  xlat_varsample_11 = (xlat_varsample_11 * xlat_varsample_11);
					  highp float tmpvar_15;
					  highp float x_16;
					  x_16 = (((uv_3.y * 4.0) + (_TimeX / 2.0)) + sin((_TimeX + 
					    sin((_TimeX * 0.63))
					  )));
					  tmpvar_15 = (x_16 - floor(x_16));
					  highp float tmpvar_17;
					  tmpvar_17 = (float((tmpvar_15 >= 0.5)) - float((tmpvar_15 >= 0.6)));
					  video_1 = (video_4 + ((
					    (1.0 - (((tmpvar_15 - 0.5) / 0.1) * tmpvar_17))
					   * tmpvar_17) * xlat_varsample_11));
					  highp float xlat_varsample_18;
					  highp vec2 tmpvar_19;
					  tmpvar_19.x = 1.0;
					  tmpvar_19.y = (2.0 * tmpvar_8);
					  highp vec2 P_20;
					  P_20 = (((tmpvar_19 * _TimeX) * 8.0) + (uv_3 * 2.0));
					  lowp float tmpvar_21;
					  tmpvar_21 = texture2D (_MainTex, P_20).x;
					  xlat_varsample_18 = tmpvar_21;
					  xlat_varsample_18 = (xlat_varsample_18 * xlat_varsample_18);
					  video_1 = (video_1 + (xlat_varsample_18 / 2.0));
					  video_1 = (video_1 * ((1.0 - 
					    ((tmpvar_10 * (uv_3.y - 0.5)) * (uv_3.y - 0.5))
					  ) * (1.0 - 
					    ((tmpvar_10 * (uv_3.x - 0.5)) * (uv_3.x - 0.5))
					  )));
					  highp float x_22;
					  x_22 = ((uv_3.y * 30.0) + _TimeX);
					  video_1 = (video_1 * ((12.0 + 
					    (x_22 - floor(x_22))
					  ) / 13.0));
					  highp vec4 tmpvar_23;
					  tmpvar_23.w = 1.0;
					  tmpvar_23.xyz = video_1;
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
					uniform highp float _TimeX;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 video_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp vec2 uv_3;
					  uv_3 = (uv_2 - vec2(0.5, 0.5));
					  uv_3 = ((uv_3 * 1.2) * (0.8333333 + (
					    (2.0 * uv_3.x)
					   * 
					    ((uv_3.x * uv_3.y) * uv_3.y)
					  )));
					  uv_3 = (uv_3 + vec2(0.5, 0.5));
					  uv_2 = uv_3;
					  highp vec3 video_4;
					  highp vec2 look_5;
					  highp float tmpvar_6;
					  tmpvar_6 = (_TimeX / 4.0);
					  look_5.x = (uv_3.x + ((
					    ((sin((
					      (uv_3.y * 10.0)
					     + _TimeX)) / 50.0) * float((sin(
					      (_TimeX + (4.0 * cos((_TimeX * 4.0))))
					    ) >= 0.3)))
					   * 
					    (1.0 + cos((_TimeX * 80.0)))
					  ) * (1.0/(
					    (1.0 + ((20.0 * (uv_3.y - 
					      (tmpvar_6 - floor(tmpvar_6))
					    )) * (uv_3.y - (tmpvar_6 - 
					      floor(tmpvar_6)
					    ))))
					  ))));
					  highp float x_7;
					  highp float tmpvar_8;
					  tmpvar_8 = cos(_TimeX);
					  x_7 = (uv_3.y + ((0.4 * 
					    float((sin((_TimeX + 
					      (2.0 * cos((_TimeX * 3.0)))
					    )) >= 0.9))
					  ) * (
					    (sin(_TimeX) * sin((_TimeX * 20.0)))
					   + 
					    (0.5 + ((0.1 * sin(
					      (_TimeX * 200.0)
					    )) * tmpvar_8))
					  )));
					  look_5.y = (x_7 - floor(x_7));
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, look_5).xyz;
					  video_4 = tmpvar_9;
					  highp float tmpvar_10;
					  tmpvar_10 = (3.0 + (0.3 * sin(
					    (_TimeX + (5.0 * cos((_TimeX * 5.0))))
					  )));
					  highp float xlat_varsample_11;
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = 1.0;
					  tmpvar_12.y = (2.0 * tmpvar_8);
					  highp vec2 P_13;
					  P_13 = (((tmpvar_12 * _TimeX) * 8.0) + ((uv_3 * vec2(0.5, 1.0)) + vec2(1.0, 3.0)));
					  lowp float tmpvar_14;
					  tmpvar_14 = texture2D (_MainTex, P_13).x;
					  xlat_varsample_11 = tmpvar_14;
					  xlat_varsample_11 = (xlat_varsample_11 * xlat_varsample_11);
					  highp float tmpvar_15;
					  highp float x_16;
					  x_16 = (((uv_3.y * 4.0) + (_TimeX / 2.0)) + sin((_TimeX + 
					    sin((_TimeX * 0.63))
					  )));
					  tmpvar_15 = (x_16 - floor(x_16));
					  highp float tmpvar_17;
					  tmpvar_17 = (float((tmpvar_15 >= 0.5)) - float((tmpvar_15 >= 0.6)));
					  video_1 = (video_4 + ((
					    (1.0 - (((tmpvar_15 - 0.5) / 0.1) * tmpvar_17))
					   * tmpvar_17) * xlat_varsample_11));
					  highp float xlat_varsample_18;
					  highp vec2 tmpvar_19;
					  tmpvar_19.x = 1.0;
					  tmpvar_19.y = (2.0 * tmpvar_8);
					  highp vec2 P_20;
					  P_20 = (((tmpvar_19 * _TimeX) * 8.0) + (uv_3 * 2.0));
					  lowp float tmpvar_21;
					  tmpvar_21 = texture2D (_MainTex, P_20).x;
					  xlat_varsample_18 = tmpvar_21;
					  xlat_varsample_18 = (xlat_varsample_18 * xlat_varsample_18);
					  video_1 = (video_1 + (xlat_varsample_18 / 2.0));
					  video_1 = (video_1 * ((1.0 - 
					    ((tmpvar_10 * (uv_3.y - 0.5)) * (uv_3.y - 0.5))
					  ) * (1.0 - 
					    ((tmpvar_10 * (uv_3.x - 0.5)) * (uv_3.x - 0.5))
					  )));
					  highp float x_22;
					  x_22 = ((uv_3.y * 30.0) + _TimeX);
					  video_1 = (video_1 * ((12.0 + 
					    (x_22 - floor(x_22))
					  ) / 13.0));
					  highp vec4 tmpvar_23;
					  tmpvar_23.w = 1.0;
					  tmpvar_23.xyz = video_1;
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
					uniform highp float _TimeX;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 video_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp vec2 uv_3;
					  uv_3 = (uv_2 - vec2(0.5, 0.5));
					  uv_3 = ((uv_3 * 1.2) * (0.8333333 + (
					    (2.0 * uv_3.x)
					   * 
					    ((uv_3.x * uv_3.y) * uv_3.y)
					  )));
					  uv_3 = (uv_3 + vec2(0.5, 0.5));
					  uv_2 = uv_3;
					  highp vec3 video_4;
					  highp vec2 look_5;
					  highp float tmpvar_6;
					  tmpvar_6 = (_TimeX / 4.0);
					  look_5.x = (uv_3.x + ((
					    ((sin((
					      (uv_3.y * 10.0)
					     + _TimeX)) / 50.0) * float((sin(
					      (_TimeX + (4.0 * cos((_TimeX * 4.0))))
					    ) >= 0.3)))
					   * 
					    (1.0 + cos((_TimeX * 80.0)))
					  ) * (1.0/(
					    (1.0 + ((20.0 * (uv_3.y - 
					      (tmpvar_6 - floor(tmpvar_6))
					    )) * (uv_3.y - (tmpvar_6 - 
					      floor(tmpvar_6)
					    ))))
					  ))));
					  highp float x_7;
					  highp float tmpvar_8;
					  tmpvar_8 = cos(_TimeX);
					  x_7 = (uv_3.y + ((0.4 * 
					    float((sin((_TimeX + 
					      (2.0 * cos((_TimeX * 3.0)))
					    )) >= 0.9))
					  ) * (
					    (sin(_TimeX) * sin((_TimeX * 20.0)))
					   + 
					    (0.5 + ((0.1 * sin(
					      (_TimeX * 200.0)
					    )) * tmpvar_8))
					  )));
					  look_5.y = (x_7 - floor(x_7));
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, look_5).xyz;
					  video_4 = tmpvar_9;
					  highp float tmpvar_10;
					  tmpvar_10 = (3.0 + (0.3 * sin(
					    (_TimeX + (5.0 * cos((_TimeX * 5.0))))
					  )));
					  highp float xlat_varsample_11;
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = 1.0;
					  tmpvar_12.y = (2.0 * tmpvar_8);
					  highp vec2 P_13;
					  P_13 = (((tmpvar_12 * _TimeX) * 8.0) + ((uv_3 * vec2(0.5, 1.0)) + vec2(1.0, 3.0)));
					  lowp float tmpvar_14;
					  tmpvar_14 = texture2D (_MainTex, P_13).x;
					  xlat_varsample_11 = tmpvar_14;
					  xlat_varsample_11 = (xlat_varsample_11 * xlat_varsample_11);
					  highp float tmpvar_15;
					  highp float x_16;
					  x_16 = (((uv_3.y * 4.0) + (_TimeX / 2.0)) + sin((_TimeX + 
					    sin((_TimeX * 0.63))
					  )));
					  tmpvar_15 = (x_16 - floor(x_16));
					  highp float tmpvar_17;
					  tmpvar_17 = (float((tmpvar_15 >= 0.5)) - float((tmpvar_15 >= 0.6)));
					  video_1 = (video_4 + ((
					    (1.0 - (((tmpvar_15 - 0.5) / 0.1) * tmpvar_17))
					   * tmpvar_17) * xlat_varsample_11));
					  highp float xlat_varsample_18;
					  highp vec2 tmpvar_19;
					  tmpvar_19.x = 1.0;
					  tmpvar_19.y = (2.0 * tmpvar_8);
					  highp vec2 P_20;
					  P_20 = (((tmpvar_19 * _TimeX) * 8.0) + (uv_3 * 2.0));
					  lowp float tmpvar_21;
					  tmpvar_21 = texture2D (_MainTex, P_20).x;
					  xlat_varsample_18 = tmpvar_21;
					  xlat_varsample_18 = (xlat_varsample_18 * xlat_varsample_18);
					  video_1 = (video_1 + (xlat_varsample_18 / 2.0));
					  video_1 = (video_1 * ((1.0 - 
					    ((tmpvar_10 * (uv_3.y - 0.5)) * (uv_3.y - 0.5))
					  ) * (1.0 - 
					    ((tmpvar_10 * (uv_3.x - 0.5)) * (uv_3.x - 0.5))
					  )));
					  highp float x_22;
					  x_22 = ((uv_3.y * 30.0) + _TimeX);
					  video_1 = (video_1 * ((12.0 + 
					    (x_22 - floor(x_22))
					  ) / 13.0));
					  highp vec4 tmpvar_23;
					  tmpvar_23.w = 1.0;
					  tmpvar_23.xyz = video_1;
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
					uniform 	float _TimeX;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec3 u_xlat2;
					mediump vec2 u_xlat16_2;
					lowp float u_xlat10_2;
					vec4 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					bool u_xlatb5;
					vec2 u_xlat6;
					mediump vec2 u_xlat16_6;
					lowp float u_xlat10_6;
					float u_xlat10;
					vec2 u_xlat11;
					mediump vec2 u_xlat16_11;
					bvec2 u_xlatb11;
					vec2 u_xlat12;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(0.25, 4.0, 80.0, 3.0);
					    u_xlat5.xyz = cos(u_xlat0.yzw);
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat0.x = _TimeX * 0.25 + (-u_xlat0.x);
					    u_xlat5.x = u_xlat5.x * 4.0 + _TimeX;
					    u_xlat5.x = sin(u_xlat5.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb5 = !!(u_xlat5.x>=0.300000012);
					#else
					    u_xlatb5 = u_xlat5.x>=0.300000012;
					#endif
					    u_xlat5.x = u_xlatb5 ? 1.0 : float(0.0);
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_11.xy = u_xlat16_1.xy * u_xlat16_1.xy;
					    u_xlat16_1.xy = u_xlat16_1.yx * vec2(1.20000005, 1.20000005);
					    u_xlat16_11.x = dot(u_xlat16_11.yy, u_xlat16_11.xx);
					    u_xlat16_11.x = u_xlat16_11.x + 0.833333313;
					    u_xlat16_2.xy = u_xlat16_1.yx * u_xlat16_11.xx + vec2(0.5, 0.5);
					    u_xlat16_1.xy = u_xlat16_11.xx * u_xlat16_1.xy;
					    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_1.xy;
					    u_xlat11.x = u_xlat16_2.y * 10.0 + _TimeX;
					    u_xlat11.x = sin(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * 0.0199999996;
					    u_xlat0.y = u_xlat5.x * u_xlat11.x;
					    u_xlat0.z = u_xlat5.y + 1.0;
					    u_xlat15 = u_xlat5.z * 2.0 + _TimeX;
					    u_xlat15 = sin(u_xlat15);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(u_xlat15>=0.899999976);
					#else
					    u_xlatb15 = u_xlat15>=0.899999976;
					#endif
					    u_xlat15 = u_xlatb15 ? 0.400000006 : float(0.0);
					    u_xlat0.x = (-u_xlat0.x) + u_xlat16_2.y;
					    u_xlat0.xy = u_xlat0.xz * u_xlat0.xy;
					    u_xlat0.x = u_xlat0.x * 20.0 + 1.0;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.y * u_xlat0.x + u_xlat16_2.x;
					    u_xlat3 = vec4(_TimeX) * vec4(20.0, 200.0, 5.0, 0.5);
					    u_xlat11.xy = sin(u_xlat3.xy);
					    u_xlat10 = u_xlat11.y * 0.100000001;
					    u_xlat3.x = sin(_TimeX);
					    u_xlat4 = cos(_TimeX);
					    u_xlat10 = u_xlat10 * u_xlat4;
					    u_xlat10 = u_xlat3.x * u_xlat11.x + u_xlat10;
					    u_xlat3.y = u_xlat4 * _TimeX;
					    u_xlat10 = u_xlat10 + 0.5;
					    u_xlat10 = u_xlat15 * u_xlat10 + u_xlat16_2.y;
					    u_xlat15 = floor(u_xlat10);
					    u_xlat0.y = (-u_xlat15) + u_xlat10;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat15 = _TimeX * 0.629999995;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat15 = u_xlat15 + _TimeX;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat11.x = u_xlat16_2.y * 4.0 + u_xlat3.w;
					    u_xlat16 = cos(u_xlat3.z);
					    u_xlat16 = u_xlat16 * 5.0 + _TimeX;
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 0.300000012 + 3.0;
					    u_xlat1.xy = (-u_xlat16_1.xy) * vec2(u_xlat16) + vec2(1.0, 1.0);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat15 = u_xlat15 + u_xlat11.x;
					    u_xlat6.x = floor(u_xlat15);
					    u_xlat15 = u_xlat15 + (-u_xlat6.x);
					    u_xlat6.x = u_xlat15 + -0.5;
					    u_xlatb11.xy = greaterThanEqual(vec4(u_xlat15), vec4(0.5, 0.600000024, 0.5, 0.600000024)).xy;
					    u_xlat15 = u_xlatb11.x ? 1.0 : float(0.0);
					    u_xlat11.x = (u_xlatb11.y) ? -1.0 : -0.0;
					    u_xlat15 = u_xlat15 + u_xlat11.x;
					    u_xlat6.x = u_xlat15 * u_xlat6.x;
					    u_xlat6.x = (-u_xlat6.x) * 9.99999809 + 1.0;
					    u_xlat15 = u_xlat15 * u_xlat6.x;
					    u_xlat16_6.xy = u_xlat16_2.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat3.x = _TimeX;
					    u_xlat6.xy = u_xlat3.xy * vec2(8.0, 16.0) + u_xlat16_6.xy;
					    u_xlat12.xy = u_xlat3.xy * vec2(8.0, 16.0);
					    u_xlat2.xz = u_xlat16_2.xy * vec2(2.0, 2.0) + u_xlat12.xy;
					    u_xlat16 = u_xlat16_2.y * 30.0 + _TimeX;
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xz).x;
					    u_xlat16_2.x = u_xlat10_2 * u_xlat10_2;
					    u_xlat10_6 = texture(_MainTex, u_xlat6.xy).x;
					    u_xlat16_6.x = u_xlat10_6 * u_xlat10_6;
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat16_6.xxx + u_xlat10_0.xyz;
					    u_xlat0.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat15 = floor(u_xlat16);
					    u_xlat15 = (-u_xlat15) + u_xlat16;
					    u_xlat15 = u_xlat15 + 12.0;
					    u_xlat15 = u_xlat15 * 0.0769230798;
					    SV_Target0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
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
					uniform 	float _TimeX;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec3 u_xlat2;
					mediump vec2 u_xlat16_2;
					lowp float u_xlat10_2;
					vec4 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					bool u_xlatb5;
					vec2 u_xlat6;
					mediump vec2 u_xlat16_6;
					lowp float u_xlat10_6;
					float u_xlat10;
					vec2 u_xlat11;
					mediump vec2 u_xlat16_11;
					bvec2 u_xlatb11;
					vec2 u_xlat12;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(0.25, 4.0, 80.0, 3.0);
					    u_xlat5.xyz = cos(u_xlat0.yzw);
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat0.x = _TimeX * 0.25 + (-u_xlat0.x);
					    u_xlat5.x = u_xlat5.x * 4.0 + _TimeX;
					    u_xlat5.x = sin(u_xlat5.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb5 = !!(u_xlat5.x>=0.300000012);
					#else
					    u_xlatb5 = u_xlat5.x>=0.300000012;
					#endif
					    u_xlat5.x = u_xlatb5 ? 1.0 : float(0.0);
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_11.xy = u_xlat16_1.xy * u_xlat16_1.xy;
					    u_xlat16_1.xy = u_xlat16_1.yx * vec2(1.20000005, 1.20000005);
					    u_xlat16_11.x = dot(u_xlat16_11.yy, u_xlat16_11.xx);
					    u_xlat16_11.x = u_xlat16_11.x + 0.833333313;
					    u_xlat16_2.xy = u_xlat16_1.yx * u_xlat16_11.xx + vec2(0.5, 0.5);
					    u_xlat16_1.xy = u_xlat16_11.xx * u_xlat16_1.xy;
					    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_1.xy;
					    u_xlat11.x = u_xlat16_2.y * 10.0 + _TimeX;
					    u_xlat11.x = sin(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * 0.0199999996;
					    u_xlat0.y = u_xlat5.x * u_xlat11.x;
					    u_xlat0.z = u_xlat5.y + 1.0;
					    u_xlat15 = u_xlat5.z * 2.0 + _TimeX;
					    u_xlat15 = sin(u_xlat15);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(u_xlat15>=0.899999976);
					#else
					    u_xlatb15 = u_xlat15>=0.899999976;
					#endif
					    u_xlat15 = u_xlatb15 ? 0.400000006 : float(0.0);
					    u_xlat0.x = (-u_xlat0.x) + u_xlat16_2.y;
					    u_xlat0.xy = u_xlat0.xz * u_xlat0.xy;
					    u_xlat0.x = u_xlat0.x * 20.0 + 1.0;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.y * u_xlat0.x + u_xlat16_2.x;
					    u_xlat3 = vec4(_TimeX) * vec4(20.0, 200.0, 5.0, 0.5);
					    u_xlat11.xy = sin(u_xlat3.xy);
					    u_xlat10 = u_xlat11.y * 0.100000001;
					    u_xlat3.x = sin(_TimeX);
					    u_xlat4 = cos(_TimeX);
					    u_xlat10 = u_xlat10 * u_xlat4;
					    u_xlat10 = u_xlat3.x * u_xlat11.x + u_xlat10;
					    u_xlat3.y = u_xlat4 * _TimeX;
					    u_xlat10 = u_xlat10 + 0.5;
					    u_xlat10 = u_xlat15 * u_xlat10 + u_xlat16_2.y;
					    u_xlat15 = floor(u_xlat10);
					    u_xlat0.y = (-u_xlat15) + u_xlat10;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat15 = _TimeX * 0.629999995;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat15 = u_xlat15 + _TimeX;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat11.x = u_xlat16_2.y * 4.0 + u_xlat3.w;
					    u_xlat16 = cos(u_xlat3.z);
					    u_xlat16 = u_xlat16 * 5.0 + _TimeX;
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 0.300000012 + 3.0;
					    u_xlat1.xy = (-u_xlat16_1.xy) * vec2(u_xlat16) + vec2(1.0, 1.0);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat15 = u_xlat15 + u_xlat11.x;
					    u_xlat6.x = floor(u_xlat15);
					    u_xlat15 = u_xlat15 + (-u_xlat6.x);
					    u_xlat6.x = u_xlat15 + -0.5;
					    u_xlatb11.xy = greaterThanEqual(vec4(u_xlat15), vec4(0.5, 0.600000024, 0.5, 0.600000024)).xy;
					    u_xlat15 = u_xlatb11.x ? 1.0 : float(0.0);
					    u_xlat11.x = (u_xlatb11.y) ? -1.0 : -0.0;
					    u_xlat15 = u_xlat15 + u_xlat11.x;
					    u_xlat6.x = u_xlat15 * u_xlat6.x;
					    u_xlat6.x = (-u_xlat6.x) * 9.99999809 + 1.0;
					    u_xlat15 = u_xlat15 * u_xlat6.x;
					    u_xlat16_6.xy = u_xlat16_2.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat3.x = _TimeX;
					    u_xlat6.xy = u_xlat3.xy * vec2(8.0, 16.0) + u_xlat16_6.xy;
					    u_xlat12.xy = u_xlat3.xy * vec2(8.0, 16.0);
					    u_xlat2.xz = u_xlat16_2.xy * vec2(2.0, 2.0) + u_xlat12.xy;
					    u_xlat16 = u_xlat16_2.y * 30.0 + _TimeX;
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xz).x;
					    u_xlat16_2.x = u_xlat10_2 * u_xlat10_2;
					    u_xlat10_6 = texture(_MainTex, u_xlat6.xy).x;
					    u_xlat16_6.x = u_xlat10_6 * u_xlat10_6;
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat16_6.xxx + u_xlat10_0.xyz;
					    u_xlat0.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat15 = floor(u_xlat16);
					    u_xlat15 = (-u_xlat15) + u_xlat16;
					    u_xlat15 = u_xlat15 + 12.0;
					    u_xlat15 = u_xlat15 * 0.0769230798;
					    SV_Target0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
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
					uniform 	float _TimeX;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					mediump vec2 u_xlat16_1;
					vec3 u_xlat2;
					mediump vec2 u_xlat16_2;
					lowp float u_xlat10_2;
					vec4 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					bool u_xlatb5;
					vec2 u_xlat6;
					mediump vec2 u_xlat16_6;
					lowp float u_xlat10_6;
					float u_xlat10;
					vec2 u_xlat11;
					mediump vec2 u_xlat16_11;
					bvec2 u_xlatb11;
					vec2 u_xlat12;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(0.25, 4.0, 80.0, 3.0);
					    u_xlat5.xyz = cos(u_xlat0.yzw);
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat0.x = _TimeX * 0.25 + (-u_xlat0.x);
					    u_xlat5.x = u_xlat5.x * 4.0 + _TimeX;
					    u_xlat5.x = sin(u_xlat5.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb5 = !!(u_xlat5.x>=0.300000012);
					#else
					    u_xlatb5 = u_xlat5.x>=0.300000012;
					#endif
					    u_xlat5.x = u_xlatb5 ? 1.0 : float(0.0);
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_11.xy = u_xlat16_1.xy * u_xlat16_1.xy;
					    u_xlat16_1.xy = u_xlat16_1.yx * vec2(1.20000005, 1.20000005);
					    u_xlat16_11.x = dot(u_xlat16_11.yy, u_xlat16_11.xx);
					    u_xlat16_11.x = u_xlat16_11.x + 0.833333313;
					    u_xlat16_2.xy = u_xlat16_1.yx * u_xlat16_11.xx + vec2(0.5, 0.5);
					    u_xlat16_1.xy = u_xlat16_11.xx * u_xlat16_1.xy;
					    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_1.xy;
					    u_xlat11.x = u_xlat16_2.y * 10.0 + _TimeX;
					    u_xlat11.x = sin(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * 0.0199999996;
					    u_xlat0.y = u_xlat5.x * u_xlat11.x;
					    u_xlat0.z = u_xlat5.y + 1.0;
					    u_xlat15 = u_xlat5.z * 2.0 + _TimeX;
					    u_xlat15 = sin(u_xlat15);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(u_xlat15>=0.899999976);
					#else
					    u_xlatb15 = u_xlat15>=0.899999976;
					#endif
					    u_xlat15 = u_xlatb15 ? 0.400000006 : float(0.0);
					    u_xlat0.x = (-u_xlat0.x) + u_xlat16_2.y;
					    u_xlat0.xy = u_xlat0.xz * u_xlat0.xy;
					    u_xlat0.x = u_xlat0.x * 20.0 + 1.0;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.y * u_xlat0.x + u_xlat16_2.x;
					    u_xlat3 = vec4(_TimeX) * vec4(20.0, 200.0, 5.0, 0.5);
					    u_xlat11.xy = sin(u_xlat3.xy);
					    u_xlat10 = u_xlat11.y * 0.100000001;
					    u_xlat3.x = sin(_TimeX);
					    u_xlat4 = cos(_TimeX);
					    u_xlat10 = u_xlat10 * u_xlat4;
					    u_xlat10 = u_xlat3.x * u_xlat11.x + u_xlat10;
					    u_xlat3.y = u_xlat4 * _TimeX;
					    u_xlat10 = u_xlat10 + 0.5;
					    u_xlat10 = u_xlat15 * u_xlat10 + u_xlat16_2.y;
					    u_xlat15 = floor(u_xlat10);
					    u_xlat0.y = (-u_xlat15) + u_xlat10;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat15 = _TimeX * 0.629999995;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat15 = u_xlat15 + _TimeX;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat11.x = u_xlat16_2.y * 4.0 + u_xlat3.w;
					    u_xlat16 = cos(u_xlat3.z);
					    u_xlat16 = u_xlat16 * 5.0 + _TimeX;
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 0.300000012 + 3.0;
					    u_xlat1.xy = (-u_xlat16_1.xy) * vec2(u_xlat16) + vec2(1.0, 1.0);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat15 = u_xlat15 + u_xlat11.x;
					    u_xlat6.x = floor(u_xlat15);
					    u_xlat15 = u_xlat15 + (-u_xlat6.x);
					    u_xlat6.x = u_xlat15 + -0.5;
					    u_xlatb11.xy = greaterThanEqual(vec4(u_xlat15), vec4(0.5, 0.600000024, 0.5, 0.600000024)).xy;
					    u_xlat15 = u_xlatb11.x ? 1.0 : float(0.0);
					    u_xlat11.x = (u_xlatb11.y) ? -1.0 : -0.0;
					    u_xlat15 = u_xlat15 + u_xlat11.x;
					    u_xlat6.x = u_xlat15 * u_xlat6.x;
					    u_xlat6.x = (-u_xlat6.x) * 9.99999809 + 1.0;
					    u_xlat15 = u_xlat15 * u_xlat6.x;
					    u_xlat16_6.xy = u_xlat16_2.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat3.x = _TimeX;
					    u_xlat6.xy = u_xlat3.xy * vec2(8.0, 16.0) + u_xlat16_6.xy;
					    u_xlat12.xy = u_xlat3.xy * vec2(8.0, 16.0);
					    u_xlat2.xz = u_xlat16_2.xy * vec2(2.0, 2.0) + u_xlat12.xy;
					    u_xlat16 = u_xlat16_2.y * 30.0 + _TimeX;
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xz).x;
					    u_xlat16_2.x = u_xlat10_2 * u_xlat10_2;
					    u_xlat10_6 = texture(_MainTex, u_xlat6.xy).x;
					    u_xlat16_6.x = u_xlat10_6 * u_xlat10_6;
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat16_6.xxx + u_xlat10_0.xyz;
					    u_xlat0.xyz = u_xlat16_2.xxx * vec3(0.5, 0.5, 0.5) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    u_xlat15 = floor(u_xlat16);
					    u_xlat15 = (-u_xlat15) + u_xlat16;
					    u_xlat15 = u_xlat15 + 12.0;
					    u_xlat15 = u_xlat15 * 0.0769230798;
					    SV_Target0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
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