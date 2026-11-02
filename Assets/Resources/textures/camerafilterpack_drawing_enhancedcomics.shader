Shader "CameraFilterPack/Drawing_EnhancedComics" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_DotSize ("_DotSize", Range(0, 1)) = 0
		_ColorRGB ("_ColorRGB", Vector) = (1,0,0,1)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 17251
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
					uniform highp vec4 _ColorRGB;
					uniform highp float _DotSize;
					uniform highp float _ColorR;
					uniform highp float _ColorG;
					uniform highp float _ColorB;
					uniform highp float _Blood;
					uniform highp float _SmoothStart;
					uniform highp float _SmoothEnd;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 brtColor_1;
					  highp vec3 color_2;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  color_2 = tmpvar_3;
					  brtColor_1 = color_2;
					  highp float edge0_4;
					  edge0_4 = (_DotSize + _SmoothStart);
					  highp float tmpvar_5;
					  tmpvar_5 = clamp (((
					    (((color_2.x + color_2.y) + color_2.z) / 3.0)
					   - edge0_4) / (
					    ((0.1 + _DotSize) + _SmoothEnd)
					   - edge0_4)), 0.0, 1.0);
					  color_2 = vec3((tmpvar_5 * (tmpvar_5 * (3.0 - 
					    (2.0 * tmpvar_5)
					  ))));
					  highp vec3 tmpvar_6;
					  tmpvar_6.x = 1.0;
					  tmpvar_6.y = _Blood;
					  tmpvar_6.z = _Blood;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = mix (tmpvar_6, (brtColor_1 * vec3(8.88, 8.88, 8.88)), vec3(8.39, 8.39, 8.39));
					  if ((((tmpvar_7.x > _ColorR) && (tmpvar_7.y < _ColorG)) && (tmpvar_7.z < _ColorB))) {
					    color_2 = _ColorRGB.xyz;
					  };
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = color_2;
					  gl_FragData[0] = tmpvar_8;
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
					uniform highp vec4 _ColorRGB;
					uniform highp float _DotSize;
					uniform highp float _ColorR;
					uniform highp float _ColorG;
					uniform highp float _ColorB;
					uniform highp float _Blood;
					uniform highp float _SmoothStart;
					uniform highp float _SmoothEnd;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 brtColor_1;
					  highp vec3 color_2;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  color_2 = tmpvar_3;
					  brtColor_1 = color_2;
					  highp float edge0_4;
					  edge0_4 = (_DotSize + _SmoothStart);
					  highp float tmpvar_5;
					  tmpvar_5 = clamp (((
					    (((color_2.x + color_2.y) + color_2.z) / 3.0)
					   - edge0_4) / (
					    ((0.1 + _DotSize) + _SmoothEnd)
					   - edge0_4)), 0.0, 1.0);
					  color_2 = vec3((tmpvar_5 * (tmpvar_5 * (3.0 - 
					    (2.0 * tmpvar_5)
					  ))));
					  highp vec3 tmpvar_6;
					  tmpvar_6.x = 1.0;
					  tmpvar_6.y = _Blood;
					  tmpvar_6.z = _Blood;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = mix (tmpvar_6, (brtColor_1 * vec3(8.88, 8.88, 8.88)), vec3(8.39, 8.39, 8.39));
					  if ((((tmpvar_7.x > _ColorR) && (tmpvar_7.y < _ColorG)) && (tmpvar_7.z < _ColorB))) {
					    color_2 = _ColorRGB.xyz;
					  };
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = color_2;
					  gl_FragData[0] = tmpvar_8;
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
					uniform highp vec4 _ColorRGB;
					uniform highp float _DotSize;
					uniform highp float _ColorR;
					uniform highp float _ColorG;
					uniform highp float _ColorB;
					uniform highp float _Blood;
					uniform highp float _SmoothStart;
					uniform highp float _SmoothEnd;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 brtColor_1;
					  highp vec3 color_2;
					  lowp vec3 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0).xyz;
					  color_2 = tmpvar_3;
					  brtColor_1 = color_2;
					  highp float edge0_4;
					  edge0_4 = (_DotSize + _SmoothStart);
					  highp float tmpvar_5;
					  tmpvar_5 = clamp (((
					    (((color_2.x + color_2.y) + color_2.z) / 3.0)
					   - edge0_4) / (
					    ((0.1 + _DotSize) + _SmoothEnd)
					   - edge0_4)), 0.0, 1.0);
					  color_2 = vec3((tmpvar_5 * (tmpvar_5 * (3.0 - 
					    (2.0 * tmpvar_5)
					  ))));
					  highp vec3 tmpvar_6;
					  tmpvar_6.x = 1.0;
					  tmpvar_6.y = _Blood;
					  tmpvar_6.z = _Blood;
					  highp vec3 tmpvar_7;
					  tmpvar_7 = mix (tmpvar_6, (brtColor_1 * vec3(8.88, 8.88, 8.88)), vec3(8.39, 8.39, 8.39));
					  if ((((tmpvar_7.x > _ColorR) && (tmpvar_7.y < _ColorG)) && (tmpvar_7.z < _ColorB))) {
					    color_2 = _ColorRGB.xyz;
					  };
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 1.0;
					  tmpvar_8.xyz = color_2;
					  gl_FragData[0] = tmpvar_8;
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
					uniform 	vec4 _ColorRGB;
					uniform 	float _DotSize;
					uniform 	float _ColorR;
					uniform 	float _ColorG;
					uniform 	float _ColorB;
					uniform 	float _Blood;
					uniform 	float _SmoothStart;
					uniform 	float _SmoothEnd;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					bool u_xlatb3;
					mediump float u_xlat16_6;
					bvec2 u_xlatb6;
					void main()
					{
					    u_xlat0.xy = vec2(_DotSize + float(_SmoothStart), _DotSize + float(_SmoothEnd));
					    u_xlat3.x = u_xlat0.y + 0.100000001;
					    u_xlat3.x = (-u_xlat0.x) + u_xlat3.x;
					    u_xlat3.x = float(1.0) / u_xlat3.x;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_6 = u_xlat10_1.y + u_xlat10_1.x;
					    u_xlat16_6 = u_xlat10_1.z + u_xlat16_6;
					    u_xlat0.x = u_xlat16_6 * 0.333333343 + (-u_xlat0.x);
					    u_xlat0.x = u_xlat3.x * u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat3.x;
					    u_xlat2.x = 1.0;
					    u_xlat2.yz = vec2(_Blood);
					    u_xlat3.xyz = u_xlat10_1.xyz * vec3(8.88000011, 8.88000011, 8.88000011) + (-u_xlat2.xzz);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(8.39000034, 8.39000034, 8.39000034) + u_xlat2.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(_ColorR<u_xlat3.x);
					#else
					    u_xlatb3 = _ColorR<u_xlat3.x;
					#endif
					    u_xlatb6.xy = lessThan(u_xlat3.yzyz, vec4(_ColorG, _ColorB, _ColorG, _ColorB)).xy;
					    u_xlatb3 = u_xlatb6.x && u_xlatb3;
					    u_xlatb3 = u_xlatb6.y && u_xlatb3;
					    SV_Target0.xyz = (bool(u_xlatb3)) ? _ColorRGB.xyz : u_xlat0.xxx;
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
					uniform 	vec4 _ColorRGB;
					uniform 	float _DotSize;
					uniform 	float _ColorR;
					uniform 	float _ColorG;
					uniform 	float _ColorB;
					uniform 	float _Blood;
					uniform 	float _SmoothStart;
					uniform 	float _SmoothEnd;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					bool u_xlatb3;
					mediump float u_xlat16_6;
					bvec2 u_xlatb6;
					void main()
					{
					    u_xlat0.xy = vec2(_DotSize + float(_SmoothStart), _DotSize + float(_SmoothEnd));
					    u_xlat3.x = u_xlat0.y + 0.100000001;
					    u_xlat3.x = (-u_xlat0.x) + u_xlat3.x;
					    u_xlat3.x = float(1.0) / u_xlat3.x;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_6 = u_xlat10_1.y + u_xlat10_1.x;
					    u_xlat16_6 = u_xlat10_1.z + u_xlat16_6;
					    u_xlat0.x = u_xlat16_6 * 0.333333343 + (-u_xlat0.x);
					    u_xlat0.x = u_xlat3.x * u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat3.x;
					    u_xlat2.x = 1.0;
					    u_xlat2.yz = vec2(_Blood);
					    u_xlat3.xyz = u_xlat10_1.xyz * vec3(8.88000011, 8.88000011, 8.88000011) + (-u_xlat2.xzz);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(8.39000034, 8.39000034, 8.39000034) + u_xlat2.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(_ColorR<u_xlat3.x);
					#else
					    u_xlatb3 = _ColorR<u_xlat3.x;
					#endif
					    u_xlatb6.xy = lessThan(u_xlat3.yzyz, vec4(_ColorG, _ColorB, _ColorG, _ColorB)).xy;
					    u_xlatb3 = u_xlatb6.x && u_xlatb3;
					    u_xlatb3 = u_xlatb6.y && u_xlatb3;
					    SV_Target0.xyz = (bool(u_xlatb3)) ? _ColorRGB.xyz : u_xlat0.xxx;
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
					uniform 	vec4 _ColorRGB;
					uniform 	float _DotSize;
					uniform 	float _ColorR;
					uniform 	float _ColorG;
					uniform 	float _ColorB;
					uniform 	float _Blood;
					uniform 	float _SmoothStart;
					uniform 	float _SmoothEnd;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					bool u_xlatb3;
					mediump float u_xlat16_6;
					bvec2 u_xlatb6;
					void main()
					{
					    u_xlat0.xy = vec2(_DotSize + float(_SmoothStart), _DotSize + float(_SmoothEnd));
					    u_xlat3.x = u_xlat0.y + 0.100000001;
					    u_xlat3.x = (-u_xlat0.x) + u_xlat3.x;
					    u_xlat3.x = float(1.0) / u_xlat3.x;
					    u_xlat10_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    u_xlat16_6 = u_xlat10_1.y + u_xlat10_1.x;
					    u_xlat16_6 = u_xlat10_1.z + u_xlat16_6;
					    u_xlat0.x = u_xlat16_6 * 0.333333343 + (-u_xlat0.x);
					    u_xlat0.x = u_xlat3.x * u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat3.x;
					    u_xlat2.x = 1.0;
					    u_xlat2.yz = vec2(_Blood);
					    u_xlat3.xyz = u_xlat10_1.xyz * vec3(8.88000011, 8.88000011, 8.88000011) + (-u_xlat2.xzz);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(8.39000034, 8.39000034, 8.39000034) + u_xlat2.xyz;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb3 = !!(_ColorR<u_xlat3.x);
					#else
					    u_xlatb3 = _ColorR<u_xlat3.x;
					#endif
					    u_xlatb6.xy = lessThan(u_xlat3.yzyz, vec4(_ColorG, _ColorB, _ColorG, _ColorB)).xy;
					    u_xlatb3 = u_xlatb6.x && u_xlatb3;
					    u_xlatb3 = u_xlatb6.y && u_xlatb3;
					    SV_Target0.xyz = (bool(u_xlatb3)) ? _ColorRGB.xyz : u_xlat0.xxx;
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