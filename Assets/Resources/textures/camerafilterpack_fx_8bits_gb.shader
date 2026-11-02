Shader "CameraFilterPack/FX_8bits_gb" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenX ("Time", Range(0, 2000)) = 1
		_ScreenY ("Time", Range(0, 2000)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 50700
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
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 FragColor_1;
					  highp float best1_2;
					  highp float best0_3;
					  highp vec3 dst1_4;
					  highp vec3 dst0_5;
					  highp vec3 src_6;
					  highp vec2 q_7;
					  q_7 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_8;
					  tmpvar_8 = ((q_7 / vec2(0.00625, 0.00694)) * vec2(0.00625, 0.00694));
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, tmpvar_8).xyz;
					  src_6 = tmpvar_9;
					  dst0_5 = vec3(0.0, 0.0, 0.0);
					  dst1_4 = vec3(0.0, 0.0, 0.0);
					  best0_3 = 1000.0;
					  best1_2 = 1000.0;
					  src_6 = (src_6 + _Distortion);
					  highp vec3 tmpvar_10;
					  tmpvar_10 = ((src_6 * (src_6 * src_6)) - vec3(2.7e-05, 0.004096, 0.035937));
					  highp float tmpvar_11;
					  tmpvar_11 = dot (tmpvar_10, tmpvar_10);
					  if ((tmpvar_11 < 1000.0)) {
					    best1_2 = 1000.0;
					    dst1_4 = vec3(0.0, 0.0, 0.0);
					    best0_3 = tmpvar_11;
					    dst0_5 = vec3(0.03, 0.16, 0.33);
					  };
					  highp vec3 tmpvar_12;
					  tmpvar_12 = ((src_6 * (src_6 * src_6)) - vec3(0.002197, 0.079507, 0.050653));
					  highp float tmpvar_13;
					  tmpvar_13 = dot (tmpvar_12, tmpvar_12);
					  if ((tmpvar_13 < best0_3)) {
					    best1_2 = best0_3;
					    dst1_4 = dst0_5;
					    best0_3 = tmpvar_13;
					    dst0_5 = vec3(0.13, 0.43, 0.37);
					  };
					  highp vec3 tmpvar_14;
					  tmpvar_14 = ((src_6 * (src_6 * src_6)) - vec3(0.103823, 0.328509, 0.07408799));
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_14, tmpvar_14);
					  if ((tmpvar_15 < best0_3)) {
					    best1_2 = best0_3;
					    dst1_4 = dst0_5;
					    best0_3 = tmpvar_15;
					    dst0_5 = vec3(0.47, 0.69, 0.42);
					  };
					  highp vec3 tmpvar_16;
					  tmpvar_16 = ((src_6 * (src_6 * src_6)) - vec3(0.314432, 0.493039, 0.019683));
					  highp float tmpvar_17;
					  tmpvar_17 = dot (tmpvar_16, tmpvar_16);
					  if ((tmpvar_17 < best0_3)) {
					    best1_2 = best0_3;
					    dst1_4 = dst0_5;
					    best0_3 = tmpvar_17;
					    dst0_5 = vec3(0.68, 0.79, 0.27);
					  };
					  highp float tmpvar_18;
					  highp float x_19;
					  x_19 = (q_7.x + q_7.y);
					  tmpvar_18 = (x_19 - (floor(
					    (x_19 * 0.5)
					  ) * 2.0));
					  highp vec2 p_20;
					  p_20 = ((q_7 * 0.5) + fract(sin(vec2(
					    floor(_TimeX)
					  ))));
					  highp float tmpvar_21;
					  tmpvar_21 = fract(((10000.0 * 
					    sin(((17.0 * p_20.x) + (p_20.y * 0.1)))
					  ) * (0.1 + 
					    abs(sin(((p_20.y * 13.0) + p_20.x)))
					  )));
					  highp vec3 tmpvar_22;
					  if ((tmpvar_18 > ((tmpvar_21 * 0.75) + (best1_2 / 
					    (best0_3 + best1_2)
					  )))) {
					    tmpvar_22 = dst1_4;
					  } else {
					    tmpvar_22 = dst0_5;
					  };
					  highp vec4 tmpvar_23;
					  tmpvar_23.w = 1.0;
					  tmpvar_23.xyz = tmpvar_22;
					  FragColor_1 = tmpvar_23;
					  if ((tmpvar_22.x == 0.0)) {
					    FragColor_1.xyz = vec3(0.03, 0.16, 0.33);
					  };
					  gl_FragData[0] = FragColor_1;
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
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 FragColor_1;
					  highp float best1_2;
					  highp float best0_3;
					  highp vec3 dst1_4;
					  highp vec3 dst0_5;
					  highp vec3 src_6;
					  highp vec2 q_7;
					  q_7 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_8;
					  tmpvar_8 = ((q_7 / vec2(0.00625, 0.00694)) * vec2(0.00625, 0.00694));
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, tmpvar_8).xyz;
					  src_6 = tmpvar_9;
					  dst0_5 = vec3(0.0, 0.0, 0.0);
					  dst1_4 = vec3(0.0, 0.0, 0.0);
					  best0_3 = 1000.0;
					  best1_2 = 1000.0;
					  src_6 = (src_6 + _Distortion);
					  highp vec3 tmpvar_10;
					  tmpvar_10 = ((src_6 * (src_6 * src_6)) - vec3(2.7e-05, 0.004096, 0.035937));
					  highp float tmpvar_11;
					  tmpvar_11 = dot (tmpvar_10, tmpvar_10);
					  if ((tmpvar_11 < 1000.0)) {
					    best1_2 = 1000.0;
					    dst1_4 = vec3(0.0, 0.0, 0.0);
					    best0_3 = tmpvar_11;
					    dst0_5 = vec3(0.03, 0.16, 0.33);
					  };
					  highp vec3 tmpvar_12;
					  tmpvar_12 = ((src_6 * (src_6 * src_6)) - vec3(0.002197, 0.079507, 0.050653));
					  highp float tmpvar_13;
					  tmpvar_13 = dot (tmpvar_12, tmpvar_12);
					  if ((tmpvar_13 < best0_3)) {
					    best1_2 = best0_3;
					    dst1_4 = dst0_5;
					    best0_3 = tmpvar_13;
					    dst0_5 = vec3(0.13, 0.43, 0.37);
					  };
					  highp vec3 tmpvar_14;
					  tmpvar_14 = ((src_6 * (src_6 * src_6)) - vec3(0.103823, 0.328509, 0.07408799));
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_14, tmpvar_14);
					  if ((tmpvar_15 < best0_3)) {
					    best1_2 = best0_3;
					    dst1_4 = dst0_5;
					    best0_3 = tmpvar_15;
					    dst0_5 = vec3(0.47, 0.69, 0.42);
					  };
					  highp vec3 tmpvar_16;
					  tmpvar_16 = ((src_6 * (src_6 * src_6)) - vec3(0.314432, 0.493039, 0.019683));
					  highp float tmpvar_17;
					  tmpvar_17 = dot (tmpvar_16, tmpvar_16);
					  if ((tmpvar_17 < best0_3)) {
					    best1_2 = best0_3;
					    dst1_4 = dst0_5;
					    best0_3 = tmpvar_17;
					    dst0_5 = vec3(0.68, 0.79, 0.27);
					  };
					  highp float tmpvar_18;
					  highp float x_19;
					  x_19 = (q_7.x + q_7.y);
					  tmpvar_18 = (x_19 - (floor(
					    (x_19 * 0.5)
					  ) * 2.0));
					  highp vec2 p_20;
					  p_20 = ((q_7 * 0.5) + fract(sin(vec2(
					    floor(_TimeX)
					  ))));
					  highp float tmpvar_21;
					  tmpvar_21 = fract(((10000.0 * 
					    sin(((17.0 * p_20.x) + (p_20.y * 0.1)))
					  ) * (0.1 + 
					    abs(sin(((p_20.y * 13.0) + p_20.x)))
					  )));
					  highp vec3 tmpvar_22;
					  if ((tmpvar_18 > ((tmpvar_21 * 0.75) + (best1_2 / 
					    (best0_3 + best1_2)
					  )))) {
					    tmpvar_22 = dst1_4;
					  } else {
					    tmpvar_22 = dst0_5;
					  };
					  highp vec4 tmpvar_23;
					  tmpvar_23.w = 1.0;
					  tmpvar_23.xyz = tmpvar_22;
					  FragColor_1 = tmpvar_23;
					  if ((tmpvar_22.x == 0.0)) {
					    FragColor_1.xyz = vec3(0.03, 0.16, 0.33);
					  };
					  gl_FragData[0] = FragColor_1;
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
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 FragColor_1;
					  highp float best1_2;
					  highp float best0_3;
					  highp vec3 dst1_4;
					  highp vec3 dst0_5;
					  highp vec3 src_6;
					  highp vec2 q_7;
					  q_7 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_8;
					  tmpvar_8 = ((q_7 / vec2(0.00625, 0.00694)) * vec2(0.00625, 0.00694));
					  lowp vec3 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, tmpvar_8).xyz;
					  src_6 = tmpvar_9;
					  dst0_5 = vec3(0.0, 0.0, 0.0);
					  dst1_4 = vec3(0.0, 0.0, 0.0);
					  best0_3 = 1000.0;
					  best1_2 = 1000.0;
					  src_6 = (src_6 + _Distortion);
					  highp vec3 tmpvar_10;
					  tmpvar_10 = ((src_6 * (src_6 * src_6)) - vec3(2.7e-05, 0.004096, 0.035937));
					  highp float tmpvar_11;
					  tmpvar_11 = dot (tmpvar_10, tmpvar_10);
					  if ((tmpvar_11 < 1000.0)) {
					    best1_2 = 1000.0;
					    dst1_4 = vec3(0.0, 0.0, 0.0);
					    best0_3 = tmpvar_11;
					    dst0_5 = vec3(0.03, 0.16, 0.33);
					  };
					  highp vec3 tmpvar_12;
					  tmpvar_12 = ((src_6 * (src_6 * src_6)) - vec3(0.002197, 0.079507, 0.050653));
					  highp float tmpvar_13;
					  tmpvar_13 = dot (tmpvar_12, tmpvar_12);
					  if ((tmpvar_13 < best0_3)) {
					    best1_2 = best0_3;
					    dst1_4 = dst0_5;
					    best0_3 = tmpvar_13;
					    dst0_5 = vec3(0.13, 0.43, 0.37);
					  };
					  highp vec3 tmpvar_14;
					  tmpvar_14 = ((src_6 * (src_6 * src_6)) - vec3(0.103823, 0.328509, 0.07408799));
					  highp float tmpvar_15;
					  tmpvar_15 = dot (tmpvar_14, tmpvar_14);
					  if ((tmpvar_15 < best0_3)) {
					    best1_2 = best0_3;
					    dst1_4 = dst0_5;
					    best0_3 = tmpvar_15;
					    dst0_5 = vec3(0.47, 0.69, 0.42);
					  };
					  highp vec3 tmpvar_16;
					  tmpvar_16 = ((src_6 * (src_6 * src_6)) - vec3(0.314432, 0.493039, 0.019683));
					  highp float tmpvar_17;
					  tmpvar_17 = dot (tmpvar_16, tmpvar_16);
					  if ((tmpvar_17 < best0_3)) {
					    best1_2 = best0_3;
					    dst1_4 = dst0_5;
					    best0_3 = tmpvar_17;
					    dst0_5 = vec3(0.68, 0.79, 0.27);
					  };
					  highp float tmpvar_18;
					  highp float x_19;
					  x_19 = (q_7.x + q_7.y);
					  tmpvar_18 = (x_19 - (floor(
					    (x_19 * 0.5)
					  ) * 2.0));
					  highp vec2 p_20;
					  p_20 = ((q_7 * 0.5) + fract(sin(vec2(
					    floor(_TimeX)
					  ))));
					  highp float tmpvar_21;
					  tmpvar_21 = fract(((10000.0 * 
					    sin(((17.0 * p_20.x) + (p_20.y * 0.1)))
					  ) * (0.1 + 
					    abs(sin(((p_20.y * 13.0) + p_20.x)))
					  )));
					  highp vec3 tmpvar_22;
					  if ((tmpvar_18 > ((tmpvar_21 * 0.75) + (best1_2 / 
					    (best0_3 + best1_2)
					  )))) {
					    tmpvar_22 = dst1_4;
					  } else {
					    tmpvar_22 = dst0_5;
					  };
					  highp vec4 tmpvar_23;
					  tmpvar_23.w = 1.0;
					  tmpvar_23.xyz = tmpvar_22;
					  FragColor_1 = tmpvar_23;
					  if ((tmpvar_22.x == 0.0)) {
					    FragColor_1.xyz = vec3(0.03, 0.16, 0.33);
					  };
					  gl_FragData[0] = FragColor_1;
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
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump float u_xlat16_0;
					bool u_xlatb0;
					vec3 u_xlat1;
					bool u_xlatb1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					vec2 u_xlat12;
					bool u_xlatb12;
					bool u_xlatb18;
					void main()
					{
					    u_xlat16_0 = vs_TEXCOORD0.y + vs_TEXCOORD0.x;
					    u_xlat6.x = u_xlat16_0 * 0.5;
					    u_xlat6.x = floor(u_xlat6.x);
					    u_xlat0.x = (-u_xlat6.x) * 2.0 + u_xlat16_0;
					    u_xlat6.x = floor(_TimeX);
					    u_xlat6.x = sin(u_xlat6.x);
					    u_xlat6.x = fract(u_xlat6.x);
					    u_xlat6.xy = vs_TEXCOORD0.xy * vec2(0.5, 0.5) + u_xlat6.xx;
					    u_xlat6.z = dot(u_xlat6.xy, vec2(17.0, 0.100000001));
					    u_xlat6.x = u_xlat6.y * 13.0 + u_xlat6.x;
					    u_xlat6.xy = sin(u_xlat6.xz);
					    u_xlat6.x = abs(u_xlat6.x) + 0.100000001;
					    u_xlat12.x = u_xlat6.y * 10000.0;
					    u_xlat6.x = u_xlat6.x * u_xlat12.x;
					    u_xlat6.x = fract(u_xlat6.x);
					    u_xlat1.z = 1000.0;
					    u_xlat12.xy = vs_TEXCOORD0.xy * vec2(1.0, 0.99999994);
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat12.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz + vec3(vec3(_Distortion, _Distortion, _Distortion));
					    u_xlat3.xyz = u_xlat2.xyz * u_xlat2.xyz;
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-2.69999982e-005, -0.00409599999, -0.0359370038);
					    u_xlat12.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat1.y = min(u_xlat12.x, 1000.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(u_xlat12.x<1000.0);
					#else
					    u_xlatb12 = u_xlat12.x<1000.0;
					#endif
					    u_xlat4.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(0.0299999993, 0.159999996, 0.330000013), vec3(bvec3(u_xlatb12)));
					    u_xlat5.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.00219699973, -0.0795070007, -0.0506530032);
					    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(u_xlat1.x<u_xlat1.y);
					#else
					    u_xlatb12 = u_xlat1.x<u_xlat1.y;
					#endif
					    u_xlat1.yz = (bool(u_xlatb12)) ? u_xlat1.xy : u_xlat1.yz;
					    u_xlat5.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.103822999, -0.328509003, -0.0740879923);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.314432025, -0.493039042, -0.0196830016);
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat1.x<u_xlat1.y);
					#else
					    u_xlatb18 = u_xlat1.x<u_xlat1.y;
					#endif
					    u_xlat2.yz = (bool(u_xlatb18)) ? u_xlat1.xy : u_xlat1.yz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat2.x<u_xlat2.y);
					#else
					    u_xlatb1 = u_xlat2.x<u_xlat2.y;
					#endif
					    u_xlat7.xy = (bool(u_xlatb1)) ? u_xlat2.xy : u_xlat2.yz;
					    u_xlat7.x = u_xlat7.y + u_xlat7.x;
					    u_xlat7.x = u_xlat7.y / u_xlat7.x;
					    u_xlat6.x = u_xlat6.x * 0.75 + u_xlat7.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat6.x<u_xlat0.x);
					#else
					    u_xlatb0 = u_xlat6.x<u_xlat0.x;
					#endif
					    u_xlat7.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat4.xyz, vec3(bvec3(u_xlatb12)));
					    u_xlat2.xyz = (bool(u_xlatb12)) ? vec3(0.129999995, 0.430000007, 0.370000005) : u_xlat4.xyz;
					    u_xlat7.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : u_xlat7.xyz;
					    u_xlat6.xyz = (bool(u_xlatb18)) ? vec3(0.469999999, 0.689999998, 0.419999987) : u_xlat2.xyz;
					    u_xlat7.xyz = (bool(u_xlatb1)) ? u_xlat6.xyz : u_xlat7.xyz;
					    u_xlat6.xyz = (bool(u_xlatb1)) ? vec3(0.680000007, 0.790000021, 0.270000011) : u_xlat6.xyz;
					    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat7.xyz : u_xlat6.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x==0.0);
					#else
					    u_xlatb18 = u_xlat0.x==0.0;
					#endif
					    SV_Target0.xyz = (bool(u_xlatb18)) ? vec3(0.0299999993, 0.159999996, 0.330000013) : u_xlat0.xyz;
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
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump float u_xlat16_0;
					bool u_xlatb0;
					vec3 u_xlat1;
					bool u_xlatb1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					vec2 u_xlat12;
					bool u_xlatb12;
					bool u_xlatb18;
					void main()
					{
					    u_xlat16_0 = vs_TEXCOORD0.y + vs_TEXCOORD0.x;
					    u_xlat6.x = u_xlat16_0 * 0.5;
					    u_xlat6.x = floor(u_xlat6.x);
					    u_xlat0.x = (-u_xlat6.x) * 2.0 + u_xlat16_0;
					    u_xlat6.x = floor(_TimeX);
					    u_xlat6.x = sin(u_xlat6.x);
					    u_xlat6.x = fract(u_xlat6.x);
					    u_xlat6.xy = vs_TEXCOORD0.xy * vec2(0.5, 0.5) + u_xlat6.xx;
					    u_xlat6.z = dot(u_xlat6.xy, vec2(17.0, 0.100000001));
					    u_xlat6.x = u_xlat6.y * 13.0 + u_xlat6.x;
					    u_xlat6.xy = sin(u_xlat6.xz);
					    u_xlat6.x = abs(u_xlat6.x) + 0.100000001;
					    u_xlat12.x = u_xlat6.y * 10000.0;
					    u_xlat6.x = u_xlat6.x * u_xlat12.x;
					    u_xlat6.x = fract(u_xlat6.x);
					    u_xlat1.z = 1000.0;
					    u_xlat12.xy = vs_TEXCOORD0.xy * vec2(1.0, 0.99999994);
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat12.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz + vec3(vec3(_Distortion, _Distortion, _Distortion));
					    u_xlat3.xyz = u_xlat2.xyz * u_xlat2.xyz;
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-2.69999982e-005, -0.00409599999, -0.0359370038);
					    u_xlat12.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat1.y = min(u_xlat12.x, 1000.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(u_xlat12.x<1000.0);
					#else
					    u_xlatb12 = u_xlat12.x<1000.0;
					#endif
					    u_xlat4.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(0.0299999993, 0.159999996, 0.330000013), vec3(bvec3(u_xlatb12)));
					    u_xlat5.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.00219699973, -0.0795070007, -0.0506530032);
					    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(u_xlat1.x<u_xlat1.y);
					#else
					    u_xlatb12 = u_xlat1.x<u_xlat1.y;
					#endif
					    u_xlat1.yz = (bool(u_xlatb12)) ? u_xlat1.xy : u_xlat1.yz;
					    u_xlat5.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.103822999, -0.328509003, -0.0740879923);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.314432025, -0.493039042, -0.0196830016);
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat1.x<u_xlat1.y);
					#else
					    u_xlatb18 = u_xlat1.x<u_xlat1.y;
					#endif
					    u_xlat2.yz = (bool(u_xlatb18)) ? u_xlat1.xy : u_xlat1.yz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat2.x<u_xlat2.y);
					#else
					    u_xlatb1 = u_xlat2.x<u_xlat2.y;
					#endif
					    u_xlat7.xy = (bool(u_xlatb1)) ? u_xlat2.xy : u_xlat2.yz;
					    u_xlat7.x = u_xlat7.y + u_xlat7.x;
					    u_xlat7.x = u_xlat7.y / u_xlat7.x;
					    u_xlat6.x = u_xlat6.x * 0.75 + u_xlat7.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat6.x<u_xlat0.x);
					#else
					    u_xlatb0 = u_xlat6.x<u_xlat0.x;
					#endif
					    u_xlat7.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat4.xyz, vec3(bvec3(u_xlatb12)));
					    u_xlat2.xyz = (bool(u_xlatb12)) ? vec3(0.129999995, 0.430000007, 0.370000005) : u_xlat4.xyz;
					    u_xlat7.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : u_xlat7.xyz;
					    u_xlat6.xyz = (bool(u_xlatb18)) ? vec3(0.469999999, 0.689999998, 0.419999987) : u_xlat2.xyz;
					    u_xlat7.xyz = (bool(u_xlatb1)) ? u_xlat6.xyz : u_xlat7.xyz;
					    u_xlat6.xyz = (bool(u_xlatb1)) ? vec3(0.680000007, 0.790000021, 0.270000011) : u_xlat6.xyz;
					    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat7.xyz : u_xlat6.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x==0.0);
					#else
					    u_xlatb18 = u_xlat0.x==0.0;
					#endif
					    SV_Target0.xyz = (bool(u_xlatb18)) ? vec3(0.0299999993, 0.159999996, 0.330000013) : u_xlat0.xyz;
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
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump float u_xlat16_0;
					bool u_xlatb0;
					vec3 u_xlat1;
					bool u_xlatb1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					vec2 u_xlat12;
					bool u_xlatb12;
					bool u_xlatb18;
					void main()
					{
					    u_xlat16_0 = vs_TEXCOORD0.y + vs_TEXCOORD0.x;
					    u_xlat6.x = u_xlat16_0 * 0.5;
					    u_xlat6.x = floor(u_xlat6.x);
					    u_xlat0.x = (-u_xlat6.x) * 2.0 + u_xlat16_0;
					    u_xlat6.x = floor(_TimeX);
					    u_xlat6.x = sin(u_xlat6.x);
					    u_xlat6.x = fract(u_xlat6.x);
					    u_xlat6.xy = vs_TEXCOORD0.xy * vec2(0.5, 0.5) + u_xlat6.xx;
					    u_xlat6.z = dot(u_xlat6.xy, vec2(17.0, 0.100000001));
					    u_xlat6.x = u_xlat6.y * 13.0 + u_xlat6.x;
					    u_xlat6.xy = sin(u_xlat6.xz);
					    u_xlat6.x = abs(u_xlat6.x) + 0.100000001;
					    u_xlat12.x = u_xlat6.y * 10000.0;
					    u_xlat6.x = u_xlat6.x * u_xlat12.x;
					    u_xlat6.x = fract(u_xlat6.x);
					    u_xlat1.z = 1000.0;
					    u_xlat12.xy = vs_TEXCOORD0.xy * vec2(1.0, 0.99999994);
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat12.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz + vec3(vec3(_Distortion, _Distortion, _Distortion));
					    u_xlat3.xyz = u_xlat2.xyz * u_xlat2.xyz;
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-2.69999982e-005, -0.00409599999, -0.0359370038);
					    u_xlat12.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat1.y = min(u_xlat12.x, 1000.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(u_xlat12.x<1000.0);
					#else
					    u_xlatb12 = u_xlat12.x<1000.0;
					#endif
					    u_xlat4.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(0.0299999993, 0.159999996, 0.330000013), vec3(bvec3(u_xlatb12)));
					    u_xlat5.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.00219699973, -0.0795070007, -0.0506530032);
					    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb12 = !!(u_xlat1.x<u_xlat1.y);
					#else
					    u_xlatb12 = u_xlat1.x<u_xlat1.y;
					#endif
					    u_xlat1.yz = (bool(u_xlatb12)) ? u_xlat1.xy : u_xlat1.yz;
					    u_xlat5.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.103822999, -0.328509003, -0.0740879923);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.314432025, -0.493039042, -0.0196830016);
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat1.x<u_xlat1.y);
					#else
					    u_xlatb18 = u_xlat1.x<u_xlat1.y;
					#endif
					    u_xlat2.yz = (bool(u_xlatb18)) ? u_xlat1.xy : u_xlat1.yz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat2.x<u_xlat2.y);
					#else
					    u_xlatb1 = u_xlat2.x<u_xlat2.y;
					#endif
					    u_xlat7.xy = (bool(u_xlatb1)) ? u_xlat2.xy : u_xlat2.yz;
					    u_xlat7.x = u_xlat7.y + u_xlat7.x;
					    u_xlat7.x = u_xlat7.y / u_xlat7.x;
					    u_xlat6.x = u_xlat6.x * 0.75 + u_xlat7.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb0 = !!(u_xlat6.x<u_xlat0.x);
					#else
					    u_xlatb0 = u_xlat6.x<u_xlat0.x;
					#endif
					    u_xlat7.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat4.xyz, vec3(bvec3(u_xlatb12)));
					    u_xlat2.xyz = (bool(u_xlatb12)) ? vec3(0.129999995, 0.430000007, 0.370000005) : u_xlat4.xyz;
					    u_xlat7.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : u_xlat7.xyz;
					    u_xlat6.xyz = (bool(u_xlatb18)) ? vec3(0.469999999, 0.689999998, 0.419999987) : u_xlat2.xyz;
					    u_xlat7.xyz = (bool(u_xlatb1)) ? u_xlat6.xyz : u_xlat7.xyz;
					    u_xlat6.xyz = (bool(u_xlatb1)) ? vec3(0.680000007, 0.790000021, 0.270000011) : u_xlat6.xyz;
					    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat7.xyz : u_xlat6.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb18 = !!(u_xlat0.x==0.0);
					#else
					    u_xlatb18 = u_xlat0.x==0.0;
					#endif
					    SV_Target0.xyz = (bool(u_xlatb18)) ? vec3(0.0299999993, 0.159999996, 0.330000013) : u_xlat0.xyz;
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