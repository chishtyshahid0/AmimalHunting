Shader "CameraFilterPack/FX_Funk" {
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
			GpuProgramID 54226
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
					  highp vec2 uv_1;
					  uv_1 = xlv_TEXCOORD0;
					  highp vec4 col_2;
					  highp float n_3;
					  highp vec2 tuv_4;
					  tuv_4 = uv_1;
					  uv_1 = (uv_1 * 2.5);
					  highp float tmpvar_5;
					  tmpvar_5 = (((
					    sin(((1.099609 + (_TimeX * 2.704406)) + (3.0 * uv_1.x)))
					   + 
					    sin(((0.455078 + (_TimeX * 2.124281)) - (4.0 * uv_1.x)))
					  ) + sin(
					    ((8.447266 + (_TimeX * 1.902469)) + (2.0 * uv_1.y))
					  )) + sin((
					    (610.4609 + (_TimeX * 2.439938))
					   + 
					    (5.0 * uv_1.y)
					  )));
					  n_3 = tmpvar_5;
					  highp float tmpvar_6;
					  tmpvar_6 = ((4.0 + tmpvar_5) / 4.0);
					  highp float tmpvar_7;
					  tmpvar_7 = fract(abs(tmpvar_6));
					  highp float tmpvar_8;
					  if ((tmpvar_6 >= 0.0)) {
					    tmpvar_8 = tmpvar_7;
					  } else {
					    tmpvar_8 = -(tmpvar_7);
					  };
					  lowp vec4 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, tuv_4);
					  col_2 = tmpvar_9;
					  n_3 = (tmpvar_8 + ((
					    (col_2.x * 0.2)
					   + 
					    (col_2.y * 0.4)
					  ) + (col_2.z * 0.2)));
					  highp float tmpvar_10;
					  tmpvar_10 = fract(abs(n_3));
					  highp float tmpvar_11;
					  if ((n_3 >= 0.0)) {
					    tmpvar_11 = tmpvar_10;
					  } else {
					    tmpvar_11 = -(tmpvar_10);
					  };
					  highp float tmpvar_12;
					  tmpvar_12 = (tmpvar_11 * 6.0);
					  highp float tmpvar_13;
					  tmpvar_13 = (clamp ((tmpvar_12 - 4.0), 0.0, 1.0) + clamp ((2.0 - tmpvar_12), 0.0, 1.0));
					  highp float tmpvar_14;
					  if ((tmpvar_12 < 2.0)) {
					    tmpvar_14 = clamp (tmpvar_12, 0.0, 1.0);
					  } else {
					    tmpvar_14 = clamp ((4.0 - tmpvar_12), 0.0, 1.0);
					  };
					  highp float tmpvar_15;
					  if ((tmpvar_12 < 4.0)) {
					    tmpvar_15 = clamp ((tmpvar_12 - 2.0), 0.0, 1.0);
					  } else {
					    tmpvar_15 = clamp ((6.0 - tmpvar_12), 0.0, 1.0);
					  };
					  highp vec3 tmpvar_16;
					  tmpvar_16.x = tmpvar_13;
					  tmpvar_16.y = tmpvar_14;
					  tmpvar_16.z = tmpvar_15;
					  highp vec4 tmpvar_17;
					  tmpvar_17.w = 1.0;
					  tmpvar_17.xyz = tmpvar_16;
					  gl_FragData[0] = tmpvar_17;
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
					  highp vec2 uv_1;
					  uv_1 = xlv_TEXCOORD0;
					  highp vec4 col_2;
					  highp float n_3;
					  highp vec2 tuv_4;
					  tuv_4 = uv_1;
					  uv_1 = (uv_1 * 2.5);
					  highp float tmpvar_5;
					  tmpvar_5 = (((
					    sin(((1.099609 + (_TimeX * 2.704406)) + (3.0 * uv_1.x)))
					   + 
					    sin(((0.455078 + (_TimeX * 2.124281)) - (4.0 * uv_1.x)))
					  ) + sin(
					    ((8.447266 + (_TimeX * 1.902469)) + (2.0 * uv_1.y))
					  )) + sin((
					    (610.4609 + (_TimeX * 2.439938))
					   + 
					    (5.0 * uv_1.y)
					  )));
					  n_3 = tmpvar_5;
					  highp float tmpvar_6;
					  tmpvar_6 = ((4.0 + tmpvar_5) / 4.0);
					  highp float tmpvar_7;
					  tmpvar_7 = fract(abs(tmpvar_6));
					  highp float tmpvar_8;
					  if ((tmpvar_6 >= 0.0)) {
					    tmpvar_8 = tmpvar_7;
					  } else {
					    tmpvar_8 = -(tmpvar_7);
					  };
					  lowp vec4 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, tuv_4);
					  col_2 = tmpvar_9;
					  n_3 = (tmpvar_8 + ((
					    (col_2.x * 0.2)
					   + 
					    (col_2.y * 0.4)
					  ) + (col_2.z * 0.2)));
					  highp float tmpvar_10;
					  tmpvar_10 = fract(abs(n_3));
					  highp float tmpvar_11;
					  if ((n_3 >= 0.0)) {
					    tmpvar_11 = tmpvar_10;
					  } else {
					    tmpvar_11 = -(tmpvar_10);
					  };
					  highp float tmpvar_12;
					  tmpvar_12 = (tmpvar_11 * 6.0);
					  highp float tmpvar_13;
					  tmpvar_13 = (clamp ((tmpvar_12 - 4.0), 0.0, 1.0) + clamp ((2.0 - tmpvar_12), 0.0, 1.0));
					  highp float tmpvar_14;
					  if ((tmpvar_12 < 2.0)) {
					    tmpvar_14 = clamp (tmpvar_12, 0.0, 1.0);
					  } else {
					    tmpvar_14 = clamp ((4.0 - tmpvar_12), 0.0, 1.0);
					  };
					  highp float tmpvar_15;
					  if ((tmpvar_12 < 4.0)) {
					    tmpvar_15 = clamp ((tmpvar_12 - 2.0), 0.0, 1.0);
					  } else {
					    tmpvar_15 = clamp ((6.0 - tmpvar_12), 0.0, 1.0);
					  };
					  highp vec3 tmpvar_16;
					  tmpvar_16.x = tmpvar_13;
					  tmpvar_16.y = tmpvar_14;
					  tmpvar_16.z = tmpvar_15;
					  highp vec4 tmpvar_17;
					  tmpvar_17.w = 1.0;
					  tmpvar_17.xyz = tmpvar_16;
					  gl_FragData[0] = tmpvar_17;
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
					  highp vec2 uv_1;
					  uv_1 = xlv_TEXCOORD0;
					  highp vec4 col_2;
					  highp float n_3;
					  highp vec2 tuv_4;
					  tuv_4 = uv_1;
					  uv_1 = (uv_1 * 2.5);
					  highp float tmpvar_5;
					  tmpvar_5 = (((
					    sin(((1.099609 + (_TimeX * 2.704406)) + (3.0 * uv_1.x)))
					   + 
					    sin(((0.455078 + (_TimeX * 2.124281)) - (4.0 * uv_1.x)))
					  ) + sin(
					    ((8.447266 + (_TimeX * 1.902469)) + (2.0 * uv_1.y))
					  )) + sin((
					    (610.4609 + (_TimeX * 2.439938))
					   + 
					    (5.0 * uv_1.y)
					  )));
					  n_3 = tmpvar_5;
					  highp float tmpvar_6;
					  tmpvar_6 = ((4.0 + tmpvar_5) / 4.0);
					  highp float tmpvar_7;
					  tmpvar_7 = fract(abs(tmpvar_6));
					  highp float tmpvar_8;
					  if ((tmpvar_6 >= 0.0)) {
					    tmpvar_8 = tmpvar_7;
					  } else {
					    tmpvar_8 = -(tmpvar_7);
					  };
					  lowp vec4 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, tuv_4);
					  col_2 = tmpvar_9;
					  n_3 = (tmpvar_8 + ((
					    (col_2.x * 0.2)
					   + 
					    (col_2.y * 0.4)
					  ) + (col_2.z * 0.2)));
					  highp float tmpvar_10;
					  tmpvar_10 = fract(abs(n_3));
					  highp float tmpvar_11;
					  if ((n_3 >= 0.0)) {
					    tmpvar_11 = tmpvar_10;
					  } else {
					    tmpvar_11 = -(tmpvar_10);
					  };
					  highp float tmpvar_12;
					  tmpvar_12 = (tmpvar_11 * 6.0);
					  highp float tmpvar_13;
					  tmpvar_13 = (clamp ((tmpvar_12 - 4.0), 0.0, 1.0) + clamp ((2.0 - tmpvar_12), 0.0, 1.0));
					  highp float tmpvar_14;
					  if ((tmpvar_12 < 2.0)) {
					    tmpvar_14 = clamp (tmpvar_12, 0.0, 1.0);
					  } else {
					    tmpvar_14 = clamp ((4.0 - tmpvar_12), 0.0, 1.0);
					  };
					  highp float tmpvar_15;
					  if ((tmpvar_12 < 4.0)) {
					    tmpvar_15 = clamp ((tmpvar_12 - 2.0), 0.0, 1.0);
					  } else {
					    tmpvar_15 = clamp ((6.0 - tmpvar_12), 0.0, 1.0);
					  };
					  highp vec3 tmpvar_16;
					  tmpvar_16.x = tmpvar_13;
					  tmpvar_16.y = tmpvar_14;
					  tmpvar_16.z = tmpvar_15;
					  highp vec4 tmpvar_17;
					  tmpvar_17.w = 1.0;
					  tmpvar_17.xyz = tmpvar_16;
					  gl_FragData[0] = tmpvar_17;
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
					vec3 u_xlat1;
					vec2 u_xlat2;
					float u_xlat3;
					mediump float u_xlat16_3;
					lowp vec3 u_xlat10_3;
					bool u_xlatb3;
					bvec2 u_xlatb6;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(2.70440626, 2.12428117, 1.9024688, 2.43993759) + vec4(1.09960902, 0.455078006, 8.44726563, 610.460938);
					    u_xlat0.y = (-vs_TEXCOORD0.x) * 10.0 + u_xlat0.y;
					    u_xlat0.xzw = vs_TEXCOORD0.xyy * vec3(7.5, 5.0, 12.5) + u_xlat0.xzw;
					    u_xlat0 = sin(u_xlat0);
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlat0.x = u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + 4.0;
					    u_xlat0.x = u_xlat0.x * 0.25;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat10_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3 = dot(u_xlat10_3.xzy, vec3(0.200000003, 0.200000003, 0.400000006));
					    u_xlat0.x = u_xlat16_3 + u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(u_xlat0.x>=(-u_xlat0.x));
					#else
					    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
					#endif
					    u_xlat0.x = fract(abs(u_xlat0.x));
					    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat3 = u_xlat0.x * 6.0;
					    u_xlat3 = u_xlat3;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
					#else
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					#endif
					    u_xlatb6.xy = lessThan(u_xlat0.xxxx, vec4(0.333333343, 0.666666687, 0.333333343, 0.666666687)).xy;
					    u_xlat1.xyz = (-u_xlat0.xxx) * vec3(6.0, 6.0, 6.0) + vec3(2.0, 4.0, 6.0);
					    u_xlat2.xy = u_xlat0.xx * vec2(6.0, 6.0) + vec2(-4.0, -2.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
					#else
					    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
					#endif
					    u_xlat1.xy = u_xlat1.xy;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
					#else
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					#endif
					    u_xlat0.x = min(u_xlat1.z, 1.0);
					    SV_Target0.z = (u_xlatb6.y) ? u_xlat2.y : u_xlat0.x;
					    SV_Target0.x = u_xlat1.x + u_xlat2.x;
					    SV_Target0.y = (u_xlatb6.x) ? u_xlat3 : u_xlat1.y;
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
					vec3 u_xlat1;
					vec2 u_xlat2;
					float u_xlat3;
					mediump float u_xlat16_3;
					lowp vec3 u_xlat10_3;
					bool u_xlatb3;
					bvec2 u_xlatb6;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(2.70440626, 2.12428117, 1.9024688, 2.43993759) + vec4(1.09960902, 0.455078006, 8.44726563, 610.460938);
					    u_xlat0.y = (-vs_TEXCOORD0.x) * 10.0 + u_xlat0.y;
					    u_xlat0.xzw = vs_TEXCOORD0.xyy * vec3(7.5, 5.0, 12.5) + u_xlat0.xzw;
					    u_xlat0 = sin(u_xlat0);
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlat0.x = u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + 4.0;
					    u_xlat0.x = u_xlat0.x * 0.25;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat10_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3 = dot(u_xlat10_3.xzy, vec3(0.200000003, 0.200000003, 0.400000006));
					    u_xlat0.x = u_xlat16_3 + u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(u_xlat0.x>=(-u_xlat0.x));
					#else
					    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
					#endif
					    u_xlat0.x = fract(abs(u_xlat0.x));
					    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat3 = u_xlat0.x * 6.0;
					    u_xlat3 = u_xlat3;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
					#else
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					#endif
					    u_xlatb6.xy = lessThan(u_xlat0.xxxx, vec4(0.333333343, 0.666666687, 0.333333343, 0.666666687)).xy;
					    u_xlat1.xyz = (-u_xlat0.xxx) * vec3(6.0, 6.0, 6.0) + vec3(2.0, 4.0, 6.0);
					    u_xlat2.xy = u_xlat0.xx * vec2(6.0, 6.0) + vec2(-4.0, -2.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
					#else
					    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
					#endif
					    u_xlat1.xy = u_xlat1.xy;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
					#else
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					#endif
					    u_xlat0.x = min(u_xlat1.z, 1.0);
					    SV_Target0.z = (u_xlatb6.y) ? u_xlat2.y : u_xlat0.x;
					    SV_Target0.x = u_xlat1.x + u_xlat2.x;
					    SV_Target0.y = (u_xlatb6.x) ? u_xlat3 : u_xlat1.y;
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
					vec3 u_xlat1;
					vec2 u_xlat2;
					float u_xlat3;
					mediump float u_xlat16_3;
					lowp vec3 u_xlat10_3;
					bool u_xlatb3;
					bvec2 u_xlatb6;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(2.70440626, 2.12428117, 1.9024688, 2.43993759) + vec4(1.09960902, 0.455078006, 8.44726563, 610.460938);
					    u_xlat0.y = (-vs_TEXCOORD0.x) * 10.0 + u_xlat0.y;
					    u_xlat0.xzw = vs_TEXCOORD0.xyy * vec3(7.5, 5.0, 12.5) + u_xlat0.xzw;
					    u_xlat0 = sin(u_xlat0);
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlat0.x = u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + 4.0;
					    u_xlat0.x = u_xlat0.x * 0.25;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat10_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_3 = dot(u_xlat10_3.xzy, vec3(0.200000003, 0.200000003, 0.400000006));
					    u_xlat0.x = u_xlat16_3 + u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(u_xlat0.x>=(-u_xlat0.x));
					#else
					    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
					#endif
					    u_xlat0.x = fract(abs(u_xlat0.x));
					    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat3 = u_xlat0.x * 6.0;
					    u_xlat3 = u_xlat3;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
					#else
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					#endif
					    u_xlatb6.xy = lessThan(u_xlat0.xxxx, vec4(0.333333343, 0.666666687, 0.333333343, 0.666666687)).xy;
					    u_xlat1.xyz = (-u_xlat0.xxx) * vec3(6.0, 6.0, 6.0) + vec3(2.0, 4.0, 6.0);
					    u_xlat2.xy = u_xlat0.xx * vec2(6.0, 6.0) + vec2(-4.0, -2.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
					#else
					    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
					#endif
					    u_xlat1.xy = u_xlat1.xy;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
					#else
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					#endif
					    u_xlat0.x = min(u_xlat1.z, 1.0);
					    SV_Target0.z = (u_xlatb6.y) ? u_xlat2.y : u_xlat0.x;
					    SV_Target0.x = u_xlat1.x + u_xlat2.x;
					    SV_Target0.y = (u_xlatb6.x) ? u_xlat3 : u_xlat1.y;
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