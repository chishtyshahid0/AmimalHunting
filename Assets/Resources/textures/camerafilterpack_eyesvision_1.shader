Shader "CameraFilterPack/EyesVision_1" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 58712
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
					uniform highp float _TimeX;
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec3 col_2;
					  highp vec3 oldfilm_3;
					  highp vec2 suv_4;
					  highp float t_5;
					  highp vec2 uv_6;
					  uv_6 = xlv_TEXCOORD0;
					  highp float tmpvar_7;
					  tmpvar_7 = float(int((_TimeX * _Value3)));
					  t_5 = (tmpvar_7 + tmpvar_7);
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = (fract((
					    sin(dot (vec2(t_5), vec2(12.9898, 78.233)))
					   * 43758.55)) * -6.0);
					  tmpvar_8.y = (fract((
					    sin(dot (vec2((t_5 + 23.0)), vec2(12.9898, 78.233)))
					   * 43758.55)) * 4.0);
					  suv_4 = ((uv_6 + (0.004 * tmpvar_8)) * 0.8);
					  suv_4 = (suv_4 + vec2(0.075, 0.05));
					  highp float time_9;
					  time_9 = (_Value2 * _TimeX);
					  highp float tmpvar_10;
					  tmpvar_10 = (1.0 + (0.5 * sin(
					    (time_9 + (uv_6.x * _Value))
					  )));
					  highp float tmpvar_11;
					  tmpvar_11 = (1.0 + (0.5 * cos(
					    (time_9 + (uv_6.y * _Value))
					  )));
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = (tmpvar_10 + sin(tmpvar_11));
					  tmpvar_12.y = (tmpvar_11 + cos(tmpvar_10));
					  suv_4 = (suv_4 + (0.02 * tmpvar_12));
					  lowp vec3 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex2, suv_4).xyz;
					  oldfilm_3 = tmpvar_13;
					  uv_6 = xlv_TEXCOORD0;
					  uv_6 = (uv_6 + (oldfilm_3.xy / 8.0));
					  lowp vec3 tmpvar_14;
					  tmpvar_14 = texture2D (_MainTex, uv_6).xyz;
					  col_2 = tmpvar_14;
					  col_2.xy = (col_2.xy + vec2(0.08, 0.08));
					  col_2.z = (col_2.z - 0.03);
					  highp float tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = (_TimeX / 2.0);
					  tmpvar_15 = (t_5 - ((
					    sin(tmpvar_16)
					   * 
					    sin(tmpvar_16)
					  ) * t_5));
					  highp vec2 x_17;
					  x_17 = (vec2(0.5, 0.5) - uv_6.y);
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (((
					    sqrt(dot (x_17, x_17))
					   - tmpvar_15) / (
					    (tmpvar_15 - 0.6)
					   - tmpvar_15)), 0.0, 1.0);
					  highp vec3 tmpvar_19;
					  tmpvar_19 = ((oldfilm_3 + col_2) * (vec3(1.0, 1.0, 1.0) - vec3((
					    (1.0 - (tmpvar_18 * (tmpvar_18 * (3.0 - 
					      (2.0 * tmpvar_18)
					    ))))
					   * _Value4))));
					  col_2 = tmpvar_19;
					  highp vec4 tmpvar_20;
					  tmpvar_20.w = 1.0;
					  tmpvar_20.xyz = tmpvar_19;
					  tmpvar_1 = tmpvar_20;
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
					uniform sampler2D _MainTex2;
					uniform highp float _TimeX;
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec3 col_2;
					  highp vec3 oldfilm_3;
					  highp vec2 suv_4;
					  highp float t_5;
					  highp vec2 uv_6;
					  uv_6 = xlv_TEXCOORD0;
					  highp float tmpvar_7;
					  tmpvar_7 = float(int((_TimeX * _Value3)));
					  t_5 = (tmpvar_7 + tmpvar_7);
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = (fract((
					    sin(dot (vec2(t_5), vec2(12.9898, 78.233)))
					   * 43758.55)) * -6.0);
					  tmpvar_8.y = (fract((
					    sin(dot (vec2((t_5 + 23.0)), vec2(12.9898, 78.233)))
					   * 43758.55)) * 4.0);
					  suv_4 = ((uv_6 + (0.004 * tmpvar_8)) * 0.8);
					  suv_4 = (suv_4 + vec2(0.075, 0.05));
					  highp float time_9;
					  time_9 = (_Value2 * _TimeX);
					  highp float tmpvar_10;
					  tmpvar_10 = (1.0 + (0.5 * sin(
					    (time_9 + (uv_6.x * _Value))
					  )));
					  highp float tmpvar_11;
					  tmpvar_11 = (1.0 + (0.5 * cos(
					    (time_9 + (uv_6.y * _Value))
					  )));
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = (tmpvar_10 + sin(tmpvar_11));
					  tmpvar_12.y = (tmpvar_11 + cos(tmpvar_10));
					  suv_4 = (suv_4 + (0.02 * tmpvar_12));
					  lowp vec3 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex2, suv_4).xyz;
					  oldfilm_3 = tmpvar_13;
					  uv_6 = xlv_TEXCOORD0;
					  uv_6 = (uv_6 + (oldfilm_3.xy / 8.0));
					  lowp vec3 tmpvar_14;
					  tmpvar_14 = texture2D (_MainTex, uv_6).xyz;
					  col_2 = tmpvar_14;
					  col_2.xy = (col_2.xy + vec2(0.08, 0.08));
					  col_2.z = (col_2.z - 0.03);
					  highp float tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = (_TimeX / 2.0);
					  tmpvar_15 = (t_5 - ((
					    sin(tmpvar_16)
					   * 
					    sin(tmpvar_16)
					  ) * t_5));
					  highp vec2 x_17;
					  x_17 = (vec2(0.5, 0.5) - uv_6.y);
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (((
					    sqrt(dot (x_17, x_17))
					   - tmpvar_15) / (
					    (tmpvar_15 - 0.6)
					   - tmpvar_15)), 0.0, 1.0);
					  highp vec3 tmpvar_19;
					  tmpvar_19 = ((oldfilm_3 + col_2) * (vec3(1.0, 1.0, 1.0) - vec3((
					    (1.0 - (tmpvar_18 * (tmpvar_18 * (3.0 - 
					      (2.0 * tmpvar_18)
					    ))))
					   * _Value4))));
					  col_2 = tmpvar_19;
					  highp vec4 tmpvar_20;
					  tmpvar_20.w = 1.0;
					  tmpvar_20.xyz = tmpvar_19;
					  tmpvar_1 = tmpvar_20;
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
					uniform sampler2D _MainTex2;
					uniform highp float _TimeX;
					uniform highp float _Value;
					uniform highp float _Value2;
					uniform highp float _Value3;
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  highp vec3 col_2;
					  highp vec3 oldfilm_3;
					  highp vec2 suv_4;
					  highp float t_5;
					  highp vec2 uv_6;
					  uv_6 = xlv_TEXCOORD0;
					  highp float tmpvar_7;
					  tmpvar_7 = float(int((_TimeX * _Value3)));
					  t_5 = (tmpvar_7 + tmpvar_7);
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = (fract((
					    sin(dot (vec2(t_5), vec2(12.9898, 78.233)))
					   * 43758.55)) * -6.0);
					  tmpvar_8.y = (fract((
					    sin(dot (vec2((t_5 + 23.0)), vec2(12.9898, 78.233)))
					   * 43758.55)) * 4.0);
					  suv_4 = ((uv_6 + (0.004 * tmpvar_8)) * 0.8);
					  suv_4 = (suv_4 + vec2(0.075, 0.05));
					  highp float time_9;
					  time_9 = (_Value2 * _TimeX);
					  highp float tmpvar_10;
					  tmpvar_10 = (1.0 + (0.5 * sin(
					    (time_9 + (uv_6.x * _Value))
					  )));
					  highp float tmpvar_11;
					  tmpvar_11 = (1.0 + (0.5 * cos(
					    (time_9 + (uv_6.y * _Value))
					  )));
					  highp vec2 tmpvar_12;
					  tmpvar_12.x = (tmpvar_10 + sin(tmpvar_11));
					  tmpvar_12.y = (tmpvar_11 + cos(tmpvar_10));
					  suv_4 = (suv_4 + (0.02 * tmpvar_12));
					  lowp vec3 tmpvar_13;
					  tmpvar_13 = texture2D (_MainTex2, suv_4).xyz;
					  oldfilm_3 = tmpvar_13;
					  uv_6 = xlv_TEXCOORD0;
					  uv_6 = (uv_6 + (oldfilm_3.xy / 8.0));
					  lowp vec3 tmpvar_14;
					  tmpvar_14 = texture2D (_MainTex, uv_6).xyz;
					  col_2 = tmpvar_14;
					  col_2.xy = (col_2.xy + vec2(0.08, 0.08));
					  col_2.z = (col_2.z - 0.03);
					  highp float tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = (_TimeX / 2.0);
					  tmpvar_15 = (t_5 - ((
					    sin(tmpvar_16)
					   * 
					    sin(tmpvar_16)
					  ) * t_5));
					  highp vec2 x_17;
					  x_17 = (vec2(0.5, 0.5) - uv_6.y);
					  highp float tmpvar_18;
					  tmpvar_18 = clamp (((
					    sqrt(dot (x_17, x_17))
					   - tmpvar_15) / (
					    (tmpvar_15 - 0.6)
					   - tmpvar_15)), 0.0, 1.0);
					  highp vec3 tmpvar_19;
					  tmpvar_19 = ((oldfilm_3 + col_2) * (vec3(1.0, 1.0, 1.0) - vec3((
					    (1.0 - (tmpvar_18 * (tmpvar_18 * (3.0 - 
					      (2.0 * tmpvar_18)
					    ))))
					   * _Value4))));
					  col_2 = tmpvar_19;
					  highp vec4 tmpvar_20;
					  tmpvar_20.w = 1.0;
					  tmpvar_20.xyz = tmpvar_19;
					  tmpvar_1 = tmpvar_20;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform lowp sampler2D _MainTex2;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					mediump vec3 u_xlat16_3;
					lowp vec3 u_xlat10_3;
					float u_xlat4;
					float u_xlat7;
					float u_xlat9;
					void main()
					{
					    u_xlat0.x = _TimeX * _Value3;
					    u_xlat0.x = trunc(u_xlat0.x);
					    u_xlat3.x = u_xlat0.x * 2.0 + 23.0;
					    u_xlat0.x = u_xlat0.x + u_xlat0.x;
					    u_xlat3.x = dot(u_xlat3.xx, vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat1.y = fract(u_xlat3.x);
					    u_xlat3.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat3.x);
					    u_xlat3.xy = u_xlat1.xy * vec2(-0.0240000002, 0.0160000008) + vs_TEXCOORD0.xy;
					    u_xlat3.xy = u_xlat3.xy * vec2(0.800000012, 0.800000012) + vec2(0.075000003, 0.0500000007);
					    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(vec2(_Value, _Value));
					    u_xlat1.xy = vec2(vec2(_Value2, _Value2)) * vec2(_TimeX) + u_xlat1.xy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 0.5 + 1.0;
					    u_xlat9 = u_xlat9 * 0.5 + 1.0;
					    u_xlat4 = sin(u_xlat9);
					    u_xlat2.x = u_xlat4 + u_xlat1.x;
					    u_xlat1.x = cos(u_xlat1.x);
					    u_xlat2.y = u_xlat9 + u_xlat1.x;
					    u_xlat3.xy = u_xlat2.xy * vec2(0.0199999996, 0.0199999996) + u_xlat3.xy;
					    u_xlat10_3.xyz = texture(_MainTex2, u_xlat3.xy).xyz;
					    u_xlat1.xy = u_xlat10_3.xy * vec2(0.125, 0.125) + vs_TEXCOORD0.xy;
					    u_xlat7 = (-u_xlat1.y) + 0.5;
					    u_xlat10_1.xyw = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_3.xyz + u_xlat10_1.xyw;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + vec3(0.0799999982, 0.0799999982, -0.0299999993);
					    u_xlat1.x = dot(vec2(u_xlat7), vec2(u_xlat7));
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat4 = _TimeX * 0.5;
					    u_xlat4 = sin(u_xlat4);
					    u_xlat4 = u_xlat4 * u_xlat4;
					    u_xlat0.x = (-u_xlat4) * u_xlat0.x + u_xlat0.x;
					    u_xlat0.x = (-u_xlat0.x) + u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * -1.66666663;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat1.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * _Value4;
					    u_xlat0.xyz = u_xlat0.xxx * (-u_xlat16_3.xyz) + u_xlat16_3.xyz;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform lowp sampler2D _MainTex2;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					mediump vec3 u_xlat16_3;
					lowp vec3 u_xlat10_3;
					float u_xlat4;
					float u_xlat7;
					float u_xlat9;
					void main()
					{
					    u_xlat0.x = _TimeX * _Value3;
					    u_xlat0.x = trunc(u_xlat0.x);
					    u_xlat3.x = u_xlat0.x * 2.0 + 23.0;
					    u_xlat0.x = u_xlat0.x + u_xlat0.x;
					    u_xlat3.x = dot(u_xlat3.xx, vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat1.y = fract(u_xlat3.x);
					    u_xlat3.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat3.x);
					    u_xlat3.xy = u_xlat1.xy * vec2(-0.0240000002, 0.0160000008) + vs_TEXCOORD0.xy;
					    u_xlat3.xy = u_xlat3.xy * vec2(0.800000012, 0.800000012) + vec2(0.075000003, 0.0500000007);
					    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(vec2(_Value, _Value));
					    u_xlat1.xy = vec2(vec2(_Value2, _Value2)) * vec2(_TimeX) + u_xlat1.xy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 0.5 + 1.0;
					    u_xlat9 = u_xlat9 * 0.5 + 1.0;
					    u_xlat4 = sin(u_xlat9);
					    u_xlat2.x = u_xlat4 + u_xlat1.x;
					    u_xlat1.x = cos(u_xlat1.x);
					    u_xlat2.y = u_xlat9 + u_xlat1.x;
					    u_xlat3.xy = u_xlat2.xy * vec2(0.0199999996, 0.0199999996) + u_xlat3.xy;
					    u_xlat10_3.xyz = texture(_MainTex2, u_xlat3.xy).xyz;
					    u_xlat1.xy = u_xlat10_3.xy * vec2(0.125, 0.125) + vs_TEXCOORD0.xy;
					    u_xlat7 = (-u_xlat1.y) + 0.5;
					    u_xlat10_1.xyw = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_3.xyz + u_xlat10_1.xyw;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + vec3(0.0799999982, 0.0799999982, -0.0299999993);
					    u_xlat1.x = dot(vec2(u_xlat7), vec2(u_xlat7));
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat4 = _TimeX * 0.5;
					    u_xlat4 = sin(u_xlat4);
					    u_xlat4 = u_xlat4 * u_xlat4;
					    u_xlat0.x = (-u_xlat4) * u_xlat0.x + u_xlat0.x;
					    u_xlat0.x = (-u_xlat0.x) + u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * -1.66666663;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat1.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * _Value4;
					    u_xlat0.xyz = u_xlat0.xxx * (-u_xlat16_3.xyz) + u_xlat16_3.xyz;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform lowp sampler2D _MainTex2;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec3 u_xlat0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					mediump vec3 u_xlat16_3;
					lowp vec3 u_xlat10_3;
					float u_xlat4;
					float u_xlat7;
					float u_xlat9;
					void main()
					{
					    u_xlat0.x = _TimeX * _Value3;
					    u_xlat0.x = trunc(u_xlat0.x);
					    u_xlat3.x = u_xlat0.x * 2.0 + 23.0;
					    u_xlat0.x = u_xlat0.x + u_xlat0.x;
					    u_xlat3.x = dot(u_xlat3.xx, vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat1.y = fract(u_xlat3.x);
					    u_xlat3.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat3.x);
					    u_xlat3.xy = u_xlat1.xy * vec2(-0.0240000002, 0.0160000008) + vs_TEXCOORD0.xy;
					    u_xlat3.xy = u_xlat3.xy * vec2(0.800000012, 0.800000012) + vec2(0.075000003, 0.0500000007);
					    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(vec2(_Value, _Value));
					    u_xlat1.xy = vec2(vec2(_Value2, _Value2)) * vec2(_TimeX) + u_xlat1.xy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 0.5 + 1.0;
					    u_xlat9 = u_xlat9 * 0.5 + 1.0;
					    u_xlat4 = sin(u_xlat9);
					    u_xlat2.x = u_xlat4 + u_xlat1.x;
					    u_xlat1.x = cos(u_xlat1.x);
					    u_xlat2.y = u_xlat9 + u_xlat1.x;
					    u_xlat3.xy = u_xlat2.xy * vec2(0.0199999996, 0.0199999996) + u_xlat3.xy;
					    u_xlat10_3.xyz = texture(_MainTex2, u_xlat3.xy).xyz;
					    u_xlat1.xy = u_xlat10_3.xy * vec2(0.125, 0.125) + vs_TEXCOORD0.xy;
					    u_xlat7 = (-u_xlat1.y) + 0.5;
					    u_xlat10_1.xyw = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_3.xyz + u_xlat10_1.xyw;
					    u_xlat16_3.xyz = u_xlat16_3.xyz + vec3(0.0799999982, 0.0799999982, -0.0299999993);
					    u_xlat1.x = dot(vec2(u_xlat7), vec2(u_xlat7));
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat4 = _TimeX * 0.5;
					    u_xlat4 = sin(u_xlat4);
					    u_xlat4 = u_xlat4 * u_xlat4;
					    u_xlat0.x = (-u_xlat4) * u_xlat0.x + u_xlat0.x;
					    u_xlat0.x = (-u_xlat0.x) + u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * -1.66666663;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat1.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * _Value4;
					    u_xlat0.xyz = u_xlat0.xxx * (-u_xlat16_3.xyz) + u_xlat16_3.xyz;
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