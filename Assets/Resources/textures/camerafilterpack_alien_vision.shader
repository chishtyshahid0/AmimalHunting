Shader "CameraFilterPack/Alien_Vision" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 29896
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 thermal_1;
					  highp vec3 col_2;
					  highp float blur_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  highp float tmpvar_5;
					  highp vec2 x_6;
					  x_6 = (uv_4 - vec2(0.5, 0.5));
					  tmpvar_5 = sqrt(dot (x_6, x_6));
					  blur_3 = ((1.0 + sin(
					    ((_TimeX * 6.0) * _Value2)
					  )) * 0.5);
					  blur_3 = (blur_3 * (1.0 + (
					    sin(((_TimeX * 16.0) * _Value2))
					   * 0.5)));
					  blur_3 = (pow (blur_3, 3.0) * 0.05);
					  blur_3 = (blur_3 * tmpvar_5);
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = (uv_4.x + blur_3);
					  tmpvar_7.y = uv_4.y;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, tmpvar_7);
					  col_2.x = tmpvar_8.x;
					  lowp vec4 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, uv_4);
					  col_2.y = tmpvar_9.y;
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = (uv_4.x - blur_3);
					  tmpvar_10.y = uv_4.y;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, tmpvar_10);
					  col_2.z = tmpvar_11.z;
					  col_2 = (col_2 - (sin(
					    (uv_4.y * 800.0)
					  ) * 0.04));
					  col_2 = (col_2 * (1.0 - (tmpvar_5 * 0.5)));
					  highp vec4 tmpvar_12;
					  tmpvar_12.xzw = vec3(0.0, 0.0, 1.0);
					  tmpvar_12.y = (0.5 + (sin(_TimeX) / 4.14));
					  highp vec4 tmpvar_13;
					  tmpvar_13.xzw = vec3(0.1, 0.1, 1.0);
					  tmpvar_13.y = (1.0 + (cos(
					    (_TimeX * 2.0)
					  ) / 4.14));
					  highp vec4 tmpvar_14;
					  tmpvar_14.xzw = vec3(0.1, 0.0, 1.0);
					  tmpvar_14.y = (0.5 + (sin(
					    (_TimeX * 4.0)
					  ) / 4.14));
					  highp float tmpvar_15;
					  tmpvar_15 = (((col_2.x + col_2.y) + col_2.z) / 3.0);
					  if ((tmpvar_15 < _Value)) {
					    thermal_1 = mix (tmpvar_12, tmpvar_14, vec4((tmpvar_15 / _Value)));
					  };
					  if ((tmpvar_15 >= _Value)) {
					    thermal_1 = mix (tmpvar_13, tmpvar_14, vec4(((tmpvar_15 - _Value) / _Value)));
					  };
					  highp vec4 tmpvar_16;
					  tmpvar_16.w = 1.0;
					  tmpvar_16.xyz = thermal_1.xyz;
					  gl_FragData[0] = tmpvar_16;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 thermal_1;
					  highp vec3 col_2;
					  highp float blur_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  highp float tmpvar_5;
					  highp vec2 x_6;
					  x_6 = (uv_4 - vec2(0.5, 0.5));
					  tmpvar_5 = sqrt(dot (x_6, x_6));
					  blur_3 = ((1.0 + sin(
					    ((_TimeX * 6.0) * _Value2)
					  )) * 0.5);
					  blur_3 = (blur_3 * (1.0 + (
					    sin(((_TimeX * 16.0) * _Value2))
					   * 0.5)));
					  blur_3 = (pow (blur_3, 3.0) * 0.05);
					  blur_3 = (blur_3 * tmpvar_5);
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = (uv_4.x + blur_3);
					  tmpvar_7.y = uv_4.y;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, tmpvar_7);
					  col_2.x = tmpvar_8.x;
					  lowp vec4 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, uv_4);
					  col_2.y = tmpvar_9.y;
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = (uv_4.x - blur_3);
					  tmpvar_10.y = uv_4.y;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, tmpvar_10);
					  col_2.z = tmpvar_11.z;
					  col_2 = (col_2 - (sin(
					    (uv_4.y * 800.0)
					  ) * 0.04));
					  col_2 = (col_2 * (1.0 - (tmpvar_5 * 0.5)));
					  highp vec4 tmpvar_12;
					  tmpvar_12.xzw = vec3(0.0, 0.0, 1.0);
					  tmpvar_12.y = (0.5 + (sin(_TimeX) / 4.14));
					  highp vec4 tmpvar_13;
					  tmpvar_13.xzw = vec3(0.1, 0.1, 1.0);
					  tmpvar_13.y = (1.0 + (cos(
					    (_TimeX * 2.0)
					  ) / 4.14));
					  highp vec4 tmpvar_14;
					  tmpvar_14.xzw = vec3(0.1, 0.0, 1.0);
					  tmpvar_14.y = (0.5 + (sin(
					    (_TimeX * 4.0)
					  ) / 4.14));
					  highp float tmpvar_15;
					  tmpvar_15 = (((col_2.x + col_2.y) + col_2.z) / 3.0);
					  if ((tmpvar_15 < _Value)) {
					    thermal_1 = mix (tmpvar_12, tmpvar_14, vec4((tmpvar_15 / _Value)));
					  };
					  if ((tmpvar_15 >= _Value)) {
					    thermal_1 = mix (tmpvar_13, tmpvar_14, vec4(((tmpvar_15 - _Value) / _Value)));
					  };
					  highp vec4 tmpvar_16;
					  tmpvar_16.w = 1.0;
					  tmpvar_16.xyz = thermal_1.xyz;
					  gl_FragData[0] = tmpvar_16;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 thermal_1;
					  highp vec3 col_2;
					  highp float blur_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  highp float tmpvar_5;
					  highp vec2 x_6;
					  x_6 = (uv_4 - vec2(0.5, 0.5));
					  tmpvar_5 = sqrt(dot (x_6, x_6));
					  blur_3 = ((1.0 + sin(
					    ((_TimeX * 6.0) * _Value2)
					  )) * 0.5);
					  blur_3 = (blur_3 * (1.0 + (
					    sin(((_TimeX * 16.0) * _Value2))
					   * 0.5)));
					  blur_3 = (pow (blur_3, 3.0) * 0.05);
					  blur_3 = (blur_3 * tmpvar_5);
					  highp vec2 tmpvar_7;
					  tmpvar_7.x = (uv_4.x + blur_3);
					  tmpvar_7.y = uv_4.y;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, tmpvar_7);
					  col_2.x = tmpvar_8.x;
					  lowp vec4 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, uv_4);
					  col_2.y = tmpvar_9.y;
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = (uv_4.x - blur_3);
					  tmpvar_10.y = uv_4.y;
					  lowp vec4 tmpvar_11;
					  tmpvar_11 = texture2D (_MainTex, tmpvar_10);
					  col_2.z = tmpvar_11.z;
					  col_2 = (col_2 - (sin(
					    (uv_4.y * 800.0)
					  ) * 0.04));
					  col_2 = (col_2 * (1.0 - (tmpvar_5 * 0.5)));
					  highp vec4 tmpvar_12;
					  tmpvar_12.xzw = vec3(0.0, 0.0, 1.0);
					  tmpvar_12.y = (0.5 + (sin(_TimeX) / 4.14));
					  highp vec4 tmpvar_13;
					  tmpvar_13.xzw = vec3(0.1, 0.1, 1.0);
					  tmpvar_13.y = (1.0 + (cos(
					    (_TimeX * 2.0)
					  ) / 4.14));
					  highp vec4 tmpvar_14;
					  tmpvar_14.xzw = vec3(0.1, 0.0, 1.0);
					  tmpvar_14.y = (0.5 + (sin(
					    (_TimeX * 4.0)
					  ) / 4.14));
					  highp float tmpvar_15;
					  tmpvar_15 = (((col_2.x + col_2.y) + col_2.z) / 3.0);
					  if ((tmpvar_15 < _Value)) {
					    thermal_1 = mix (tmpvar_12, tmpvar_14, vec4((tmpvar_15 / _Value)));
					  };
					  if ((tmpvar_15 >= _Value)) {
					    thermal_1 = mix (tmpvar_13, tmpvar_14, vec4(((tmpvar_15 - _Value) / _Value)));
					  };
					  highp vec4 tmpvar_16;
					  tmpvar_16.w = 1.0;
					  tmpvar_16.xyz = thermal_1.xyz;
					  gl_FragData[0] = tmpvar_16;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					mediump vec2 u_xlat16_4;
					bool u_xlatb8;
					vec2 u_xlat9;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _Value2 * _TimeX;
					    u_xlat0.xy = u_xlat0.xx * vec2(6.0, 16.0);
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat4 = u_xlat0.y * 0.5 + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat0.x = u_xlat4 * u_xlat0.x;
					    u_xlat4 = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat4 * u_xlat0.x;
					    u_xlat16_4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_4.x = dot(u_xlat16_4.xy, u_xlat16_4.xy);
					    u_xlat16_4.x = sqrt(u_xlat16_4.x);
					    u_xlat0.x = u_xlat16_4.x * u_xlat0.x;
					    u_xlat16_4.x = (-u_xlat16_4.x) * 0.5 + 1.0;
					    u_xlat1.x = u_xlat0.x * 0.0500000007 + vs_TEXCOORD0.x;
					    u_xlat1.z = (-u_xlat0.x) * 0.0500000007 + vs_TEXCOORD0.x;
					    u_xlat1.yw = vs_TEXCOORD0.yy;
					    u_xlat0.x = texture(_MainTex, u_xlat1.xy).x;
					    u_xlat0.w = texture(_MainTex, u_xlat1.zw).z;
					    u_xlat1.x = vs_TEXCOORD0.y * 800.0;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat0.z = texture(_MainTex, vs_TEXCOORD0.xy).y;
					    u_xlat0.xzw = (-u_xlat1.xxx) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat0.xzw;
					    u_xlat0.xz = u_xlat16_4.xx * u_xlat0.xz;
					    u_xlat0.x = u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = u_xlat0.w * u_xlat16_4.x + u_xlat0.x;
					    u_xlat0.y = u_xlat0.x * 0.333333343;
					    u_xlat0.x = u_xlat0.x * 0.333333343 + (-_Value);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(u_xlat0.y>=_Value);
					#else
					    u_xlatb8 = u_xlat0.y>=_Value;
					#endif
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(_Value, _Value));
					    u_xlat12 = _TimeX + _TimeX;
					    u_xlat12 = cos(u_xlat12);
					    u_xlat9.y = u_xlat12 * 0.241545901 + 1.0;
					    u_xlat12 = _TimeX * 4.0;
					    u_xlat12 = sin(u_xlat12);
					    u_xlat2.y = u_xlat12 * 0.241545901 + 0.5;
					    u_xlat2.x = float(0.100000001);
					    u_xlat2.z = float(0.0);
					    u_xlat1.x = float(0.0);
					    u_xlat9.x = float(0.100000001);
					    u_xlat3.xyz = (-u_xlat9.xyx) + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat9.xyx;
					    u_xlat0.x = sin(_TimeX);
					    u_xlat1.y = u_xlat0.x * 0.241545901 + 0.5;
					    u_xlat2.xyz = (-u_xlat1.xyx) + u_xlat2.xyz;
					    u_xlat0.xyw = u_xlat0.yyy * u_xlat2.xyz + u_xlat1.xyx;
					    SV_Target0.xyz = (bool(u_xlatb8)) ? u_xlat3.xyz : u_xlat0.xyw;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					mediump vec2 u_xlat16_4;
					bool u_xlatb8;
					vec2 u_xlat9;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _Value2 * _TimeX;
					    u_xlat0.xy = u_xlat0.xx * vec2(6.0, 16.0);
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat4 = u_xlat0.y * 0.5 + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat0.x = u_xlat4 * u_xlat0.x;
					    u_xlat4 = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat4 * u_xlat0.x;
					    u_xlat16_4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_4.x = dot(u_xlat16_4.xy, u_xlat16_4.xy);
					    u_xlat16_4.x = sqrt(u_xlat16_4.x);
					    u_xlat0.x = u_xlat16_4.x * u_xlat0.x;
					    u_xlat16_4.x = (-u_xlat16_4.x) * 0.5 + 1.0;
					    u_xlat1.x = u_xlat0.x * 0.0500000007 + vs_TEXCOORD0.x;
					    u_xlat1.z = (-u_xlat0.x) * 0.0500000007 + vs_TEXCOORD0.x;
					    u_xlat1.yw = vs_TEXCOORD0.yy;
					    u_xlat0.x = texture(_MainTex, u_xlat1.xy).x;
					    u_xlat0.w = texture(_MainTex, u_xlat1.zw).z;
					    u_xlat1.x = vs_TEXCOORD0.y * 800.0;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat0.z = texture(_MainTex, vs_TEXCOORD0.xy).y;
					    u_xlat0.xzw = (-u_xlat1.xxx) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat0.xzw;
					    u_xlat0.xz = u_xlat16_4.xx * u_xlat0.xz;
					    u_xlat0.x = u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = u_xlat0.w * u_xlat16_4.x + u_xlat0.x;
					    u_xlat0.y = u_xlat0.x * 0.333333343;
					    u_xlat0.x = u_xlat0.x * 0.333333343 + (-_Value);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(u_xlat0.y>=_Value);
					#else
					    u_xlatb8 = u_xlat0.y>=_Value;
					#endif
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(_Value, _Value));
					    u_xlat12 = _TimeX + _TimeX;
					    u_xlat12 = cos(u_xlat12);
					    u_xlat9.y = u_xlat12 * 0.241545901 + 1.0;
					    u_xlat12 = _TimeX * 4.0;
					    u_xlat12 = sin(u_xlat12);
					    u_xlat2.y = u_xlat12 * 0.241545901 + 0.5;
					    u_xlat2.x = float(0.100000001);
					    u_xlat2.z = float(0.0);
					    u_xlat1.x = float(0.0);
					    u_xlat9.x = float(0.100000001);
					    u_xlat3.xyz = (-u_xlat9.xyx) + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat9.xyx;
					    u_xlat0.x = sin(_TimeX);
					    u_xlat1.y = u_xlat0.x * 0.241545901 + 0.5;
					    u_xlat2.xyz = (-u_xlat1.xyx) + u_xlat2.xyz;
					    u_xlat0.xyw = u_xlat0.yyy * u_xlat2.xyz + u_xlat1.xyx;
					    SV_Target0.xyz = (bool(u_xlatb8)) ? u_xlat3.xyz : u_xlat0.xyw;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					mediump vec2 u_xlat16_4;
					bool u_xlatb8;
					vec2 u_xlat9;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _Value2 * _TimeX;
					    u_xlat0.xy = u_xlat0.xx * vec2(6.0, 16.0);
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat4 = u_xlat0.y * 0.5 + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat0.x = u_xlat4 * u_xlat0.x;
					    u_xlat4 = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat4 * u_xlat0.x;
					    u_xlat16_4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_4.x = dot(u_xlat16_4.xy, u_xlat16_4.xy);
					    u_xlat16_4.x = sqrt(u_xlat16_4.x);
					    u_xlat0.x = u_xlat16_4.x * u_xlat0.x;
					    u_xlat16_4.x = (-u_xlat16_4.x) * 0.5 + 1.0;
					    u_xlat1.x = u_xlat0.x * 0.0500000007 + vs_TEXCOORD0.x;
					    u_xlat1.z = (-u_xlat0.x) * 0.0500000007 + vs_TEXCOORD0.x;
					    u_xlat1.yw = vs_TEXCOORD0.yy;
					    u_xlat0.x = texture(_MainTex, u_xlat1.xy).x;
					    u_xlat0.w = texture(_MainTex, u_xlat1.zw).z;
					    u_xlat1.x = vs_TEXCOORD0.y * 800.0;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat0.z = texture(_MainTex, vs_TEXCOORD0.xy).y;
					    u_xlat0.xzw = (-u_xlat1.xxx) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat0.xzw;
					    u_xlat0.xz = u_xlat16_4.xx * u_xlat0.xz;
					    u_xlat0.x = u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = u_xlat0.w * u_xlat16_4.x + u_xlat0.x;
					    u_xlat0.y = u_xlat0.x * 0.333333343;
					    u_xlat0.x = u_xlat0.x * 0.333333343 + (-_Value);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(u_xlat0.y>=_Value);
					#else
					    u_xlatb8 = u_xlat0.y>=_Value;
					#endif
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(_Value, _Value));
					    u_xlat12 = _TimeX + _TimeX;
					    u_xlat12 = cos(u_xlat12);
					    u_xlat9.y = u_xlat12 * 0.241545901 + 1.0;
					    u_xlat12 = _TimeX * 4.0;
					    u_xlat12 = sin(u_xlat12);
					    u_xlat2.y = u_xlat12 * 0.241545901 + 0.5;
					    u_xlat2.x = float(0.100000001);
					    u_xlat2.z = float(0.0);
					    u_xlat1.x = float(0.0);
					    u_xlat9.x = float(0.100000001);
					    u_xlat3.xyz = (-u_xlat9.xyx) + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat9.xyx;
					    u_xlat0.x = sin(_TimeX);
					    u_xlat1.y = u_xlat0.x * 0.241545901 + 0.5;
					    u_xlat2.xyz = (-u_xlat1.xyx) + u_xlat2.xyz;
					    u_xlat0.xyw = u_xlat0.yyy * u_xlat2.xyz + u_xlat1.xyx;
					    SV_Target0.xyz = (bool(u_xlatb8)) ? u_xlat3.xyz : u_xlat0.xyw;
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