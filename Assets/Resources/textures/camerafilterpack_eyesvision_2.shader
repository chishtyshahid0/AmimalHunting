Shader "CameraFilterPack/EyesVision_2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 32757
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
					  highp float dist2_2;
					  highp vec3 col_3;
					  highp vec3 oldfilm_4;
					  highp vec2 suv_5;
					  highp float t_6;
					  highp vec2 uv_7;
					  uv_7 = xlv_TEXCOORD0;
					  highp float tmpvar_8;
					  tmpvar_8 = float(int((_TimeX * _Value3)));
					  t_6 = (tmpvar_8 + tmpvar_8);
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = (fract((
					    sin(dot (vec2(t_6), vec2(12.9898, 78.233)))
					   * 43758.55)) * -6.0);
					  tmpvar_9.y = (fract((
					    sin(dot (vec2((t_6 + 23.0)), vec2(12.9898, 78.233)))
					   * 43758.55)) * 4.0);
					  suv_5 = ((uv_7 + (0.004 * tmpvar_9)) * 0.8);
					  suv_5 = (suv_5 + vec2(0.075, 0.05));
					  highp float time_10;
					  time_10 = (_Value2 * _TimeX);
					  highp float tmpvar_11;
					  tmpvar_11 = (1.0 + (0.5 * sin(
					    (time_10 + (uv_7.x * _Value))
					  )));
					  highp float tmpvar_12;
					  tmpvar_12 = (1.0 + (0.5 * cos(
					    (time_10 + (uv_7.y * _Value))
					  )));
					  highp vec2 tmpvar_13;
					  tmpvar_13.x = (tmpvar_11 + sin(tmpvar_12));
					  tmpvar_13.y = (tmpvar_12 + cos(tmpvar_11));
					  suv_5 = (suv_5 + (0.02 * tmpvar_13));
					  lowp vec3 tmpvar_14;
					  tmpvar_14 = texture2D (_MainTex2, suv_5).xyz;
					  oldfilm_4 = tmpvar_14;
					  uv_7 = xlv_TEXCOORD0;
					  uv_7 = (uv_7 + (oldfilm_4.xy / 16.0));
					  lowp vec3 tmpvar_15;
					  tmpvar_15 = texture2D (_MainTex, uv_7).xyz;
					  col_3 = tmpvar_15;
					  highp float tmpvar_16;
					  highp float tmpvar_17;
					  tmpvar_17 = (_TimeX / 2.0);
					  tmpvar_16 = (t_6 - ((
					    sin(tmpvar_17)
					   * 
					    sin(tmpvar_17)
					  ) * t_6));
					  highp vec2 x_18;
					  x_18 = (vec2(0.5, 0.5) - uv_7.y);
					  highp float tmpvar_19;
					  tmpvar_19 = clamp (((
					    sqrt(dot (x_18, x_18))
					   - tmpvar_16) / (
					    (tmpvar_16 - 0.6)
					   - tmpvar_16)), 0.0, 1.0);
					  highp vec2 x_20;
					  x_20 = (vec2(0.6, 0.6) - (suv_5 * 1.2));
					  highp float tmpvar_21;
					  tmpvar_21 = clamp (((
					    sqrt(dot (x_20, x_20))
					   - 0.4) / 0.2), 0.0, 1.0);
					  dist2_2 = ((1.0 - (tmpvar_19 * 
					    (tmpvar_19 * (3.0 - (2.0 * tmpvar_19)))
					  )) + (tmpvar_21 * (tmpvar_21 * 
					    (3.0 - (2.0 * tmpvar_21))
					  )));
					  highp vec3 tmpvar_22;
					  tmpvar_22 = (oldfilm_4 + ((col_3 * 
					    (vec3(1.0, 1.0, 1.0) - vec3((dist2_2 * _Value4)))
					  ) - dist2_2));
					  col_3 = tmpvar_22;
					  highp vec4 tmpvar_23;
					  tmpvar_23.w = 1.0;
					  tmpvar_23.xyz = tmpvar_22;
					  tmpvar_1 = tmpvar_23;
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
					  highp float dist2_2;
					  highp vec3 col_3;
					  highp vec3 oldfilm_4;
					  highp vec2 suv_5;
					  highp float t_6;
					  highp vec2 uv_7;
					  uv_7 = xlv_TEXCOORD0;
					  highp float tmpvar_8;
					  tmpvar_8 = float(int((_TimeX * _Value3)));
					  t_6 = (tmpvar_8 + tmpvar_8);
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = (fract((
					    sin(dot (vec2(t_6), vec2(12.9898, 78.233)))
					   * 43758.55)) * -6.0);
					  tmpvar_9.y = (fract((
					    sin(dot (vec2((t_6 + 23.0)), vec2(12.9898, 78.233)))
					   * 43758.55)) * 4.0);
					  suv_5 = ((uv_7 + (0.004 * tmpvar_9)) * 0.8);
					  suv_5 = (suv_5 + vec2(0.075, 0.05));
					  highp float time_10;
					  time_10 = (_Value2 * _TimeX);
					  highp float tmpvar_11;
					  tmpvar_11 = (1.0 + (0.5 * sin(
					    (time_10 + (uv_7.x * _Value))
					  )));
					  highp float tmpvar_12;
					  tmpvar_12 = (1.0 + (0.5 * cos(
					    (time_10 + (uv_7.y * _Value))
					  )));
					  highp vec2 tmpvar_13;
					  tmpvar_13.x = (tmpvar_11 + sin(tmpvar_12));
					  tmpvar_13.y = (tmpvar_12 + cos(tmpvar_11));
					  suv_5 = (suv_5 + (0.02 * tmpvar_13));
					  lowp vec3 tmpvar_14;
					  tmpvar_14 = texture2D (_MainTex2, suv_5).xyz;
					  oldfilm_4 = tmpvar_14;
					  uv_7 = xlv_TEXCOORD0;
					  uv_7 = (uv_7 + (oldfilm_4.xy / 16.0));
					  lowp vec3 tmpvar_15;
					  tmpvar_15 = texture2D (_MainTex, uv_7).xyz;
					  col_3 = tmpvar_15;
					  highp float tmpvar_16;
					  highp float tmpvar_17;
					  tmpvar_17 = (_TimeX / 2.0);
					  tmpvar_16 = (t_6 - ((
					    sin(tmpvar_17)
					   * 
					    sin(tmpvar_17)
					  ) * t_6));
					  highp vec2 x_18;
					  x_18 = (vec2(0.5, 0.5) - uv_7.y);
					  highp float tmpvar_19;
					  tmpvar_19 = clamp (((
					    sqrt(dot (x_18, x_18))
					   - tmpvar_16) / (
					    (tmpvar_16 - 0.6)
					   - tmpvar_16)), 0.0, 1.0);
					  highp vec2 x_20;
					  x_20 = (vec2(0.6, 0.6) - (suv_5 * 1.2));
					  highp float tmpvar_21;
					  tmpvar_21 = clamp (((
					    sqrt(dot (x_20, x_20))
					   - 0.4) / 0.2), 0.0, 1.0);
					  dist2_2 = ((1.0 - (tmpvar_19 * 
					    (tmpvar_19 * (3.0 - (2.0 * tmpvar_19)))
					  )) + (tmpvar_21 * (tmpvar_21 * 
					    (3.0 - (2.0 * tmpvar_21))
					  )));
					  highp vec3 tmpvar_22;
					  tmpvar_22 = (oldfilm_4 + ((col_3 * 
					    (vec3(1.0, 1.0, 1.0) - vec3((dist2_2 * _Value4)))
					  ) - dist2_2));
					  col_3 = tmpvar_22;
					  highp vec4 tmpvar_23;
					  tmpvar_23.w = 1.0;
					  tmpvar_23.xyz = tmpvar_22;
					  tmpvar_1 = tmpvar_23;
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
					  highp float dist2_2;
					  highp vec3 col_3;
					  highp vec3 oldfilm_4;
					  highp vec2 suv_5;
					  highp float t_6;
					  highp vec2 uv_7;
					  uv_7 = xlv_TEXCOORD0;
					  highp float tmpvar_8;
					  tmpvar_8 = float(int((_TimeX * _Value3)));
					  t_6 = (tmpvar_8 + tmpvar_8);
					  highp vec2 tmpvar_9;
					  tmpvar_9.x = (fract((
					    sin(dot (vec2(t_6), vec2(12.9898, 78.233)))
					   * 43758.55)) * -6.0);
					  tmpvar_9.y = (fract((
					    sin(dot (vec2((t_6 + 23.0)), vec2(12.9898, 78.233)))
					   * 43758.55)) * 4.0);
					  suv_5 = ((uv_7 + (0.004 * tmpvar_9)) * 0.8);
					  suv_5 = (suv_5 + vec2(0.075, 0.05));
					  highp float time_10;
					  time_10 = (_Value2 * _TimeX);
					  highp float tmpvar_11;
					  tmpvar_11 = (1.0 + (0.5 * sin(
					    (time_10 + (uv_7.x * _Value))
					  )));
					  highp float tmpvar_12;
					  tmpvar_12 = (1.0 + (0.5 * cos(
					    (time_10 + (uv_7.y * _Value))
					  )));
					  highp vec2 tmpvar_13;
					  tmpvar_13.x = (tmpvar_11 + sin(tmpvar_12));
					  tmpvar_13.y = (tmpvar_12 + cos(tmpvar_11));
					  suv_5 = (suv_5 + (0.02 * tmpvar_13));
					  lowp vec3 tmpvar_14;
					  tmpvar_14 = texture2D (_MainTex2, suv_5).xyz;
					  oldfilm_4 = tmpvar_14;
					  uv_7 = xlv_TEXCOORD0;
					  uv_7 = (uv_7 + (oldfilm_4.xy / 16.0));
					  lowp vec3 tmpvar_15;
					  tmpvar_15 = texture2D (_MainTex, uv_7).xyz;
					  col_3 = tmpvar_15;
					  highp float tmpvar_16;
					  highp float tmpvar_17;
					  tmpvar_17 = (_TimeX / 2.0);
					  tmpvar_16 = (t_6 - ((
					    sin(tmpvar_17)
					   * 
					    sin(tmpvar_17)
					  ) * t_6));
					  highp vec2 x_18;
					  x_18 = (vec2(0.5, 0.5) - uv_7.y);
					  highp float tmpvar_19;
					  tmpvar_19 = clamp (((
					    sqrt(dot (x_18, x_18))
					   - tmpvar_16) / (
					    (tmpvar_16 - 0.6)
					   - tmpvar_16)), 0.0, 1.0);
					  highp vec2 x_20;
					  x_20 = (vec2(0.6, 0.6) - (suv_5 * 1.2));
					  highp float tmpvar_21;
					  tmpvar_21 = clamp (((
					    sqrt(dot (x_20, x_20))
					   - 0.4) / 0.2), 0.0, 1.0);
					  dist2_2 = ((1.0 - (tmpvar_19 * 
					    (tmpvar_19 * (3.0 - (2.0 * tmpvar_19)))
					  )) + (tmpvar_21 * (tmpvar_21 * 
					    (3.0 - (2.0 * tmpvar_21))
					  )));
					  highp vec3 tmpvar_22;
					  tmpvar_22 = (oldfilm_4 + ((col_3 * 
					    (vec3(1.0, 1.0, 1.0) - vec3((dist2_2 * _Value4)))
					  ) - dist2_2));
					  col_3 = tmpvar_22;
					  highp vec4 tmpvar_23;
					  tmpvar_23.w = 1.0;
					  tmpvar_23.xyz = tmpvar_22;
					  tmpvar_1 = tmpvar_23;
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
					lowp vec3 u_xlat10_1;
					vec2 u_xlat2;
					lowp vec3 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat6;
					float u_xlat9;
					float u_xlat10;
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
					    u_xlat10_1.xyz = texture(_MainTex2, u_xlat3.xy).xyz;
					    u_xlat3.xy = (-u_xlat3.xy) * vec2(1.20000005, 1.20000005) + vec2(0.600000024, 0.600000024);
					    u_xlat3.x = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat0.y = u_xlat3.x + -0.400000006;
					    u_xlat6.xy = u_xlat10_1.xy * vec2(0.0625, 0.0625) + vs_TEXCOORD0.xy;
					    u_xlat10 = (-u_xlat6.y) + 0.5;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat6.xy).xyz;
					    u_xlat6.x = dot(vec2(u_xlat10), vec2(u_xlat10));
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat9 = _TimeX * 0.5;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat9 = u_xlat9 * u_xlat9;
					    u_xlat0.x = (-u_xlat9) * u_xlat0.x + u_xlat0.x;
					    u_xlat0.x = (-u_xlat0.x) + u_xlat6.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(-1.66666663, 4.99999952);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
					#else
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					#endif
					    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat6.x) * u_xlat0.x + 1.0;
					    u_xlat6.x = u_xlat0.y * -2.0 + 3.0;
					    u_xlat3.x = u_xlat0.y * u_xlat0.y;
					    u_xlat0.x = u_xlat6.x * u_xlat3.x + u_xlat0.x;
					    u_xlat3.x = u_xlat0.x * _Value4;
					    u_xlat3.xyz = u_xlat3.xxx * (-u_xlat10_2.xyz) + u_xlat10_2.xyz;
					    u_xlat0.xyz = (-u_xlat0.xxx) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat10_1.xyz;
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
					lowp vec3 u_xlat10_1;
					vec2 u_xlat2;
					lowp vec3 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat6;
					float u_xlat9;
					float u_xlat10;
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
					    u_xlat10_1.xyz = texture(_MainTex2, u_xlat3.xy).xyz;
					    u_xlat3.xy = (-u_xlat3.xy) * vec2(1.20000005, 1.20000005) + vec2(0.600000024, 0.600000024);
					    u_xlat3.x = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat0.y = u_xlat3.x + -0.400000006;
					    u_xlat6.xy = u_xlat10_1.xy * vec2(0.0625, 0.0625) + vs_TEXCOORD0.xy;
					    u_xlat10 = (-u_xlat6.y) + 0.5;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat6.xy).xyz;
					    u_xlat6.x = dot(vec2(u_xlat10), vec2(u_xlat10));
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat9 = _TimeX * 0.5;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat9 = u_xlat9 * u_xlat9;
					    u_xlat0.x = (-u_xlat9) * u_xlat0.x + u_xlat0.x;
					    u_xlat0.x = (-u_xlat0.x) + u_xlat6.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(-1.66666663, 4.99999952);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
					#else
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					#endif
					    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat6.x) * u_xlat0.x + 1.0;
					    u_xlat6.x = u_xlat0.y * -2.0 + 3.0;
					    u_xlat3.x = u_xlat0.y * u_xlat0.y;
					    u_xlat0.x = u_xlat6.x * u_xlat3.x + u_xlat0.x;
					    u_xlat3.x = u_xlat0.x * _Value4;
					    u_xlat3.xyz = u_xlat3.xxx * (-u_xlat10_2.xyz) + u_xlat10_2.xyz;
					    u_xlat0.xyz = (-u_xlat0.xxx) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat10_1.xyz;
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
					lowp vec3 u_xlat10_1;
					vec2 u_xlat2;
					lowp vec3 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat6;
					float u_xlat9;
					float u_xlat10;
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
					    u_xlat10_1.xyz = texture(_MainTex2, u_xlat3.xy).xyz;
					    u_xlat3.xy = (-u_xlat3.xy) * vec2(1.20000005, 1.20000005) + vec2(0.600000024, 0.600000024);
					    u_xlat3.x = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat0.y = u_xlat3.x + -0.400000006;
					    u_xlat6.xy = u_xlat10_1.xy * vec2(0.0625, 0.0625) + vs_TEXCOORD0.xy;
					    u_xlat10 = (-u_xlat6.y) + 0.5;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat6.xy).xyz;
					    u_xlat6.x = dot(vec2(u_xlat10), vec2(u_xlat10));
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat9 = _TimeX * 0.5;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat9 = u_xlat9 * u_xlat9;
					    u_xlat0.x = (-u_xlat9) * u_xlat0.x + u_xlat0.x;
					    u_xlat0.x = (-u_xlat0.x) + u_xlat6.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(-1.66666663, 4.99999952);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
					#else
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					#endif
					    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat6.x) * u_xlat0.x + 1.0;
					    u_xlat6.x = u_xlat0.y * -2.0 + 3.0;
					    u_xlat3.x = u_xlat0.y * u_xlat0.y;
					    u_xlat0.x = u_xlat6.x * u_xlat3.x + u_xlat0.x;
					    u_xlat3.x = u_xlat0.x * _Value4;
					    u_xlat3.xyz = u_xlat3.xxx * (-u_xlat10_2.xyz) + u_xlat10_2.xyz;
					    u_xlat0.xyz = (-u_xlat0.xxx) + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat10_1.xyz;
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