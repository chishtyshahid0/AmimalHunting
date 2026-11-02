Shader "CameraFilterPack/TV_50" {
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
			GpuProgramID 27916
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
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec4 text_2;
					  highp vec3 col_3;
					  highp vec2 q_4;
					  q_4 = xlv_TEXCOORD0;
					  highp vec2 uv_5;
					  uv_5 = ((q_4 - 0.5) * 2.0);
					  uv_5 = (uv_5 * 1.1);
					  highp float tmpvar_6;
					  tmpvar_6 = (abs(uv_5.y) * 0.2);
					  uv_5.x = (uv_5.x * (1.0 + (tmpvar_6 * tmpvar_6)));
					  highp float tmpvar_7;
					  tmpvar_7 = (abs(uv_5.x) * 0.25);
					  uv_5.y = (uv_5.y * (1.0 + (tmpvar_7 * tmpvar_7)));
					  uv_5 = ((uv_5 / 2.0) + 0.5);
					  uv_5 = ((uv_5 * 0.92) + 0.04);
					  highp float tmpvar_8;
					  tmpvar_8 = (((
					    sin(((0.3 * _TimeX) + (uv_5.y * 21.0)))
					   * 
					    sin(((0.7 * _TimeX) + (uv_5.y * 29.0)))
					  ) * sin(
					    ((0.3 + (0.33 * _TimeX)) + (uv_5.y * 31.0))
					  )) * 0.0017);
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = ((tmpvar_8 + uv_5.x) + 0.001);
					  tmpvar_9.y = (uv_5.y + 0.001);
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, tmpvar_9);
					  text_2 = tmpvar_10;
					  col_3 = (text_2.xyz + 0.05);
					  highp vec2 tmpvar_11;
					  tmpvar_11.y = -0.02;
					  tmpvar_11.x = (tmpvar_8 + 0.025);
					  lowp vec4 tmpvar_12;
					  highp vec2 P_13;
					  P_13 = ((0.75 * tmpvar_11) + (uv_5 + vec2(0.001, 0.001)));
					  tmpvar_12 = texture2D (_MainTex, P_13);
					  text_2 = tmpvar_12;
					  col_3.x = (col_3.x + (0.08 * text_2.x));
					  col_3.y = (col_3.y + (0.05 * text_2.y));
					  col_3.z = (col_3.z + (0.08 * text_2.z));
					  col_3 = (clamp ((
					    (col_3 * 0.6)
					   + 
					    ((0.4 * col_3) * col_3)
					  ), vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0)) * pow ((
					    (((16.0 * uv_5.x) * uv_5.y) * (1.0 - uv_5.x))
					   * 
					    (1.0 - uv_5.y)
					  ), 0.3));
					  col_3 = (col_3 * vec3(3.66, 2.94, 2.66));
					  col_3 = (col_3 * (0.4 + (0.7 * 
					    pow (clamp ((0.35 + (0.35 * 
					      sin(((3.5 * _TimeX) + ((uv_5.y * _ScreenResolution.y) * 1.5)))
					    )), 0.0, 1.0), 1.7)
					  )));
					  col_3 = vec3(dot (col_3, vec3(0.222, 0.707, 0.071)));
					  col_3 = (col_3 * ((1.0 + 
					    (0.01 * sin((110.0 * _TimeX)))
					  ) + (vec3(
					    clamp (((fract(
					      (sin(dot ((
					        (floor((uv_5 * vec2(250.0, 250.0))) * _TimeX)
					       / 1000.0), vec2(12.9898, 78.233))) * 43758.55)
					    ) + 1.0) - 0.75), 0.0, 1.0)
					  ) * 
					    clamp (floor((sin(
					      ((uv_5.y * 6.0) + (_TimeX * 2.6))
					    ) + 1.95)), 0.0, 1.1)
					  )));
					  if (((uv_5.x < 0.0) || (uv_5.x > 1.0))) {
					    col_3 = vec3(0.0, 0.0, 0.0);
					  };
					  if (((uv_5.y < 0.0) || (uv_5.y > 1.0))) {
					    col_3 = vec3(0.0, 0.0, 0.0);
					  };
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 1.0;
					  tmpvar_14.xyz = col_3;
					  tmpvar_1 = tmpvar_14;
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
					uniform highp float _TimeX;
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec4 text_2;
					  highp vec3 col_3;
					  highp vec2 q_4;
					  q_4 = xlv_TEXCOORD0;
					  highp vec2 uv_5;
					  uv_5 = ((q_4 - 0.5) * 2.0);
					  uv_5 = (uv_5 * 1.1);
					  highp float tmpvar_6;
					  tmpvar_6 = (abs(uv_5.y) * 0.2);
					  uv_5.x = (uv_5.x * (1.0 + (tmpvar_6 * tmpvar_6)));
					  highp float tmpvar_7;
					  tmpvar_7 = (abs(uv_5.x) * 0.25);
					  uv_5.y = (uv_5.y * (1.0 + (tmpvar_7 * tmpvar_7)));
					  uv_5 = ((uv_5 / 2.0) + 0.5);
					  uv_5 = ((uv_5 * 0.92) + 0.04);
					  highp float tmpvar_8;
					  tmpvar_8 = (((
					    sin(((0.3 * _TimeX) + (uv_5.y * 21.0)))
					   * 
					    sin(((0.7 * _TimeX) + (uv_5.y * 29.0)))
					  ) * sin(
					    ((0.3 + (0.33 * _TimeX)) + (uv_5.y * 31.0))
					  )) * 0.0017);
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = ((tmpvar_8 + uv_5.x) + 0.001);
					  tmpvar_9.y = (uv_5.y + 0.001);
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, tmpvar_9);
					  text_2 = tmpvar_10;
					  col_3 = (text_2.xyz + 0.05);
					  highp vec2 tmpvar_11;
					  tmpvar_11.y = -0.02;
					  tmpvar_11.x = (tmpvar_8 + 0.025);
					  lowp vec4 tmpvar_12;
					  highp vec2 P_13;
					  P_13 = ((0.75 * tmpvar_11) + (uv_5 + vec2(0.001, 0.001)));
					  tmpvar_12 = texture2D (_MainTex, P_13);
					  text_2 = tmpvar_12;
					  col_3.x = (col_3.x + (0.08 * text_2.x));
					  col_3.y = (col_3.y + (0.05 * text_2.y));
					  col_3.z = (col_3.z + (0.08 * text_2.z));
					  col_3 = (clamp ((
					    (col_3 * 0.6)
					   + 
					    ((0.4 * col_3) * col_3)
					  ), vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0)) * pow ((
					    (((16.0 * uv_5.x) * uv_5.y) * (1.0 - uv_5.x))
					   * 
					    (1.0 - uv_5.y)
					  ), 0.3));
					  col_3 = (col_3 * vec3(3.66, 2.94, 2.66));
					  col_3 = (col_3 * (0.4 + (0.7 * 
					    pow (clamp ((0.35 + (0.35 * 
					      sin(((3.5 * _TimeX) + ((uv_5.y * _ScreenResolution.y) * 1.5)))
					    )), 0.0, 1.0), 1.7)
					  )));
					  col_3 = vec3(dot (col_3, vec3(0.222, 0.707, 0.071)));
					  col_3 = (col_3 * ((1.0 + 
					    (0.01 * sin((110.0 * _TimeX)))
					  ) + (vec3(
					    clamp (((fract(
					      (sin(dot ((
					        (floor((uv_5 * vec2(250.0, 250.0))) * _TimeX)
					       / 1000.0), vec2(12.9898, 78.233))) * 43758.55)
					    ) + 1.0) - 0.75), 0.0, 1.0)
					  ) * 
					    clamp (floor((sin(
					      ((uv_5.y * 6.0) + (_TimeX * 2.6))
					    ) + 1.95)), 0.0, 1.1)
					  )));
					  if (((uv_5.x < 0.0) || (uv_5.x > 1.0))) {
					    col_3 = vec3(0.0, 0.0, 0.0);
					  };
					  if (((uv_5.y < 0.0) || (uv_5.y > 1.0))) {
					    col_3 = vec3(0.0, 0.0, 0.0);
					  };
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 1.0;
					  tmpvar_14.xyz = col_3;
					  tmpvar_1 = tmpvar_14;
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
					uniform highp float _TimeX;
					uniform highp vec4 _ScreenResolution;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec4 text_2;
					  highp vec3 col_3;
					  highp vec2 q_4;
					  q_4 = xlv_TEXCOORD0;
					  highp vec2 uv_5;
					  uv_5 = ((q_4 - 0.5) * 2.0);
					  uv_5 = (uv_5 * 1.1);
					  highp float tmpvar_6;
					  tmpvar_6 = (abs(uv_5.y) * 0.2);
					  uv_5.x = (uv_5.x * (1.0 + (tmpvar_6 * tmpvar_6)));
					  highp float tmpvar_7;
					  tmpvar_7 = (abs(uv_5.x) * 0.25);
					  uv_5.y = (uv_5.y * (1.0 + (tmpvar_7 * tmpvar_7)));
					  uv_5 = ((uv_5 / 2.0) + 0.5);
					  uv_5 = ((uv_5 * 0.92) + 0.04);
					  highp float tmpvar_8;
					  tmpvar_8 = (((
					    sin(((0.3 * _TimeX) + (uv_5.y * 21.0)))
					   * 
					    sin(((0.7 * _TimeX) + (uv_5.y * 29.0)))
					  ) * sin(
					    ((0.3 + (0.33 * _TimeX)) + (uv_5.y * 31.0))
					  )) * 0.0017);
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = ((tmpvar_8 + uv_5.x) + 0.001);
					  tmpvar_9.y = (uv_5.y + 0.001);
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, tmpvar_9);
					  text_2 = tmpvar_10;
					  col_3 = (text_2.xyz + 0.05);
					  highp vec2 tmpvar_11;
					  tmpvar_11.y = -0.02;
					  tmpvar_11.x = (tmpvar_8 + 0.025);
					  lowp vec4 tmpvar_12;
					  highp vec2 P_13;
					  P_13 = ((0.75 * tmpvar_11) + (uv_5 + vec2(0.001, 0.001)));
					  tmpvar_12 = texture2D (_MainTex, P_13);
					  text_2 = tmpvar_12;
					  col_3.x = (col_3.x + (0.08 * text_2.x));
					  col_3.y = (col_3.y + (0.05 * text_2.y));
					  col_3.z = (col_3.z + (0.08 * text_2.z));
					  col_3 = (clamp ((
					    (col_3 * 0.6)
					   + 
					    ((0.4 * col_3) * col_3)
					  ), vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0)) * pow ((
					    (((16.0 * uv_5.x) * uv_5.y) * (1.0 - uv_5.x))
					   * 
					    (1.0 - uv_5.y)
					  ), 0.3));
					  col_3 = (col_3 * vec3(3.66, 2.94, 2.66));
					  col_3 = (col_3 * (0.4 + (0.7 * 
					    pow (clamp ((0.35 + (0.35 * 
					      sin(((3.5 * _TimeX) + ((uv_5.y * _ScreenResolution.y) * 1.5)))
					    )), 0.0, 1.0), 1.7)
					  )));
					  col_3 = vec3(dot (col_3, vec3(0.222, 0.707, 0.071)));
					  col_3 = (col_3 * ((1.0 + 
					    (0.01 * sin((110.0 * _TimeX)))
					  ) + (vec3(
					    clamp (((fract(
					      (sin(dot ((
					        (floor((uv_5 * vec2(250.0, 250.0))) * _TimeX)
					       / 1000.0), vec2(12.9898, 78.233))) * 43758.55)
					    ) + 1.0) - 0.75), 0.0, 1.0)
					  ) * 
					    clamp (floor((sin(
					      ((uv_5.y * 6.0) + (_TimeX * 2.6))
					    ) + 1.95)), 0.0, 1.1)
					  )));
					  if (((uv_5.x < 0.0) || (uv_5.x > 1.0))) {
					    col_3 = vec3(0.0, 0.0, 0.0);
					  };
					  if (((uv_5.y < 0.0) || (uv_5.y > 1.0))) {
					    col_3 = vec3(0.0, 0.0, 0.0);
					  };
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 1.0;
					  tmpvar_14.xyz = col_3;
					  tmpvar_1 = tmpvar_14;
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
					uniform 	float _TimeX;
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					ivec2 u_xlati1;
					vec3 u_xlat2;
					mediump vec3 u_xlat16_3;
					lowp vec3 u_xlat10_3;
					vec2 u_xlat4;
					ivec2 u_xlati4;
					vec3 u_xlat5;
					vec2 u_xlat8;
					mediump float u_xlat16_8;
					float u_xlat12;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_0.xy = u_xlat16_0.xy * vec2(2.20000005, 2.20000005);
					    u_xlat16_8 = abs(u_xlat16_0.y) * 0.200000003;
					    u_xlat16_8 = u_xlat16_8 * u_xlat16_8 + 1.0;
					    u_xlat5.x = u_xlat16_8 * u_xlat16_0.x;
					    u_xlat0.x = abs(u_xlat5.x) * 0.25;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + 1.0;
					    u_xlat5.yz = u_xlat0.xx * u_xlat16_0.yy;
					    u_xlat0.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat12 = u_xlat0.x * 0.920000017;
					    u_xlat1.yzw = u_xlat0.zxy * vec3(0.920000017, 0.920000017, 0.920000017) + vec3(0.0409999974, 0.0399999991, 0.0399999991);
					    u_xlat0.x = _TimeX * 0.330000013 + 0.300000012;
					    u_xlat0.x = u_xlat1.w * 31.0 + u_xlat0.x;
					    u_xlat2.xyz = vec3(u_xlat1.w * float(21.0), u_xlat1.w * float(29.0), u_xlat1.z * float(250.0));
					    u_xlat0.yz = vec2(_TimeX) * vec2(0.300000012, 0.699999988) + u_xlat2.xy;
					    u_xlat2.x = floor(u_xlat2.z);
					    u_xlat0.xyz = sin(u_xlat0.xyz);
					    u_xlat4.x = u_xlat0.z * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat4.x;
					    u_xlat4.x = u_xlat0.x * 0.00170000002 + 0.0250000004;
					    u_xlat0.x = u_xlat0.x * 0.00170000002 + u_xlat1.z;
					    u_xlat1.x = u_xlat0.x + 0.00100000005;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_3.xyz + vec3(0.0500000007, 0.0500000007, 0.0500000007);
					    u_xlat1.x = u_xlat4.x * 0.75 + u_xlat12;
					    u_xlat0.xy = u_xlat1.xy + vec2(0.0409999974, -0.0149999997);
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.0799999982, 0.0500000007, 0.0799999982) + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat16_3.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
					#else
					    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
					#endif
					    u_xlat12 = u_xlat1.z * u_xlat1.w;
					    u_xlat12 = u_xlat12 * 16.0;
					    u_xlat1.xy = vec2((-u_xlat1.z) + float(1.0), (-u_xlat1.w) + float(1.0));
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat12 = u_xlat1.y * u_xlat12;
					    u_xlat12 = log2(u_xlat12);
					    u_xlat12 = u_xlat12 * 0.300000012;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat16_0.xyz;
					    u_xlat12 = u_xlat1.w * _ScreenResolution.y;
					    u_xlat1.x = _TimeX * 3.5;
					    u_xlat12 = u_xlat12 * 1.5 + u_xlat1.x;
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 0.349999994 + 0.349999994;
					    u_xlat0.w = log2(u_xlat12);
					    u_xlat0 = u_xlat0 * vec4(3.66000009, 2.94000006, 2.66000009, 1.70000005);
					    u_xlat12 = exp2(u_xlat0.w);
					    u_xlat12 = u_xlat12 * 0.699999988 + 0.400000006;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.222000003, 0.707000017, 0.0710000023));
					    u_xlat4.x = u_xlat1.w * 250.0;
					    u_xlat2.y = floor(u_xlat4.x);
					    u_xlat4.xy = u_xlat2.xy * vec2(_TimeX);
					    u_xlat4.xy = u_xlat4.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat4.x = dot(u_xlat4.xy, vec2(12.9898005, 78.2330017));
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 43758.5469;
					    u_xlat4.x = fract(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x + 0.25;
					    u_xlat8.xy = vec2(_TimeX) * vec2(2.5999999, 110.0);
					    u_xlat8.x = u_xlat1.w * 6.0 + u_xlat8.x;
					    u_xlat8.xy = sin(u_xlat8.xy);
					    u_xlat12 = u_xlat8.y * 0.00999999978 + 1.0;
					    u_xlat8.x = u_xlat8.x + 1.95000005;
					    u_xlat4.y = floor(u_xlat8.x);
					    u_xlat4.xy = min(u_xlat4.xy, vec2(1.0, 1.10000002));
					    u_xlat4.x = u_xlat4.x * u_xlat4.y + u_xlat12;
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlati4.xy = ivec2(uvec2(lessThan(u_xlat1.zwzz, vec4(0.0, 0.0, 0.0, 0.0)).xy) * 0xFFFFFFFFu);
					    u_xlati1.xy = ivec2(uvec2(lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.zwzz).xy) * 0xFFFFFFFFu);
					    u_xlati4.xy = ivec2(uvec2(u_xlati4.xy) | uvec2(u_xlati1.xy));
					    u_xlati4.x = int(uint(u_xlati4.y) | uint(u_xlati4.x));
					    u_xlat0.xyz = (u_xlati4.x != 0) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xxx;
					    SV_Target0.xyz = u_xlat0.xyz;
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
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					ivec2 u_xlati1;
					vec3 u_xlat2;
					mediump vec3 u_xlat16_3;
					lowp vec3 u_xlat10_3;
					vec2 u_xlat4;
					ivec2 u_xlati4;
					vec3 u_xlat5;
					vec2 u_xlat8;
					mediump float u_xlat16_8;
					float u_xlat12;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_0.xy = u_xlat16_0.xy * vec2(2.20000005, 2.20000005);
					    u_xlat16_8 = abs(u_xlat16_0.y) * 0.200000003;
					    u_xlat16_8 = u_xlat16_8 * u_xlat16_8 + 1.0;
					    u_xlat5.x = u_xlat16_8 * u_xlat16_0.x;
					    u_xlat0.x = abs(u_xlat5.x) * 0.25;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + 1.0;
					    u_xlat5.yz = u_xlat0.xx * u_xlat16_0.yy;
					    u_xlat0.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat12 = u_xlat0.x * 0.920000017;
					    u_xlat1.yzw = u_xlat0.zxy * vec3(0.920000017, 0.920000017, 0.920000017) + vec3(0.0409999974, 0.0399999991, 0.0399999991);
					    u_xlat0.x = _TimeX * 0.330000013 + 0.300000012;
					    u_xlat0.x = u_xlat1.w * 31.0 + u_xlat0.x;
					    u_xlat2.xyz = vec3(u_xlat1.w * float(21.0), u_xlat1.w * float(29.0), u_xlat1.z * float(250.0));
					    u_xlat0.yz = vec2(_TimeX) * vec2(0.300000012, 0.699999988) + u_xlat2.xy;
					    u_xlat2.x = floor(u_xlat2.z);
					    u_xlat0.xyz = sin(u_xlat0.xyz);
					    u_xlat4.x = u_xlat0.z * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat4.x;
					    u_xlat4.x = u_xlat0.x * 0.00170000002 + 0.0250000004;
					    u_xlat0.x = u_xlat0.x * 0.00170000002 + u_xlat1.z;
					    u_xlat1.x = u_xlat0.x + 0.00100000005;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_3.xyz + vec3(0.0500000007, 0.0500000007, 0.0500000007);
					    u_xlat1.x = u_xlat4.x * 0.75 + u_xlat12;
					    u_xlat0.xy = u_xlat1.xy + vec2(0.0409999974, -0.0149999997);
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.0799999982, 0.0500000007, 0.0799999982) + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat16_3.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
					#else
					    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
					#endif
					    u_xlat12 = u_xlat1.z * u_xlat1.w;
					    u_xlat12 = u_xlat12 * 16.0;
					    u_xlat1.xy = vec2((-u_xlat1.z) + float(1.0), (-u_xlat1.w) + float(1.0));
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat12 = u_xlat1.y * u_xlat12;
					    u_xlat12 = log2(u_xlat12);
					    u_xlat12 = u_xlat12 * 0.300000012;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat16_0.xyz;
					    u_xlat12 = u_xlat1.w * _ScreenResolution.y;
					    u_xlat1.x = _TimeX * 3.5;
					    u_xlat12 = u_xlat12 * 1.5 + u_xlat1.x;
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 0.349999994 + 0.349999994;
					    u_xlat0.w = log2(u_xlat12);
					    u_xlat0 = u_xlat0 * vec4(3.66000009, 2.94000006, 2.66000009, 1.70000005);
					    u_xlat12 = exp2(u_xlat0.w);
					    u_xlat12 = u_xlat12 * 0.699999988 + 0.400000006;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.222000003, 0.707000017, 0.0710000023));
					    u_xlat4.x = u_xlat1.w * 250.0;
					    u_xlat2.y = floor(u_xlat4.x);
					    u_xlat4.xy = u_xlat2.xy * vec2(_TimeX);
					    u_xlat4.xy = u_xlat4.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat4.x = dot(u_xlat4.xy, vec2(12.9898005, 78.2330017));
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 43758.5469;
					    u_xlat4.x = fract(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x + 0.25;
					    u_xlat8.xy = vec2(_TimeX) * vec2(2.5999999, 110.0);
					    u_xlat8.x = u_xlat1.w * 6.0 + u_xlat8.x;
					    u_xlat8.xy = sin(u_xlat8.xy);
					    u_xlat12 = u_xlat8.y * 0.00999999978 + 1.0;
					    u_xlat8.x = u_xlat8.x + 1.95000005;
					    u_xlat4.y = floor(u_xlat8.x);
					    u_xlat4.xy = min(u_xlat4.xy, vec2(1.0, 1.10000002));
					    u_xlat4.x = u_xlat4.x * u_xlat4.y + u_xlat12;
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlati4.xy = ivec2(uvec2(lessThan(u_xlat1.zwzz, vec4(0.0, 0.0, 0.0, 0.0)).xy) * 0xFFFFFFFFu);
					    u_xlati1.xy = ivec2(uvec2(lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.zwzz).xy) * 0xFFFFFFFFu);
					    u_xlati4.xy = ivec2(uvec2(u_xlati4.xy) | uvec2(u_xlati1.xy));
					    u_xlati4.x = int(uint(u_xlati4.y) | uint(u_xlati4.x));
					    u_xlat0.xyz = (u_xlati4.x != 0) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xxx;
					    SV_Target0.xyz = u_xlat0.xyz;
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
					uniform 	vec4 _ScreenResolution;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					ivec2 u_xlati1;
					vec3 u_xlat2;
					mediump vec3 u_xlat16_3;
					lowp vec3 u_xlat10_3;
					vec2 u_xlat4;
					ivec2 u_xlati4;
					vec3 u_xlat5;
					vec2 u_xlat8;
					mediump float u_xlat16_8;
					float u_xlat12;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_0.xy = u_xlat16_0.xy * vec2(2.20000005, 2.20000005);
					    u_xlat16_8 = abs(u_xlat16_0.y) * 0.200000003;
					    u_xlat16_8 = u_xlat16_8 * u_xlat16_8 + 1.0;
					    u_xlat5.x = u_xlat16_8 * u_xlat16_0.x;
					    u_xlat0.x = abs(u_xlat5.x) * 0.25;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + 1.0;
					    u_xlat5.yz = u_xlat0.xx * u_xlat16_0.yy;
					    u_xlat0.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat12 = u_xlat0.x * 0.920000017;
					    u_xlat1.yzw = u_xlat0.zxy * vec3(0.920000017, 0.920000017, 0.920000017) + vec3(0.0409999974, 0.0399999991, 0.0399999991);
					    u_xlat0.x = _TimeX * 0.330000013 + 0.300000012;
					    u_xlat0.x = u_xlat1.w * 31.0 + u_xlat0.x;
					    u_xlat2.xyz = vec3(u_xlat1.w * float(21.0), u_xlat1.w * float(29.0), u_xlat1.z * float(250.0));
					    u_xlat0.yz = vec2(_TimeX) * vec2(0.300000012, 0.699999988) + u_xlat2.xy;
					    u_xlat2.x = floor(u_xlat2.z);
					    u_xlat0.xyz = sin(u_xlat0.xyz);
					    u_xlat4.x = u_xlat0.z * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat4.x;
					    u_xlat4.x = u_xlat0.x * 0.00170000002 + 0.0250000004;
					    u_xlat0.x = u_xlat0.x * 0.00170000002 + u_xlat1.z;
					    u_xlat1.x = u_xlat0.x + 0.00100000005;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_3.xyz + vec3(0.0500000007, 0.0500000007, 0.0500000007);
					    u_xlat1.x = u_xlat4.x * 0.75 + u_xlat12;
					    u_xlat0.xy = u_xlat1.xy + vec2(0.0409999974, -0.0149999997);
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.0799999982, 0.0500000007, 0.0799999982) + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_0.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat16_3.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
					#else
					    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
					#endif
					    u_xlat12 = u_xlat1.z * u_xlat1.w;
					    u_xlat12 = u_xlat12 * 16.0;
					    u_xlat1.xy = vec2((-u_xlat1.z) + float(1.0), (-u_xlat1.w) + float(1.0));
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat12 = u_xlat1.y * u_xlat12;
					    u_xlat12 = log2(u_xlat12);
					    u_xlat12 = u_xlat12 * 0.300000012;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat16_0.xyz;
					    u_xlat12 = u_xlat1.w * _ScreenResolution.y;
					    u_xlat1.x = _TimeX * 3.5;
					    u_xlat12 = u_xlat12 * 1.5 + u_xlat1.x;
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 0.349999994 + 0.349999994;
					    u_xlat0.w = log2(u_xlat12);
					    u_xlat0 = u_xlat0 * vec4(3.66000009, 2.94000006, 2.66000009, 1.70000005);
					    u_xlat12 = exp2(u_xlat0.w);
					    u_xlat12 = u_xlat12 * 0.699999988 + 0.400000006;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.222000003, 0.707000017, 0.0710000023));
					    u_xlat4.x = u_xlat1.w * 250.0;
					    u_xlat2.y = floor(u_xlat4.x);
					    u_xlat4.xy = u_xlat2.xy * vec2(_TimeX);
					    u_xlat4.xy = u_xlat4.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat4.x = dot(u_xlat4.xy, vec2(12.9898005, 78.2330017));
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 43758.5469;
					    u_xlat4.x = fract(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x + 0.25;
					    u_xlat8.xy = vec2(_TimeX) * vec2(2.5999999, 110.0);
					    u_xlat8.x = u_xlat1.w * 6.0 + u_xlat8.x;
					    u_xlat8.xy = sin(u_xlat8.xy);
					    u_xlat12 = u_xlat8.y * 0.00999999978 + 1.0;
					    u_xlat8.x = u_xlat8.x + 1.95000005;
					    u_xlat4.y = floor(u_xlat8.x);
					    u_xlat4.xy = min(u_xlat4.xy, vec2(1.0, 1.10000002));
					    u_xlat4.x = u_xlat4.x * u_xlat4.y + u_xlat12;
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlati4.xy = ivec2(uvec2(lessThan(u_xlat1.zwzz, vec4(0.0, 0.0, 0.0, 0.0)).xy) * 0xFFFFFFFFu);
					    u_xlati1.xy = ivec2(uvec2(lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.zwzz).xy) * 0xFFFFFFFFu);
					    u_xlati4.xy = ivec2(uvec2(u_xlati4.xy) | uvec2(u_xlati1.xy));
					    u_xlati4.x = int(uint(u_xlati4.y) | uint(u_xlati4.x));
					    u_xlat0.xyz = (u_xlati4.x != 0) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xxx;
					    SV_Target0.xyz = u_xlat0.xyz;
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