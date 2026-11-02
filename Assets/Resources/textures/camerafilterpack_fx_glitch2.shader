Shader "CameraFilterPack/FX_Glitch2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 45304
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
					#ifndef SHADER_TARGET
					    #define SHADER_TARGET 30
					#endif
					#ifndef UNITY_NO_DXT5nm
					    #define UNITY_NO_DXT5nm 1
					#endif
					#ifndef UNITY_NO_RGBM
					    #define UNITY_NO_RGBM 1
					#endif
					#ifndef UNITY_NO_SCREENSPACE_SHADOWS
					    #define UNITY_NO_SCREENSPACE_SHADOWS 1
					#endif
					#ifndef UNITY_ENABLE_REFLECTION_BUFFERS
					    #define UNITY_ENABLE_REFLECTION_BUFFERS 1
					#endif
					#ifndef UNITY_FRAMEBUFFER_FETCH_AVAILABLE
					    #define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
					#endif
					#ifndef UNITY_NO_FULL_STANDARD_SHADER
					    #define UNITY_NO_FULL_STANDARD_SHADER 1
					#endif
					#ifndef UNITY_PBS_USE_BRDF3
					    #define UNITY_PBS_USE_BRDF3 1
					#endif
					#ifndef SHADER_API_MOBILE
					    #define SHADER_API_MOBILE 1
					#endif
					#ifndef UNITY_HARDWARE_TIER1
					    #define UNITY_HARDWARE_TIER1 1
					#endif
					#ifndef UNITY_COLORSPACE_GAMMA
					    #define UNITY_COLORSPACE_GAMMA 1
					#endif
					#ifndef UNITY_VERSION
					    #define UNITY_VERSION 551
					#endif
					#ifndef SHADER_API_GLES
					    #define SHADER_API_GLES 1
					#endif
					
					#line 459
					struct v2f_vertex_lit {
					    highp vec2 uv;
					    lowp vec4 diff;
					    lowp vec4 spec;
					};
					#line 606
					struct v2f_img {
					    highp vec4 pos;
					    mediump vec2 uv;
					};
					#line 600
					struct appdata_img {
					    highp vec4 vertex;
					    mediump vec2 texcoord;
					};
					#line 34
					struct v2f {
					    mediump vec2 texcoord;
					    highp vec4 vertex;
					    lowp vec4 color;
					};
					#line 28
					struct appdata_t {
					    highp vec4 vertex;
					    highp vec4 color;
					    highp vec2 texcoord;
					};
					#line 55
					uniform highp vec4 _Time;
					uniform highp vec4 _SinTime;
					uniform highp vec4 _CosTime;
					uniform highp vec4 unity_DeltaTime;
					#line 61
					uniform highp vec3 _WorldSpaceCameraPos;
					#line 68
					uniform highp vec4 _ProjectionParams;
					#line 74
					uniform highp vec4 _ScreenParams;
					#line 81
					uniform highp vec4 _ZBufferParams;
					#line 87
					uniform highp vec4 unity_OrthoParams;
					#line 92
					uniform highp vec4 unity_CameraWorldClipPlanes[6];
					#line 98
					uniform highp mat4 unity_CameraProjection;
					uniform highp mat4 unity_CameraInvProjection;
					uniform highp mat4 unity_WorldToCamera;
					uniform highp mat4 unity_CameraToWorld;
					#line 114
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform highp vec4 _LightPositionRange;
					#line 119
					uniform highp vec4 unity_4LightPosX0;
					uniform highp vec4 unity_4LightPosY0;
					uniform highp vec4 unity_4LightPosZ0;
					uniform mediump vec4 unity_4LightAtten0;
					#line 124
					uniform mediump vec4 unity_LightColor[8];
					uniform highp vec4 unity_LightPosition[8];
					#line 132
					uniform mediump vec4 unity_LightAtten[8];
					uniform highp vec4 unity_SpotDirection[8];
					#line 136
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					#line 140
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					#line 146
					uniform mediump vec3 unity_LightColor0;
					uniform mediump vec3 unity_LightColor1;
					uniform mediump vec3 unity_LightColor2;
					uniform mediump vec3 unity_LightColor3;
					#line 153
					uniform highp vec4 unity_ShadowSplitSpheres[4];
					uniform highp vec4 unity_ShadowSplitSqRadii;
					uniform highp vec4 unity_LightShadowBias;
					uniform highp vec4 _LightSplitsNear;
					#line 157
					uniform highp vec4 _LightSplitsFar;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform mediump vec4 _LightShadowData;
					uniform highp vec4 unity_ShadowFadeCenterAndType;
					#line 167
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 glstate_matrix_modelview0;
					uniform highp mat4 glstate_matrix_invtrans_modelview0;
					#line 172
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_LODFade;
					uniform highp vec4 unity_WorldTransformParams;
					#line 200
					uniform highp mat4 glstate_matrix_transpose_modelview0;
					#line 208
					uniform lowp vec4 glstate_lightmodel_ambient;
					uniform lowp vec4 unity_AmbientSky;
					uniform lowp vec4 unity_AmbientEquator;
					uniform lowp vec4 unity_AmbientGround;
					#line 212
					uniform lowp vec4 unity_IndirectSpecColor;
					uniform highp mat4 glstate_matrix_projection;
					#line 216
					uniform highp mat4 unity_MatrixV;
					uniform highp mat4 unity_MatrixInvV;
					uniform highp mat4 unity_MatrixVP;
					uniform highp int unity_StereoEyeIndex;
					#line 228
					uniform lowp vec4 unity_FogColor;
					#line 233
					uniform highp vec4 unity_FogParams;
					#line 241
					uniform sampler2D unity_Lightmap;
					uniform sampler2D unity_LightmapInd;
					#line 246
					uniform sampler2D unity_DynamicLightmap;
					uniform sampler2D unity_DynamicDirectionality;
					uniform sampler2D unity_DynamicNormal;
					#line 251
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					#line 259
					uniform samplerCube unity_SpecCube0;
					uniform samplerCube unity_SpecCube1;
					#line 263
					uniform highp vec4 unity_SpecCube0_BoxMax;
					uniform highp vec4 unity_SpecCube0_BoxMin;
					uniform highp vec4 unity_SpecCube0_ProbePosition;
					uniform mediump vec4 unity_SpecCube0_HDR;
					#line 268
					uniform highp vec4 unity_SpecCube1_BoxMax;
					uniform highp vec4 unity_SpecCube1_BoxMin;
					uniform highp vec4 unity_SpecCube1_ProbePosition;
					uniform mediump vec4 unity_SpecCube1_HDR;
					#line 76
					#line 85
					#line 95
					#line 104
					#line 116
					#line 127
					#line 136
					#line 143
					#line 149
					#line 155
					#line 163
					#line 169
					#line 175
					#line 181
					#line 187
					#line 198
					#line 213
					#line 220
					#line 235
					#line 242
					#line 249
					#line 267
					#line 303
					#line 332
					#line 338
					#line 351
					#line 369
					#line 385
					#line 439
					#line 465
					#line 476
					#line 485
					#line 492
					#line 497
					#line 515
					#line 535
					#line 550
					#line 555
					uniform mediump vec4 unity_Lightmap_HDR;
					#line 566
					uniform mediump vec4 unity_DynamicLightmap_HDR;
					#line 573
					#line 583
					#line 612
					#line 618
					#line 628
					#line 637
					#line 644
					#line 653
					#line 661
					#line 670
					#line 689
					#line 695
					#line 703
					#line 714
					#line 719
					#line 770
					#line 798
					#line 806
					#line 810
					#line 816
					#line 825
					#line 835
					#line 870
					#line 25
					uniform sampler2D _MainTex;
					uniform highp float _TimeX;
					uniform highp vec4 _ScreenResolution;
					#line 40
					#line 48
					#line 54
					#line 66
					#line 48
					highp float hash( in highp float n ) {
					    return fract((sin(n) * 43812.18));
					}
					#line 66
					highp float noise( in highp vec3 p ) {
					    highp vec3 pi = floor(p);
					    #line 70
					    highp vec3 pf = fract(p);
					    highp float n = ((pi.x + (59.0 * pi.y)) + (256.0 * pi.z));
					    pf.x = ((pf.x * pf.x) * (3.0 - (2.0 * pf.x)));
					    pf.y = ((pf.y * pf.y) * (3.0 - (2.0 * pf.y)));
					    #line 74
					    pf.z = sin(pf.z);
					    highp float v1 = mix( mix( hash( n), hash( (n + 1.0)), pf.x), mix( hash( (n + 59.0)), hash( ((n + 1.0) + 59.0)), pf.x), pf.y);
					    #line 81
					    highp float v2 = mix( mix( hash( (n + 256.0)), hash( ((n + 1.0) + 256.0)), pf.x), mix( hash( ((n + 59.0) + 256.0)), hash( (((n + 1.0) + 59.0) + 256.0)), pf.x), pf.y);
					    #line 86
					    return mix( v1, v2, pf.z);
					}
					#line 89
					highp vec4 frag( in v2f i ) {
					    #line 91
					    highp vec2 uv = i.texcoord.xy;
					    uv -= 0.5;
					    highp float _TimeX = (_TimeX_1 / 30.0);
					    #line 95
					    _TimeX = (0.5 + (0.5 * sin((_TimeX * 6.238))));
					    _TimeX = texture2D( _MainTex, vec2( 0.5, 0.5)).x;
					    if ((_TimeX < 0.2)){
					        uv *= 1.0;
					    }
					    else{
					        if ((_TimeX < 0.4)){
					            #line 101
					            uv.x += 100.55;
					            uv *= 5e-05;
					        }
					        else{
					            if ((_TimeX < 0.6)){
					                #line 106
					                uv *= 0.00045;
					            }
					            else{
					                if ((_TimeX < 0.8)){
					                    #line 110
					                    uv *= 500000.0;
					                }
					                else{
					                    if ((_TimeX < 1.0)){
					                        #line 114
					                        uv *= 4.5e-05;
					                    }
					                }
					            }
					        }
					    }
					    #line 118
					    highp float fft = texture2D( _MainTex, vec2( uv.x, 0.25)).x;
					    highp float ftf = texture2D( _MainTex, vec2( uv.x, 0.15)).x;
					    highp float fty = texture2D( _MainTex, vec2( uv.x, 0.35)).x;
					    uv *= (200.0 * sin((log(fft) * 10.0)));
					    #line 123
					    if ((sin(fty) < 0.5)){
					        uv.x += (sin(fty) * sin((cos(_TimeX) + (uv.y * 40005.0))));
					    }
					    uv *= sin((_TimeX * 179.0));
					    highp vec3 p;
					    #line 127
					    p.x = uv.x;
					    p.y = uv.y;
					    p.z = sin(((0.0 * _TimeX) * ftf));
					    #line 131
					    highp float no = noise( p);
					    highp vec3 col = vec3( hash( ((no * 6.238) * cos(_TimeX))), hash( ((no * 6.2384) + (0.4 * cos((_TimeX * 2.25))))), hash( ((no * 6.2384) + (0.8 * cos((_TimeX * 0.8468))))));
					    #line 138
					    highp float b = dot( uv, uv);
					    b *= 10000.0;
					    b = (b * b);
					    col.xyz *= texture2D( _MainTex, i.texcoord.xy).xyz;
					    #line 143
					    return vec4( col, 1.0);
					}
					varying mediump vec2 xlv_TEXCOORD0;
					varying lowp vec4 xlv_COLOR;
					void main() {
					    highp vec4 xl_retval;
					    v2f xlt_i;
					    xlt_i.texcoord = vec2(xlv_TEXCOORD0);
					    xlt_i.vertex = vec4(0.0);
					    xlt_i.color = vec4(xlv_COLOR);
					    xl_retval = frag( xlt_i);
					    gl_FragData[0] = vec4(xl_retval);
					}
					/* HLSL2GLSL - NOTE: GLSL optimization failed
					(94,24): error: `_TimeX_1' undeclared
					(94,24): error: operands to arithmetic operators must be numeric
					*/
					
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
					#ifndef SHADER_TARGET
					    #define SHADER_TARGET 30
					#endif
					#ifndef UNITY_NO_DXT5nm
					    #define UNITY_NO_DXT5nm 1
					#endif
					#ifndef UNITY_NO_RGBM
					    #define UNITY_NO_RGBM 1
					#endif
					#ifndef UNITY_NO_SCREENSPACE_SHADOWS
					    #define UNITY_NO_SCREENSPACE_SHADOWS 1
					#endif
					#ifndef UNITY_ENABLE_REFLECTION_BUFFERS
					    #define UNITY_ENABLE_REFLECTION_BUFFERS 1
					#endif
					#ifndef UNITY_FRAMEBUFFER_FETCH_AVAILABLE
					    #define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
					#endif
					#ifndef UNITY_PBS_USE_BRDF2
					    #define UNITY_PBS_USE_BRDF2 1
					#endif
					#ifndef SHADER_API_MOBILE
					    #define SHADER_API_MOBILE 1
					#endif
					#ifndef UNITY_HARDWARE_TIER2
					    #define UNITY_HARDWARE_TIER2 1
					#endif
					#ifndef UNITY_COLORSPACE_GAMMA
					    #define UNITY_COLORSPACE_GAMMA 1
					#endif
					#ifndef UNITY_VERSION
					    #define UNITY_VERSION 551
					#endif
					#ifndef SHADER_API_GLES
					    #define SHADER_API_GLES 1
					#endif
					
					#line 459
					struct v2f_vertex_lit {
					    highp vec2 uv;
					    lowp vec4 diff;
					    lowp vec4 spec;
					};
					#line 606
					struct v2f_img {
					    highp vec4 pos;
					    mediump vec2 uv;
					};
					#line 600
					struct appdata_img {
					    highp vec4 vertex;
					    mediump vec2 texcoord;
					};
					#line 34
					struct v2f {
					    mediump vec2 texcoord;
					    highp vec4 vertex;
					    lowp vec4 color;
					};
					#line 28
					struct appdata_t {
					    highp vec4 vertex;
					    highp vec4 color;
					    highp vec2 texcoord;
					};
					#line 55
					uniform highp vec4 _Time;
					uniform highp vec4 _SinTime;
					uniform highp vec4 _CosTime;
					uniform highp vec4 unity_DeltaTime;
					#line 61
					uniform highp vec3 _WorldSpaceCameraPos;
					#line 68
					uniform highp vec4 _ProjectionParams;
					#line 74
					uniform highp vec4 _ScreenParams;
					#line 81
					uniform highp vec4 _ZBufferParams;
					#line 87
					uniform highp vec4 unity_OrthoParams;
					#line 92
					uniform highp vec4 unity_CameraWorldClipPlanes[6];
					#line 98
					uniform highp mat4 unity_CameraProjection;
					uniform highp mat4 unity_CameraInvProjection;
					uniform highp mat4 unity_WorldToCamera;
					uniform highp mat4 unity_CameraToWorld;
					#line 114
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform highp vec4 _LightPositionRange;
					#line 119
					uniform highp vec4 unity_4LightPosX0;
					uniform highp vec4 unity_4LightPosY0;
					uniform highp vec4 unity_4LightPosZ0;
					uniform mediump vec4 unity_4LightAtten0;
					#line 124
					uniform mediump vec4 unity_LightColor[8];
					uniform highp vec4 unity_LightPosition[8];
					#line 132
					uniform mediump vec4 unity_LightAtten[8];
					uniform highp vec4 unity_SpotDirection[8];
					#line 136
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					#line 140
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					#line 146
					uniform mediump vec3 unity_LightColor0;
					uniform mediump vec3 unity_LightColor1;
					uniform mediump vec3 unity_LightColor2;
					uniform mediump vec3 unity_LightColor3;
					#line 153
					uniform highp vec4 unity_ShadowSplitSpheres[4];
					uniform highp vec4 unity_ShadowSplitSqRadii;
					uniform highp vec4 unity_LightShadowBias;
					uniform highp vec4 _LightSplitsNear;
					#line 157
					uniform highp vec4 _LightSplitsFar;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform mediump vec4 _LightShadowData;
					uniform highp vec4 unity_ShadowFadeCenterAndType;
					#line 167
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 glstate_matrix_modelview0;
					uniform highp mat4 glstate_matrix_invtrans_modelview0;
					#line 172
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_LODFade;
					uniform highp vec4 unity_WorldTransformParams;
					#line 200
					uniform highp mat4 glstate_matrix_transpose_modelview0;
					#line 208
					uniform lowp vec4 glstate_lightmodel_ambient;
					uniform lowp vec4 unity_AmbientSky;
					uniform lowp vec4 unity_AmbientEquator;
					uniform lowp vec4 unity_AmbientGround;
					#line 212
					uniform lowp vec4 unity_IndirectSpecColor;
					uniform highp mat4 glstate_matrix_projection;
					#line 216
					uniform highp mat4 unity_MatrixV;
					uniform highp mat4 unity_MatrixInvV;
					uniform highp mat4 unity_MatrixVP;
					uniform highp int unity_StereoEyeIndex;
					#line 228
					uniform lowp vec4 unity_FogColor;
					#line 233
					uniform highp vec4 unity_FogParams;
					#line 241
					uniform sampler2D unity_Lightmap;
					uniform sampler2D unity_LightmapInd;
					#line 246
					uniform sampler2D unity_DynamicLightmap;
					uniform sampler2D unity_DynamicDirectionality;
					uniform sampler2D unity_DynamicNormal;
					#line 251
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					#line 259
					uniform samplerCube unity_SpecCube0;
					uniform samplerCube unity_SpecCube1;
					#line 263
					uniform highp vec4 unity_SpecCube0_BoxMax;
					uniform highp vec4 unity_SpecCube0_BoxMin;
					uniform highp vec4 unity_SpecCube0_ProbePosition;
					uniform mediump vec4 unity_SpecCube0_HDR;
					#line 268
					uniform highp vec4 unity_SpecCube1_BoxMax;
					uniform highp vec4 unity_SpecCube1_BoxMin;
					uniform highp vec4 unity_SpecCube1_ProbePosition;
					uniform mediump vec4 unity_SpecCube1_HDR;
					#line 76
					#line 85
					#line 95
					#line 104
					#line 116
					#line 127
					#line 136
					#line 143
					#line 149
					#line 155
					#line 163
					#line 169
					#line 175
					#line 181
					#line 187
					#line 198
					#line 213
					#line 220
					#line 235
					#line 242
					#line 249
					#line 267
					#line 303
					#line 332
					#line 338
					#line 351
					#line 369
					#line 385
					#line 439
					#line 465
					#line 476
					#line 485
					#line 492
					#line 497
					#line 515
					#line 535
					#line 550
					#line 555
					uniform mediump vec4 unity_Lightmap_HDR;
					#line 566
					uniform mediump vec4 unity_DynamicLightmap_HDR;
					#line 573
					#line 583
					#line 612
					#line 618
					#line 628
					#line 637
					#line 644
					#line 653
					#line 661
					#line 670
					#line 689
					#line 695
					#line 703
					#line 714
					#line 719
					#line 770
					#line 798
					#line 806
					#line 810
					#line 816
					#line 825
					#line 835
					#line 870
					#line 25
					uniform sampler2D _MainTex;
					uniform highp float _TimeX;
					uniform highp vec4 _ScreenResolution;
					#line 40
					#line 48
					#line 54
					#line 66
					#line 48
					highp float hash( in highp float n ) {
					    return fract((sin(n) * 43812.18));
					}
					#line 66
					highp float noise( in highp vec3 p ) {
					    highp vec3 pi = floor(p);
					    #line 70
					    highp vec3 pf = fract(p);
					    highp float n = ((pi.x + (59.0 * pi.y)) + (256.0 * pi.z));
					    pf.x = ((pf.x * pf.x) * (3.0 - (2.0 * pf.x)));
					    pf.y = ((pf.y * pf.y) * (3.0 - (2.0 * pf.y)));
					    #line 74
					    pf.z = sin(pf.z);
					    highp float v1 = mix( mix( hash( n), hash( (n + 1.0)), pf.x), mix( hash( (n + 59.0)), hash( ((n + 1.0) + 59.0)), pf.x), pf.y);
					    #line 81
					    highp float v2 = mix( mix( hash( (n + 256.0)), hash( ((n + 1.0) + 256.0)), pf.x), mix( hash( ((n + 59.0) + 256.0)), hash( (((n + 1.0) + 59.0) + 256.0)), pf.x), pf.y);
					    #line 86
					    return mix( v1, v2, pf.z);
					}
					#line 89
					highp vec4 frag( in v2f i ) {
					    #line 91
					    highp vec2 uv = i.texcoord.xy;
					    uv -= 0.5;
					    highp float _TimeX = (_TimeX_1 / 30.0);
					    #line 95
					    _TimeX = (0.5 + (0.5 * sin((_TimeX * 6.238))));
					    _TimeX = texture2D( _MainTex, vec2( 0.5, 0.5)).x;
					    if ((_TimeX < 0.2)){
					        uv *= 1.0;
					    }
					    else{
					        if ((_TimeX < 0.4)){
					            #line 101
					            uv.x += 100.55;
					            uv *= 5e-05;
					        }
					        else{
					            if ((_TimeX < 0.6)){
					                #line 106
					                uv *= 0.00045;
					            }
					            else{
					                if ((_TimeX < 0.8)){
					                    #line 110
					                    uv *= 500000.0;
					                }
					                else{
					                    if ((_TimeX < 1.0)){
					                        #line 114
					                        uv *= 4.5e-05;
					                    }
					                }
					            }
					        }
					    }
					    #line 118
					    highp float fft = texture2D( _MainTex, vec2( uv.x, 0.25)).x;
					    highp float ftf = texture2D( _MainTex, vec2( uv.x, 0.15)).x;
					    highp float fty = texture2D( _MainTex, vec2( uv.x, 0.35)).x;
					    uv *= (200.0 * sin((log(fft) * 10.0)));
					    #line 123
					    if ((sin(fty) < 0.5)){
					        uv.x += (sin(fty) * sin((cos(_TimeX) + (uv.y * 40005.0))));
					    }
					    uv *= sin((_TimeX * 179.0));
					    highp vec3 p;
					    #line 127
					    p.x = uv.x;
					    p.y = uv.y;
					    p.z = sin(((0.0 * _TimeX) * ftf));
					    #line 131
					    highp float no = noise( p);
					    highp vec3 col = vec3( hash( ((no * 6.238) * cos(_TimeX))), hash( ((no * 6.2384) + (0.4 * cos((_TimeX * 2.25))))), hash( ((no * 6.2384) + (0.8 * cos((_TimeX * 0.8468))))));
					    #line 138
					    highp float b = dot( uv, uv);
					    b *= 10000.0;
					    b = (b * b);
					    col.xyz *= texture2D( _MainTex, i.texcoord.xy).xyz;
					    #line 143
					    return vec4( col, 1.0);
					}
					varying mediump vec2 xlv_TEXCOORD0;
					varying lowp vec4 xlv_COLOR;
					void main() {
					    highp vec4 xl_retval;
					    v2f xlt_i;
					    xlt_i.texcoord = vec2(xlv_TEXCOORD0);
					    xlt_i.vertex = vec4(0.0);
					    xlt_i.color = vec4(xlv_COLOR);
					    xl_retval = frag( xlt_i);
					    gl_FragData[0] = vec4(xl_retval);
					}
					/* HLSL2GLSL - NOTE: GLSL optimization failed
					(94,24): error: `_TimeX_1' undeclared
					(94,24): error: operands to arithmetic operators must be numeric
					*/
					
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
					#ifndef SHADER_TARGET
					    #define SHADER_TARGET 30
					#endif
					#ifndef UNITY_NO_DXT5nm
					    #define UNITY_NO_DXT5nm 1
					#endif
					#ifndef UNITY_NO_RGBM
					    #define UNITY_NO_RGBM 1
					#endif
					#ifndef UNITY_NO_SCREENSPACE_SHADOWS
					    #define UNITY_NO_SCREENSPACE_SHADOWS 1
					#endif
					#ifndef UNITY_ENABLE_REFLECTION_BUFFERS
					    #define UNITY_ENABLE_REFLECTION_BUFFERS 1
					#endif
					#ifndef UNITY_FRAMEBUFFER_FETCH_AVAILABLE
					    #define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
					#endif
					#ifndef UNITY_PBS_USE_BRDF2
					    #define UNITY_PBS_USE_BRDF2 1
					#endif
					#ifndef SHADER_API_MOBILE
					    #define SHADER_API_MOBILE 1
					#endif
					#ifndef UNITY_HARDWARE_TIER3
					    #define UNITY_HARDWARE_TIER3 1
					#endif
					#ifndef UNITY_COLORSPACE_GAMMA
					    #define UNITY_COLORSPACE_GAMMA 1
					#endif
					#ifndef UNITY_VERSION
					    #define UNITY_VERSION 551
					#endif
					#ifndef SHADER_API_GLES
					    #define SHADER_API_GLES 1
					#endif
					
					#line 459
					struct v2f_vertex_lit {
					    highp vec2 uv;
					    lowp vec4 diff;
					    lowp vec4 spec;
					};
					#line 606
					struct v2f_img {
					    highp vec4 pos;
					    mediump vec2 uv;
					};
					#line 600
					struct appdata_img {
					    highp vec4 vertex;
					    mediump vec2 texcoord;
					};
					#line 34
					struct v2f {
					    mediump vec2 texcoord;
					    highp vec4 vertex;
					    lowp vec4 color;
					};
					#line 28
					struct appdata_t {
					    highp vec4 vertex;
					    highp vec4 color;
					    highp vec2 texcoord;
					};
					#line 55
					uniform highp vec4 _Time;
					uniform highp vec4 _SinTime;
					uniform highp vec4 _CosTime;
					uniform highp vec4 unity_DeltaTime;
					#line 61
					uniform highp vec3 _WorldSpaceCameraPos;
					#line 68
					uniform highp vec4 _ProjectionParams;
					#line 74
					uniform highp vec4 _ScreenParams;
					#line 81
					uniform highp vec4 _ZBufferParams;
					#line 87
					uniform highp vec4 unity_OrthoParams;
					#line 92
					uniform highp vec4 unity_CameraWorldClipPlanes[6];
					#line 98
					uniform highp mat4 unity_CameraProjection;
					uniform highp mat4 unity_CameraInvProjection;
					uniform highp mat4 unity_WorldToCamera;
					uniform highp mat4 unity_CameraToWorld;
					#line 114
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform highp vec4 _LightPositionRange;
					#line 119
					uniform highp vec4 unity_4LightPosX0;
					uniform highp vec4 unity_4LightPosY0;
					uniform highp vec4 unity_4LightPosZ0;
					uniform mediump vec4 unity_4LightAtten0;
					#line 124
					uniform mediump vec4 unity_LightColor[8];
					uniform highp vec4 unity_LightPosition[8];
					#line 132
					uniform mediump vec4 unity_LightAtten[8];
					uniform highp vec4 unity_SpotDirection[8];
					#line 136
					uniform mediump vec4 unity_SHAr;
					uniform mediump vec4 unity_SHAg;
					uniform mediump vec4 unity_SHAb;
					uniform mediump vec4 unity_SHBr;
					#line 140
					uniform mediump vec4 unity_SHBg;
					uniform mediump vec4 unity_SHBb;
					uniform mediump vec4 unity_SHC;
					#line 146
					uniform mediump vec3 unity_LightColor0;
					uniform mediump vec3 unity_LightColor1;
					uniform mediump vec3 unity_LightColor2;
					uniform mediump vec3 unity_LightColor3;
					#line 153
					uniform highp vec4 unity_ShadowSplitSpheres[4];
					uniform highp vec4 unity_ShadowSplitSqRadii;
					uniform highp vec4 unity_LightShadowBias;
					uniform highp vec4 _LightSplitsNear;
					#line 157
					uniform highp vec4 _LightSplitsFar;
					uniform highp mat4 unity_WorldToShadow[4];
					uniform mediump vec4 _LightShadowData;
					uniform highp vec4 unity_ShadowFadeCenterAndType;
					#line 167
					uniform highp mat4 glstate_matrix_mvp;
					uniform highp mat4 glstate_matrix_modelview0;
					uniform highp mat4 glstate_matrix_invtrans_modelview0;
					#line 172
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp vec4 unity_LODFade;
					uniform highp vec4 unity_WorldTransformParams;
					#line 200
					uniform highp mat4 glstate_matrix_transpose_modelview0;
					#line 208
					uniform lowp vec4 glstate_lightmodel_ambient;
					uniform lowp vec4 unity_AmbientSky;
					uniform lowp vec4 unity_AmbientEquator;
					uniform lowp vec4 unity_AmbientGround;
					#line 212
					uniform lowp vec4 unity_IndirectSpecColor;
					uniform highp mat4 glstate_matrix_projection;
					#line 216
					uniform highp mat4 unity_MatrixV;
					uniform highp mat4 unity_MatrixInvV;
					uniform highp mat4 unity_MatrixVP;
					uniform highp int unity_StereoEyeIndex;
					#line 228
					uniform lowp vec4 unity_FogColor;
					#line 233
					uniform highp vec4 unity_FogParams;
					#line 241
					uniform sampler2D unity_Lightmap;
					uniform sampler2D unity_LightmapInd;
					#line 246
					uniform sampler2D unity_DynamicLightmap;
					uniform sampler2D unity_DynamicDirectionality;
					uniform sampler2D unity_DynamicNormal;
					#line 251
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					#line 259
					uniform samplerCube unity_SpecCube0;
					uniform samplerCube unity_SpecCube1;
					#line 263
					uniform highp vec4 unity_SpecCube0_BoxMax;
					uniform highp vec4 unity_SpecCube0_BoxMin;
					uniform highp vec4 unity_SpecCube0_ProbePosition;
					uniform mediump vec4 unity_SpecCube0_HDR;
					#line 268
					uniform highp vec4 unity_SpecCube1_BoxMax;
					uniform highp vec4 unity_SpecCube1_BoxMin;
					uniform highp vec4 unity_SpecCube1_ProbePosition;
					uniform mediump vec4 unity_SpecCube1_HDR;
					#line 76
					#line 85
					#line 95
					#line 104
					#line 116
					#line 127
					#line 136
					#line 143
					#line 149
					#line 155
					#line 163
					#line 169
					#line 175
					#line 181
					#line 187
					#line 198
					#line 213
					#line 220
					#line 235
					#line 242
					#line 249
					#line 267
					#line 303
					#line 332
					#line 338
					#line 351
					#line 369
					#line 385
					#line 439
					#line 465
					#line 476
					#line 485
					#line 492
					#line 497
					#line 515
					#line 535
					#line 550
					#line 555
					uniform mediump vec4 unity_Lightmap_HDR;
					#line 566
					uniform mediump vec4 unity_DynamicLightmap_HDR;
					#line 573
					#line 583
					#line 612
					#line 618
					#line 628
					#line 637
					#line 644
					#line 653
					#line 661
					#line 670
					#line 689
					#line 695
					#line 703
					#line 714
					#line 719
					#line 770
					#line 798
					#line 806
					#line 810
					#line 816
					#line 825
					#line 835
					#line 870
					#line 25
					uniform sampler2D _MainTex;
					uniform highp float _TimeX;
					uniform highp vec4 _ScreenResolution;
					#line 40
					#line 48
					#line 54
					#line 66
					#line 48
					highp float hash( in highp float n ) {
					    return fract((sin(n) * 43812.18));
					}
					#line 66
					highp float noise( in highp vec3 p ) {
					    highp vec3 pi = floor(p);
					    #line 70
					    highp vec3 pf = fract(p);
					    highp float n = ((pi.x + (59.0 * pi.y)) + (256.0 * pi.z));
					    pf.x = ((pf.x * pf.x) * (3.0 - (2.0 * pf.x)));
					    pf.y = ((pf.y * pf.y) * (3.0 - (2.0 * pf.y)));
					    #line 74
					    pf.z = sin(pf.z);
					    highp float v1 = mix( mix( hash( n), hash( (n + 1.0)), pf.x), mix( hash( (n + 59.0)), hash( ((n + 1.0) + 59.0)), pf.x), pf.y);
					    #line 81
					    highp float v2 = mix( mix( hash( (n + 256.0)), hash( ((n + 1.0) + 256.0)), pf.x), mix( hash( ((n + 59.0) + 256.0)), hash( (((n + 1.0) + 59.0) + 256.0)), pf.x), pf.y);
					    #line 86
					    return mix( v1, v2, pf.z);
					}
					#line 89
					highp vec4 frag( in v2f i ) {
					    #line 91
					    highp vec2 uv = i.texcoord.xy;
					    uv -= 0.5;
					    highp float _TimeX = (_TimeX_1 / 30.0);
					    #line 95
					    _TimeX = (0.5 + (0.5 * sin((_TimeX * 6.238))));
					    _TimeX = texture2D( _MainTex, vec2( 0.5, 0.5)).x;
					    if ((_TimeX < 0.2)){
					        uv *= 1.0;
					    }
					    else{
					        if ((_TimeX < 0.4)){
					            #line 101
					            uv.x += 100.55;
					            uv *= 5e-05;
					        }
					        else{
					            if ((_TimeX < 0.6)){
					                #line 106
					                uv *= 0.00045;
					            }
					            else{
					                if ((_TimeX < 0.8)){
					                    #line 110
					                    uv *= 500000.0;
					                }
					                else{
					                    if ((_TimeX < 1.0)){
					                        #line 114
					                        uv *= 4.5e-05;
					                    }
					                }
					            }
					        }
					    }
					    #line 118
					    highp float fft = texture2D( _MainTex, vec2( uv.x, 0.25)).x;
					    highp float ftf = texture2D( _MainTex, vec2( uv.x, 0.15)).x;
					    highp float fty = texture2D( _MainTex, vec2( uv.x, 0.35)).x;
					    uv *= (200.0 * sin((log(fft) * 10.0)));
					    #line 123
					    if ((sin(fty) < 0.5)){
					        uv.x += (sin(fty) * sin((cos(_TimeX) + (uv.y * 40005.0))));
					    }
					    uv *= sin((_TimeX * 179.0));
					    highp vec3 p;
					    #line 127
					    p.x = uv.x;
					    p.y = uv.y;
					    p.z = sin(((0.0 * _TimeX) * ftf));
					    #line 131
					    highp float no = noise( p);
					    highp vec3 col = vec3( hash( ((no * 6.238) * cos(_TimeX))), hash( ((no * 6.2384) + (0.4 * cos((_TimeX * 2.25))))), hash( ((no * 6.2384) + (0.8 * cos((_TimeX * 0.8468))))));
					    #line 138
					    highp float b = dot( uv, uv);
					    b *= 10000.0;
					    b = (b * b);
					    col.xyz *= texture2D( _MainTex, i.texcoord.xy).xyz;
					    #line 143
					    return vec4( col, 1.0);
					}
					varying mediump vec2 xlv_TEXCOORD0;
					varying lowp vec4 xlv_COLOR;
					void main() {
					    highp vec4 xl_retval;
					    v2f xlt_i;
					    xlt_i.texcoord = vec2(xlv_TEXCOORD0);
					    xlt_i.vertex = vec4(0.0);
					    xlt_i.color = vec4(xlv_COLOR);
					    xl_retval = frag( xlt_i);
					    gl_FragData[0] = vec4(xl_retval);
					}
					/* HLSL2GLSL - NOTE: GLSL optimization failed
					(94,24): error: `_TimeX_1' undeclared
					(94,24): error: operands to arithmetic operators must be numeric
					*/
					
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					bvec4 u_xlatb3;
					vec2 u_xlat4;
					mediump float u_xlat16_4;
					lowp float u_xlat10_4;
					bool u_xlatb4;
					vec2 u_xlat8;
					bool u_xlatb8;
					vec2 u_xlat9;
					float u_xlat13;
					void main()
					{
					    u_xlat0.x = texture(_MainTex, vec2(0.5, 0.5)).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb4 = !!(u_xlat0.x<1.0);
					#else
					    u_xlatb4 = u_xlat0.x<1.0;
					#endif
					    u_xlat16_1 = vs_TEXCOORD0.xyxy + vec4(100.050003, -0.5, -0.5, -0.5);
					    u_xlat2 = vec4(u_xlat16_1.z * float(500000.0), u_xlat16_1.w * float(500000.0), u_xlat16_1.z * float(4.50000007e-005), u_xlat16_1.w * float(4.50000007e-005));
					    u_xlat4.xy = (bool(u_xlatb4)) ? u_xlat2.zw : u_xlat16_1.zw;
					    u_xlatb3 = lessThan(u_xlat0.xxxx, vec4(0.200000003, 0.400000006, 0.600000024, 0.800000012));
					    u_xlat4.xy = (u_xlatb3.w) ? u_xlat2.xy : u_xlat4.xy;
					    u_xlat2 = u_xlat16_1 * vec4(4.99999987e-005, 4.99999987e-005, 0.000449999992, 0.000449999992);
					    u_xlat4.xy = (u_xlatb3.z) ? u_xlat2.zw : u_xlat4.xy;
					    u_xlat4.xy = (u_xlatb3.y) ? u_xlat2.xy : u_xlat4.xy;
					    u_xlat1.xy = (u_xlatb3.x) ? u_xlat16_1.zw : u_xlat4.xy;
					    u_xlat1.z = float(0.25);
					    u_xlat1.w = float(0.349999994);
					    u_xlat10_4 = texture(_MainTex, u_xlat1.xz).x;
					    u_xlat4.y = texture(_MainTex, u_xlat1.xw).x;
					    u_xlat16_4 = log2(u_xlat10_4);
					    u_xlat4.x = u_xlat16_4 * 6.93147182;
					    u_xlat4.xy = sin(u_xlat4.xy);
					    u_xlat4.x = u_xlat4.x * 200.0;
					    u_xlat1.yz = u_xlat4.xx * u_xlat1.xy;
					    u_xlat4.x = cos(u_xlat0.x);
					    u_xlat2.xyz = u_xlat0.xxx * vec3(179.0, 2.25, 0.846800029);
					    u_xlat0.x = u_xlat1.z * 40005.0 + u_xlat4.x;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat4.y * u_xlat0.x + u_xlat1.y;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(u_xlat4.y<0.5);
					#else
					    u_xlatb8 = u_xlat4.y<0.5;
					#endif
					    u_xlat1.x = (u_xlatb8) ? u_xlat0.x : u_xlat1.y;
					    u_xlat0.x = sin(u_xlat2.x);
					    u_xlat0.zw = cos(u_xlat2.yz);
					    u_xlat1.xy = u_xlat0.xx * u_xlat1.xz;
					    u_xlat9.xy = fract(u_xlat1.xy);
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat0.x = u_xlat1.y * 59.0 + u_xlat1.x;
					    u_xlat1.xy = u_xlat9.xy * u_xlat9.xy;
					    u_xlat9.xy = (-u_xlat9.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat1.xy = u_xlat9.xy * u_xlat1.xy;
					    u_xlat2.xyz = u_xlat0.xxx + vec3(1.0, 59.0, 60.0);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.xzw = u_xlat0.xzw * vec3(43812.1758, 0.400000006, 0.800000012);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat2.xyz = sin(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat2.xyz = fract(u_xlat2.xyz);
					    u_xlat9.x = (-u_xlat2.y) + u_xlat2.z;
					    u_xlat9.x = u_xlat1.x * u_xlat9.x + u_xlat2.y;
					    u_xlat13 = (-u_xlat0.x) + u_xlat2.x;
					    u_xlat0.x = u_xlat1.x * u_xlat13 + u_xlat0.x;
					    u_xlat1.x = (-u_xlat0.x) + u_xlat9.x;
					    u_xlat0.x = u_xlat1.y * u_xlat1.x + u_xlat0.x;
					    u_xlat8.xy = u_xlat0.xx * vec2(6.23839998, 6.23839998) + u_xlat0.zw;
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 6.23799992;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43812.1758;
					    u_xlat1.x = fract(u_xlat0.x);
					    u_xlat0.xy = sin(u_xlat8.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(43812.1758, 43812.1758);
					    u_xlat1.yz = fract(u_xlat0.xy);
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					bvec4 u_xlatb3;
					vec2 u_xlat4;
					mediump float u_xlat16_4;
					lowp float u_xlat10_4;
					bool u_xlatb4;
					vec2 u_xlat8;
					bool u_xlatb8;
					vec2 u_xlat9;
					float u_xlat13;
					void main()
					{
					    u_xlat0.x = texture(_MainTex, vec2(0.5, 0.5)).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb4 = !!(u_xlat0.x<1.0);
					#else
					    u_xlatb4 = u_xlat0.x<1.0;
					#endif
					    u_xlat16_1 = vs_TEXCOORD0.xyxy + vec4(100.050003, -0.5, -0.5, -0.5);
					    u_xlat2 = vec4(u_xlat16_1.z * float(500000.0), u_xlat16_1.w * float(500000.0), u_xlat16_1.z * float(4.50000007e-005), u_xlat16_1.w * float(4.50000007e-005));
					    u_xlat4.xy = (bool(u_xlatb4)) ? u_xlat2.zw : u_xlat16_1.zw;
					    u_xlatb3 = lessThan(u_xlat0.xxxx, vec4(0.200000003, 0.400000006, 0.600000024, 0.800000012));
					    u_xlat4.xy = (u_xlatb3.w) ? u_xlat2.xy : u_xlat4.xy;
					    u_xlat2 = u_xlat16_1 * vec4(4.99999987e-005, 4.99999987e-005, 0.000449999992, 0.000449999992);
					    u_xlat4.xy = (u_xlatb3.z) ? u_xlat2.zw : u_xlat4.xy;
					    u_xlat4.xy = (u_xlatb3.y) ? u_xlat2.xy : u_xlat4.xy;
					    u_xlat1.xy = (u_xlatb3.x) ? u_xlat16_1.zw : u_xlat4.xy;
					    u_xlat1.z = float(0.25);
					    u_xlat1.w = float(0.349999994);
					    u_xlat10_4 = texture(_MainTex, u_xlat1.xz).x;
					    u_xlat4.y = texture(_MainTex, u_xlat1.xw).x;
					    u_xlat16_4 = log2(u_xlat10_4);
					    u_xlat4.x = u_xlat16_4 * 6.93147182;
					    u_xlat4.xy = sin(u_xlat4.xy);
					    u_xlat4.x = u_xlat4.x * 200.0;
					    u_xlat1.yz = u_xlat4.xx * u_xlat1.xy;
					    u_xlat4.x = cos(u_xlat0.x);
					    u_xlat2.xyz = u_xlat0.xxx * vec3(179.0, 2.25, 0.846800029);
					    u_xlat0.x = u_xlat1.z * 40005.0 + u_xlat4.x;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat4.y * u_xlat0.x + u_xlat1.y;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(u_xlat4.y<0.5);
					#else
					    u_xlatb8 = u_xlat4.y<0.5;
					#endif
					    u_xlat1.x = (u_xlatb8) ? u_xlat0.x : u_xlat1.y;
					    u_xlat0.x = sin(u_xlat2.x);
					    u_xlat0.zw = cos(u_xlat2.yz);
					    u_xlat1.xy = u_xlat0.xx * u_xlat1.xz;
					    u_xlat9.xy = fract(u_xlat1.xy);
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat0.x = u_xlat1.y * 59.0 + u_xlat1.x;
					    u_xlat1.xy = u_xlat9.xy * u_xlat9.xy;
					    u_xlat9.xy = (-u_xlat9.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat1.xy = u_xlat9.xy * u_xlat1.xy;
					    u_xlat2.xyz = u_xlat0.xxx + vec3(1.0, 59.0, 60.0);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.xzw = u_xlat0.xzw * vec3(43812.1758, 0.400000006, 0.800000012);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat2.xyz = sin(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat2.xyz = fract(u_xlat2.xyz);
					    u_xlat9.x = (-u_xlat2.y) + u_xlat2.z;
					    u_xlat9.x = u_xlat1.x * u_xlat9.x + u_xlat2.y;
					    u_xlat13 = (-u_xlat0.x) + u_xlat2.x;
					    u_xlat0.x = u_xlat1.x * u_xlat13 + u_xlat0.x;
					    u_xlat1.x = (-u_xlat0.x) + u_xlat9.x;
					    u_xlat0.x = u_xlat1.y * u_xlat1.x + u_xlat0.x;
					    u_xlat8.xy = u_xlat0.xx * vec2(6.23839998, 6.23839998) + u_xlat0.zw;
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 6.23799992;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43812.1758;
					    u_xlat1.x = fract(u_xlat0.x);
					    u_xlat0.xy = sin(u_xlat8.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(43812.1758, 43812.1758);
					    u_xlat1.yz = fract(u_xlat0.xy);
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
					vec4 u_xlat2;
					bvec4 u_xlatb3;
					vec2 u_xlat4;
					mediump float u_xlat16_4;
					lowp float u_xlat10_4;
					bool u_xlatb4;
					vec2 u_xlat8;
					bool u_xlatb8;
					vec2 u_xlat9;
					float u_xlat13;
					void main()
					{
					    u_xlat0.x = texture(_MainTex, vec2(0.5, 0.5)).x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb4 = !!(u_xlat0.x<1.0);
					#else
					    u_xlatb4 = u_xlat0.x<1.0;
					#endif
					    u_xlat16_1 = vs_TEXCOORD0.xyxy + vec4(100.050003, -0.5, -0.5, -0.5);
					    u_xlat2 = vec4(u_xlat16_1.z * float(500000.0), u_xlat16_1.w * float(500000.0), u_xlat16_1.z * float(4.50000007e-005), u_xlat16_1.w * float(4.50000007e-005));
					    u_xlat4.xy = (bool(u_xlatb4)) ? u_xlat2.zw : u_xlat16_1.zw;
					    u_xlatb3 = lessThan(u_xlat0.xxxx, vec4(0.200000003, 0.400000006, 0.600000024, 0.800000012));
					    u_xlat4.xy = (u_xlatb3.w) ? u_xlat2.xy : u_xlat4.xy;
					    u_xlat2 = u_xlat16_1 * vec4(4.99999987e-005, 4.99999987e-005, 0.000449999992, 0.000449999992);
					    u_xlat4.xy = (u_xlatb3.z) ? u_xlat2.zw : u_xlat4.xy;
					    u_xlat4.xy = (u_xlatb3.y) ? u_xlat2.xy : u_xlat4.xy;
					    u_xlat1.xy = (u_xlatb3.x) ? u_xlat16_1.zw : u_xlat4.xy;
					    u_xlat1.z = float(0.25);
					    u_xlat1.w = float(0.349999994);
					    u_xlat10_4 = texture(_MainTex, u_xlat1.xz).x;
					    u_xlat4.y = texture(_MainTex, u_xlat1.xw).x;
					    u_xlat16_4 = log2(u_xlat10_4);
					    u_xlat4.x = u_xlat16_4 * 6.93147182;
					    u_xlat4.xy = sin(u_xlat4.xy);
					    u_xlat4.x = u_xlat4.x * 200.0;
					    u_xlat1.yz = u_xlat4.xx * u_xlat1.xy;
					    u_xlat4.x = cos(u_xlat0.x);
					    u_xlat2.xyz = u_xlat0.xxx * vec3(179.0, 2.25, 0.846800029);
					    u_xlat0.x = u_xlat1.z * 40005.0 + u_xlat4.x;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat4.y * u_xlat0.x + u_xlat1.y;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(u_xlat4.y<0.5);
					#else
					    u_xlatb8 = u_xlat4.y<0.5;
					#endif
					    u_xlat1.x = (u_xlatb8) ? u_xlat0.x : u_xlat1.y;
					    u_xlat0.x = sin(u_xlat2.x);
					    u_xlat0.zw = cos(u_xlat2.yz);
					    u_xlat1.xy = u_xlat0.xx * u_xlat1.xz;
					    u_xlat9.xy = fract(u_xlat1.xy);
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat0.x = u_xlat1.y * 59.0 + u_xlat1.x;
					    u_xlat1.xy = u_xlat9.xy * u_xlat9.xy;
					    u_xlat9.xy = (-u_xlat9.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat1.xy = u_xlat9.xy * u_xlat1.xy;
					    u_xlat2.xyz = u_xlat0.xxx + vec3(1.0, 59.0, 60.0);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.xzw = u_xlat0.xzw * vec3(43812.1758, 0.400000006, 0.800000012);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat2.xyz = sin(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat2.xyz = fract(u_xlat2.xyz);
					    u_xlat9.x = (-u_xlat2.y) + u_xlat2.z;
					    u_xlat9.x = u_xlat1.x * u_xlat9.x + u_xlat2.y;
					    u_xlat13 = (-u_xlat0.x) + u_xlat2.x;
					    u_xlat0.x = u_xlat1.x * u_xlat13 + u_xlat0.x;
					    u_xlat1.x = (-u_xlat0.x) + u_xlat9.x;
					    u_xlat0.x = u_xlat1.y * u_xlat1.x + u_xlat0.x;
					    u_xlat8.xy = u_xlat0.xx * vec2(6.23839998, 6.23839998) + u_xlat0.zw;
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 6.23799992;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43812.1758;
					    u_xlat1.x = fract(u_xlat0.x);
					    u_xlat0.xy = sin(u_xlat8.xy);
					    u_xlat0.xy = u_xlat0.xy * vec2(43812.1758, 43812.1758);
					    u_xlat1.yz = fract(u_xlat0.xy);
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
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