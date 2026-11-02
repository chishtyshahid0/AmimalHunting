Shader "CameraFilterPack/Blend2Camera_Color" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 42426
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
					uniform sampler2D _MainTex2;
					uniform highp float _Value;
					uniform highp float _Value2;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tex2_1;
					  highp vec4 tex_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, uv_3);
					  tex_2 = tmpvar_4;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex2, uv_3);
					  tex2_1 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = mix (tex_2.xyz, tex2_1.xyz, vec3(_Value2));
					  highp vec3 tmpvar_7;
					  tmpvar_7 = mix (tex_2.xyz, tex2_1.xyz, vec3((1.0 - _Value2)));
					  highp vec4 tmpvar_8;
					  tmpvar_8.xy = tmpvar_6.zy;
					  tmpvar_8.zw = vec2(-1.0, 0.6666667);
					  highp vec4 tmpvar_9;
					  tmpvar_9.xy = tmpvar_6.yz;
					  tmpvar_9.zw = vec2(0.0, -0.3333333);
					  highp vec4 tmpvar_10;
					  tmpvar_10 = mix (tmpvar_8, tmpvar_9, vec4(float((tmpvar_6.y >= tmpvar_6.z))));
					  highp vec4 tmpvar_11;
					  tmpvar_11.xyz = tmpvar_10.xyw;
					  tmpvar_11.w = tmpvar_6.x;
					  highp vec4 tmpvar_12;
					  tmpvar_12.x = tmpvar_6.x;
					  tmpvar_12.yzw = tmpvar_10.yzx;
					  highp vec4 tmpvar_13;
					  tmpvar_13 = mix (tmpvar_11, tmpvar_12, vec4(float((tmpvar_6.x >= tmpvar_10.x))));
					  highp float tmpvar_14;
					  tmpvar_14 = (tmpvar_13.x - min (tmpvar_13.w, tmpvar_13.y));
					  highp vec3 tmpvar_15;
					  tmpvar_15.x = abs((tmpvar_13.z + (
					    (tmpvar_13.w - tmpvar_13.y)
					   / 
					    ((6.0 * tmpvar_14) + 1e-10)
					  )));
					  tmpvar_15.y = (tmpvar_14 / (tmpvar_13.x + 1e-10));
					  tmpvar_15.z = tmpvar_13.x;
					  highp vec4 tmpvar_16;
					  tmpvar_16.xy = tmpvar_7.zy;
					  tmpvar_16.zw = vec2(-1.0, 0.6666667);
					  highp vec4 tmpvar_17;
					  tmpvar_17.xy = tmpvar_7.yz;
					  tmpvar_17.zw = vec2(0.0, -0.3333333);
					  highp vec4 tmpvar_18;
					  tmpvar_18 = mix (tmpvar_16, tmpvar_17, vec4(float((tmpvar_7.y >= tmpvar_7.z))));
					  highp vec4 tmpvar_19;
					  tmpvar_19.xyz = tmpvar_18.xyw;
					  tmpvar_19.w = tmpvar_7.x;
					  highp vec4 tmpvar_20;
					  tmpvar_20.x = tmpvar_7.x;
					  tmpvar_20.yzw = tmpvar_18.yzx;
					  highp vec4 tmpvar_21;
					  tmpvar_21.w = 1.0;
					  tmpvar_21.xyz = mix (tmpvar_6, (mix (tmpvar_19, tmpvar_20, vec4(
					    float((tmpvar_7.x >= tmpvar_18.x))
					  )).x * mix (vec3(1.0, 1.0, 1.0), 
					    clamp ((abs((
					      (fract((tmpvar_15.xxx + vec3(1.0, 0.6666667, 0.3333333))) * 6.0)
					     - vec3(3.0, 3.0, 3.0))) - vec3(1.0, 1.0, 1.0)), vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0))
					  , tmpvar_15.yyy)), vec3(_Value));
					  gl_FragData[0] = tmpvar_21;
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
					uniform sampler2D _MainTex2;
					uniform highp float _Value;
					uniform highp float _Value2;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tex2_1;
					  highp vec4 tex_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, uv_3);
					  tex_2 = tmpvar_4;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex2, uv_3);
					  tex2_1 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = mix (tex_2.xyz, tex2_1.xyz, vec3(_Value2));
					  highp vec3 tmpvar_7;
					  tmpvar_7 = mix (tex_2.xyz, tex2_1.xyz, vec3((1.0 - _Value2)));
					  highp vec4 tmpvar_8;
					  tmpvar_8.xy = tmpvar_6.zy;
					  tmpvar_8.zw = vec2(-1.0, 0.6666667);
					  highp vec4 tmpvar_9;
					  tmpvar_9.xy = tmpvar_6.yz;
					  tmpvar_9.zw = vec2(0.0, -0.3333333);
					  highp vec4 tmpvar_10;
					  tmpvar_10 = mix (tmpvar_8, tmpvar_9, vec4(float((tmpvar_6.y >= tmpvar_6.z))));
					  highp vec4 tmpvar_11;
					  tmpvar_11.xyz = tmpvar_10.xyw;
					  tmpvar_11.w = tmpvar_6.x;
					  highp vec4 tmpvar_12;
					  tmpvar_12.x = tmpvar_6.x;
					  tmpvar_12.yzw = tmpvar_10.yzx;
					  highp vec4 tmpvar_13;
					  tmpvar_13 = mix (tmpvar_11, tmpvar_12, vec4(float((tmpvar_6.x >= tmpvar_10.x))));
					  highp float tmpvar_14;
					  tmpvar_14 = (tmpvar_13.x - min (tmpvar_13.w, tmpvar_13.y));
					  highp vec3 tmpvar_15;
					  tmpvar_15.x = abs((tmpvar_13.z + (
					    (tmpvar_13.w - tmpvar_13.y)
					   / 
					    ((6.0 * tmpvar_14) + 1e-10)
					  )));
					  tmpvar_15.y = (tmpvar_14 / (tmpvar_13.x + 1e-10));
					  tmpvar_15.z = tmpvar_13.x;
					  highp vec4 tmpvar_16;
					  tmpvar_16.xy = tmpvar_7.zy;
					  tmpvar_16.zw = vec2(-1.0, 0.6666667);
					  highp vec4 tmpvar_17;
					  tmpvar_17.xy = tmpvar_7.yz;
					  tmpvar_17.zw = vec2(0.0, -0.3333333);
					  highp vec4 tmpvar_18;
					  tmpvar_18 = mix (tmpvar_16, tmpvar_17, vec4(float((tmpvar_7.y >= tmpvar_7.z))));
					  highp vec4 tmpvar_19;
					  tmpvar_19.xyz = tmpvar_18.xyw;
					  tmpvar_19.w = tmpvar_7.x;
					  highp vec4 tmpvar_20;
					  tmpvar_20.x = tmpvar_7.x;
					  tmpvar_20.yzw = tmpvar_18.yzx;
					  highp vec4 tmpvar_21;
					  tmpvar_21.w = 1.0;
					  tmpvar_21.xyz = mix (tmpvar_6, (mix (tmpvar_19, tmpvar_20, vec4(
					    float((tmpvar_7.x >= tmpvar_18.x))
					  )).x * mix (vec3(1.0, 1.0, 1.0), 
					    clamp ((abs((
					      (fract((tmpvar_15.xxx + vec3(1.0, 0.6666667, 0.3333333))) * 6.0)
					     - vec3(3.0, 3.0, 3.0))) - vec3(1.0, 1.0, 1.0)), vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0))
					  , tmpvar_15.yyy)), vec3(_Value));
					  gl_FragData[0] = tmpvar_21;
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
					uniform sampler2D _MainTex2;
					uniform highp float _Value;
					uniform highp float _Value2;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tex2_1;
					  highp vec4 tex_2;
					  highp vec2 uv_3;
					  uv_3 = xlv_TEXCOORD0;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, uv_3);
					  tex_2 = tmpvar_4;
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex2, uv_3);
					  tex2_1 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = mix (tex_2.xyz, tex2_1.xyz, vec3(_Value2));
					  highp vec3 tmpvar_7;
					  tmpvar_7 = mix (tex_2.xyz, tex2_1.xyz, vec3((1.0 - _Value2)));
					  highp vec4 tmpvar_8;
					  tmpvar_8.xy = tmpvar_6.zy;
					  tmpvar_8.zw = vec2(-1.0, 0.6666667);
					  highp vec4 tmpvar_9;
					  tmpvar_9.xy = tmpvar_6.yz;
					  tmpvar_9.zw = vec2(0.0, -0.3333333);
					  highp vec4 tmpvar_10;
					  tmpvar_10 = mix (tmpvar_8, tmpvar_9, vec4(float((tmpvar_6.y >= tmpvar_6.z))));
					  highp vec4 tmpvar_11;
					  tmpvar_11.xyz = tmpvar_10.xyw;
					  tmpvar_11.w = tmpvar_6.x;
					  highp vec4 tmpvar_12;
					  tmpvar_12.x = tmpvar_6.x;
					  tmpvar_12.yzw = tmpvar_10.yzx;
					  highp vec4 tmpvar_13;
					  tmpvar_13 = mix (tmpvar_11, tmpvar_12, vec4(float((tmpvar_6.x >= tmpvar_10.x))));
					  highp float tmpvar_14;
					  tmpvar_14 = (tmpvar_13.x - min (tmpvar_13.w, tmpvar_13.y));
					  highp vec3 tmpvar_15;
					  tmpvar_15.x = abs((tmpvar_13.z + (
					    (tmpvar_13.w - tmpvar_13.y)
					   / 
					    ((6.0 * tmpvar_14) + 1e-10)
					  )));
					  tmpvar_15.y = (tmpvar_14 / (tmpvar_13.x + 1e-10));
					  tmpvar_15.z = tmpvar_13.x;
					  highp vec4 tmpvar_16;
					  tmpvar_16.xy = tmpvar_7.zy;
					  tmpvar_16.zw = vec2(-1.0, 0.6666667);
					  highp vec4 tmpvar_17;
					  tmpvar_17.xy = tmpvar_7.yz;
					  tmpvar_17.zw = vec2(0.0, -0.3333333);
					  highp vec4 tmpvar_18;
					  tmpvar_18 = mix (tmpvar_16, tmpvar_17, vec4(float((tmpvar_7.y >= tmpvar_7.z))));
					  highp vec4 tmpvar_19;
					  tmpvar_19.xyz = tmpvar_18.xyw;
					  tmpvar_19.w = tmpvar_7.x;
					  highp vec4 tmpvar_20;
					  tmpvar_20.x = tmpvar_7.x;
					  tmpvar_20.yzw = tmpvar_18.yzx;
					  highp vec4 tmpvar_21;
					  tmpvar_21.w = 1.0;
					  tmpvar_21.xyz = mix (tmpvar_6, (mix (tmpvar_19, tmpvar_20, vec4(
					    float((tmpvar_7.x >= tmpvar_18.x))
					  )).x * mix (vec3(1.0, 1.0, 1.0), 
					    clamp ((abs((
					      (fract((tmpvar_15.xxx + vec3(1.0, 0.6666667, 0.3333333))) * 6.0)
					     - vec3(3.0, 3.0, 3.0))) - vec3(1.0, 1.0, 1.0)), vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0))
					  , tmpvar_15.yyy)), vec3(_Value));
					  gl_FragData[0] = tmpvar_21;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MainTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat17;
					bool u_xlatb17;
					void main()
					{
					    u_xlat0.z = float(-1.0);
					    u_xlat0.w = float(0.666666687);
					    u_xlat1.z = float(1.0);
					    u_xlat1.w = float(-1.0);
					    u_xlat10_2.xyz = texture(_MainTex2, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz + (-u_xlat10_3.xyz);
					    u_xlat4.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat16_2.xyz + u_xlat10_3.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb17 = !!(u_xlat4.y>=u_xlat4.z);
					#else
					    u_xlatb17 = u_xlat4.y>=u_xlat4.z;
					#endif
					    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
					    u_xlat0.xy = u_xlat4.zy;
					    u_xlat1.xy = vec2((-u_xlat0.x) + u_xlat4.y, (-u_xlat0.y) + u_xlat4.z);
					    u_xlat0 = vec4(u_xlat17) * u_xlat1.xywz + u_xlat0.xywz;
					    u_xlat1.z = u_xlat0.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb17 = !!(u_xlat4.x>=u_xlat0.x);
					#else
					    u_xlatb17 = u_xlat4.x>=u_xlat0.x;
					#endif
					    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
					    u_xlat0.w = u_xlat4.x;
					    u_xlat1.xyw = u_xlat0.wyx;
					    u_xlat1 = (-u_xlat0) + u_xlat1;
					    u_xlat0 = vec4(u_xlat17) * u_xlat1 + u_xlat0;
					    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
					    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 6.0 + 1.00000001e-010;
					    u_xlat5.x = (-u_xlat0.y) + u_xlat0.w;
					    u_xlat5.x = u_xlat5.x / u_xlat6;
					    u_xlat5.x = u_xlat5.x + u_xlat0.z;
					    u_xlat0.x = u_xlat0.x + 1.00000001e-010;
					    u_xlat0.x = u_xlat1.x / u_xlat0.x;
					    u_xlat5.xyz = abs(u_xlat5.xxx) + vec3(1.0, 0.666666687, 0.333333343);
					    u_xlat5.xyz = fract(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
					    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
					#else
					    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
					#endif
					    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat15 = (-_Value2) + 1.0;
					    u_xlat1.xyz = vec3(u_xlat15) * u_xlat16_2.xyz + u_xlat10_3.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(u_xlat1.y>=u_xlat1.z);
					#else
					    u_xlatb15 = u_xlat1.y>=u_xlat1.z;
					#endif
					    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
					    u_xlat6 = (-u_xlat1.z) + u_xlat1.y;
					    u_xlat15 = u_xlat15 * u_xlat6 + u_xlat1.z;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(u_xlat1.x>=u_xlat15);
					#else
					    u_xlatb6 = u_xlat1.x>=u_xlat15;
					#endif
					    u_xlat1.x = (-u_xlat15) + u_xlat1.x;
					    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
					    u_xlat15 = u_xlat6 * u_xlat1.x + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + (-u_xlat4.xyz);
					    SV_Target0.xyz = vec3(vec3(_Value, _Value, _Value)) * u_xlat0.xyz + u_xlat4.xyz;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MainTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat17;
					bool u_xlatb17;
					void main()
					{
					    u_xlat0.z = float(-1.0);
					    u_xlat0.w = float(0.666666687);
					    u_xlat1.z = float(1.0);
					    u_xlat1.w = float(-1.0);
					    u_xlat10_2.xyz = texture(_MainTex2, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz + (-u_xlat10_3.xyz);
					    u_xlat4.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat16_2.xyz + u_xlat10_3.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb17 = !!(u_xlat4.y>=u_xlat4.z);
					#else
					    u_xlatb17 = u_xlat4.y>=u_xlat4.z;
					#endif
					    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
					    u_xlat0.xy = u_xlat4.zy;
					    u_xlat1.xy = vec2((-u_xlat0.x) + u_xlat4.y, (-u_xlat0.y) + u_xlat4.z);
					    u_xlat0 = vec4(u_xlat17) * u_xlat1.xywz + u_xlat0.xywz;
					    u_xlat1.z = u_xlat0.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb17 = !!(u_xlat4.x>=u_xlat0.x);
					#else
					    u_xlatb17 = u_xlat4.x>=u_xlat0.x;
					#endif
					    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
					    u_xlat0.w = u_xlat4.x;
					    u_xlat1.xyw = u_xlat0.wyx;
					    u_xlat1 = (-u_xlat0) + u_xlat1;
					    u_xlat0 = vec4(u_xlat17) * u_xlat1 + u_xlat0;
					    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
					    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 6.0 + 1.00000001e-010;
					    u_xlat5.x = (-u_xlat0.y) + u_xlat0.w;
					    u_xlat5.x = u_xlat5.x / u_xlat6;
					    u_xlat5.x = u_xlat5.x + u_xlat0.z;
					    u_xlat0.x = u_xlat0.x + 1.00000001e-010;
					    u_xlat0.x = u_xlat1.x / u_xlat0.x;
					    u_xlat5.xyz = abs(u_xlat5.xxx) + vec3(1.0, 0.666666687, 0.333333343);
					    u_xlat5.xyz = fract(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
					    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
					#else
					    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
					#endif
					    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat15 = (-_Value2) + 1.0;
					    u_xlat1.xyz = vec3(u_xlat15) * u_xlat16_2.xyz + u_xlat10_3.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(u_xlat1.y>=u_xlat1.z);
					#else
					    u_xlatb15 = u_xlat1.y>=u_xlat1.z;
					#endif
					    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
					    u_xlat6 = (-u_xlat1.z) + u_xlat1.y;
					    u_xlat15 = u_xlat15 * u_xlat6 + u_xlat1.z;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(u_xlat1.x>=u_xlat15);
					#else
					    u_xlatb6 = u_xlat1.x>=u_xlat15;
					#endif
					    u_xlat1.x = (-u_xlat15) + u_xlat1.x;
					    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
					    u_xlat15 = u_xlat6 * u_xlat1.x + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + (-u_xlat4.xyz);
					    SV_Target0.xyz = vec3(vec3(_Value, _Value, _Value)) * u_xlat0.xyz + u_xlat4.xyz;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MainTex2;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat17;
					bool u_xlatb17;
					void main()
					{
					    u_xlat0.z = float(-1.0);
					    u_xlat0.w = float(0.666666687);
					    u_xlat1.z = float(1.0);
					    u_xlat1.w = float(-1.0);
					    u_xlat10_2.xyz = texture(_MainTex2, vs_TEXCOORD0.xy).xyz;
					    u_xlat10_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz + (-u_xlat10_3.xyz);
					    u_xlat4.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat16_2.xyz + u_xlat10_3.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb17 = !!(u_xlat4.y>=u_xlat4.z);
					#else
					    u_xlatb17 = u_xlat4.y>=u_xlat4.z;
					#endif
					    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
					    u_xlat0.xy = u_xlat4.zy;
					    u_xlat1.xy = vec2((-u_xlat0.x) + u_xlat4.y, (-u_xlat0.y) + u_xlat4.z);
					    u_xlat0 = vec4(u_xlat17) * u_xlat1.xywz + u_xlat0.xywz;
					    u_xlat1.z = u_xlat0.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb17 = !!(u_xlat4.x>=u_xlat0.x);
					#else
					    u_xlatb17 = u_xlat4.x>=u_xlat0.x;
					#endif
					    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
					    u_xlat0.w = u_xlat4.x;
					    u_xlat1.xyw = u_xlat0.wyx;
					    u_xlat1 = (-u_xlat0) + u_xlat1;
					    u_xlat0 = vec4(u_xlat17) * u_xlat1 + u_xlat0;
					    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
					    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
					    u_xlat6 = u_xlat1.x * 6.0 + 1.00000001e-010;
					    u_xlat5.x = (-u_xlat0.y) + u_xlat0.w;
					    u_xlat5.x = u_xlat5.x / u_xlat6;
					    u_xlat5.x = u_xlat5.x + u_xlat0.z;
					    u_xlat0.x = u_xlat0.x + 1.00000001e-010;
					    u_xlat0.x = u_xlat1.x / u_xlat0.x;
					    u_xlat5.xyz = abs(u_xlat5.xxx) + vec3(1.0, 0.666666687, 0.333333343);
					    u_xlat5.xyz = fract(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
					    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
					#else
					    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
					#endif
					    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat15 = (-_Value2) + 1.0;
					    u_xlat1.xyz = vec3(u_xlat15) * u_xlat16_2.xyz + u_xlat10_3.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb15 = !!(u_xlat1.y>=u_xlat1.z);
					#else
					    u_xlatb15 = u_xlat1.y>=u_xlat1.z;
					#endif
					    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
					    u_xlat6 = (-u_xlat1.z) + u_xlat1.y;
					    u_xlat15 = u_xlat15 * u_xlat6 + u_xlat1.z;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb6 = !!(u_xlat1.x>=u_xlat15);
					#else
					    u_xlatb6 = u_xlat1.x>=u_xlat15;
					#endif
					    u_xlat1.x = (-u_xlat15) + u_xlat1.x;
					    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
					    u_xlat15 = u_xlat6 * u_xlat1.x + u_xlat15;
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + (-u_xlat4.xyz);
					    SV_Target0.xyz = vec3(vec3(_Value, _Value, _Value)) * u_xlat0.xyz + u_xlat4.xyz;
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