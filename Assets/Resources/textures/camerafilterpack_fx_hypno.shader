Shader "CameraFilterPack/FX_Hypno" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 62418
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
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 res_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  uv_2 = ((uv_2 * 2.0) - 1.0);
					  uv_2 = (uv_2 * uv_2);
					  highp float tmpvar_3;
					  tmpvar_3 = (_TimeX * _Value);
					  highp float a_4;
					  a_4 = (sin(tmpvar_3) + tmpvar_3);
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = ((cos(a_4) * uv_2.x) - (sin(a_4) * uv_2.y));
					  tmpvar_5.y = ((sin(a_4) * uv_2.x) + (cos(a_4) * uv_2.y));
					  uv_2 = tmpvar_5;
					  highp vec2 uv_6;
					  uv_6 = (tmpvar_5 * (sin(
					    (tmpvar_3 * 3.0)
					  ) + 2.0));
					  highp vec3 tt_7;
					  highp float tmpvar_8;
					  tmpvar_8 = (uv_6.x - (floor(
					    (uv_6.x * 6.666667)
					  ) * 0.15));
					  highp float tmpvar_9;
					  tmpvar_9 = (uv_6.y - (floor(
					    (uv_6.y * 6.666667)
					  ) * 0.15));
					  highp float tmpvar_10;
					  tmpvar_10 = clamp (((tmpvar_8 - 0.02) / 0.03), 0.0, 1.0);
					  highp float tmpvar_11;
					  tmpvar_11 = clamp (((tmpvar_8 - 0.06) / 0.02), 0.0, 1.0);
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (((tmpvar_9 - 0.02) / 0.03), 0.0, 1.0);
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (((tmpvar_9 - 0.06) / 0.02), 0.0, 1.0);
					  highp vec3 tmpvar_14;
					  tmpvar_14.z = 1.0;
					  tmpvar_14.x = (uv_6.x - (floor(
					    (uv_6.x * 1.666667)
					  ) * 0.6));
					  tmpvar_14.y = (uv_6.y - (floor(
					    (uv_6.y * 2.0)
					  ) * 0.5));
					  highp vec3 tmpvar_15;
					  tmpvar_15 = (tmpvar_14 * ((
					    (tmpvar_10 * (tmpvar_10 * (3.0 - (2.0 * tmpvar_10))))
					   * 
					    (1.0 - (tmpvar_11 * (tmpvar_11 * (3.0 - 
					      (2.0 * tmpvar_11)
					    ))))
					  ) + (
					    (tmpvar_12 * (tmpvar_12 * (3.0 - (2.0 * tmpvar_12))))
					   * 
					    (1.0 - (tmpvar_13 * (tmpvar_13 * (3.0 - 
					      (2.0 * tmpvar_13)
					    ))))
					  )));
					  tt_7.x = (tmpvar_15.x * _Value2);
					  tt_7.y = (tmpvar_15.y * _Value3);
					  tt_7.z = (tmpvar_15.z * _Value4);
					  lowp vec3 tmpvar_16;
					  tmpvar_16 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  res_1 = tmpvar_16;
					  res_1 = (res_1 + abs(tt_7));
					  highp vec4 tmpvar_17;
					  tmpvar_17.w = 1.0;
					  tmpvar_17.xyz = res_1;
					  gl_FragData[0] = tmpvar_17;
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
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 res_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  uv_2 = ((uv_2 * 2.0) - 1.0);
					  uv_2 = (uv_2 * uv_2);
					  highp float tmpvar_3;
					  tmpvar_3 = (_TimeX * _Value);
					  highp float a_4;
					  a_4 = (sin(tmpvar_3) + tmpvar_3);
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = ((cos(a_4) * uv_2.x) - (sin(a_4) * uv_2.y));
					  tmpvar_5.y = ((sin(a_4) * uv_2.x) + (cos(a_4) * uv_2.y));
					  uv_2 = tmpvar_5;
					  highp vec2 uv_6;
					  uv_6 = (tmpvar_5 * (sin(
					    (tmpvar_3 * 3.0)
					  ) + 2.0));
					  highp vec3 tt_7;
					  highp float tmpvar_8;
					  tmpvar_8 = (uv_6.x - (floor(
					    (uv_6.x * 6.666667)
					  ) * 0.15));
					  highp float tmpvar_9;
					  tmpvar_9 = (uv_6.y - (floor(
					    (uv_6.y * 6.666667)
					  ) * 0.15));
					  highp float tmpvar_10;
					  tmpvar_10 = clamp (((tmpvar_8 - 0.02) / 0.03), 0.0, 1.0);
					  highp float tmpvar_11;
					  tmpvar_11 = clamp (((tmpvar_8 - 0.06) / 0.02), 0.0, 1.0);
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (((tmpvar_9 - 0.02) / 0.03), 0.0, 1.0);
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (((tmpvar_9 - 0.06) / 0.02), 0.0, 1.0);
					  highp vec3 tmpvar_14;
					  tmpvar_14.z = 1.0;
					  tmpvar_14.x = (uv_6.x - (floor(
					    (uv_6.x * 1.666667)
					  ) * 0.6));
					  tmpvar_14.y = (uv_6.y - (floor(
					    (uv_6.y * 2.0)
					  ) * 0.5));
					  highp vec3 tmpvar_15;
					  tmpvar_15 = (tmpvar_14 * ((
					    (tmpvar_10 * (tmpvar_10 * (3.0 - (2.0 * tmpvar_10))))
					   * 
					    (1.0 - (tmpvar_11 * (tmpvar_11 * (3.0 - 
					      (2.0 * tmpvar_11)
					    ))))
					  ) + (
					    (tmpvar_12 * (tmpvar_12 * (3.0 - (2.0 * tmpvar_12))))
					   * 
					    (1.0 - (tmpvar_13 * (tmpvar_13 * (3.0 - 
					      (2.0 * tmpvar_13)
					    ))))
					  )));
					  tt_7.x = (tmpvar_15.x * _Value2);
					  tt_7.y = (tmpvar_15.y * _Value3);
					  tt_7.z = (tmpvar_15.z * _Value4);
					  lowp vec3 tmpvar_16;
					  tmpvar_16 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  res_1 = tmpvar_16;
					  res_1 = (res_1 + abs(tt_7));
					  highp vec4 tmpvar_17;
					  tmpvar_17.w = 1.0;
					  tmpvar_17.xyz = res_1;
					  gl_FragData[0] = tmpvar_17;
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
					uniform highp float _Value4;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 res_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  uv_2 = ((uv_2 * 2.0) - 1.0);
					  uv_2 = (uv_2 * uv_2);
					  highp float tmpvar_3;
					  tmpvar_3 = (_TimeX * _Value);
					  highp float a_4;
					  a_4 = (sin(tmpvar_3) + tmpvar_3);
					  highp vec2 tmpvar_5;
					  tmpvar_5.x = ((cos(a_4) * uv_2.x) - (sin(a_4) * uv_2.y));
					  tmpvar_5.y = ((sin(a_4) * uv_2.x) + (cos(a_4) * uv_2.y));
					  uv_2 = tmpvar_5;
					  highp vec2 uv_6;
					  uv_6 = (tmpvar_5 * (sin(
					    (tmpvar_3 * 3.0)
					  ) + 2.0));
					  highp vec3 tt_7;
					  highp float tmpvar_8;
					  tmpvar_8 = (uv_6.x - (floor(
					    (uv_6.x * 6.666667)
					  ) * 0.15));
					  highp float tmpvar_9;
					  tmpvar_9 = (uv_6.y - (floor(
					    (uv_6.y * 6.666667)
					  ) * 0.15));
					  highp float tmpvar_10;
					  tmpvar_10 = clamp (((tmpvar_8 - 0.02) / 0.03), 0.0, 1.0);
					  highp float tmpvar_11;
					  tmpvar_11 = clamp (((tmpvar_8 - 0.06) / 0.02), 0.0, 1.0);
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (((tmpvar_9 - 0.02) / 0.03), 0.0, 1.0);
					  highp float tmpvar_13;
					  tmpvar_13 = clamp (((tmpvar_9 - 0.06) / 0.02), 0.0, 1.0);
					  highp vec3 tmpvar_14;
					  tmpvar_14.z = 1.0;
					  tmpvar_14.x = (uv_6.x - (floor(
					    (uv_6.x * 1.666667)
					  ) * 0.6));
					  tmpvar_14.y = (uv_6.y - (floor(
					    (uv_6.y * 2.0)
					  ) * 0.5));
					  highp vec3 tmpvar_15;
					  tmpvar_15 = (tmpvar_14 * ((
					    (tmpvar_10 * (tmpvar_10 * (3.0 - (2.0 * tmpvar_10))))
					   * 
					    (1.0 - (tmpvar_11 * (tmpvar_11 * (3.0 - 
					      (2.0 * tmpvar_11)
					    ))))
					  ) + (
					    (tmpvar_12 * (tmpvar_12 * (3.0 - (2.0 * tmpvar_12))))
					   * 
					    (1.0 - (tmpvar_13 * (tmpvar_13 * (3.0 - 
					      (2.0 * tmpvar_13)
					    ))))
					  )));
					  tt_7.x = (tmpvar_15.x * _Value2);
					  tt_7.y = (tmpvar_15.y * _Value3);
					  tt_7.z = (tmpvar_15.z * _Value4);
					  lowp vec3 tmpvar_16;
					  tmpvar_16 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  res_1 = tmpvar_16;
					  res_1 = (res_1 + abs(tt_7));
					  highp vec4 tmpvar_17;
					  tmpvar_17.w = 1.0;
					  tmpvar_17.xyz = res_1;
					  gl_FragData[0] = tmpvar_17;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					vec3 u_xlat4;
					mediump vec2 u_xlat16_6;
					void main()
					{
					    u_xlat0.x = _Value * _TimeX;
					    u_xlat0.y = u_xlat0.x * 3.0;
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.x = _TimeX * _Value + u_xlat0.x;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat3 = u_xlat0.y + 2.0;
					    u_xlat16_6.xy = vs_TEXCOORD0.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat16_6.xy = u_xlat16_6.xy * u_xlat16_6.xy;
					    u_xlat4.xy = u_xlat16_6.xy * u_xlat0.xx;
					    u_xlat2.xz = u_xlat1.xx * u_xlat16_6.yy + (-u_xlat4.xx);
					    u_xlat2.y = u_xlat1.x * u_xlat16_6.x + u_xlat4.y;
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat2.xyz;
					    u_xlat1.xyz = vec3(u_xlat0.z * float(6.66666651), u_xlat0.y * float(6.66666651), u_xlat0.z * float(1.66666663));
					    u_xlat1.xyz = floor(u_xlat1.xyz);
					    u_xlat0.xzw = (-u_xlat1.zxy) * vec3(0.600000024, 0.150000006, 0.150000006) + u_xlat0.zxy;
					    u_xlat1 = vec4(u_xlat0.z + float(-0.0199999996), u_xlat0.z + float(-0.0599999987), u_xlat0.w + float(-0.0199999996), u_xlat0.w + float(-0.0599999987));
					    u_xlat1 = u_xlat1 * vec4(33.3333321, 50.0, 33.3333321, 50.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
					#else
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					#endif
					    u_xlat2 = u_xlat1 * vec4(-2.0, -2.0, -2.0, -2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1.xz = u_xlat1.xz * u_xlat2.xz;
					    u_xlat4.xz = (-u_xlat2.yw) * u_xlat1.yw + vec2(1.0, 1.0);
					    u_xlat1.xy = u_xlat4.xz * u_xlat1.xz;
					    u_xlat1.x = u_xlat1.y + u_xlat1.x;
					    u_xlat4.x = u_xlat0.y + u_xlat0.y;
					    u_xlat4.x = floor(u_xlat4.x);
					    u_xlat0.z = (-u_xlat4.x) * 0.5 + u_xlat0.y;
					    u_xlat0.w = 1.0;
					    u_xlat0.xyz = u_xlat0.xzw * u_xlat1.xxx;
					    u_xlat1.xy = vec2(u_xlat0.x * float(_Value2), u_xlat0.y * float(_Value3));
					    u_xlat1.z = u_xlat0.z * _Value4;
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = abs(u_xlat1.xyz) + u_xlat10_0.xyz;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					vec3 u_xlat4;
					mediump vec2 u_xlat16_6;
					void main()
					{
					    u_xlat0.x = _Value * _TimeX;
					    u_xlat0.y = u_xlat0.x * 3.0;
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.x = _TimeX * _Value + u_xlat0.x;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat3 = u_xlat0.y + 2.0;
					    u_xlat16_6.xy = vs_TEXCOORD0.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat16_6.xy = u_xlat16_6.xy * u_xlat16_6.xy;
					    u_xlat4.xy = u_xlat16_6.xy * u_xlat0.xx;
					    u_xlat2.xz = u_xlat1.xx * u_xlat16_6.yy + (-u_xlat4.xx);
					    u_xlat2.y = u_xlat1.x * u_xlat16_6.x + u_xlat4.y;
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat2.xyz;
					    u_xlat1.xyz = vec3(u_xlat0.z * float(6.66666651), u_xlat0.y * float(6.66666651), u_xlat0.z * float(1.66666663));
					    u_xlat1.xyz = floor(u_xlat1.xyz);
					    u_xlat0.xzw = (-u_xlat1.zxy) * vec3(0.600000024, 0.150000006, 0.150000006) + u_xlat0.zxy;
					    u_xlat1 = vec4(u_xlat0.z + float(-0.0199999996), u_xlat0.z + float(-0.0599999987), u_xlat0.w + float(-0.0199999996), u_xlat0.w + float(-0.0599999987));
					    u_xlat1 = u_xlat1 * vec4(33.3333321, 50.0, 33.3333321, 50.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
					#else
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					#endif
					    u_xlat2 = u_xlat1 * vec4(-2.0, -2.0, -2.0, -2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1.xz = u_xlat1.xz * u_xlat2.xz;
					    u_xlat4.xz = (-u_xlat2.yw) * u_xlat1.yw + vec2(1.0, 1.0);
					    u_xlat1.xy = u_xlat4.xz * u_xlat1.xz;
					    u_xlat1.x = u_xlat1.y + u_xlat1.x;
					    u_xlat4.x = u_xlat0.y + u_xlat0.y;
					    u_xlat4.x = floor(u_xlat4.x);
					    u_xlat0.z = (-u_xlat4.x) * 0.5 + u_xlat0.y;
					    u_xlat0.w = 1.0;
					    u_xlat0.xyz = u_xlat0.xzw * u_xlat1.xxx;
					    u_xlat1.xy = vec2(u_xlat0.x * float(_Value2), u_xlat0.y * float(_Value3));
					    u_xlat1.z = u_xlat0.z * _Value4;
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = abs(u_xlat1.xyz) + u_xlat10_0.xyz;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					vec3 u_xlat4;
					mediump vec2 u_xlat16_6;
					void main()
					{
					    u_xlat0.x = _Value * _TimeX;
					    u_xlat0.y = u_xlat0.x * 3.0;
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.x = _TimeX * _Value + u_xlat0.x;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat3 = u_xlat0.y + 2.0;
					    u_xlat16_6.xy = vs_TEXCOORD0.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat16_6.xy = u_xlat16_6.xy * u_xlat16_6.xy;
					    u_xlat4.xy = u_xlat16_6.xy * u_xlat0.xx;
					    u_xlat2.xz = u_xlat1.xx * u_xlat16_6.yy + (-u_xlat4.xx);
					    u_xlat2.y = u_xlat1.x * u_xlat16_6.x + u_xlat4.y;
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat2.xyz;
					    u_xlat1.xyz = vec3(u_xlat0.z * float(6.66666651), u_xlat0.y * float(6.66666651), u_xlat0.z * float(1.66666663));
					    u_xlat1.xyz = floor(u_xlat1.xyz);
					    u_xlat0.xzw = (-u_xlat1.zxy) * vec3(0.600000024, 0.150000006, 0.150000006) + u_xlat0.zxy;
					    u_xlat1 = vec4(u_xlat0.z + float(-0.0199999996), u_xlat0.z + float(-0.0599999987), u_xlat0.w + float(-0.0199999996), u_xlat0.w + float(-0.0599999987));
					    u_xlat1 = u_xlat1 * vec4(33.3333321, 50.0, 33.3333321, 50.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
					#else
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					#endif
					    u_xlat2 = u_xlat1 * vec4(-2.0, -2.0, -2.0, -2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1.xz = u_xlat1.xz * u_xlat2.xz;
					    u_xlat4.xz = (-u_xlat2.yw) * u_xlat1.yw + vec2(1.0, 1.0);
					    u_xlat1.xy = u_xlat4.xz * u_xlat1.xz;
					    u_xlat1.x = u_xlat1.y + u_xlat1.x;
					    u_xlat4.x = u_xlat0.y + u_xlat0.y;
					    u_xlat4.x = floor(u_xlat4.x);
					    u_xlat0.z = (-u_xlat4.x) * 0.5 + u_xlat0.y;
					    u_xlat0.w = 1.0;
					    u_xlat0.xyz = u_xlat0.xzw * u_xlat1.xxx;
					    u_xlat1.xy = vec2(u_xlat0.x * float(_Value2), u_xlat0.y * float(_Value3));
					    u_xlat1.z = u_xlat0.z * _Value4;
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = abs(u_xlat1.xyz) + u_xlat10_0.xyz;
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