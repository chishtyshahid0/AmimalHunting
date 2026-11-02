Shader "CameraFilterPack/EXTRA_SHOWFPS" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 44768
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
					#line 36
					struct v2f {
					    mediump vec2 texcoord;
					    highp vec4 vertex;
					    lowp vec4 color;
					};
					#line 30
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
					uniform highp float _Value;
					uniform highp float _Value2;
					#line 29
					uniform highp vec4 _ScreenResolution;
					#line 42
					#line 51
					#line 56
					#line 56
					highp int D( in highp vec2 p, in highp float n ) {
					    highp int i = int(p.y);
					    highp int b = int(pow( 2.0, floor(((30.0 - p.x) - (n * 3.0)))));
					    i = (( ((p.x < 0.0) || (p.x > 3.0)) ) ? ( 0 ) : ( (( (i == 5) ) ? ( 972980223 ) : ( (( (i == 4) ) ? ( 690407533 ) : ( (( (i == 3) ) ? ( 704642687 ) : ( (( (i == 2) ) ? ( 696556137 ) : ( (( (i == 1) ) ? ( 972881535 ) : ( 0 )) )) )) )) )) ));
					    #line 61
					    return ((i / b) - (2 * ((i / b) / 2)));
					}
					#line 51
					highp float mod( in highp float x, in highp float modu ) {
					    return (x - (floor((x * (1.0 / modu))) * modu));
					}
					#line 64
					lowp vec4 frag( in v2f i ) {
					    #line 66
					    highp vec2 uv = i.texcoord;
					    lowp vec4 fps = vec4( 0.0, 0.0, 0.0, 0.0);
					    uv *= 512.0;
					    uv /= _Value;
					    highp float c = 1000.0;
					    #line 70
					    uv.x *= 2.0;
					    highp int n = 0;
					    for ( ; (n < 4); (n++)) {
					        if ((uv.x -= 4.0 < 3.0)){
					            highp float h = float(D( uv, mod( floor((_Value2 / c)), 10.0)));
					            #line 74
					            if ((_Value2 > 45.0)){
					                fps += vec4( 0.0, h, 0.0, 1.0);
					            }
					            else{
					                if ((_Value2 > 30.0)){
					                    fps += vec4( h, h, 0.0, 1.0);
					                }
					                else{
					                    fps += vec4( h, 0.0, 0.0, 1.0);
					                }
					            }
					        }
					        #line 80
					        c *= 0.1;
					    }
					    lowp vec4 txt = texture2D( _MainTex, i.texcoord);
					    txt += fps;
					    #line 84
					    return txt;
					}
					varying mediump vec2 xlv_TEXCOORD0;
					varying lowp vec4 xlv_COLOR;
					void main() {
					    lowp vec4 xl_retval;
					    v2f xlt_i;
					    xlt_i.texcoord = vec2(xlv_TEXCOORD0);
					    xlt_i.vertex = vec4(0.0);
					    xlt_i.color = vec4(xlv_COLOR);
					    xl_retval = frag( xlt_i);
					    gl_FragData[0] = vec4(xl_retval);
					}
					/* HLSL2GLSL - NOTE: GLSL optimization failed
					(74,7): error: operands to arithmetic operators must be numeric
					(74,7): error: if-statement condition must be scalar boolean
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
					#line 36
					struct v2f {
					    mediump vec2 texcoord;
					    highp vec4 vertex;
					    lowp vec4 color;
					};
					#line 30
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
					uniform highp float _Value;
					uniform highp float _Value2;
					#line 29
					uniform highp vec4 _ScreenResolution;
					#line 42
					#line 51
					#line 56
					#line 56
					highp int D( in highp vec2 p, in highp float n ) {
					    highp int i = int(p.y);
					    highp int b = int(pow( 2.0, floor(((30.0 - p.x) - (n * 3.0)))));
					    i = (( ((p.x < 0.0) || (p.x > 3.0)) ) ? ( 0 ) : ( (( (i == 5) ) ? ( 972980223 ) : ( (( (i == 4) ) ? ( 690407533 ) : ( (( (i == 3) ) ? ( 704642687 ) : ( (( (i == 2) ) ? ( 696556137 ) : ( (( (i == 1) ) ? ( 972881535 ) : ( 0 )) )) )) )) )) ));
					    #line 61
					    return ((i / b) - (2 * ((i / b) / 2)));
					}
					#line 51
					highp float mod( in highp float x, in highp float modu ) {
					    return (x - (floor((x * (1.0 / modu))) * modu));
					}
					#line 64
					lowp vec4 frag( in v2f i ) {
					    #line 66
					    highp vec2 uv = i.texcoord;
					    lowp vec4 fps = vec4( 0.0, 0.0, 0.0, 0.0);
					    uv *= 512.0;
					    uv /= _Value;
					    highp float c = 1000.0;
					    #line 70
					    uv.x *= 2.0;
					    highp int n = 0;
					    for ( ; (n < 4); (n++)) {
					        if ((uv.x -= 4.0 < 3.0)){
					            highp float h = float(D( uv, mod( floor((_Value2 / c)), 10.0)));
					            #line 74
					            if ((_Value2 > 45.0)){
					                fps += vec4( 0.0, h, 0.0, 1.0);
					            }
					            else{
					                if ((_Value2 > 30.0)){
					                    fps += vec4( h, h, 0.0, 1.0);
					                }
					                else{
					                    fps += vec4( h, 0.0, 0.0, 1.0);
					                }
					            }
					        }
					        #line 80
					        c *= 0.1;
					    }
					    lowp vec4 txt = texture2D( _MainTex, i.texcoord);
					    txt += fps;
					    #line 84
					    return txt;
					}
					varying mediump vec2 xlv_TEXCOORD0;
					varying lowp vec4 xlv_COLOR;
					void main() {
					    lowp vec4 xl_retval;
					    v2f xlt_i;
					    xlt_i.texcoord = vec2(xlv_TEXCOORD0);
					    xlt_i.vertex = vec4(0.0);
					    xlt_i.color = vec4(xlv_COLOR);
					    xl_retval = frag( xlt_i);
					    gl_FragData[0] = vec4(xl_retval);
					}
					/* HLSL2GLSL - NOTE: GLSL optimization failed
					(74,7): error: operands to arithmetic operators must be numeric
					(74,7): error: if-statement condition must be scalar boolean
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
					#line 36
					struct v2f {
					    mediump vec2 texcoord;
					    highp vec4 vertex;
					    lowp vec4 color;
					};
					#line 30
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
					uniform highp float _Value;
					uniform highp float _Value2;
					#line 29
					uniform highp vec4 _ScreenResolution;
					#line 42
					#line 51
					#line 56
					#line 56
					highp int D( in highp vec2 p, in highp float n ) {
					    highp int i = int(p.y);
					    highp int b = int(pow( 2.0, floor(((30.0 - p.x) - (n * 3.0)))));
					    i = (( ((p.x < 0.0) || (p.x > 3.0)) ) ? ( 0 ) : ( (( (i == 5) ) ? ( 972980223 ) : ( (( (i == 4) ) ? ( 690407533 ) : ( (( (i == 3) ) ? ( 704642687 ) : ( (( (i == 2) ) ? ( 696556137 ) : ( (( (i == 1) ) ? ( 972881535 ) : ( 0 )) )) )) )) )) ));
					    #line 61
					    return ((i / b) - (2 * ((i / b) / 2)));
					}
					#line 51
					highp float mod( in highp float x, in highp float modu ) {
					    return (x - (floor((x * (1.0 / modu))) * modu));
					}
					#line 64
					lowp vec4 frag( in v2f i ) {
					    #line 66
					    highp vec2 uv = i.texcoord;
					    lowp vec4 fps = vec4( 0.0, 0.0, 0.0, 0.0);
					    uv *= 512.0;
					    uv /= _Value;
					    highp float c = 1000.0;
					    #line 70
					    uv.x *= 2.0;
					    highp int n = 0;
					    for ( ; (n < 4); (n++)) {
					        if ((uv.x -= 4.0 < 3.0)){
					            highp float h = float(D( uv, mod( floor((_Value2 / c)), 10.0)));
					            #line 74
					            if ((_Value2 > 45.0)){
					                fps += vec4( 0.0, h, 0.0, 1.0);
					            }
					            else{
					                if ((_Value2 > 30.0)){
					                    fps += vec4( h, h, 0.0, 1.0);
					                }
					                else{
					                    fps += vec4( h, 0.0, 0.0, 1.0);
					                }
					            }
					        }
					        #line 80
					        c *= 0.1;
					    }
					    lowp vec4 txt = texture2D( _MainTex, i.texcoord);
					    txt += fps;
					    #line 84
					    return txt;
					}
					varying mediump vec2 xlv_TEXCOORD0;
					varying lowp vec4 xlv_COLOR;
					void main() {
					    lowp vec4 xl_retval;
					    v2f xlt_i;
					    xlt_i.texcoord = vec2(xlv_TEXCOORD0);
					    xlt_i.vertex = vec4(0.0);
					    xlt_i.color = vec4(xlv_COLOR);
					    xl_retval = frag( xlt_i);
					    gl_FragData[0] = vec4(xl_retval);
					}
					/* HLSL2GLSL - NOTE: GLSL optimization failed
					(74,7): error: operands to arithmetic operators must be numeric
					(74,7): error: if-statement condition must be scalar boolean
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec2 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec3 u_xlat1;
					bvec4 u_xlatb1;
					lowp vec4 u_xlat10_2;
					float u_xlat3;
					vec3 u_xlat4;
					int u_xlati4;
					uint u_xlatu4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					lowp vec3 u_xlat10_7;
					int u_xlati8;
					uint u_xlatu8;
					bool u_xlatb8;
					int u_xlati11;
					uint u_xlatu12;
					bvec2 u_xlatb16;
					float u_xlat19;
					int u_xlati19;
					uint u_xlatu19;
					bool u_xlatb19;
					float u_xlat25;
					float u_xlat27;
					int u_xlati27;
					uint u_xlatu27;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy * vec2(512.0, 512.0);
					    u_xlat0.xy = u_xlat16_0.xy / vec2(vec2(_Value, _Value));
					    u_xlat0.x = u_xlat0.x + u_xlat0.x;
					    u_xlati8 = int(u_xlat0.y);
					    u_xlatb1 = equal(ivec4(u_xlati8), ivec4(5, 4, 3, 2));
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(u_xlati8==1);
					#else
					    u_xlatb8 = u_xlati8==1;
					#endif
					    u_xlatu8 = u_xlatb8 ? 972881535u : uint(0);
					    u_xlatu8 = (u_xlatb1.w) ? 696556137u : u_xlatu8;
					    u_xlatu8 = (u_xlatb1.z) ? 704642687u : u_xlatu8;
					    u_xlatu8 = (u_xlatb1.y) ? 690407533u : u_xlatu8;
					    u_xlatu8 = (u_xlatb1.x) ? 972980223u : u_xlatu8;
					    u_xlatb16.xy = lessThan(vec4(45.0, 30.0, 45.0, 30.0), vec4(vec4(_Value2, _Value2, _Value2, _Value2))).xy;
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(1.0);
					    u_xlat25 = u_xlat0.x;
					    u_xlat10_2.x = float(0.0);
					    u_xlat10_2.y = float(0.0);
					    u_xlat10_2.w = float(0.0);
					    u_xlat3 = float(1000.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = u_xlat25 + -4.0;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb19 = !!(u_xlat25<3.0);
					#else
					        u_xlatb19 = u_xlat25<3.0;
					#endif
					        if(u_xlatb19){
					            u_xlat19 = _Value2 / u_xlat3;
					            u_xlat19 = floor(u_xlat19);
					            u_xlat27 = u_xlat19 * 0.100000001;
					            u_xlat27 = floor(u_xlat27);
					            u_xlat19 = (-u_xlat27) * 10.0 + u_xlat19;
					            u_xlat27 = (-u_xlat25) + 30.0;
					            u_xlat19 = (-u_xlat19) * 3.0 + u_xlat27;
					            u_xlat19 = floor(u_xlat19);
					            u_xlat19 = exp2(u_xlat19);
					            u_xlati19 = int(u_xlat19);
					#ifdef UNITY_ADRENO_ES3
					            { bool cond = u_xlat25<0.0; u_xlati27 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					            u_xlati27 = int((u_xlat25<0.0) ? 0xFFFFFFFFu : uint(0u));
					#endif
					#ifdef UNITY_ADRENO_ES3
					            { bool cond = 3.0<u_xlat25; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					            u_xlati4 = int((3.0<u_xlat25) ? 0xFFFFFFFFu : uint(0u));
					#endif
					            u_xlati27 = int(uint(u_xlati27) | uint(u_xlati4));
					            u_xlatu27 = (u_xlati27 != 0) ? uint(0u) : u_xlatu8;
					            u_xlati4 = int(uint(u_xlati19) ^ u_xlatu27);
					            u_xlatu19 = uint(max(u_xlati19, (-u_xlati19)));
					            u_xlatu19 = u_xlatu27 / u_xlatu19;
					            //null.zwzz = uintBitsToFloat(u_xlatu27 % u_xlatu19);
					            u_xlatu27 = uint(0 - int(u_xlatu19));
					            u_xlati4 = int(uint(u_xlati4) & 2147483648u);
					            u_xlatu19 = (u_xlati4 != 0) ? u_xlatu27 : u_xlatu19;
					            u_xlati27 = int(u_xlatu19 ^ 2u);
					            u_xlatu4 = uint(max(int(u_xlatu19), (-int(u_xlatu19))));
					            u_xlatu4 = u_xlatu4 >> 1u;
					            u_xlatu12 = uint(0 - int(u_xlatu4));
					            u_xlati27 = int(uint(u_xlati27) & 2147483648u);
					            u_xlatu27 = (u_xlati27 != 0) ? u_xlatu12 : u_xlatu4;
					            u_xlati19 = int(0xFFFFFFFEu) * int(u_xlatu27) + int(u_xlatu19);
					            u_xlat1.x = float(u_xlati19);
					            u_xlat4.xyz = u_xlat1.yxz + u_xlat10_2.xyw;
					            u_xlat5.xyz = u_xlat1.xxz + u_xlat10_2.xyw;
					            u_xlat6.xyz = u_xlat1.xyz + u_xlat10_2.xyw;
					            u_xlat10_7.xyz = (u_xlatb16.y) ? u_xlat5.xyz : u_xlat6.xyz;
					            u_xlat10_2.xyw = (u_xlatb16.x) ? u_xlat4.xyz : u_xlat10_7.xyz;
					        //ENDIF
					        }
					        u_xlat3 = u_xlat3 * 0.100000001;
					    }
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_2.z = 0.0;
					    SV_Target0 = u_xlat10_2 + u_xlat10_0;
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
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec2 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec3 u_xlat1;
					bvec4 u_xlatb1;
					lowp vec4 u_xlat10_2;
					float u_xlat3;
					vec3 u_xlat4;
					int u_xlati4;
					uint u_xlatu4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					lowp vec3 u_xlat10_7;
					int u_xlati8;
					uint u_xlatu8;
					bool u_xlatb8;
					int u_xlati11;
					uint u_xlatu12;
					bvec2 u_xlatb16;
					float u_xlat19;
					int u_xlati19;
					uint u_xlatu19;
					bool u_xlatb19;
					float u_xlat25;
					float u_xlat27;
					int u_xlati27;
					uint u_xlatu27;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy * vec2(512.0, 512.0);
					    u_xlat0.xy = u_xlat16_0.xy / vec2(vec2(_Value, _Value));
					    u_xlat0.x = u_xlat0.x + u_xlat0.x;
					    u_xlati8 = int(u_xlat0.y);
					    u_xlatb1 = equal(ivec4(u_xlati8), ivec4(5, 4, 3, 2));
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(u_xlati8==1);
					#else
					    u_xlatb8 = u_xlati8==1;
					#endif
					    u_xlatu8 = u_xlatb8 ? 972881535u : uint(0);
					    u_xlatu8 = (u_xlatb1.w) ? 696556137u : u_xlatu8;
					    u_xlatu8 = (u_xlatb1.z) ? 704642687u : u_xlatu8;
					    u_xlatu8 = (u_xlatb1.y) ? 690407533u : u_xlatu8;
					    u_xlatu8 = (u_xlatb1.x) ? 972980223u : u_xlatu8;
					    u_xlatb16.xy = lessThan(vec4(45.0, 30.0, 45.0, 30.0), vec4(vec4(_Value2, _Value2, _Value2, _Value2))).xy;
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(1.0);
					    u_xlat25 = u_xlat0.x;
					    u_xlat10_2.x = float(0.0);
					    u_xlat10_2.y = float(0.0);
					    u_xlat10_2.w = float(0.0);
					    u_xlat3 = float(1000.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = u_xlat25 + -4.0;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb19 = !!(u_xlat25<3.0);
					#else
					        u_xlatb19 = u_xlat25<3.0;
					#endif
					        if(u_xlatb19){
					            u_xlat19 = _Value2 / u_xlat3;
					            u_xlat19 = floor(u_xlat19);
					            u_xlat27 = u_xlat19 * 0.100000001;
					            u_xlat27 = floor(u_xlat27);
					            u_xlat19 = (-u_xlat27) * 10.0 + u_xlat19;
					            u_xlat27 = (-u_xlat25) + 30.0;
					            u_xlat19 = (-u_xlat19) * 3.0 + u_xlat27;
					            u_xlat19 = floor(u_xlat19);
					            u_xlat19 = exp2(u_xlat19);
					            u_xlati19 = int(u_xlat19);
					#ifdef UNITY_ADRENO_ES3
					            { bool cond = u_xlat25<0.0; u_xlati27 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					            u_xlati27 = int((u_xlat25<0.0) ? 0xFFFFFFFFu : uint(0u));
					#endif
					#ifdef UNITY_ADRENO_ES3
					            { bool cond = 3.0<u_xlat25; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					            u_xlati4 = int((3.0<u_xlat25) ? 0xFFFFFFFFu : uint(0u));
					#endif
					            u_xlati27 = int(uint(u_xlati27) | uint(u_xlati4));
					            u_xlatu27 = (u_xlati27 != 0) ? uint(0u) : u_xlatu8;
					            u_xlati4 = int(uint(u_xlati19) ^ u_xlatu27);
					            u_xlatu19 = uint(max(u_xlati19, (-u_xlati19)));
					            u_xlatu19 = u_xlatu27 / u_xlatu19;
					            //null.zwzz = uintBitsToFloat(u_xlatu27 % u_xlatu19);
					            u_xlatu27 = uint(0 - int(u_xlatu19));
					            u_xlati4 = int(uint(u_xlati4) & 2147483648u);
					            u_xlatu19 = (u_xlati4 != 0) ? u_xlatu27 : u_xlatu19;
					            u_xlati27 = int(u_xlatu19 ^ 2u);
					            u_xlatu4 = uint(max(int(u_xlatu19), (-int(u_xlatu19))));
					            u_xlatu4 = u_xlatu4 >> 1u;
					            u_xlatu12 = uint(0 - int(u_xlatu4));
					            u_xlati27 = int(uint(u_xlati27) & 2147483648u);
					            u_xlatu27 = (u_xlati27 != 0) ? u_xlatu12 : u_xlatu4;
					            u_xlati19 = int(0xFFFFFFFEu) * int(u_xlatu27) + int(u_xlatu19);
					            u_xlat1.x = float(u_xlati19);
					            u_xlat4.xyz = u_xlat1.yxz + u_xlat10_2.xyw;
					            u_xlat5.xyz = u_xlat1.xxz + u_xlat10_2.xyw;
					            u_xlat6.xyz = u_xlat1.xyz + u_xlat10_2.xyw;
					            u_xlat10_7.xyz = (u_xlatb16.y) ? u_xlat5.xyz : u_xlat6.xyz;
					            u_xlat10_2.xyw = (u_xlatb16.x) ? u_xlat4.xyz : u_xlat10_7.xyz;
					        //ENDIF
					        }
					        u_xlat3 = u_xlat3 * 0.100000001;
					    }
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_2.z = 0.0;
					    SV_Target0 = u_xlat10_2 + u_xlat10_0;
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
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out lowp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec2 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec3 u_xlat1;
					bvec4 u_xlatb1;
					lowp vec4 u_xlat10_2;
					float u_xlat3;
					vec3 u_xlat4;
					int u_xlati4;
					uint u_xlatu4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					lowp vec3 u_xlat10_7;
					int u_xlati8;
					uint u_xlatu8;
					bool u_xlatb8;
					int u_xlati11;
					uint u_xlatu12;
					bvec2 u_xlatb16;
					float u_xlat19;
					int u_xlati19;
					uint u_xlatu19;
					bool u_xlatb19;
					float u_xlat25;
					float u_xlat27;
					int u_xlati27;
					uint u_xlatu27;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy * vec2(512.0, 512.0);
					    u_xlat0.xy = u_xlat16_0.xy / vec2(vec2(_Value, _Value));
					    u_xlat0.x = u_xlat0.x + u_xlat0.x;
					    u_xlati8 = int(u_xlat0.y);
					    u_xlatb1 = equal(ivec4(u_xlati8), ivec4(5, 4, 3, 2));
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb8 = !!(u_xlati8==1);
					#else
					    u_xlatb8 = u_xlati8==1;
					#endif
					    u_xlatu8 = u_xlatb8 ? 972881535u : uint(0);
					    u_xlatu8 = (u_xlatb1.w) ? 696556137u : u_xlatu8;
					    u_xlatu8 = (u_xlatb1.z) ? 704642687u : u_xlatu8;
					    u_xlatu8 = (u_xlatb1.y) ? 690407533u : u_xlatu8;
					    u_xlatu8 = (u_xlatb1.x) ? 972980223u : u_xlatu8;
					    u_xlatb16.xy = lessThan(vec4(45.0, 30.0, 45.0, 30.0), vec4(vec4(_Value2, _Value2, _Value2, _Value2))).xy;
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(1.0);
					    u_xlat25 = u_xlat0.x;
					    u_xlat10_2.x = float(0.0);
					    u_xlat10_2.y = float(0.0);
					    u_xlat10_2.w = float(0.0);
					    u_xlat3 = float(1000.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<4 ; u_xlati_loop_1++)
					    {
					        u_xlat25 = u_xlat25 + -4.0;
					#ifdef UNITY_ADRENO_ES3
					        u_xlatb19 = !!(u_xlat25<3.0);
					#else
					        u_xlatb19 = u_xlat25<3.0;
					#endif
					        if(u_xlatb19){
					            u_xlat19 = _Value2 / u_xlat3;
					            u_xlat19 = floor(u_xlat19);
					            u_xlat27 = u_xlat19 * 0.100000001;
					            u_xlat27 = floor(u_xlat27);
					            u_xlat19 = (-u_xlat27) * 10.0 + u_xlat19;
					            u_xlat27 = (-u_xlat25) + 30.0;
					            u_xlat19 = (-u_xlat19) * 3.0 + u_xlat27;
					            u_xlat19 = floor(u_xlat19);
					            u_xlat19 = exp2(u_xlat19);
					            u_xlati19 = int(u_xlat19);
					#ifdef UNITY_ADRENO_ES3
					            { bool cond = u_xlat25<0.0; u_xlati27 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					            u_xlati27 = int((u_xlat25<0.0) ? 0xFFFFFFFFu : uint(0u));
					#endif
					#ifdef UNITY_ADRENO_ES3
					            { bool cond = 3.0<u_xlat25; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
					#else
					            u_xlati4 = int((3.0<u_xlat25) ? 0xFFFFFFFFu : uint(0u));
					#endif
					            u_xlati27 = int(uint(u_xlati27) | uint(u_xlati4));
					            u_xlatu27 = (u_xlati27 != 0) ? uint(0u) : u_xlatu8;
					            u_xlati4 = int(uint(u_xlati19) ^ u_xlatu27);
					            u_xlatu19 = uint(max(u_xlati19, (-u_xlati19)));
					            u_xlatu19 = u_xlatu27 / u_xlatu19;
					            //null.zwzz = uintBitsToFloat(u_xlatu27 % u_xlatu19);
					            u_xlatu27 = uint(0 - int(u_xlatu19));
					            u_xlati4 = int(uint(u_xlati4) & 2147483648u);
					            u_xlatu19 = (u_xlati4 != 0) ? u_xlatu27 : u_xlatu19;
					            u_xlati27 = int(u_xlatu19 ^ 2u);
					            u_xlatu4 = uint(max(int(u_xlatu19), (-int(u_xlatu19))));
					            u_xlatu4 = u_xlatu4 >> 1u;
					            u_xlatu12 = uint(0 - int(u_xlatu4));
					            u_xlati27 = int(uint(u_xlati27) & 2147483648u);
					            u_xlatu27 = (u_xlati27 != 0) ? u_xlatu12 : u_xlatu4;
					            u_xlati19 = int(0xFFFFFFFEu) * int(u_xlatu27) + int(u_xlatu19);
					            u_xlat1.x = float(u_xlati19);
					            u_xlat4.xyz = u_xlat1.yxz + u_xlat10_2.xyw;
					            u_xlat5.xyz = u_xlat1.xxz + u_xlat10_2.xyw;
					            u_xlat6.xyz = u_xlat1.xyz + u_xlat10_2.xyw;
					            u_xlat10_7.xyz = (u_xlatb16.y) ? u_xlat5.xyz : u_xlat6.xyz;
					            u_xlat10_2.xyw = (u_xlatb16.x) ? u_xlat4.xyz : u_xlat10_7.xyz;
					        //ENDIF
					        }
					        u_xlat3 = u_xlat3 * 0.100000001;
					    }
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_2.z = 0.0;
					    SV_Target0 = u_xlat10_2 + u_xlat10_0;
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