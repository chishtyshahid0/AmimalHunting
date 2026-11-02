Shader "CameraFilterPack/Vision_Plasma" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 26687
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
					uniform highp float _Value3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 uv_1;
					  highp float tmpvar_2;
					  tmpvar_2 = (_TimeX * 0.33);
					  uv_1 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_3;
					  tmpvar_3.y = 0.5;
					  tmpvar_3.x = (0.5 + (0.5 * sin(
					    ((8.792 * uv_1.x) + (2.8 * tmpvar_2))
					  )));
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (uv_1 - tmpvar_3);
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = (1.6 * cos((tmpvar_2 * 2.0)));
					  tmpvar_5.y = sin((tmpvar_2 * 1.7));
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (uv_1 - tmpvar_5);
					  highp vec3 tmpvar_7;
					  tmpvar_7.x = (0.5 * (cos(
					    (sqrt(dot (tmpvar_4, tmpvar_4)) * 5.6)
					  ) + 1.0));
					  tmpvar_7.y = cos(((4.62 * 
					    dot (uv_1, uv_1)
					  ) + tmpvar_2));
					  tmpvar_7.z = cos((sqrt(
					    dot (tmpvar_6, tmpvar_6)
					  ) * 1.3));
					  highp float tmpvar_8;
					  tmpvar_8 = (dot (tmpvar_7, vec3(1.0, 1.0, 1.0)) / _Value3);
					  highp vec2 x_9;
					  x_9 = (vec2(0.5, 0.5) - uv_1);
					  highp float tmpvar_10;
					  tmpvar_10 = clamp (((
					    sqrt(dot (x_9, x_9))
					   - _Value) / (
					    ((_Value - 0.05) - _Value2)
					   - _Value)), 0.0, 1.0);
					  highp vec3 tmpvar_11;
					  tmpvar_11.x = (0.5 * (sin(
					    ((6.28 * tmpvar_8) + (tmpvar_2 * 3.45))
					  ) + 1.0));
					  tmpvar_11.y = (0.5 * (sin(
					    ((6.28 * tmpvar_8) + (tmpvar_2 * 3.15))
					  ) + 1.0));
					  tmpvar_11.z = (0.4 * (sin(
					    ((6.28 * tmpvar_8) + (tmpvar_2 * 1.26))
					  ) + 1.0));
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_MainTex, uv_1);
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 0.0;
					  tmpvar_13.xyz = tmpvar_11;
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 1.0;
					  tmpvar_14.xyz = mix (tmpvar_12, tmpvar_13, vec4((1.0 - (tmpvar_10 * 
					    (tmpvar_10 * (3.0 - (2.0 * tmpvar_10)))
					  )))).xyz;
					  gl_FragData[0] = tmpvar_14;
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
					uniform highp float _Value3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 uv_1;
					  highp float tmpvar_2;
					  tmpvar_2 = (_TimeX * 0.33);
					  uv_1 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_3;
					  tmpvar_3.y = 0.5;
					  tmpvar_3.x = (0.5 + (0.5 * sin(
					    ((8.792 * uv_1.x) + (2.8 * tmpvar_2))
					  )));
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (uv_1 - tmpvar_3);
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = (1.6 * cos((tmpvar_2 * 2.0)));
					  tmpvar_5.y = sin((tmpvar_2 * 1.7));
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (uv_1 - tmpvar_5);
					  highp vec3 tmpvar_7;
					  tmpvar_7.x = (0.5 * (cos(
					    (sqrt(dot (tmpvar_4, tmpvar_4)) * 5.6)
					  ) + 1.0));
					  tmpvar_7.y = cos(((4.62 * 
					    dot (uv_1, uv_1)
					  ) + tmpvar_2));
					  tmpvar_7.z = cos((sqrt(
					    dot (tmpvar_6, tmpvar_6)
					  ) * 1.3));
					  highp float tmpvar_8;
					  tmpvar_8 = (dot (tmpvar_7, vec3(1.0, 1.0, 1.0)) / _Value3);
					  highp vec2 x_9;
					  x_9 = (vec2(0.5, 0.5) - uv_1);
					  highp float tmpvar_10;
					  tmpvar_10 = clamp (((
					    sqrt(dot (x_9, x_9))
					   - _Value) / (
					    ((_Value - 0.05) - _Value2)
					   - _Value)), 0.0, 1.0);
					  highp vec3 tmpvar_11;
					  tmpvar_11.x = (0.5 * (sin(
					    ((6.28 * tmpvar_8) + (tmpvar_2 * 3.45))
					  ) + 1.0));
					  tmpvar_11.y = (0.5 * (sin(
					    ((6.28 * tmpvar_8) + (tmpvar_2 * 3.15))
					  ) + 1.0));
					  tmpvar_11.z = (0.4 * (sin(
					    ((6.28 * tmpvar_8) + (tmpvar_2 * 1.26))
					  ) + 1.0));
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_MainTex, uv_1);
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 0.0;
					  tmpvar_13.xyz = tmpvar_11;
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 1.0;
					  tmpvar_14.xyz = mix (tmpvar_12, tmpvar_13, vec4((1.0 - (tmpvar_10 * 
					    (tmpvar_10 * (3.0 - (2.0 * tmpvar_10)))
					  )))).xyz;
					  gl_FragData[0] = tmpvar_14;
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
					uniform highp float _Value3;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec2 uv_1;
					  highp float tmpvar_2;
					  tmpvar_2 = (_TimeX * 0.33);
					  uv_1 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_3;
					  tmpvar_3.y = 0.5;
					  tmpvar_3.x = (0.5 + (0.5 * sin(
					    ((8.792 * uv_1.x) + (2.8 * tmpvar_2))
					  )));
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (uv_1 - tmpvar_3);
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = (1.6 * cos((tmpvar_2 * 2.0)));
					  tmpvar_5.y = sin((tmpvar_2 * 1.7));
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (uv_1 - tmpvar_5);
					  highp vec3 tmpvar_7;
					  tmpvar_7.x = (0.5 * (cos(
					    (sqrt(dot (tmpvar_4, tmpvar_4)) * 5.6)
					  ) + 1.0));
					  tmpvar_7.y = cos(((4.62 * 
					    dot (uv_1, uv_1)
					  ) + tmpvar_2));
					  tmpvar_7.z = cos((sqrt(
					    dot (tmpvar_6, tmpvar_6)
					  ) * 1.3));
					  highp float tmpvar_8;
					  tmpvar_8 = (dot (tmpvar_7, vec3(1.0, 1.0, 1.0)) / _Value3);
					  highp vec2 x_9;
					  x_9 = (vec2(0.5, 0.5) - uv_1);
					  highp float tmpvar_10;
					  tmpvar_10 = clamp (((
					    sqrt(dot (x_9, x_9))
					   - _Value) / (
					    ((_Value - 0.05) - _Value2)
					   - _Value)), 0.0, 1.0);
					  highp vec3 tmpvar_11;
					  tmpvar_11.x = (0.5 * (sin(
					    ((6.28 * tmpvar_8) + (tmpvar_2 * 3.45))
					  ) + 1.0));
					  tmpvar_11.y = (0.5 * (sin(
					    ((6.28 * tmpvar_8) + (tmpvar_2 * 3.15))
					  ) + 1.0));
					  tmpvar_11.z = (0.4 * (sin(
					    ((6.28 * tmpvar_8) + (tmpvar_2 * 1.26))
					  ) + 1.0));
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = texture2D (_MainTex, uv_1);
					  highp vec4 tmpvar_13;
					  tmpvar_13.w = 0.0;
					  tmpvar_13.xyz = tmpvar_11;
					  highp vec4 tmpvar_14;
					  tmpvar_14.w = 1.0;
					  tmpvar_14.xyz = mix (tmpvar_12, tmpvar_13, vec4((1.0 - (tmpvar_10 * 
					    (tmpvar_10 * (3.0 - (2.0 * tmpvar_10)))
					  )))).xyz;
					  gl_FragData[0] = tmpvar_14;
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
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec2 u_xlat2;
					mediump vec2 u_xlat16_2;
					vec3 u_xlat3;
					mediump float u_xlat16_3;
					vec2 u_xlat6;
					float u_xlat9;
					mediump float u_xlat16_9;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(0.330000013, 0.924000025, 0.660000026, 0.561000049);
					    u_xlat6.x = cos(u_xlat0.z);
					    u_xlat1.x = u_xlat6.x * 1.60000002;
					    u_xlat1.y = sin(u_xlat0.w);
					    u_xlat6.xy = (-u_xlat1.xy) + vs_TEXCOORD0.xy;
					    u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x * 1.29999995;
					    u_xlat1.z = cos(u_xlat6.x);
					    u_xlat3.x = vs_TEXCOORD0.x * 8.79199982 + u_xlat0.y;
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat2.x = u_xlat3.x * 0.5 + 0.5;
					    u_xlat2.y = 0.5;
					    u_xlat3.xy = (-u_xlat2.xy) + vs_TEXCOORD0.xy;
					    u_xlat3.x = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 5.5999999;
					    u_xlat3.x = cos(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x + 1.0;
					    u_xlat1.x = u_xlat3.x * 0.5;
					    u_xlat16_3 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat16_3 * 4.61999989 + u_xlat0.x;
					    u_xlat1.y = cos(u_xlat0.x);
					    u_xlat0.x = dot(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat0.x / _Value3;
					    u_xlat3.xyz = vec3(_TimeX) * vec3(1.13850009, 1.03950012, 0.415800005);
					    u_xlat0.xyz = u_xlat0.xxx * vec3(6.28000021, 6.28000021, 6.28000021) + u_xlat3.xyz;
					    u_xlat0.xyz = sin(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.400000006) + (-u_xlat10_1.xyz);
					    u_xlat16_2.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_9 = dot(u_xlat16_2.xy, u_xlat16_2.xy);
					    u_xlat16_9 = sqrt(u_xlat16_9);
					    u_xlat9 = u_xlat16_9 + (-_Value);
					    u_xlat10 = _Value + -0.0500000007;
					    u_xlat10 = u_xlat10 + (-_Value2);
					    u_xlat10 = u_xlat10 + (-_Value);
					    u_xlat10 = float(1.0) / u_xlat10;
					    u_xlat9 = u_xlat9 * u_xlat10;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
					#else
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					#endif
					    u_xlat10 = u_xlat9 * -2.0 + 3.0;
					    u_xlat9 = u_xlat9 * u_xlat9;
					    u_xlat9 = (-u_xlat10) * u_xlat9 + 1.0;
					    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz + u_xlat10_1.xyz;
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
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec2 u_xlat2;
					mediump vec2 u_xlat16_2;
					vec3 u_xlat3;
					mediump float u_xlat16_3;
					vec2 u_xlat6;
					float u_xlat9;
					mediump float u_xlat16_9;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(0.330000013, 0.924000025, 0.660000026, 0.561000049);
					    u_xlat6.x = cos(u_xlat0.z);
					    u_xlat1.x = u_xlat6.x * 1.60000002;
					    u_xlat1.y = sin(u_xlat0.w);
					    u_xlat6.xy = (-u_xlat1.xy) + vs_TEXCOORD0.xy;
					    u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x * 1.29999995;
					    u_xlat1.z = cos(u_xlat6.x);
					    u_xlat3.x = vs_TEXCOORD0.x * 8.79199982 + u_xlat0.y;
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat2.x = u_xlat3.x * 0.5 + 0.5;
					    u_xlat2.y = 0.5;
					    u_xlat3.xy = (-u_xlat2.xy) + vs_TEXCOORD0.xy;
					    u_xlat3.x = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 5.5999999;
					    u_xlat3.x = cos(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x + 1.0;
					    u_xlat1.x = u_xlat3.x * 0.5;
					    u_xlat16_3 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat16_3 * 4.61999989 + u_xlat0.x;
					    u_xlat1.y = cos(u_xlat0.x);
					    u_xlat0.x = dot(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat0.x / _Value3;
					    u_xlat3.xyz = vec3(_TimeX) * vec3(1.13850009, 1.03950012, 0.415800005);
					    u_xlat0.xyz = u_xlat0.xxx * vec3(6.28000021, 6.28000021, 6.28000021) + u_xlat3.xyz;
					    u_xlat0.xyz = sin(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.400000006) + (-u_xlat10_1.xyz);
					    u_xlat16_2.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_9 = dot(u_xlat16_2.xy, u_xlat16_2.xy);
					    u_xlat16_9 = sqrt(u_xlat16_9);
					    u_xlat9 = u_xlat16_9 + (-_Value);
					    u_xlat10 = _Value + -0.0500000007;
					    u_xlat10 = u_xlat10 + (-_Value2);
					    u_xlat10 = u_xlat10 + (-_Value);
					    u_xlat10 = float(1.0) / u_xlat10;
					    u_xlat9 = u_xlat9 * u_xlat10;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
					#else
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					#endif
					    u_xlat10 = u_xlat9 * -2.0 + 3.0;
					    u_xlat9 = u_xlat9 * u_xlat9;
					    u_xlat9 = (-u_xlat10) * u_xlat9 + 1.0;
					    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz + u_xlat10_1.xyz;
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
					uniform 	float _Value3;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec2 u_xlat2;
					mediump vec2 u_xlat16_2;
					vec3 u_xlat3;
					mediump float u_xlat16_3;
					vec2 u_xlat6;
					float u_xlat9;
					mediump float u_xlat16_9;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(0.330000013, 0.924000025, 0.660000026, 0.561000049);
					    u_xlat6.x = cos(u_xlat0.z);
					    u_xlat1.x = u_xlat6.x * 1.60000002;
					    u_xlat1.y = sin(u_xlat0.w);
					    u_xlat6.xy = (-u_xlat1.xy) + vs_TEXCOORD0.xy;
					    u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x * 1.29999995;
					    u_xlat1.z = cos(u_xlat6.x);
					    u_xlat3.x = vs_TEXCOORD0.x * 8.79199982 + u_xlat0.y;
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat2.x = u_xlat3.x * 0.5 + 0.5;
					    u_xlat2.y = 0.5;
					    u_xlat3.xy = (-u_xlat2.xy) + vs_TEXCOORD0.xy;
					    u_xlat3.x = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 5.5999999;
					    u_xlat3.x = cos(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x + 1.0;
					    u_xlat1.x = u_xlat3.x * 0.5;
					    u_xlat16_3 = dot(vs_TEXCOORD0.xy, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat16_3 * 4.61999989 + u_xlat0.x;
					    u_xlat1.y = cos(u_xlat0.x);
					    u_xlat0.x = dot(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat0.x = u_xlat0.x / _Value3;
					    u_xlat3.xyz = vec3(_TimeX) * vec3(1.13850009, 1.03950012, 0.415800005);
					    u_xlat0.xyz = u_xlat0.xxx * vec3(6.28000021, 6.28000021, 6.28000021) + u_xlat3.xyz;
					    u_xlat0.xyz = sin(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.400000006) + (-u_xlat10_1.xyz);
					    u_xlat16_2.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_9 = dot(u_xlat16_2.xy, u_xlat16_2.xy);
					    u_xlat16_9 = sqrt(u_xlat16_9);
					    u_xlat9 = u_xlat16_9 + (-_Value);
					    u_xlat10 = _Value + -0.0500000007;
					    u_xlat10 = u_xlat10 + (-_Value2);
					    u_xlat10 = u_xlat10 + (-_Value);
					    u_xlat10 = float(1.0) / u_xlat10;
					    u_xlat9 = u_xlat9 * u_xlat10;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
					#else
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					#endif
					    u_xlat10 = u_xlat9 * -2.0 + 3.0;
					    u_xlat9 = u_xlat9 * u_xlat9;
					    u_xlat9 = (-u_xlat10) * u_xlat9 + 1.0;
					    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz + u_xlat10_1.xyz;
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