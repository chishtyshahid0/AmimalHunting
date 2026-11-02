Shader "CameraFilterPack/FX_ZebraColor" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Value ("_Value", Range(1, 10)) = 10
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 62590
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
					uniform highp vec4 _ScreenResolution;
					uniform highp float _Value;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float a_1;
					  highp vec3 col_2;
					  highp vec3 txt_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, uv_4).xyz;
					  txt_3 = tmpvar_5;
					  col_2 = (txt_3 / sqrt(dot (txt_3, txt_3)));
					  highp float tmpvar_6;
					  tmpvar_6 = (((txt_3.x + txt_3.y) + txt_3.z) / 3.0);
					  highp float tmpvar_7;
					  highp float tmpvar_8;
					  tmpvar_8 = (min (abs(
					    (txt_3.x / txt_3.y)
					  ), 1.0) / max (abs(
					    (txt_3.x / txt_3.y)
					  ), 1.0));
					  highp float tmpvar_9;
					  tmpvar_9 = (tmpvar_8 * tmpvar_8);
					  tmpvar_9 = (((
					    ((((
					      ((((-0.01213232 * tmpvar_9) + 0.05368138) * tmpvar_9) - 0.1173503)
					     * tmpvar_9) + 0.1938925) * tmpvar_9) - 0.3326756)
					   * tmpvar_9) + 0.9999793) * tmpvar_8);
					  tmpvar_9 = (tmpvar_9 + (float(
					    (abs((txt_3.x / txt_3.y)) > 1.0)
					  ) * (
					    (tmpvar_9 * -2.0)
					   + 1.570796)));
					  tmpvar_7 = (tmpvar_9 * sign((txt_3.x / txt_3.y)));
					  if ((abs(txt_3.y) > (1e-08 * abs(txt_3.x)))) {
					    if ((txt_3.y < 0.0)) {
					      if ((txt_3.x >= 0.0)) {
					        tmpvar_7 += 3.141593;
					      } else {
					        tmpvar_7 = (tmpvar_7 - 3.141593);
					      };
					    };
					  } else {
					    tmpvar_7 = (sign(txt_3.x) * 1.570796);
					  };
					  a_1 = (2.0 * tmpvar_7);
					  a_1 = (((
					    floor(((_Value * a_1) / 3.141593))
					   * 3.141593) / _Value) + 1.570796);
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = cos(a_1);
					  tmpvar_10.y = sin(a_1);
					  a_1 = (6.283185 * dot (tmpvar_10, (xlv_TEXCOORD0 * _ScreenResolution.xy)));
					  col_2 = ((0.5 - (0.5 * 
					    cos(((0.5 * (
					      floor((_Value * tmpvar_6))
					     / _Value)) * a_1))
					  )) * (txt_3 / sqrt(
					    dot (txt_3, txt_3)
					  )));
					  highp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = col_2;
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
					uniform highp vec4 _ScreenResolution;
					uniform highp float _Value;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float a_1;
					  highp vec3 col_2;
					  highp vec3 txt_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, uv_4).xyz;
					  txt_3 = tmpvar_5;
					  col_2 = (txt_3 / sqrt(dot (txt_3, txt_3)));
					  highp float tmpvar_6;
					  tmpvar_6 = (((txt_3.x + txt_3.y) + txt_3.z) / 3.0);
					  highp float tmpvar_7;
					  highp float tmpvar_8;
					  tmpvar_8 = (min (abs(
					    (txt_3.x / txt_3.y)
					  ), 1.0) / max (abs(
					    (txt_3.x / txt_3.y)
					  ), 1.0));
					  highp float tmpvar_9;
					  tmpvar_9 = (tmpvar_8 * tmpvar_8);
					  tmpvar_9 = (((
					    ((((
					      ((((-0.01213232 * tmpvar_9) + 0.05368138) * tmpvar_9) - 0.1173503)
					     * tmpvar_9) + 0.1938925) * tmpvar_9) - 0.3326756)
					   * tmpvar_9) + 0.9999793) * tmpvar_8);
					  tmpvar_9 = (tmpvar_9 + (float(
					    (abs((txt_3.x / txt_3.y)) > 1.0)
					  ) * (
					    (tmpvar_9 * -2.0)
					   + 1.570796)));
					  tmpvar_7 = (tmpvar_9 * sign((txt_3.x / txt_3.y)));
					  if ((abs(txt_3.y) > (1e-08 * abs(txt_3.x)))) {
					    if ((txt_3.y < 0.0)) {
					      if ((txt_3.x >= 0.0)) {
					        tmpvar_7 += 3.141593;
					      } else {
					        tmpvar_7 = (tmpvar_7 - 3.141593);
					      };
					    };
					  } else {
					    tmpvar_7 = (sign(txt_3.x) * 1.570796);
					  };
					  a_1 = (2.0 * tmpvar_7);
					  a_1 = (((
					    floor(((_Value * a_1) / 3.141593))
					   * 3.141593) / _Value) + 1.570796);
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = cos(a_1);
					  tmpvar_10.y = sin(a_1);
					  a_1 = (6.283185 * dot (tmpvar_10, (xlv_TEXCOORD0 * _ScreenResolution.xy)));
					  col_2 = ((0.5 - (0.5 * 
					    cos(((0.5 * (
					      floor((_Value * tmpvar_6))
					     / _Value)) * a_1))
					  )) * (txt_3 / sqrt(
					    dot (txt_3, txt_3)
					  )));
					  highp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = col_2;
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
					uniform highp vec4 _ScreenResolution;
					uniform highp float _Value;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float a_1;
					  highp vec3 col_2;
					  highp vec3 txt_3;
					  highp vec2 uv_4;
					  uv_4 = xlv_TEXCOORD0;
					  lowp vec3 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, uv_4).xyz;
					  txt_3 = tmpvar_5;
					  col_2 = (txt_3 / sqrt(dot (txt_3, txt_3)));
					  highp float tmpvar_6;
					  tmpvar_6 = (((txt_3.x + txt_3.y) + txt_3.z) / 3.0);
					  highp float tmpvar_7;
					  highp float tmpvar_8;
					  tmpvar_8 = (min (abs(
					    (txt_3.x / txt_3.y)
					  ), 1.0) / max (abs(
					    (txt_3.x / txt_3.y)
					  ), 1.0));
					  highp float tmpvar_9;
					  tmpvar_9 = (tmpvar_8 * tmpvar_8);
					  tmpvar_9 = (((
					    ((((
					      ((((-0.01213232 * tmpvar_9) + 0.05368138) * tmpvar_9) - 0.1173503)
					     * tmpvar_9) + 0.1938925) * tmpvar_9) - 0.3326756)
					   * tmpvar_9) + 0.9999793) * tmpvar_8);
					  tmpvar_9 = (tmpvar_9 + (float(
					    (abs((txt_3.x / txt_3.y)) > 1.0)
					  ) * (
					    (tmpvar_9 * -2.0)
					   + 1.570796)));
					  tmpvar_7 = (tmpvar_9 * sign((txt_3.x / txt_3.y)));
					  if ((abs(txt_3.y) > (1e-08 * abs(txt_3.x)))) {
					    if ((txt_3.y < 0.0)) {
					      if ((txt_3.x >= 0.0)) {
					        tmpvar_7 += 3.141593;
					      } else {
					        tmpvar_7 = (tmpvar_7 - 3.141593);
					      };
					    };
					  } else {
					    tmpvar_7 = (sign(txt_3.x) * 1.570796);
					  };
					  a_1 = (2.0 * tmpvar_7);
					  a_1 = (((
					    floor(((_Value * a_1) / 3.141593))
					   * 3.141593) / _Value) + 1.570796);
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = cos(a_1);
					  tmpvar_10.y = sin(a_1);
					  a_1 = (6.283185 * dot (tmpvar_10, (xlv_TEXCOORD0 * _ScreenResolution.xy)));
					  col_2 = ((0.5 - (0.5 * 
					    cos(((0.5 * (
					      floor((_Value * tmpvar_6))
					     / _Value)) * a_1))
					  )) * (txt_3 / sqrt(
					    dot (txt_3, txt_3)
					  )));
					  highp vec4 tmpvar_11;
					  tmpvar_11.w = 1.0;
					  tmpvar_11.xyz = col_2;
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Value;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					mediump float u_xlat16_1;
					bool u_xlatb1;
					vec2 u_xlat2;
					float u_xlat4;
					mediump float u_xlat16_4;
					bool u_xlatb4;
					bool u_xlatb7;
					float u_xlat9;
					mediump float u_xlat16_9;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_9 = max(abs(u_xlat10_0.y), abs(u_xlat10_0.x));
					    u_xlat16_9 = float(1.0) / u_xlat16_9;
					    u_xlat16_1 = min(abs(u_xlat10_0.y), abs(u_xlat10_0.x));
					    u_xlat16_9 = u_xlat16_9 * u_xlat16_1;
					    u_xlat16_1 = u_xlat16_9 * u_xlat16_9;
					    u_xlat16_4 = u_xlat16_1 * 0.0208350997 + -0.0851330012;
					    u_xlat16_4 = u_xlat16_1 * u_xlat16_4 + 0.180141002;
					    u_xlat16_4 = u_xlat16_1 * u_xlat16_4 + -0.330299497;
					    u_xlat16_1 = u_xlat16_1 * u_xlat16_4 + 0.999866009;
					    u_xlat16_4 = u_xlat16_9 * u_xlat16_1;
					    u_xlat4 = u_xlat16_4 * -2.0 + 1.57079637;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(abs(u_xlat10_0.y)<abs(u_xlat10_0.x));
					#else
					    u_xlatb7 = abs(u_xlat10_0.y)<abs(u_xlat10_0.x);
					#endif
					    u_xlat4 = u_xlatb7 ? u_xlat4 : float(0.0);
					    u_xlat9 = u_xlat16_9 * u_xlat16_1 + u_xlat4;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat10_0.y<(-u_xlat10_0.y));
					#else
					    u_xlatb1 = u_xlat10_0.y<(-u_xlat10_0.y);
					#endif
					    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
					    u_xlat9 = u_xlat9 + u_xlat1.x;
					    u_xlat1.x = min(u_xlat10_0.y, u_xlat10_0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat1.x<(-u_xlat1.x));
					#else
					    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
					#endif
					    u_xlat4 = max(u_xlat10_0.y, u_xlat10_0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb4 = !!(u_xlat4>=(-u_xlat4));
					#else
					    u_xlatb4 = u_xlat4>=(-u_xlat4);
					#endif
					    u_xlatb1 = u_xlatb4 && u_xlatb1;
					    u_xlat9 = (u_xlatb1) ? (-u_xlat9) : u_xlat9;
					    u_xlat9 = u_xlat9 * _Value;
					    u_xlat9 = u_xlat9 * 0.636619747;
					    u_xlat9 = floor(u_xlat9);
					    u_xlat9 = u_xlat9 * 3.14159274;
					    u_xlat9 = u_xlat9 / _Value;
					    u_xlat9 = u_xlat9 + 1.57079637;
					    u_xlat1.x = sin(u_xlat9);
					    u_xlat2.x = cos(u_xlat9);
					    u_xlat2.y = u_xlat1.x;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat9 = dot(u_xlat2.xy, u_xlat1.xy);
					    u_xlat16_1 = u_xlat10_0.y + u_xlat10_0.x;
					    u_xlat16_1 = u_xlat10_0.z + u_xlat16_1;
					    u_xlat1.x = u_xlat16_1 * _Value;
					    u_xlat1.x = u_xlat1.x * 0.333333343;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x / _Value;
					    u_xlat9 = u_xlat9 * u_xlat1.x;
					    u_xlat9 = u_xlat9 * 3.14159274;
					    u_xlat9 = cos(u_xlat9);
					    u_xlat9 = (-u_xlat9) * 0.5 + 0.5;
					    u_xlat16_1 = dot(u_xlat10_0.xyz, u_xlat10_0.xyz);
					    u_xlat16_1 = sqrt(u_xlat16_1);
					    u_xlat16_0.xyz = u_xlat10_0.xyz / vec3(u_xlat16_1);
					    SV_Target0.xyz = u_xlat16_0.xyz * vec3(u_xlat9);
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Value;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					mediump float u_xlat16_1;
					bool u_xlatb1;
					vec2 u_xlat2;
					float u_xlat4;
					mediump float u_xlat16_4;
					bool u_xlatb4;
					bool u_xlatb7;
					float u_xlat9;
					mediump float u_xlat16_9;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_9 = max(abs(u_xlat10_0.y), abs(u_xlat10_0.x));
					    u_xlat16_9 = float(1.0) / u_xlat16_9;
					    u_xlat16_1 = min(abs(u_xlat10_0.y), abs(u_xlat10_0.x));
					    u_xlat16_9 = u_xlat16_9 * u_xlat16_1;
					    u_xlat16_1 = u_xlat16_9 * u_xlat16_9;
					    u_xlat16_4 = u_xlat16_1 * 0.0208350997 + -0.0851330012;
					    u_xlat16_4 = u_xlat16_1 * u_xlat16_4 + 0.180141002;
					    u_xlat16_4 = u_xlat16_1 * u_xlat16_4 + -0.330299497;
					    u_xlat16_1 = u_xlat16_1 * u_xlat16_4 + 0.999866009;
					    u_xlat16_4 = u_xlat16_9 * u_xlat16_1;
					    u_xlat4 = u_xlat16_4 * -2.0 + 1.57079637;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(abs(u_xlat10_0.y)<abs(u_xlat10_0.x));
					#else
					    u_xlatb7 = abs(u_xlat10_0.y)<abs(u_xlat10_0.x);
					#endif
					    u_xlat4 = u_xlatb7 ? u_xlat4 : float(0.0);
					    u_xlat9 = u_xlat16_9 * u_xlat16_1 + u_xlat4;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat10_0.y<(-u_xlat10_0.y));
					#else
					    u_xlatb1 = u_xlat10_0.y<(-u_xlat10_0.y);
					#endif
					    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
					    u_xlat9 = u_xlat9 + u_xlat1.x;
					    u_xlat1.x = min(u_xlat10_0.y, u_xlat10_0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat1.x<(-u_xlat1.x));
					#else
					    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
					#endif
					    u_xlat4 = max(u_xlat10_0.y, u_xlat10_0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb4 = !!(u_xlat4>=(-u_xlat4));
					#else
					    u_xlatb4 = u_xlat4>=(-u_xlat4);
					#endif
					    u_xlatb1 = u_xlatb4 && u_xlatb1;
					    u_xlat9 = (u_xlatb1) ? (-u_xlat9) : u_xlat9;
					    u_xlat9 = u_xlat9 * _Value;
					    u_xlat9 = u_xlat9 * 0.636619747;
					    u_xlat9 = floor(u_xlat9);
					    u_xlat9 = u_xlat9 * 3.14159274;
					    u_xlat9 = u_xlat9 / _Value;
					    u_xlat9 = u_xlat9 + 1.57079637;
					    u_xlat1.x = sin(u_xlat9);
					    u_xlat2.x = cos(u_xlat9);
					    u_xlat2.y = u_xlat1.x;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat9 = dot(u_xlat2.xy, u_xlat1.xy);
					    u_xlat16_1 = u_xlat10_0.y + u_xlat10_0.x;
					    u_xlat16_1 = u_xlat10_0.z + u_xlat16_1;
					    u_xlat1.x = u_xlat16_1 * _Value;
					    u_xlat1.x = u_xlat1.x * 0.333333343;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x / _Value;
					    u_xlat9 = u_xlat9 * u_xlat1.x;
					    u_xlat9 = u_xlat9 * 3.14159274;
					    u_xlat9 = cos(u_xlat9);
					    u_xlat9 = (-u_xlat9) * 0.5 + 0.5;
					    u_xlat16_1 = dot(u_xlat10_0.xyz, u_xlat10_0.xyz);
					    u_xlat16_1 = sqrt(u_xlat16_1);
					    u_xlat16_0.xyz = u_xlat10_0.xyz / vec3(u_xlat16_1);
					    SV_Target0.xyz = u_xlat16_0.xyz * vec3(u_xlat9);
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Value;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					mediump vec3 u_xlat16_0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					mediump float u_xlat16_1;
					bool u_xlatb1;
					vec2 u_xlat2;
					float u_xlat4;
					mediump float u_xlat16_4;
					bool u_xlatb4;
					bool u_xlatb7;
					float u_xlat9;
					mediump float u_xlat16_9;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_9 = max(abs(u_xlat10_0.y), abs(u_xlat10_0.x));
					    u_xlat16_9 = float(1.0) / u_xlat16_9;
					    u_xlat16_1 = min(abs(u_xlat10_0.y), abs(u_xlat10_0.x));
					    u_xlat16_9 = u_xlat16_9 * u_xlat16_1;
					    u_xlat16_1 = u_xlat16_9 * u_xlat16_9;
					    u_xlat16_4 = u_xlat16_1 * 0.0208350997 + -0.0851330012;
					    u_xlat16_4 = u_xlat16_1 * u_xlat16_4 + 0.180141002;
					    u_xlat16_4 = u_xlat16_1 * u_xlat16_4 + -0.330299497;
					    u_xlat16_1 = u_xlat16_1 * u_xlat16_4 + 0.999866009;
					    u_xlat16_4 = u_xlat16_9 * u_xlat16_1;
					    u_xlat4 = u_xlat16_4 * -2.0 + 1.57079637;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb7 = !!(abs(u_xlat10_0.y)<abs(u_xlat10_0.x));
					#else
					    u_xlatb7 = abs(u_xlat10_0.y)<abs(u_xlat10_0.x);
					#endif
					    u_xlat4 = u_xlatb7 ? u_xlat4 : float(0.0);
					    u_xlat9 = u_xlat16_9 * u_xlat16_1 + u_xlat4;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat10_0.y<(-u_xlat10_0.y));
					#else
					    u_xlatb1 = u_xlat10_0.y<(-u_xlat10_0.y);
					#endif
					    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
					    u_xlat9 = u_xlat9 + u_xlat1.x;
					    u_xlat1.x = min(u_xlat10_0.y, u_xlat10_0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb1 = !!(u_xlat1.x<(-u_xlat1.x));
					#else
					    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
					#endif
					    u_xlat4 = max(u_xlat10_0.y, u_xlat10_0.x);
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb4 = !!(u_xlat4>=(-u_xlat4));
					#else
					    u_xlatb4 = u_xlat4>=(-u_xlat4);
					#endif
					    u_xlatb1 = u_xlatb4 && u_xlatb1;
					    u_xlat9 = (u_xlatb1) ? (-u_xlat9) : u_xlat9;
					    u_xlat9 = u_xlat9 * _Value;
					    u_xlat9 = u_xlat9 * 0.636619747;
					    u_xlat9 = floor(u_xlat9);
					    u_xlat9 = u_xlat9 * 3.14159274;
					    u_xlat9 = u_xlat9 / _Value;
					    u_xlat9 = u_xlat9 + 1.57079637;
					    u_xlat1.x = sin(u_xlat9);
					    u_xlat2.x = cos(u_xlat9);
					    u_xlat2.y = u_xlat1.x;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy;
					    u_xlat9 = dot(u_xlat2.xy, u_xlat1.xy);
					    u_xlat16_1 = u_xlat10_0.y + u_xlat10_0.x;
					    u_xlat16_1 = u_xlat10_0.z + u_xlat16_1;
					    u_xlat1.x = u_xlat16_1 * _Value;
					    u_xlat1.x = u_xlat1.x * 0.333333343;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x / _Value;
					    u_xlat9 = u_xlat9 * u_xlat1.x;
					    u_xlat9 = u_xlat9 * 3.14159274;
					    u_xlat9 = cos(u_xlat9);
					    u_xlat9 = (-u_xlat9) * 0.5 + 0.5;
					    u_xlat16_1 = dot(u_xlat10_0.xyz, u_xlat10_0.xyz);
					    u_xlat16_1 = sqrt(u_xlat16_1);
					    u_xlat16_0.xyz = u_xlat10_0.xyz / vec3(u_xlat16_1);
					    SV_Target0.xyz = u_xlat16_0.xyz * vec3(u_xlat9);
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