Shader "CameraFilterPack/Colors_HSV" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_HueShift ("HueShift", Range(0, 360)) = 0
		_Sat ("Saturation", Float) = 1
		_Val ("Value", Float) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 26585
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
					uniform highp float _HueShift;
					uniform highp float _Sat;
					uniform highp float _Val;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec3 tmpvar_1;
					  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  highp vec3 RGB_2;
					  RGB_2 = tmpvar_1;
					  highp vec3 RESULT_3;
					  highp float tmpvar_4;
					  highp float tmpvar_5;
					  tmpvar_5 = (_HueShift * 3.141593);
					  highp float tmpvar_6;
					  tmpvar_6 = (_Val * _Sat);
					  tmpvar_4 = (tmpvar_6 * cos((tmpvar_5 / 180.0)));
					  highp float tmpvar_7;
					  tmpvar_7 = (tmpvar_6 * sin((tmpvar_5 / 180.0)));
					  highp float tmpvar_8;
					  tmpvar_8 = (0.299 * _Val);
					  highp float tmpvar_9;
					  tmpvar_9 = (0.587 * _Val);
					  highp float tmpvar_10;
					  tmpvar_10 = (0.114 * _Val);
					  RESULT_3.x = (((
					    ((tmpvar_8 + (0.701 * tmpvar_4)) + (0.168 * tmpvar_7))
					   * RGB_2.x) + (
					    ((tmpvar_9 - (0.587 * tmpvar_4)) + (0.33 * tmpvar_7))
					   * RGB_2.y)) + ((
					    (tmpvar_10 - (0.114 * tmpvar_4))
					   - 
					    (0.497 * tmpvar_7)
					  ) * RGB_2.z));
					  RESULT_3.y = (((
					    ((tmpvar_8 - (0.299 * tmpvar_4)) - (0.328 * tmpvar_7))
					   * RGB_2.x) + (
					    ((tmpvar_9 + (0.413 * tmpvar_4)) + (0.035 * tmpvar_7))
					   * RGB_2.y)) + ((
					    (tmpvar_10 - (0.114 * tmpvar_4))
					   + 
					    (0.292 * tmpvar_7)
					  ) * RGB_2.z));
					  RESULT_3.z = (((
					    ((tmpvar_8 - (0.3 * tmpvar_4)) + (1.25 * tmpvar_7))
					   * RGB_2.x) + (
					    ((tmpvar_9 - (0.588 * tmpvar_4)) - (1.05 * tmpvar_7))
					   * RGB_2.y)) + ((
					    (tmpvar_10 + (0.886 * tmpvar_4))
					   - 
					    (0.203 * tmpvar_7)
					  ) * RGB_2.z));
					  highp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = RESULT_3;
					  gl_FragData[0] = tmpvar_11;
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
					uniform highp float _HueShift;
					uniform highp float _Sat;
					uniform highp float _Val;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec3 tmpvar_1;
					  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  highp vec3 RGB_2;
					  RGB_2 = tmpvar_1;
					  highp vec3 RESULT_3;
					  highp float tmpvar_4;
					  highp float tmpvar_5;
					  tmpvar_5 = (_HueShift * 3.141593);
					  highp float tmpvar_6;
					  tmpvar_6 = (_Val * _Sat);
					  tmpvar_4 = (tmpvar_6 * cos((tmpvar_5 / 180.0)));
					  highp float tmpvar_7;
					  tmpvar_7 = (tmpvar_6 * sin((tmpvar_5 / 180.0)));
					  highp float tmpvar_8;
					  tmpvar_8 = (0.299 * _Val);
					  highp float tmpvar_9;
					  tmpvar_9 = (0.587 * _Val);
					  highp float tmpvar_10;
					  tmpvar_10 = (0.114 * _Val);
					  RESULT_3.x = (((
					    ((tmpvar_8 + (0.701 * tmpvar_4)) + (0.168 * tmpvar_7))
					   * RGB_2.x) + (
					    ((tmpvar_9 - (0.587 * tmpvar_4)) + (0.33 * tmpvar_7))
					   * RGB_2.y)) + ((
					    (tmpvar_10 - (0.114 * tmpvar_4))
					   - 
					    (0.497 * tmpvar_7)
					  ) * RGB_2.z));
					  RESULT_3.y = (((
					    ((tmpvar_8 - (0.299 * tmpvar_4)) - (0.328 * tmpvar_7))
					   * RGB_2.x) + (
					    ((tmpvar_9 + (0.413 * tmpvar_4)) + (0.035 * tmpvar_7))
					   * RGB_2.y)) + ((
					    (tmpvar_10 - (0.114 * tmpvar_4))
					   + 
					    (0.292 * tmpvar_7)
					  ) * RGB_2.z));
					  RESULT_3.z = (((
					    ((tmpvar_8 - (0.3 * tmpvar_4)) + (1.25 * tmpvar_7))
					   * RGB_2.x) + (
					    ((tmpvar_9 - (0.588 * tmpvar_4)) - (1.05 * tmpvar_7))
					   * RGB_2.y)) + ((
					    (tmpvar_10 + (0.886 * tmpvar_4))
					   - 
					    (0.203 * tmpvar_7)
					  ) * RGB_2.z));
					  highp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = RESULT_3;
					  gl_FragData[0] = tmpvar_11;
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
					uniform highp float _HueShift;
					uniform highp float _Sat;
					uniform highp float _Val;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec3 tmpvar_1;
					  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  highp vec3 RGB_2;
					  RGB_2 = tmpvar_1;
					  highp vec3 RESULT_3;
					  highp float tmpvar_4;
					  highp float tmpvar_5;
					  tmpvar_5 = (_HueShift * 3.141593);
					  highp float tmpvar_6;
					  tmpvar_6 = (_Val * _Sat);
					  tmpvar_4 = (tmpvar_6 * cos((tmpvar_5 / 180.0)));
					  highp float tmpvar_7;
					  tmpvar_7 = (tmpvar_6 * sin((tmpvar_5 / 180.0)));
					  highp float tmpvar_8;
					  tmpvar_8 = (0.299 * _Val);
					  highp float tmpvar_9;
					  tmpvar_9 = (0.587 * _Val);
					  highp float tmpvar_10;
					  tmpvar_10 = (0.114 * _Val);
					  RESULT_3.x = (((
					    ((tmpvar_8 + (0.701 * tmpvar_4)) + (0.168 * tmpvar_7))
					   * RGB_2.x) + (
					    ((tmpvar_9 - (0.587 * tmpvar_4)) + (0.33 * tmpvar_7))
					   * RGB_2.y)) + ((
					    (tmpvar_10 - (0.114 * tmpvar_4))
					   - 
					    (0.497 * tmpvar_7)
					  ) * RGB_2.z));
					  RESULT_3.y = (((
					    ((tmpvar_8 - (0.299 * tmpvar_4)) - (0.328 * tmpvar_7))
					   * RGB_2.x) + (
					    ((tmpvar_9 + (0.413 * tmpvar_4)) + (0.035 * tmpvar_7))
					   * RGB_2.y)) + ((
					    (tmpvar_10 - (0.114 * tmpvar_4))
					   + 
					    (0.292 * tmpvar_7)
					  ) * RGB_2.z));
					  RESULT_3.z = (((
					    ((tmpvar_8 - (0.3 * tmpvar_4)) + (1.25 * tmpvar_7))
					   * RGB_2.x) + (
					    ((tmpvar_9 - (0.588 * tmpvar_4)) - (1.05 * tmpvar_7))
					   * RGB_2.y)) + ((
					    (tmpvar_10 + (0.886 * tmpvar_4))
					   - 
					    (0.203 * tmpvar_7)
					  ) * RGB_2.z));
					  highp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = RESULT_3;
					  gl_FragData[0] = tmpvar_11;
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
					uniform 	float _HueShift;
					uniform 	float _Sat;
					uniform 	float _Val;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					lowp vec3 u_xlat10_4;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat0 = _HueShift * 0.0174532942;
					    u_xlat1.x = cos(u_xlat0);
					    u_xlat0 = sin(u_xlat0);
					    u_xlat3.x = _Sat * _Val;
					    u_xlat6 = u_xlat1.x * u_xlat3.x;
					    u_xlat0 = u_xlat0 * u_xlat3.x;
					    u_xlat1 = vec4(u_xlat6) * vec4(0.412999988, 0.300000012, 0.588, 0.885999978);
					    u_xlat2 = vec4(u_xlat6) * vec4(0.700999975, 0.587000012, 0.114, 0.298999995);
					    u_xlat3.xy = vec2(vec2(_Val, _Val)) * vec2(0.587000012, 0.114) + u_xlat1.xw;
					    u_xlat1.xy = vec2(vec2(_Val, _Val)) * vec2(0.298999995, 0.587000012) + (-u_xlat1.yz);
					    u_xlat6 = (-u_xlat0) * 0.202999994 + u_xlat3.y;
					    u_xlat3.x = u_xlat0 * 0.0350000001 + u_xlat3.x;
					    u_xlat9 = u_xlat0 * 1.25 + u_xlat1.x;
					    u_xlat1.x = (-u_xlat0) * 1.04999995 + u_xlat1.y;
					    u_xlat10_4.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat1.x = u_xlat10_4.y * u_xlat1.x;
					    u_xlat9 = u_xlat9 * u_xlat10_4.x + u_xlat1.x;
					    SV_Target0.z = u_xlat6 * u_xlat10_4.z + u_xlat9;
					    u_xlat6 = _Val * 0.298999995 + u_xlat2.x;
					    u_xlat2.xyz = vec3(vec3(_Val, _Val, _Val)) * vec3(0.587000012, 0.114, 0.298999995) + (-u_xlat2.yzw);
					    u_xlat6 = u_xlat0 * 0.167999998 + u_xlat6;
					    u_xlat9 = u_xlat0 * 0.330000013 + u_xlat2.x;
					    u_xlat9 = u_xlat10_4.y * u_xlat9;
					    u_xlat6 = u_xlat6 * u_xlat10_4.x + u_xlat9;
					    u_xlat2.xz = (-vec2(u_xlat0)) * vec2(0.497000009, 0.328000009) + u_xlat2.yz;
					    u_xlat0 = u_xlat0 * 0.291999996 + u_xlat2.y;
					    SV_Target0.x = u_xlat2.x * u_xlat10_4.z + u_xlat6;
					    u_xlat6 = u_xlat10_4.x * u_xlat2.z;
					    u_xlat3.x = u_xlat3.x * u_xlat10_4.y + u_xlat6;
					    SV_Target0.y = u_xlat0 * u_xlat10_4.z + u_xlat3.x;
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
					uniform 	float _HueShift;
					uniform 	float _Sat;
					uniform 	float _Val;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					lowp vec3 u_xlat10_4;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat0 = _HueShift * 0.0174532942;
					    u_xlat1.x = cos(u_xlat0);
					    u_xlat0 = sin(u_xlat0);
					    u_xlat3.x = _Sat * _Val;
					    u_xlat6 = u_xlat1.x * u_xlat3.x;
					    u_xlat0 = u_xlat0 * u_xlat3.x;
					    u_xlat1 = vec4(u_xlat6) * vec4(0.412999988, 0.300000012, 0.588, 0.885999978);
					    u_xlat2 = vec4(u_xlat6) * vec4(0.700999975, 0.587000012, 0.114, 0.298999995);
					    u_xlat3.xy = vec2(vec2(_Val, _Val)) * vec2(0.587000012, 0.114) + u_xlat1.xw;
					    u_xlat1.xy = vec2(vec2(_Val, _Val)) * vec2(0.298999995, 0.587000012) + (-u_xlat1.yz);
					    u_xlat6 = (-u_xlat0) * 0.202999994 + u_xlat3.y;
					    u_xlat3.x = u_xlat0 * 0.0350000001 + u_xlat3.x;
					    u_xlat9 = u_xlat0 * 1.25 + u_xlat1.x;
					    u_xlat1.x = (-u_xlat0) * 1.04999995 + u_xlat1.y;
					    u_xlat10_4.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat1.x = u_xlat10_4.y * u_xlat1.x;
					    u_xlat9 = u_xlat9 * u_xlat10_4.x + u_xlat1.x;
					    SV_Target0.z = u_xlat6 * u_xlat10_4.z + u_xlat9;
					    u_xlat6 = _Val * 0.298999995 + u_xlat2.x;
					    u_xlat2.xyz = vec3(vec3(_Val, _Val, _Val)) * vec3(0.587000012, 0.114, 0.298999995) + (-u_xlat2.yzw);
					    u_xlat6 = u_xlat0 * 0.167999998 + u_xlat6;
					    u_xlat9 = u_xlat0 * 0.330000013 + u_xlat2.x;
					    u_xlat9 = u_xlat10_4.y * u_xlat9;
					    u_xlat6 = u_xlat6 * u_xlat10_4.x + u_xlat9;
					    u_xlat2.xz = (-vec2(u_xlat0)) * vec2(0.497000009, 0.328000009) + u_xlat2.yz;
					    u_xlat0 = u_xlat0 * 0.291999996 + u_xlat2.y;
					    SV_Target0.x = u_xlat2.x * u_xlat10_4.z + u_xlat6;
					    u_xlat6 = u_xlat10_4.x * u_xlat2.z;
					    u_xlat3.x = u_xlat3.x * u_xlat10_4.y + u_xlat6;
					    SV_Target0.y = u_xlat0 * u_xlat10_4.z + u_xlat3.x;
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
					uniform 	float _HueShift;
					uniform 	float _Sat;
					uniform 	float _Val;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					lowp vec3 u_xlat10_4;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat0 = _HueShift * 0.0174532942;
					    u_xlat1.x = cos(u_xlat0);
					    u_xlat0 = sin(u_xlat0);
					    u_xlat3.x = _Sat * _Val;
					    u_xlat6 = u_xlat1.x * u_xlat3.x;
					    u_xlat0 = u_xlat0 * u_xlat3.x;
					    u_xlat1 = vec4(u_xlat6) * vec4(0.412999988, 0.300000012, 0.588, 0.885999978);
					    u_xlat2 = vec4(u_xlat6) * vec4(0.700999975, 0.587000012, 0.114, 0.298999995);
					    u_xlat3.xy = vec2(vec2(_Val, _Val)) * vec2(0.587000012, 0.114) + u_xlat1.xw;
					    u_xlat1.xy = vec2(vec2(_Val, _Val)) * vec2(0.298999995, 0.587000012) + (-u_xlat1.yz);
					    u_xlat6 = (-u_xlat0) * 0.202999994 + u_xlat3.y;
					    u_xlat3.x = u_xlat0 * 0.0350000001 + u_xlat3.x;
					    u_xlat9 = u_xlat0 * 1.25 + u_xlat1.x;
					    u_xlat1.x = (-u_xlat0) * 1.04999995 + u_xlat1.y;
					    u_xlat10_4.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat1.x = u_xlat10_4.y * u_xlat1.x;
					    u_xlat9 = u_xlat9 * u_xlat10_4.x + u_xlat1.x;
					    SV_Target0.z = u_xlat6 * u_xlat10_4.z + u_xlat9;
					    u_xlat6 = _Val * 0.298999995 + u_xlat2.x;
					    u_xlat2.xyz = vec3(vec3(_Val, _Val, _Val)) * vec3(0.587000012, 0.114, 0.298999995) + (-u_xlat2.yzw);
					    u_xlat6 = u_xlat0 * 0.167999998 + u_xlat6;
					    u_xlat9 = u_xlat0 * 0.330000013 + u_xlat2.x;
					    u_xlat9 = u_xlat10_4.y * u_xlat9;
					    u_xlat6 = u_xlat6 * u_xlat10_4.x + u_xlat9;
					    u_xlat2.xz = (-vec2(u_xlat0)) * vec2(0.497000009, 0.328000009) + u_xlat2.yz;
					    u_xlat0 = u_xlat0 * 0.291999996 + u_xlat2.y;
					    SV_Target0.x = u_xlat2.x * u_xlat10_4.z + u_xlat6;
					    u_xlat6 = u_xlat10_4.x * u_xlat2.z;
					    u_xlat3.x = u_xlat3.x * u_xlat10_4.y + u_xlat6;
					    SV_Target0.y = u_xlat0 * u_xlat10_4.z + u_xlat3.x;
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