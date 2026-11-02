Shader "CameraFilterPack/FX_Grid" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 5)) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 22450
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
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float lit_1;
					  highp float yb_2;
					  highp float xb_3;
					  highp vec2 uv_4;
					  highp float tmpvar_5;
					  tmpvar_5 = (0.3 * _Distortion);
					  uv_4 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_6;
					  tmpvar_6 = fract((uv_4 * vec2(60.0, 35.3)));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (floor((uv_4 * vec2(60.0, 35.3))) / vec2(60.0, 35.3));
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = tmpvar_7.x;
					  tmpvar_8.y = uv_4.y;
					  lowp float tmpvar_9;
					  tmpvar_9 = dot (texture2D (_MainTex, tmpvar_8).xyz, vec3(0.33, 0.33, 0.33));
					  xb_3 = tmpvar_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = uv_4.x;
					  tmpvar_10.y = tmpvar_7.y;
					  lowp float tmpvar_11;
					  tmpvar_11 = dot (texture2D (_MainTex, tmpvar_10).xyz, vec3(0.33, 0.33, 0.33));
					  yb_2 = tmpvar_11;
					  highp float tmpvar_12;
					  tmpvar_12 = abs(((tmpvar_6.y - 
					    (tmpvar_5 / 2.0)
					  ) - (
					    (1.0 - tmpvar_5)
					   * yb_2)));
					  bool tmpvar_13;
					  if ((tmpvar_12 < (tmpvar_5 / 2.0))) {
					    tmpvar_13 = bool(1);
					  } else {
					    highp float tmpvar_14;
					    tmpvar_14 = abs(((tmpvar_6.x - 
					      (tmpvar_5 / 2.0)
					    ) - (
					      (1.0 - tmpvar_5)
					     * xb_3)));
					    tmpvar_13 = (tmpvar_14 < (tmpvar_5 / 2.0));
					  };
					  lowp float tmpvar_15;
					  tmpvar_15 = float(tmpvar_13);
					  lit_1 = tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = ((yb_2 + xb_3) / 2.0);
					  highp vec4 tmpvar_17;
					  tmpvar_17.xzw = vec3(0.0, 0.0, 1.0);
					  tmpvar_17.y = ((lit_1 * tmpvar_16) + ((
					    (1.0 - lit_1)
					   * tmpvar_16) * 0.3));
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
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float lit_1;
					  highp float yb_2;
					  highp float xb_3;
					  highp vec2 uv_4;
					  highp float tmpvar_5;
					  tmpvar_5 = (0.3 * _Distortion);
					  uv_4 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_6;
					  tmpvar_6 = fract((uv_4 * vec2(60.0, 35.3)));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (floor((uv_4 * vec2(60.0, 35.3))) / vec2(60.0, 35.3));
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = tmpvar_7.x;
					  tmpvar_8.y = uv_4.y;
					  lowp float tmpvar_9;
					  tmpvar_9 = dot (texture2D (_MainTex, tmpvar_8).xyz, vec3(0.33, 0.33, 0.33));
					  xb_3 = tmpvar_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = uv_4.x;
					  tmpvar_10.y = tmpvar_7.y;
					  lowp float tmpvar_11;
					  tmpvar_11 = dot (texture2D (_MainTex, tmpvar_10).xyz, vec3(0.33, 0.33, 0.33));
					  yb_2 = tmpvar_11;
					  highp float tmpvar_12;
					  tmpvar_12 = abs(((tmpvar_6.y - 
					    (tmpvar_5 / 2.0)
					  ) - (
					    (1.0 - tmpvar_5)
					   * yb_2)));
					  bool tmpvar_13;
					  if ((tmpvar_12 < (tmpvar_5 / 2.0))) {
					    tmpvar_13 = bool(1);
					  } else {
					    highp float tmpvar_14;
					    tmpvar_14 = abs(((tmpvar_6.x - 
					      (tmpvar_5 / 2.0)
					    ) - (
					      (1.0 - tmpvar_5)
					     * xb_3)));
					    tmpvar_13 = (tmpvar_14 < (tmpvar_5 / 2.0));
					  };
					  lowp float tmpvar_15;
					  tmpvar_15 = float(tmpvar_13);
					  lit_1 = tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = ((yb_2 + xb_3) / 2.0);
					  highp vec4 tmpvar_17;
					  tmpvar_17.xzw = vec3(0.0, 0.0, 1.0);
					  tmpvar_17.y = ((lit_1 * tmpvar_16) + ((
					    (1.0 - lit_1)
					   * tmpvar_16) * 0.3));
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
					uniform highp float _Distortion;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float lit_1;
					  highp float yb_2;
					  highp float xb_3;
					  highp vec2 uv_4;
					  highp float tmpvar_5;
					  tmpvar_5 = (0.3 * _Distortion);
					  uv_4 = xlv_TEXCOORD0;
					  highp vec2 tmpvar_6;
					  tmpvar_6 = fract((uv_4 * vec2(60.0, 35.3)));
					  highp vec2 tmpvar_7;
					  tmpvar_7 = (floor((uv_4 * vec2(60.0, 35.3))) / vec2(60.0, 35.3));
					  highp vec2 tmpvar_8;
					  tmpvar_8.x = tmpvar_7.x;
					  tmpvar_8.y = uv_4.y;
					  lowp float tmpvar_9;
					  tmpvar_9 = dot (texture2D (_MainTex, tmpvar_8).xyz, vec3(0.33, 0.33, 0.33));
					  xb_3 = tmpvar_9;
					  highp vec2 tmpvar_10;
					  tmpvar_10.x = uv_4.x;
					  tmpvar_10.y = tmpvar_7.y;
					  lowp float tmpvar_11;
					  tmpvar_11 = dot (texture2D (_MainTex, tmpvar_10).xyz, vec3(0.33, 0.33, 0.33));
					  yb_2 = tmpvar_11;
					  highp float tmpvar_12;
					  tmpvar_12 = abs(((tmpvar_6.y - 
					    (tmpvar_5 / 2.0)
					  ) - (
					    (1.0 - tmpvar_5)
					   * yb_2)));
					  bool tmpvar_13;
					  if ((tmpvar_12 < (tmpvar_5 / 2.0))) {
					    tmpvar_13 = bool(1);
					  } else {
					    highp float tmpvar_14;
					    tmpvar_14 = abs(((tmpvar_6.x - 
					      (tmpvar_5 / 2.0)
					    ) - (
					      (1.0 - tmpvar_5)
					     * xb_3)));
					    tmpvar_13 = (tmpvar_14 < (tmpvar_5 / 2.0));
					  };
					  lowp float tmpvar_15;
					  tmpvar_15 = float(tmpvar_13);
					  lit_1 = tmpvar_15;
					  highp float tmpvar_16;
					  tmpvar_16 = ((yb_2 + xb_3) / 2.0);
					  highp vec4 tmpvar_17;
					  tmpvar_17.xzw = vec3(0.0, 0.0, 1.0);
					  tmpvar_17.y = ((lit_1 * tmpvar_16) + ((
					    (1.0 - lit_1)
					   * tmpvar_16) * 0.3));
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
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					ivec2 u_xlati0;
					vec4 u_xlat1;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					float u_xlat3;
					vec2 u_xlat6;
					mediump float u_xlat16_6;
					float u_xlat9;
					mediump float u_xlat16_9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(60.0, 35.2999992);
					    u_xlat6.xy = floor(u_xlat0.xy);
					    u_xlat0.xy = fract(u_xlat0.yx);
					    u_xlat0.xy = (-vec2(vec2(_Distortion, _Distortion))) * vec2(0.150000006, 0.150000006) + u_xlat0.xy;
					    u_xlat1.xw = u_xlat6.xy * vec2(0.0166666675, 0.0283286124);
					    u_xlat1.yz = vs_TEXCOORD0.yx;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat1.zw).xyz;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat16_6 = dot(u_xlat10_1.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat16_9 = dot(u_xlat10_2.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat1.x = (-_Distortion) * 0.300000012 + 1.0;
					    u_xlat0.x = (-u_xlat1.x) * u_xlat16_9 + u_xlat0.x;
					    u_xlat16_9 = u_xlat16_6 + u_xlat16_9;
					    u_xlat0.y = (-u_xlat1.x) * u_xlat16_6 + u_xlat0.y;
					    u_xlat16_6 = u_xlat16_9 * 0.5;
					    u_xlat9 = _Distortion * 0.150000006;
					    u_xlati0.xy = ivec2(uvec2(lessThan(abs(u_xlat0.xyxx), vec4(u_xlat9)).xy) * 0xFFFFFFFFu);
					    u_xlati0.x = int(uint(u_xlati0.y) | uint(u_xlati0.x));
					    u_xlat3 = (u_xlati0.x != 0) ? 0.0 : 1.0;
					    u_xlat0.x = uintBitsToFloat(uint(u_xlati0.x) & 1065353216u);
					    u_xlat3 = u_xlat16_6 * u_xlat3;
					    u_xlat3 = u_xlat3 * 0.300000012;
					    SV_Target0.y = u_xlat0.x * u_xlat16_6 + u_xlat3;
					    SV_Target0.xzw = vec3(0.0, 0.0, 1.0);
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
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					ivec2 u_xlati0;
					vec4 u_xlat1;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					float u_xlat3;
					vec2 u_xlat6;
					mediump float u_xlat16_6;
					float u_xlat9;
					mediump float u_xlat16_9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(60.0, 35.2999992);
					    u_xlat6.xy = floor(u_xlat0.xy);
					    u_xlat0.xy = fract(u_xlat0.yx);
					    u_xlat0.xy = (-vec2(vec2(_Distortion, _Distortion))) * vec2(0.150000006, 0.150000006) + u_xlat0.xy;
					    u_xlat1.xw = u_xlat6.xy * vec2(0.0166666675, 0.0283286124);
					    u_xlat1.yz = vs_TEXCOORD0.yx;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat1.zw).xyz;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat16_6 = dot(u_xlat10_1.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat16_9 = dot(u_xlat10_2.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat1.x = (-_Distortion) * 0.300000012 + 1.0;
					    u_xlat0.x = (-u_xlat1.x) * u_xlat16_9 + u_xlat0.x;
					    u_xlat16_9 = u_xlat16_6 + u_xlat16_9;
					    u_xlat0.y = (-u_xlat1.x) * u_xlat16_6 + u_xlat0.y;
					    u_xlat16_6 = u_xlat16_9 * 0.5;
					    u_xlat9 = _Distortion * 0.150000006;
					    u_xlati0.xy = ivec2(uvec2(lessThan(abs(u_xlat0.xyxx), vec4(u_xlat9)).xy) * 0xFFFFFFFFu);
					    u_xlati0.x = int(uint(u_xlati0.y) | uint(u_xlati0.x));
					    u_xlat3 = (u_xlati0.x != 0) ? 0.0 : 1.0;
					    u_xlat0.x = uintBitsToFloat(uint(u_xlati0.x) & 1065353216u);
					    u_xlat3 = u_xlat16_6 * u_xlat3;
					    u_xlat3 = u_xlat3 * 0.300000012;
					    SV_Target0.y = u_xlat0.x * u_xlat16_6 + u_xlat3;
					    SV_Target0.xzw = vec3(0.0, 0.0, 1.0);
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
					uniform 	float _Distortion;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					ivec2 u_xlati0;
					vec4 u_xlat1;
					lowp vec3 u_xlat10_1;
					lowp vec3 u_xlat10_2;
					float u_xlat3;
					vec2 u_xlat6;
					mediump float u_xlat16_6;
					float u_xlat9;
					mediump float u_xlat16_9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(60.0, 35.2999992);
					    u_xlat6.xy = floor(u_xlat0.xy);
					    u_xlat0.xy = fract(u_xlat0.yx);
					    u_xlat0.xy = (-vec2(vec2(_Distortion, _Distortion))) * vec2(0.150000006, 0.150000006) + u_xlat0.xy;
					    u_xlat1.xw = u_xlat6.xy * vec2(0.0166666675, 0.0283286124);
					    u_xlat1.yz = vs_TEXCOORD0.yx;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat1.zw).xyz;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
					    u_xlat16_6 = dot(u_xlat10_1.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat16_9 = dot(u_xlat10_2.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat1.x = (-_Distortion) * 0.300000012 + 1.0;
					    u_xlat0.x = (-u_xlat1.x) * u_xlat16_9 + u_xlat0.x;
					    u_xlat16_9 = u_xlat16_6 + u_xlat16_9;
					    u_xlat0.y = (-u_xlat1.x) * u_xlat16_6 + u_xlat0.y;
					    u_xlat16_6 = u_xlat16_9 * 0.5;
					    u_xlat9 = _Distortion * 0.150000006;
					    u_xlati0.xy = ivec2(uvec2(lessThan(abs(u_xlat0.xyxx), vec4(u_xlat9)).xy) * 0xFFFFFFFFu);
					    u_xlati0.x = int(uint(u_xlati0.y) | uint(u_xlati0.x));
					    u_xlat3 = (u_xlati0.x != 0) ? 0.0 : 1.0;
					    u_xlat0.x = uintBitsToFloat(uint(u_xlati0.x) & 1065353216u);
					    u_xlat3 = u_xlat16_6 * u_xlat3;
					    u_xlat3 = u_xlat3 * 0.300000012;
					    SV_Target0.y = u_xlat0.x * u_xlat16_6 + u_xlat3;
					    SV_Target0.xzw = vec3(0.0, 0.0, 1.0);
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