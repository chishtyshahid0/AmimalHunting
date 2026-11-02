Shader "CameraFilterPack/Oculus_NightVision2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 40450
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
					uniform highp float _Red_R;
					uniform highp float _Red_G;
					uniform highp float _Red_B;
					uniform highp float _Green_R;
					uniform highp float _Green_G;
					uniform highp float _Green_B;
					uniform highp float _Blue_R;
					uniform highp float _Blue_G;
					uniform highp float _Blue_B;
					uniform highp float _Red_C;
					uniform highp float _Green_C;
					uniform highp float _Blue_C;
					uniform highp float _FadeFX;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 rgb_1;
					  highp vec4 col_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, uv_3);
					  col_2 = tmpvar_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5.x = _Red_R;
					  tmpvar_5.y = _Red_G;
					  tmpvar_5.z = _Red_B;
					  highp vec3 tmpvar_6;
					  tmpvar_6.x = _Green_R;
					  tmpvar_6.y = _Green_G;
					  tmpvar_6.z = _Green_B;
					  highp vec3 tmpvar_7;
					  tmpvar_7.x = _Blue_R;
					  tmpvar_7.y = _Blue_G;
					  tmpvar_7.z = _Blue_B;
					  highp vec3 tmpvar_8;
					  tmpvar_8.x = (dot (col_2.xyz, tmpvar_5) + _Red_C);
					  tmpvar_8.y = (dot (col_2.xyz, tmpvar_6) + _Green_C);
					  tmpvar_8.z = (dot (col_2.xyz, tmpvar_7) + _Blue_C);
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 0.0;
					  tmpvar_9.xyz = (tmpvar_8 * vec3((1.0 - (
					    (0.5 + (0.5 * fract((
					      (sin(dot ((uv_3 * vec2(0.1, 1.0)), vec2(12.9898, 78.233))) * 43758.55)
					     + _TimeX))))
					   * 0.5))));
					  highp float xlat_varsample_10;
					  highp vec2 tmpvar_11;
					  tmpvar_11.x = 1.0;
					  tmpvar_11.y = (2.0 * cos(_TimeX));
					  highp vec2 P_12;
					  P_12 = (((tmpvar_11 * _TimeX) * 8.0) + ((uv_3 * vec2(0.5, 1.0)) + vec2(1.0, 3.0)));
					  lowp float tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, P_12).x;
					  xlat_varsample_10 = tmpvar_13;
					  xlat_varsample_10 = (xlat_varsample_10 * xlat_varsample_10);
					  highp float tmpvar_14;
					  highp float x_15;
					  x_15 = (((uv_3.y * 2.0) + (_TimeX / 4.0)) + sin((_TimeX + 
					    sin((_TimeX * 0.23))
					  )));
					  tmpvar_14 = (x_15 - floor(x_15));
					  highp float tmpvar_16;
					  tmpvar_16 = (float((tmpvar_14 >= 0.4)) - float((tmpvar_14 >= 0.6)));
					  rgb_1 = (mix (col_2, tmpvar_9, vec4(_FadeFX)).xyz + ((
					    (1.0 - (((tmpvar_14 - 0.4) / 0.2) * tmpvar_16))
					   * tmpvar_16) * xlat_varsample_10));
					  highp float x_17;
					  x_17 = ((uv_3.y * 30.0) + _TimeX);
					  rgb_1 = (rgb_1 * ((12.0 + 
					    (x_17 - floor(x_17))
					  ) / 13.0));
					  rgb_1 = (rgb_1 * (0.5 + (
					    (((12.0 * uv_3.y) * (1.5 - uv_3.x)) * (1.5 - uv_3.y))
					   * uv_3.x)));
					  rgb_1 = (rgb_1 * (0.9 + (0.1 * 
					    sin(((10.0 * _TimeX) + (uv_3.y * 300.0)))
					  )));
					  rgb_1 = (rgb_1 * (0.79 + (0.01 * 
					    sin((110.0 * _TimeX))
					  )));
					  highp vec4 tmpvar_18;
					  tmpvar_18.w = 1.0;
					  tmpvar_18.xyz = rgb_1;
					  gl_FragData[0] = tmpvar_18;
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
					uniform highp float _Red_R;
					uniform highp float _Red_G;
					uniform highp float _Red_B;
					uniform highp float _Green_R;
					uniform highp float _Green_G;
					uniform highp float _Green_B;
					uniform highp float _Blue_R;
					uniform highp float _Blue_G;
					uniform highp float _Blue_B;
					uniform highp float _Red_C;
					uniform highp float _Green_C;
					uniform highp float _Blue_C;
					uniform highp float _FadeFX;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 rgb_1;
					  highp vec4 col_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, uv_3);
					  col_2 = tmpvar_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5.x = _Red_R;
					  tmpvar_5.y = _Red_G;
					  tmpvar_5.z = _Red_B;
					  highp vec3 tmpvar_6;
					  tmpvar_6.x = _Green_R;
					  tmpvar_6.y = _Green_G;
					  tmpvar_6.z = _Green_B;
					  highp vec3 tmpvar_7;
					  tmpvar_7.x = _Blue_R;
					  tmpvar_7.y = _Blue_G;
					  tmpvar_7.z = _Blue_B;
					  highp vec3 tmpvar_8;
					  tmpvar_8.x = (dot (col_2.xyz, tmpvar_5) + _Red_C);
					  tmpvar_8.y = (dot (col_2.xyz, tmpvar_6) + _Green_C);
					  tmpvar_8.z = (dot (col_2.xyz, tmpvar_7) + _Blue_C);
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 0.0;
					  tmpvar_9.xyz = (tmpvar_8 * vec3((1.0 - (
					    (0.5 + (0.5 * fract((
					      (sin(dot ((uv_3 * vec2(0.1, 1.0)), vec2(12.9898, 78.233))) * 43758.55)
					     + _TimeX))))
					   * 0.5))));
					  highp float xlat_varsample_10;
					  highp vec2 tmpvar_11;
					  tmpvar_11.x = 1.0;
					  tmpvar_11.y = (2.0 * cos(_TimeX));
					  highp vec2 P_12;
					  P_12 = (((tmpvar_11 * _TimeX) * 8.0) + ((uv_3 * vec2(0.5, 1.0)) + vec2(1.0, 3.0)));
					  lowp float tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, P_12).x;
					  xlat_varsample_10 = tmpvar_13;
					  xlat_varsample_10 = (xlat_varsample_10 * xlat_varsample_10);
					  highp float tmpvar_14;
					  highp float x_15;
					  x_15 = (((uv_3.y * 2.0) + (_TimeX / 4.0)) + sin((_TimeX + 
					    sin((_TimeX * 0.23))
					  )));
					  tmpvar_14 = (x_15 - floor(x_15));
					  highp float tmpvar_16;
					  tmpvar_16 = (float((tmpvar_14 >= 0.4)) - float((tmpvar_14 >= 0.6)));
					  rgb_1 = (mix (col_2, tmpvar_9, vec4(_FadeFX)).xyz + ((
					    (1.0 - (((tmpvar_14 - 0.4) / 0.2) * tmpvar_16))
					   * tmpvar_16) * xlat_varsample_10));
					  highp float x_17;
					  x_17 = ((uv_3.y * 30.0) + _TimeX);
					  rgb_1 = (rgb_1 * ((12.0 + 
					    (x_17 - floor(x_17))
					  ) / 13.0));
					  rgb_1 = (rgb_1 * (0.5 + (
					    (((12.0 * uv_3.y) * (1.5 - uv_3.x)) * (1.5 - uv_3.y))
					   * uv_3.x)));
					  rgb_1 = (rgb_1 * (0.9 + (0.1 * 
					    sin(((10.0 * _TimeX) + (uv_3.y * 300.0)))
					  )));
					  rgb_1 = (rgb_1 * (0.79 + (0.01 * 
					    sin((110.0 * _TimeX))
					  )));
					  highp vec4 tmpvar_18;
					  tmpvar_18.w = 1.0;
					  tmpvar_18.xyz = rgb_1;
					  gl_FragData[0] = tmpvar_18;
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
					uniform highp float _Red_R;
					uniform highp float _Red_G;
					uniform highp float _Red_B;
					uniform highp float _Green_R;
					uniform highp float _Green_G;
					uniform highp float _Green_B;
					uniform highp float _Blue_R;
					uniform highp float _Blue_G;
					uniform highp float _Blue_B;
					uniform highp float _Red_C;
					uniform highp float _Green_C;
					uniform highp float _Blue_C;
					uniform highp float _FadeFX;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 rgb_1;
					  highp vec4 col_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, uv_3);
					  col_2 = tmpvar_4;
					  highp vec3 tmpvar_5;
					  tmpvar_5.x = _Red_R;
					  tmpvar_5.y = _Red_G;
					  tmpvar_5.z = _Red_B;
					  highp vec3 tmpvar_6;
					  tmpvar_6.x = _Green_R;
					  tmpvar_6.y = _Green_G;
					  tmpvar_6.z = _Green_B;
					  highp vec3 tmpvar_7;
					  tmpvar_7.x = _Blue_R;
					  tmpvar_7.y = _Blue_G;
					  tmpvar_7.z = _Blue_B;
					  highp vec3 tmpvar_8;
					  tmpvar_8.x = (dot (col_2.xyz, tmpvar_5) + _Red_C);
					  tmpvar_8.y = (dot (col_2.xyz, tmpvar_6) + _Green_C);
					  tmpvar_8.z = (dot (col_2.xyz, tmpvar_7) + _Blue_C);
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 0.0;
					  tmpvar_9.xyz = (tmpvar_8 * vec3((1.0 - (
					    (0.5 + (0.5 * fract((
					      (sin(dot ((uv_3 * vec2(0.1, 1.0)), vec2(12.9898, 78.233))) * 43758.55)
					     + _TimeX))))
					   * 0.5))));
					  highp float xlat_varsample_10;
					  highp vec2 tmpvar_11;
					  tmpvar_11.x = 1.0;
					  tmpvar_11.y = (2.0 * cos(_TimeX));
					  highp vec2 P_12;
					  P_12 = (((tmpvar_11 * _TimeX) * 8.0) + ((uv_3 * vec2(0.5, 1.0)) + vec2(1.0, 3.0)));
					  lowp float tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex, P_12).x;
					  xlat_varsample_10 = tmpvar_13;
					  xlat_varsample_10 = (xlat_varsample_10 * xlat_varsample_10);
					  highp float tmpvar_14;
					  highp float x_15;
					  x_15 = (((uv_3.y * 2.0) + (_TimeX / 4.0)) + sin((_TimeX + 
					    sin((_TimeX * 0.23))
					  )));
					  tmpvar_14 = (x_15 - floor(x_15));
					  highp float tmpvar_16;
					  tmpvar_16 = (float((tmpvar_14 >= 0.4)) - float((tmpvar_14 >= 0.6)));
					  rgb_1 = (mix (col_2, tmpvar_9, vec4(_FadeFX)).xyz + ((
					    (1.0 - (((tmpvar_14 - 0.4) / 0.2) * tmpvar_16))
					   * tmpvar_16) * xlat_varsample_10));
					  highp float x_17;
					  x_17 = ((uv_3.y * 30.0) + _TimeX);
					  rgb_1 = (rgb_1 * ((12.0 + 
					    (x_17 - floor(x_17))
					  ) / 13.0));
					  rgb_1 = (rgb_1 * (0.5 + (
					    (((12.0 * uv_3.y) * (1.5 - uv_3.x)) * (1.5 - uv_3.y))
					   * uv_3.x)));
					  rgb_1 = (rgb_1 * (0.9 + (0.1 * 
					    sin(((10.0 * _TimeX) + (uv_3.y * 300.0)))
					  )));
					  rgb_1 = (rgb_1 * (0.79 + (0.01 * 
					    sin((110.0 * _TimeX))
					  )));
					  highp vec4 tmpvar_18;
					  tmpvar_18.w = 1.0;
					  tmpvar_18.xyz = rgb_1;
					  gl_FragData[0] = tmpvar_18;
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
					uniform 	float _Red_R;
					uniform 	float _Red_G;
					uniform 	float _Red_B;
					uniform 	float _Green_R;
					uniform 	float _Green_G;
					uniform 	float _Green_B;
					uniform 	float _Blue_R;
					uniform 	float _Blue_G;
					uniform 	float _Blue_B;
					uniform 	float _Red_C;
					uniform 	float _Green_C;
					uniform 	float _Blue_C;
					uniform 	float _FadeFX;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec2 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_1;
					lowp float u_xlat10_1;
					vec2 u_xlat2;
					lowp vec3 u_xlat10_3;
					vec2 u_xlat4;
					float u_xlat7;
					mediump vec2 u_xlat16_7;
					bvec2 u_xlatb7;
					float u_xlat9;
					mediump float u_xlat16_9;
					float u_xlat10;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy * vec2(0.100000001, 1.0);
					    u_xlat0.x = dot(u_xlat16_0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469 + _TimeX;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 1.0;
					    u_xlat1.x = _Blue_R;
					    u_xlat1.yz = vec2(_Blue_G, _Blue_B);
					    u_xlat10_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat1.x = dot(u_xlat10_3.xyz, u_xlat1.xyz);
					    u_xlat1.z = u_xlat1.x + _Blue_C;
					    u_xlat10 = dot(u_xlat10_3.xyz, vec3(_Red_R, _Red_G, _Red_B));
					    u_xlat1.x = u_xlat10 + _Red_C;
					    u_xlat10 = dot(u_xlat10_3.xyz, vec3(_Green_R, _Green_G, _Green_B));
					    u_xlat1.y = u_xlat10 + _Green_C;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xxx + (-u_xlat10_3.xyz);
					    u_xlat0.xyz = vec3(vec3(_FadeFX, _FadeFX, _FadeFX)) * u_xlat1.xyz + u_xlat10_3.xyz;
					    u_xlat1.xyz = vec3(_TimeX) * vec3(0.25, 0.230000004, 110.0);
					    u_xlat4.xy = sin(u_xlat1.yz);
					    u_xlat9 = vs_TEXCOORD0.y * 2.0 + u_xlat1.x;
					    u_xlat1.x = u_xlat4.x + _TimeX;
					    u_xlat4.x = u_xlat4.y * 0.00999999978 + 0.790000021;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat9 = u_xlat9 + u_xlat1.x;
					    u_xlat1.x = floor(u_xlat9);
					    u_xlat9 = u_xlat9 + (-u_xlat1.x);
					    u_xlat1.x = u_xlat9 + -0.400000006;
					    u_xlatb7.xy = greaterThanEqual(vec4(u_xlat9), vec4(0.400000006, 0.600000024, 0.400000006, 0.600000024)).xy;
					    u_xlat9 = u_xlatb7.x ? 1.0 : float(0.0);
					    u_xlat7 = (u_xlatb7.y) ? -1.0 : -0.0;
					    u_xlat9 = u_xlat9 + u_xlat7;
					    u_xlat1.x = u_xlat9 * u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) * 4.99999952 + 1.0;
					    u_xlat9 = u_xlat9 * u_xlat1.x;
					    u_xlat1.x = cos(_TimeX);
					    u_xlat2.y = u_xlat1.x * _TimeX;
					    u_xlat16_1.xz = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat2.x = _TimeX;
					    u_xlat1.xz = u_xlat2.xy * vec2(8.0, 16.0) + u_xlat16_1.xz;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xz).x;
					    u_xlat16_1.x = u_xlat10_1 * u_xlat10_1;
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat16_1.xxx + u_xlat0.xyz;
					    u_xlat9 = vs_TEXCOORD0.y * 30.0 + _TimeX;
					    u_xlat1.x = floor(u_xlat9);
					    u_xlat9 = u_xlat9 + (-u_xlat1.x);
					    u_xlat9 = u_xlat9 + 12.0;
					    u_xlat9 = u_xlat9 * 0.0769230798;
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat16_1.xz = vs_TEXCOORD0.xy * vec2(6.0, 300.0);
					    u_xlat16_9 = u_xlat16_1.x * vs_TEXCOORD0.y;
					    u_xlat1.x = _TimeX * 10.0 + u_xlat16_1.z;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 0.100000001 + 0.899999976;
					    u_xlat16_7.xy = (-vs_TEXCOORD0.xy) + vec2(1.5, 1.5);
					    u_xlat16_9 = u_xlat16_9 * u_xlat16_7.x;
					    u_xlat16_9 = dot(vec2(u_xlat16_9), u_xlat16_7.yy);
					    u_xlat16_9 = u_xlat16_9 + 0.5;
					    u_xlat0.xyz = vec3(u_xlat16_9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat4.xxx * u_xlat0.xyz;
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
					uniform 	float _Red_R;
					uniform 	float _Red_G;
					uniform 	float _Red_B;
					uniform 	float _Green_R;
					uniform 	float _Green_G;
					uniform 	float _Green_B;
					uniform 	float _Blue_R;
					uniform 	float _Blue_G;
					uniform 	float _Blue_B;
					uniform 	float _Red_C;
					uniform 	float _Green_C;
					uniform 	float _Blue_C;
					uniform 	float _FadeFX;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec2 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_1;
					lowp float u_xlat10_1;
					vec2 u_xlat2;
					lowp vec3 u_xlat10_3;
					vec2 u_xlat4;
					float u_xlat7;
					mediump vec2 u_xlat16_7;
					bvec2 u_xlatb7;
					float u_xlat9;
					mediump float u_xlat16_9;
					float u_xlat10;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy * vec2(0.100000001, 1.0);
					    u_xlat0.x = dot(u_xlat16_0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469 + _TimeX;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 1.0;
					    u_xlat1.x = _Blue_R;
					    u_xlat1.yz = vec2(_Blue_G, _Blue_B);
					    u_xlat10_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat1.x = dot(u_xlat10_3.xyz, u_xlat1.xyz);
					    u_xlat1.z = u_xlat1.x + _Blue_C;
					    u_xlat10 = dot(u_xlat10_3.xyz, vec3(_Red_R, _Red_G, _Red_B));
					    u_xlat1.x = u_xlat10 + _Red_C;
					    u_xlat10 = dot(u_xlat10_3.xyz, vec3(_Green_R, _Green_G, _Green_B));
					    u_xlat1.y = u_xlat10 + _Green_C;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xxx + (-u_xlat10_3.xyz);
					    u_xlat0.xyz = vec3(vec3(_FadeFX, _FadeFX, _FadeFX)) * u_xlat1.xyz + u_xlat10_3.xyz;
					    u_xlat1.xyz = vec3(_TimeX) * vec3(0.25, 0.230000004, 110.0);
					    u_xlat4.xy = sin(u_xlat1.yz);
					    u_xlat9 = vs_TEXCOORD0.y * 2.0 + u_xlat1.x;
					    u_xlat1.x = u_xlat4.x + _TimeX;
					    u_xlat4.x = u_xlat4.y * 0.00999999978 + 0.790000021;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat9 = u_xlat9 + u_xlat1.x;
					    u_xlat1.x = floor(u_xlat9);
					    u_xlat9 = u_xlat9 + (-u_xlat1.x);
					    u_xlat1.x = u_xlat9 + -0.400000006;
					    u_xlatb7.xy = greaterThanEqual(vec4(u_xlat9), vec4(0.400000006, 0.600000024, 0.400000006, 0.600000024)).xy;
					    u_xlat9 = u_xlatb7.x ? 1.0 : float(0.0);
					    u_xlat7 = (u_xlatb7.y) ? -1.0 : -0.0;
					    u_xlat9 = u_xlat9 + u_xlat7;
					    u_xlat1.x = u_xlat9 * u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) * 4.99999952 + 1.0;
					    u_xlat9 = u_xlat9 * u_xlat1.x;
					    u_xlat1.x = cos(_TimeX);
					    u_xlat2.y = u_xlat1.x * _TimeX;
					    u_xlat16_1.xz = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat2.x = _TimeX;
					    u_xlat1.xz = u_xlat2.xy * vec2(8.0, 16.0) + u_xlat16_1.xz;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xz).x;
					    u_xlat16_1.x = u_xlat10_1 * u_xlat10_1;
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat16_1.xxx + u_xlat0.xyz;
					    u_xlat9 = vs_TEXCOORD0.y * 30.0 + _TimeX;
					    u_xlat1.x = floor(u_xlat9);
					    u_xlat9 = u_xlat9 + (-u_xlat1.x);
					    u_xlat9 = u_xlat9 + 12.0;
					    u_xlat9 = u_xlat9 * 0.0769230798;
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat16_1.xz = vs_TEXCOORD0.xy * vec2(6.0, 300.0);
					    u_xlat16_9 = u_xlat16_1.x * vs_TEXCOORD0.y;
					    u_xlat1.x = _TimeX * 10.0 + u_xlat16_1.z;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 0.100000001 + 0.899999976;
					    u_xlat16_7.xy = (-vs_TEXCOORD0.xy) + vec2(1.5, 1.5);
					    u_xlat16_9 = u_xlat16_9 * u_xlat16_7.x;
					    u_xlat16_9 = dot(vec2(u_xlat16_9), u_xlat16_7.yy);
					    u_xlat16_9 = u_xlat16_9 + 0.5;
					    u_xlat0.xyz = vec3(u_xlat16_9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat4.xxx * u_xlat0.xyz;
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
					uniform 	float _Red_R;
					uniform 	float _Red_G;
					uniform 	float _Red_B;
					uniform 	float _Green_R;
					uniform 	float _Green_G;
					uniform 	float _Green_B;
					uniform 	float _Blue_R;
					uniform 	float _Blue_G;
					uniform 	float _Blue_B;
					uniform 	float _Red_C;
					uniform 	float _Green_C;
					uniform 	float _Blue_C;
					uniform 	float _FadeFX;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec2 u_xlat16_0;
					vec3 u_xlat1;
					mediump vec3 u_xlat16_1;
					lowp float u_xlat10_1;
					vec2 u_xlat2;
					lowp vec3 u_xlat10_3;
					vec2 u_xlat4;
					float u_xlat7;
					mediump vec2 u_xlat16_7;
					bvec2 u_xlatb7;
					float u_xlat9;
					mediump float u_xlat16_9;
					float u_xlat10;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy * vec2(0.100000001, 1.0);
					    u_xlat0.x = dot(u_xlat16_0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469 + _TimeX;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 1.0;
					    u_xlat1.x = _Blue_R;
					    u_xlat1.yz = vec2(_Blue_G, _Blue_B);
					    u_xlat10_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat1.x = dot(u_xlat10_3.xyz, u_xlat1.xyz);
					    u_xlat1.z = u_xlat1.x + _Blue_C;
					    u_xlat10 = dot(u_xlat10_3.xyz, vec3(_Red_R, _Red_G, _Red_B));
					    u_xlat1.x = u_xlat10 + _Red_C;
					    u_xlat10 = dot(u_xlat10_3.xyz, vec3(_Green_R, _Green_G, _Green_B));
					    u_xlat1.y = u_xlat10 + _Green_C;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xxx + (-u_xlat10_3.xyz);
					    u_xlat0.xyz = vec3(vec3(_FadeFX, _FadeFX, _FadeFX)) * u_xlat1.xyz + u_xlat10_3.xyz;
					    u_xlat1.xyz = vec3(_TimeX) * vec3(0.25, 0.230000004, 110.0);
					    u_xlat4.xy = sin(u_xlat1.yz);
					    u_xlat9 = vs_TEXCOORD0.y * 2.0 + u_xlat1.x;
					    u_xlat1.x = u_xlat4.x + _TimeX;
					    u_xlat4.x = u_xlat4.y * 0.00999999978 + 0.790000021;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat9 = u_xlat9 + u_xlat1.x;
					    u_xlat1.x = floor(u_xlat9);
					    u_xlat9 = u_xlat9 + (-u_xlat1.x);
					    u_xlat1.x = u_xlat9 + -0.400000006;
					    u_xlatb7.xy = greaterThanEqual(vec4(u_xlat9), vec4(0.400000006, 0.600000024, 0.400000006, 0.600000024)).xy;
					    u_xlat9 = u_xlatb7.x ? 1.0 : float(0.0);
					    u_xlat7 = (u_xlatb7.y) ? -1.0 : -0.0;
					    u_xlat9 = u_xlat9 + u_xlat7;
					    u_xlat1.x = u_xlat9 * u_xlat1.x;
					    u_xlat1.x = (-u_xlat1.x) * 4.99999952 + 1.0;
					    u_xlat9 = u_xlat9 * u_xlat1.x;
					    u_xlat1.x = cos(_TimeX);
					    u_xlat2.y = u_xlat1.x * _TimeX;
					    u_xlat16_1.xz = vs_TEXCOORD0.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat2.x = _TimeX;
					    u_xlat1.xz = u_xlat2.xy * vec2(8.0, 16.0) + u_xlat16_1.xz;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xz).x;
					    u_xlat16_1.x = u_xlat10_1 * u_xlat10_1;
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat16_1.xxx + u_xlat0.xyz;
					    u_xlat9 = vs_TEXCOORD0.y * 30.0 + _TimeX;
					    u_xlat1.x = floor(u_xlat9);
					    u_xlat9 = u_xlat9 + (-u_xlat1.x);
					    u_xlat9 = u_xlat9 + 12.0;
					    u_xlat9 = u_xlat9 * 0.0769230798;
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat16_1.xz = vs_TEXCOORD0.xy * vec2(6.0, 300.0);
					    u_xlat16_9 = u_xlat16_1.x * vs_TEXCOORD0.y;
					    u_xlat1.x = _TimeX * 10.0 + u_xlat16_1.z;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 0.100000001 + 0.899999976;
					    u_xlat16_7.xy = (-vs_TEXCOORD0.xy) + vec2(1.5, 1.5);
					    u_xlat16_9 = u_xlat16_9 * u_xlat16_7.x;
					    u_xlat16_9 = dot(vec2(u_xlat16_9), u_xlat16_7.yy);
					    u_xlat16_9 = u_xlat16_9 + 0.5;
					    u_xlat0.xyz = vec3(u_xlat16_9) * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat4.xxx * u_xlat0.xyz;
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