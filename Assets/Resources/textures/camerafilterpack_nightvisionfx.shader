Shader "CameraFilterPack/NightVisionFX" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 65105
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
					uniform highp float _Vignette;
					uniform highp float _Vignette_Alpha;
					uniform highp float _Greenness;
					uniform highp float _Distortion;
					uniform highp float _Noise;
					uniform highp float _Intensity;
					uniform highp float _Light;
					uniform highp float _Light2;
					uniform highp float _Line;
					uniform highp float _Color_R;
					uniform highp float _Color_G;
					uniform highp float _Color_B;
					uniform highp float _Size;
					uniform highp float _Dist;
					uniform highp float _Smooth;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp vec2 uv_3;
					  uv_3 = (uv_2 - vec2(0.5, 0.5));
					  uv_3 = ((uv_3 * 1.2) * (0.8333333 + (
					    (2.0 * uv_3.x)
					   * 
					    ((uv_3.x * uv_3.y) * uv_3.y)
					  )));
					  uv_3 = (uv_3 + vec2(0.5, 0.5));
					  highp vec2 tmpvar_4;
					  tmpvar_4 = mix (uv_2, uv_3, vec2(_Distortion));
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
					  col_1 = (tmpvar_5.xyz + _Intensity);
					  col_1 = (col_1 + ((
					    fract((sin(dot (
					      (tmpvar_4 * floor((_TimeX * 8.0)))
					    , vec2(12.9898, 78.233))) * 43758.55))
					   / 2.0) * _Noise));
					  mediump float tmpvar_6;
					  mediump vec2 tmpvar_7;
					  tmpvar_7 = (vec2(0.5, 0.5) - xlv_TEXCOORD0);
					  tmpvar_6 = sqrt(dot (tmpvar_7, tmpvar_7));
					  highp float edge0_8;
					  edge0_8 = (0.15 + _Vignette);
					  highp float tmpvar_9;
					  tmpvar_9 = clamp (((tmpvar_6 - edge0_8) / (
					    (0.5 + _Vignette)
					   - edge0_8)), 0.0, 1.0);
					  col_1 = (col_1 - ((tmpvar_9 * 
					    (tmpvar_9 * (3.0 - (2.0 * tmpvar_9)))
					  ) * _Vignette_Alpha));
					  mediump float tmpvar_10;
					  tmpvar_10 = sqrt(dot (tmpvar_7, tmpvar_7));
					  highp float edge0_11;
					  edge0_11 = (0.25 + _Vignette);
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (((tmpvar_10 - edge0_11) / (_Vignette - edge0_11)), 0.0, 1.0);
					  col_1 = (col_1 + ((tmpvar_12 * 
					    (tmpvar_12 * (3.0 - (2.0 * tmpvar_12)))
					  ) * _Light2));
					  highp vec3 tmpvar_13;
					  tmpvar_13.xz = vec2(0.55, 0.55);
					  tmpvar_13.y = (1.55 + (_Greenness / 4.0));
					  col_1 = (col_1 * tmpvar_13);
					  col_1 = (col_1 * mix (1.0, (0.8 + 
					    (0.1 * sin(((10.0 * _TimeX) + (
					      (tmpvar_4.y * 300.0)
					     * _Light))))
					  ), _Line));
					  col_1.x = (col_1.x + _Color_R);
					  col_1.y = (col_1.y + _Color_G);
					  col_1.z = (col_1.z + _Color_B);
					  uv_2 = xlv_TEXCOORD0;
					  uv_2.x = (uv_2.x / 0.72);
					  highp float tmpvar_14;
					  tmpvar_14 = (_Size - _Smooth);
					  highp vec2 tmpvar_15;
					  tmpvar_15.y = 0.5;
					  tmpvar_15.x = (0.694 + _Dist);
					  highp vec2 x_16;
					  x_16 = (tmpvar_15 - uv_2);
					  highp float tmpvar_17;
					  tmpvar_17 = clamp (((
					    sqrt(dot (x_16, x_16))
					   - _Size) / (tmpvar_14 - _Size)), 0.0, 1.0);
					  highp vec2 tmpvar_18;
					  tmpvar_18.y = 0.5;
					  tmpvar_18.x = (0.694 - _Dist);
					  highp vec2 x_19;
					  x_19 = (tmpvar_18 - uv_2);
					  highp float tmpvar_20;
					  tmpvar_20 = clamp (((
					    sqrt(dot (x_19, x_19))
					   - _Size) / (tmpvar_14 - _Size)), 0.0, 1.0);
					  highp vec3 tmpvar_21;
					  tmpvar_21 = (col_1 * (vec3(1.0, 1.0, 1.0) - vec3((
					    (1.0 - (tmpvar_17 * (tmpvar_17 * (3.0 - 
					      (2.0 * tmpvar_17)
					    ))))
					   * 
					    (1.0 - (tmpvar_20 * (tmpvar_20 * (3.0 - 
					      (2.0 * tmpvar_20)
					    ))))
					  ))));
					  col_1 = tmpvar_21;
					  highp vec4 tmpvar_22;
					  tmpvar_22.w = 1.0;
					  tmpvar_22.xyz = tmpvar_21;
					  gl_FragData[0] = tmpvar_22;
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
					uniform highp float _Vignette;
					uniform highp float _Vignette_Alpha;
					uniform highp float _Greenness;
					uniform highp float _Distortion;
					uniform highp float _Noise;
					uniform highp float _Intensity;
					uniform highp float _Light;
					uniform highp float _Light2;
					uniform highp float _Line;
					uniform highp float _Color_R;
					uniform highp float _Color_G;
					uniform highp float _Color_B;
					uniform highp float _Size;
					uniform highp float _Dist;
					uniform highp float _Smooth;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp vec2 uv_3;
					  uv_3 = (uv_2 - vec2(0.5, 0.5));
					  uv_3 = ((uv_3 * 1.2) * (0.8333333 + (
					    (2.0 * uv_3.x)
					   * 
					    ((uv_3.x * uv_3.y) * uv_3.y)
					  )));
					  uv_3 = (uv_3 + vec2(0.5, 0.5));
					  highp vec2 tmpvar_4;
					  tmpvar_4 = mix (uv_2, uv_3, vec2(_Distortion));
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
					  col_1 = (tmpvar_5.xyz + _Intensity);
					  col_1 = (col_1 + ((
					    fract((sin(dot (
					      (tmpvar_4 * floor((_TimeX * 8.0)))
					    , vec2(12.9898, 78.233))) * 43758.55))
					   / 2.0) * _Noise));
					  mediump float tmpvar_6;
					  mediump vec2 tmpvar_7;
					  tmpvar_7 = (vec2(0.5, 0.5) - xlv_TEXCOORD0);
					  tmpvar_6 = sqrt(dot (tmpvar_7, tmpvar_7));
					  highp float edge0_8;
					  edge0_8 = (0.15 + _Vignette);
					  highp float tmpvar_9;
					  tmpvar_9 = clamp (((tmpvar_6 - edge0_8) / (
					    (0.5 + _Vignette)
					   - edge0_8)), 0.0, 1.0);
					  col_1 = (col_1 - ((tmpvar_9 * 
					    (tmpvar_9 * (3.0 - (2.0 * tmpvar_9)))
					  ) * _Vignette_Alpha));
					  mediump float tmpvar_10;
					  tmpvar_10 = sqrt(dot (tmpvar_7, tmpvar_7));
					  highp float edge0_11;
					  edge0_11 = (0.25 + _Vignette);
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (((tmpvar_10 - edge0_11) / (_Vignette - edge0_11)), 0.0, 1.0);
					  col_1 = (col_1 + ((tmpvar_12 * 
					    (tmpvar_12 * (3.0 - (2.0 * tmpvar_12)))
					  ) * _Light2));
					  highp vec3 tmpvar_13;
					  tmpvar_13.xz = vec2(0.55, 0.55);
					  tmpvar_13.y = (1.55 + (_Greenness / 4.0));
					  col_1 = (col_1 * tmpvar_13);
					  col_1 = (col_1 * mix (1.0, (0.8 + 
					    (0.1 * sin(((10.0 * _TimeX) + (
					      (tmpvar_4.y * 300.0)
					     * _Light))))
					  ), _Line));
					  col_1.x = (col_1.x + _Color_R);
					  col_1.y = (col_1.y + _Color_G);
					  col_1.z = (col_1.z + _Color_B);
					  uv_2 = xlv_TEXCOORD0;
					  uv_2.x = (uv_2.x / 0.72);
					  highp float tmpvar_14;
					  tmpvar_14 = (_Size - _Smooth);
					  highp vec2 tmpvar_15;
					  tmpvar_15.y = 0.5;
					  tmpvar_15.x = (0.694 + _Dist);
					  highp vec2 x_16;
					  x_16 = (tmpvar_15 - uv_2);
					  highp float tmpvar_17;
					  tmpvar_17 = clamp (((
					    sqrt(dot (x_16, x_16))
					   - _Size) / (tmpvar_14 - _Size)), 0.0, 1.0);
					  highp vec2 tmpvar_18;
					  tmpvar_18.y = 0.5;
					  tmpvar_18.x = (0.694 - _Dist);
					  highp vec2 x_19;
					  x_19 = (tmpvar_18 - uv_2);
					  highp float tmpvar_20;
					  tmpvar_20 = clamp (((
					    sqrt(dot (x_19, x_19))
					   - _Size) / (tmpvar_14 - _Size)), 0.0, 1.0);
					  highp vec3 tmpvar_21;
					  tmpvar_21 = (col_1 * (vec3(1.0, 1.0, 1.0) - vec3((
					    (1.0 - (tmpvar_17 * (tmpvar_17 * (3.0 - 
					      (2.0 * tmpvar_17)
					    ))))
					   * 
					    (1.0 - (tmpvar_20 * (tmpvar_20 * (3.0 - 
					      (2.0 * tmpvar_20)
					    ))))
					  ))));
					  col_1 = tmpvar_21;
					  highp vec4 tmpvar_22;
					  tmpvar_22.w = 1.0;
					  tmpvar_22.xyz = tmpvar_21;
					  gl_FragData[0] = tmpvar_22;
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
					uniform highp float _Vignette;
					uniform highp float _Vignette_Alpha;
					uniform highp float _Greenness;
					uniform highp float _Distortion;
					uniform highp float _Noise;
					uniform highp float _Intensity;
					uniform highp float _Light;
					uniform highp float _Light2;
					uniform highp float _Line;
					uniform highp float _Color_R;
					uniform highp float _Color_G;
					uniform highp float _Color_B;
					uniform highp float _Size;
					uniform highp float _Dist;
					uniform highp float _Smooth;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec3 col_1;
					  highp vec2 uv_2;
					  uv_2 = xlv_TEXCOORD0;
					  highp vec2 uv_3;
					  uv_3 = (uv_2 - vec2(0.5, 0.5));
					  uv_3 = ((uv_3 * 1.2) * (0.8333333 + (
					    (2.0 * uv_3.x)
					   * 
					    ((uv_3.x * uv_3.y) * uv_3.y)
					  )));
					  uv_3 = (uv_3 + vec2(0.5, 0.5));
					  highp vec2 tmpvar_4;
					  tmpvar_4 = mix (uv_2, uv_3, vec2(_Distortion));
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, tmpvar_4);
					  col_1 = (tmpvar_5.xyz + _Intensity);
					  col_1 = (col_1 + ((
					    fract((sin(dot (
					      (tmpvar_4 * floor((_TimeX * 8.0)))
					    , vec2(12.9898, 78.233))) * 43758.55))
					   / 2.0) * _Noise));
					  mediump float tmpvar_6;
					  mediump vec2 tmpvar_7;
					  tmpvar_7 = (vec2(0.5, 0.5) - xlv_TEXCOORD0);
					  tmpvar_6 = sqrt(dot (tmpvar_7, tmpvar_7));
					  highp float edge0_8;
					  edge0_8 = (0.15 + _Vignette);
					  highp float tmpvar_9;
					  tmpvar_9 = clamp (((tmpvar_6 - edge0_8) / (
					    (0.5 + _Vignette)
					   - edge0_8)), 0.0, 1.0);
					  col_1 = (col_1 - ((tmpvar_9 * 
					    (tmpvar_9 * (3.0 - (2.0 * tmpvar_9)))
					  ) * _Vignette_Alpha));
					  mediump float tmpvar_10;
					  tmpvar_10 = sqrt(dot (tmpvar_7, tmpvar_7));
					  highp float edge0_11;
					  edge0_11 = (0.25 + _Vignette);
					  highp float tmpvar_12;
					  tmpvar_12 = clamp (((tmpvar_10 - edge0_11) / (_Vignette - edge0_11)), 0.0, 1.0);
					  col_1 = (col_1 + ((tmpvar_12 * 
					    (tmpvar_12 * (3.0 - (2.0 * tmpvar_12)))
					  ) * _Light2));
					  highp vec3 tmpvar_13;
					  tmpvar_13.xz = vec2(0.55, 0.55);
					  tmpvar_13.y = (1.55 + (_Greenness / 4.0));
					  col_1 = (col_1 * tmpvar_13);
					  col_1 = (col_1 * mix (1.0, (0.8 + 
					    (0.1 * sin(((10.0 * _TimeX) + (
					      (tmpvar_4.y * 300.0)
					     * _Light))))
					  ), _Line));
					  col_1.x = (col_1.x + _Color_R);
					  col_1.y = (col_1.y + _Color_G);
					  col_1.z = (col_1.z + _Color_B);
					  uv_2 = xlv_TEXCOORD0;
					  uv_2.x = (uv_2.x / 0.72);
					  highp float tmpvar_14;
					  tmpvar_14 = (_Size - _Smooth);
					  highp vec2 tmpvar_15;
					  tmpvar_15.y = 0.5;
					  tmpvar_15.x = (0.694 + _Dist);
					  highp vec2 x_16;
					  x_16 = (tmpvar_15 - uv_2);
					  highp float tmpvar_17;
					  tmpvar_17 = clamp (((
					    sqrt(dot (x_16, x_16))
					   - _Size) / (tmpvar_14 - _Size)), 0.0, 1.0);
					  highp vec2 tmpvar_18;
					  tmpvar_18.y = 0.5;
					  tmpvar_18.x = (0.694 - _Dist);
					  highp vec2 x_19;
					  x_19 = (tmpvar_18 - uv_2);
					  highp float tmpvar_20;
					  tmpvar_20 = clamp (((
					    sqrt(dot (x_19, x_19))
					   - _Size) / (tmpvar_14 - _Size)), 0.0, 1.0);
					  highp vec3 tmpvar_21;
					  tmpvar_21 = (col_1 * (vec3(1.0, 1.0, 1.0) - vec3((
					    (1.0 - (tmpvar_17 * (tmpvar_17 * (3.0 - 
					      (2.0 * tmpvar_17)
					    ))))
					   * 
					    (1.0 - (tmpvar_20 * (tmpvar_20 * (3.0 - 
					      (2.0 * tmpvar_20)
					    ))))
					  ))));
					  col_1 = tmpvar_21;
					  highp vec4 tmpvar_22;
					  tmpvar_22.w = 1.0;
					  tmpvar_22.xyz = tmpvar_21;
					  gl_FragData[0] = tmpvar_22;
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
					uniform 	float _Vignette;
					uniform 	float _Vignette_Alpha;
					uniform 	float _Greenness;
					uniform 	float _Distortion;
					uniform 	float _Noise;
					uniform 	float _Intensity;
					uniform 	float _Light;
					uniform 	float _Light2;
					uniform 	float _Line;
					uniform 	float _Color_R;
					uniform 	float _Color_G;
					uniform 	float _Color_B;
					uniform 	float _Size;
					uniform 	float _Dist;
					uniform 	float _Smooth;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump float u_xlat16_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					mediump vec2 u_xlat16_3;
					vec2 u_xlat6;
					mediump vec2 u_xlat16_6;
					float u_xlat9;
					mediump float u_xlat16_9;
					void main()
					{
					    u_xlat16_0 = vs_TEXCOORD0.x * 1.38888884;
					    u_xlat0.y = (-u_xlat16_0);
					    u_xlat1.x = _Dist + 0.694000006;
					    u_xlat1.y = 0.5;
					    u_xlat0.z = (-vs_TEXCOORD0.y);
					    u_xlat3.xz = vec2(u_xlat0.y + u_xlat1.x, u_xlat0.z + u_xlat1.y);
					    u_xlat3.x = dot(u_xlat3.xz, u_xlat3.xz);
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x + (-_Size);
					    u_xlat9 = float(1.0) / (-_Smooth);
					    u_xlat3.x = u_xlat9 * u_xlat3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
					#else
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat3.x * -2.0 + 3.0;
					    u_xlat3.x = u_xlat3.x * u_xlat3.x;
					    u_xlat3.x = (-u_xlat1.x) * u_xlat3.x + 1.0;
					    u_xlat0.x = (-vs_TEXCOORD0.x) * 1.38888884 + (-_Dist);
					    u_xlat0.xz = u_xlat0.xz + vec2(0.694000006, 0.5);
					    u_xlat0.x = dot(u_xlat0.xz, u_xlat0.xz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Size);
					    u_xlat0.x = u_xlat9 * u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat6.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat3.x;
					    u_xlat16_3.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_1.xy = u_xlat16_3.xy * u_xlat16_3.xy;
					    u_xlat16_3.xy = u_xlat16_3.xy * vec2(1.20000005, 1.20000005);
					    u_xlat16_9 = dot(u_xlat16_1.yy, u_xlat16_1.xx);
					    u_xlat16_9 = u_xlat16_9 + 0.833333313;
					    u_xlat16_3.xy = u_xlat16_3.xy * vec2(u_xlat16_9) + vec2(0.5, 0.5);
					    u_xlat16_3.xy = u_xlat16_3.xy + (-vs_TEXCOORD0.xy);
					    u_xlat3.xy = vec2(vec2(_Distortion, _Distortion)) * u_xlat16_3.xy + vs_TEXCOORD0.xy;
					    u_xlat1.xy = vec2(_TimeX) * vec2(8.0, 10.0);
					    u_xlat9 = floor(u_xlat1.x);
					    u_xlat1.xz = vec2(u_xlat9) * u_xlat3.xy;
					    u_xlat9 = dot(u_xlat1.xz, vec2(12.9898005, 78.2330017));
					    u_xlat9 = sin(u_xlat9);
					    u_xlat9 = u_xlat9 * 43758.5469;
					    u_xlat9 = fract(u_xlat9);
					    u_xlat9 = u_xlat9 * _Noise;
					    u_xlat10_1.xzw = texture(_MainTex, u_xlat3.xy).xyz;
					    u_xlat3.x = u_xlat3.y * _Light;
					    u_xlat3.x = u_xlat3.x * 300.0 + u_xlat1.y;
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 0.100000001 + -0.199999988;
					    u_xlat3.x = _Line * u_xlat3.x + 1.0;
					    u_xlat1.xyz = u_xlat10_1.xzw + vec3(vec3(_Intensity, _Intensity, _Intensity));
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat16_6.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_6.x = dot(u_xlat16_6.xy, u_xlat16_6.xy);
					    u_xlat16_6.x = sqrt(u_xlat16_6.x);
					    u_xlat2.xy = vec2(vec2(_Vignette, _Vignette)) + vec2(0.150000006, 0.25);
					    u_xlat6.xy = u_xlat16_6.xx + (-u_xlat2.xy);
					    u_xlat6.xy = u_xlat6.xy * vec2(2.85714293, -4.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.xy = min(max(u_xlat6.xy, 0.0), 1.0);
					#else
					    u_xlat6.xy = clamp(u_xlat6.xy, 0.0, 1.0);
					#endif
					    u_xlat2.xy = u_xlat6.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
					    u_xlat6.xy = u_xlat6.xy * u_xlat6.xy;
					    u_xlat6.xy = u_xlat6.xy * u_xlat2.xy;
					    u_xlat1.xyz = (-u_xlat6.xxx) * vec3(vec3(_Vignette_Alpha, _Vignette_Alpha, _Vignette_Alpha)) + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat6.yyy * vec3(vec3(_Light2, _Light2, _Light2)) + u_xlat1.xyz;
					    u_xlat6.x = _Greenness * 0.25 + 1.54999995;
					    u_xlat2.y = u_xlat6.x * u_xlat1.y;
					    u_xlat2.xz = u_xlat1.xz * vec2(0.550000012, 0.550000012);
					    u_xlat1.yz = u_xlat2.yz * u_xlat3.xx + vec2(_Color_G, _Color_B);
					    u_xlat1.x = u_xlat2.x * u_xlat3.x + _Color_R;
					    SV_Target0.xyz = u_xlat0.xxx * (-u_xlat1.xyz) + u_xlat1.xyz;
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
					uniform 	float _Vignette;
					uniform 	float _Vignette_Alpha;
					uniform 	float _Greenness;
					uniform 	float _Distortion;
					uniform 	float _Noise;
					uniform 	float _Intensity;
					uniform 	float _Light;
					uniform 	float _Light2;
					uniform 	float _Line;
					uniform 	float _Color_R;
					uniform 	float _Color_G;
					uniform 	float _Color_B;
					uniform 	float _Size;
					uniform 	float _Dist;
					uniform 	float _Smooth;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump float u_xlat16_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					mediump vec2 u_xlat16_3;
					vec2 u_xlat6;
					mediump vec2 u_xlat16_6;
					float u_xlat9;
					mediump float u_xlat16_9;
					void main()
					{
					    u_xlat16_0 = vs_TEXCOORD0.x * 1.38888884;
					    u_xlat0.y = (-u_xlat16_0);
					    u_xlat1.x = _Dist + 0.694000006;
					    u_xlat1.y = 0.5;
					    u_xlat0.z = (-vs_TEXCOORD0.y);
					    u_xlat3.xz = vec2(u_xlat0.y + u_xlat1.x, u_xlat0.z + u_xlat1.y);
					    u_xlat3.x = dot(u_xlat3.xz, u_xlat3.xz);
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x + (-_Size);
					    u_xlat9 = float(1.0) / (-_Smooth);
					    u_xlat3.x = u_xlat9 * u_xlat3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
					#else
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat3.x * -2.0 + 3.0;
					    u_xlat3.x = u_xlat3.x * u_xlat3.x;
					    u_xlat3.x = (-u_xlat1.x) * u_xlat3.x + 1.0;
					    u_xlat0.x = (-vs_TEXCOORD0.x) * 1.38888884 + (-_Dist);
					    u_xlat0.xz = u_xlat0.xz + vec2(0.694000006, 0.5);
					    u_xlat0.x = dot(u_xlat0.xz, u_xlat0.xz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Size);
					    u_xlat0.x = u_xlat9 * u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat6.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat3.x;
					    u_xlat16_3.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_1.xy = u_xlat16_3.xy * u_xlat16_3.xy;
					    u_xlat16_3.xy = u_xlat16_3.xy * vec2(1.20000005, 1.20000005);
					    u_xlat16_9 = dot(u_xlat16_1.yy, u_xlat16_1.xx);
					    u_xlat16_9 = u_xlat16_9 + 0.833333313;
					    u_xlat16_3.xy = u_xlat16_3.xy * vec2(u_xlat16_9) + vec2(0.5, 0.5);
					    u_xlat16_3.xy = u_xlat16_3.xy + (-vs_TEXCOORD0.xy);
					    u_xlat3.xy = vec2(vec2(_Distortion, _Distortion)) * u_xlat16_3.xy + vs_TEXCOORD0.xy;
					    u_xlat1.xy = vec2(_TimeX) * vec2(8.0, 10.0);
					    u_xlat9 = floor(u_xlat1.x);
					    u_xlat1.xz = vec2(u_xlat9) * u_xlat3.xy;
					    u_xlat9 = dot(u_xlat1.xz, vec2(12.9898005, 78.2330017));
					    u_xlat9 = sin(u_xlat9);
					    u_xlat9 = u_xlat9 * 43758.5469;
					    u_xlat9 = fract(u_xlat9);
					    u_xlat9 = u_xlat9 * _Noise;
					    u_xlat10_1.xzw = texture(_MainTex, u_xlat3.xy).xyz;
					    u_xlat3.x = u_xlat3.y * _Light;
					    u_xlat3.x = u_xlat3.x * 300.0 + u_xlat1.y;
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 0.100000001 + -0.199999988;
					    u_xlat3.x = _Line * u_xlat3.x + 1.0;
					    u_xlat1.xyz = u_xlat10_1.xzw + vec3(vec3(_Intensity, _Intensity, _Intensity));
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat16_6.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_6.x = dot(u_xlat16_6.xy, u_xlat16_6.xy);
					    u_xlat16_6.x = sqrt(u_xlat16_6.x);
					    u_xlat2.xy = vec2(vec2(_Vignette, _Vignette)) + vec2(0.150000006, 0.25);
					    u_xlat6.xy = u_xlat16_6.xx + (-u_xlat2.xy);
					    u_xlat6.xy = u_xlat6.xy * vec2(2.85714293, -4.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.xy = min(max(u_xlat6.xy, 0.0), 1.0);
					#else
					    u_xlat6.xy = clamp(u_xlat6.xy, 0.0, 1.0);
					#endif
					    u_xlat2.xy = u_xlat6.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
					    u_xlat6.xy = u_xlat6.xy * u_xlat6.xy;
					    u_xlat6.xy = u_xlat6.xy * u_xlat2.xy;
					    u_xlat1.xyz = (-u_xlat6.xxx) * vec3(vec3(_Vignette_Alpha, _Vignette_Alpha, _Vignette_Alpha)) + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat6.yyy * vec3(vec3(_Light2, _Light2, _Light2)) + u_xlat1.xyz;
					    u_xlat6.x = _Greenness * 0.25 + 1.54999995;
					    u_xlat2.y = u_xlat6.x * u_xlat1.y;
					    u_xlat2.xz = u_xlat1.xz * vec2(0.550000012, 0.550000012);
					    u_xlat1.yz = u_xlat2.yz * u_xlat3.xx + vec2(_Color_G, _Color_B);
					    u_xlat1.x = u_xlat2.x * u_xlat3.x + _Color_R;
					    SV_Target0.xyz = u_xlat0.xxx * (-u_xlat1.xyz) + u_xlat1.xyz;
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
					uniform 	float _Vignette;
					uniform 	float _Vignette_Alpha;
					uniform 	float _Greenness;
					uniform 	float _Distortion;
					uniform 	float _Noise;
					uniform 	float _Intensity;
					uniform 	float _Light;
					uniform 	float _Light2;
					uniform 	float _Line;
					uniform 	float _Color_R;
					uniform 	float _Color_G;
					uniform 	float _Color_B;
					uniform 	float _Size;
					uniform 	float _Dist;
					uniform 	float _Smooth;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump float u_xlat16_0;
					vec3 u_xlat1;
					mediump vec2 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					mediump vec2 u_xlat16_3;
					vec2 u_xlat6;
					mediump vec2 u_xlat16_6;
					float u_xlat9;
					mediump float u_xlat16_9;
					void main()
					{
					    u_xlat16_0 = vs_TEXCOORD0.x * 1.38888884;
					    u_xlat0.y = (-u_xlat16_0);
					    u_xlat1.x = _Dist + 0.694000006;
					    u_xlat1.y = 0.5;
					    u_xlat0.z = (-vs_TEXCOORD0.y);
					    u_xlat3.xz = vec2(u_xlat0.y + u_xlat1.x, u_xlat0.z + u_xlat1.y);
					    u_xlat3.x = dot(u_xlat3.xz, u_xlat3.xz);
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x + (-_Size);
					    u_xlat9 = float(1.0) / (-_Smooth);
					    u_xlat3.x = u_xlat9 * u_xlat3.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
					#else
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					#endif
					    u_xlat1.x = u_xlat3.x * -2.0 + 3.0;
					    u_xlat3.x = u_xlat3.x * u_xlat3.x;
					    u_xlat3.x = (-u_xlat1.x) * u_xlat3.x + 1.0;
					    u_xlat0.x = (-vs_TEXCOORD0.x) * 1.38888884 + (-_Dist);
					    u_xlat0.xz = u_xlat0.xz + vec2(0.694000006, 0.5);
					    u_xlat0.x = dot(u_xlat0.xz, u_xlat0.xz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Size);
					    u_xlat0.x = u_xlat9 * u_xlat0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
					#else
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					#endif
					    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat6.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat3.x;
					    u_xlat16_3.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_1.xy = u_xlat16_3.xy * u_xlat16_3.xy;
					    u_xlat16_3.xy = u_xlat16_3.xy * vec2(1.20000005, 1.20000005);
					    u_xlat16_9 = dot(u_xlat16_1.yy, u_xlat16_1.xx);
					    u_xlat16_9 = u_xlat16_9 + 0.833333313;
					    u_xlat16_3.xy = u_xlat16_3.xy * vec2(u_xlat16_9) + vec2(0.5, 0.5);
					    u_xlat16_3.xy = u_xlat16_3.xy + (-vs_TEXCOORD0.xy);
					    u_xlat3.xy = vec2(vec2(_Distortion, _Distortion)) * u_xlat16_3.xy + vs_TEXCOORD0.xy;
					    u_xlat1.xy = vec2(_TimeX) * vec2(8.0, 10.0);
					    u_xlat9 = floor(u_xlat1.x);
					    u_xlat1.xz = vec2(u_xlat9) * u_xlat3.xy;
					    u_xlat9 = dot(u_xlat1.xz, vec2(12.9898005, 78.2330017));
					    u_xlat9 = sin(u_xlat9);
					    u_xlat9 = u_xlat9 * 43758.5469;
					    u_xlat9 = fract(u_xlat9);
					    u_xlat9 = u_xlat9 * _Noise;
					    u_xlat10_1.xzw = texture(_MainTex, u_xlat3.xy).xyz;
					    u_xlat3.x = u_xlat3.y * _Light;
					    u_xlat3.x = u_xlat3.x * 300.0 + u_xlat1.y;
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 0.100000001 + -0.199999988;
					    u_xlat3.x = _Line * u_xlat3.x + 1.0;
					    u_xlat1.xyz = u_xlat10_1.xzw + vec3(vec3(_Intensity, _Intensity, _Intensity));
					    u_xlat1.xyz = vec3(u_xlat9) * vec3(0.5, 0.5, 0.5) + u_xlat1.xyz;
					    u_xlat16_6.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat16_6.x = dot(u_xlat16_6.xy, u_xlat16_6.xy);
					    u_xlat16_6.x = sqrt(u_xlat16_6.x);
					    u_xlat2.xy = vec2(vec2(_Vignette, _Vignette)) + vec2(0.150000006, 0.25);
					    u_xlat6.xy = u_xlat16_6.xx + (-u_xlat2.xy);
					    u_xlat6.xy = u_xlat6.xy * vec2(2.85714293, -4.0);
					#ifdef UNITY_ADRENO_ES3
					    u_xlat6.xy = min(max(u_xlat6.xy, 0.0), 1.0);
					#else
					    u_xlat6.xy = clamp(u_xlat6.xy, 0.0, 1.0);
					#endif
					    u_xlat2.xy = u_xlat6.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
					    u_xlat6.xy = u_xlat6.xy * u_xlat6.xy;
					    u_xlat6.xy = u_xlat6.xy * u_xlat2.xy;
					    u_xlat1.xyz = (-u_xlat6.xxx) * vec3(vec3(_Vignette_Alpha, _Vignette_Alpha, _Vignette_Alpha)) + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat6.yyy * vec3(vec3(_Light2, _Light2, _Light2)) + u_xlat1.xyz;
					    u_xlat6.x = _Greenness * 0.25 + 1.54999995;
					    u_xlat2.y = u_xlat6.x * u_xlat1.y;
					    u_xlat2.xz = u_xlat1.xz * vec2(0.550000012, 0.550000012);
					    u_xlat1.yz = u_xlat2.yz * u_xlat3.xx + vec2(_Color_G, _Color_B);
					    u_xlat1.x = u_xlat2.x * u_xlat3.x + _Color_R;
					    SV_Target0.xyz = u_xlat0.xxx * (-u_xlat1.xyz) + u_xlat1.xyz;
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