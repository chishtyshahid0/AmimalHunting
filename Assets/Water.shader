Shader "Custom/BuiltInWaterFoam"
{
    Properties
    {
        [Header(Water Colors)]
        _ShallowColor ("Shallow Water Color", Color) = (0.10, 0.65, 0.70, 0.55)
        _DeepColor ("Deep Water Color", Color) = (0.02, 0.15, 0.35, 0.82)
        _DepthDistance ("Water Depth Distance", Range(0.1, 20)) = 4

        [Header(Animated Water Normals)]
        [Normal] _NormalMap1 ("Normal Map 1", 2D) = "bump" {}
        [Normal] _NormalMap2 ("Normal Map 2", 2D) = "bump" {}

        _NormalSpeed1 ("Normal Speed 1", Vector) = (0.03, 0.01, 0, 0)
        _NormalSpeed2 ("Normal Speed 2", Vector) = (-0.02, 0.025, 0, 0)
        _NormalStrength ("Normal Strength", Range(0, 2)) = 0.7

        [Header(Mesh Waves)]
        _WaveHeight ("Wave Height", Range(0, 1)) = 0.08
        _WaveFrequency ("Wave Frequency", Range(0.01, 5)) = 0.6
        _WaveSpeed ("Wave Speed", Range(0, 5)) = 0.8

        [Header(Shore Foam)]
        _FoamTex ("Foam Noise Texture", 2D) = "white" {}
        _FoamColor ("Foam Color", Color) = (1, 1, 1, 1)
        _FoamDistance ("Foam Distance", Range(0.01, 5)) = 0.7
        _FoamTiling ("Foam Tiling", Range(0.01, 10)) = 0.5
        _FoamSpeed ("Foam Speed", Vector) = (0.05, 0.025, 0, 0)
        _FoamThreshold ("Foam Threshold", Range(0, 1)) = 0.25
        _FoamIntensity ("Foam Intensity", Range(0, 2)) = 1

        [Header(Surface Settings)]
        _Smoothness ("Smoothness", Range(0, 1)) = 0.9
        _Metallic ("Metallic", Range(0, 1)) = 0
        _Opacity ("Overall Opacity", Range(0, 1)) = 0.75
    }

    SubShader
    {
        Tags
        {
            "Queue" = "Transparent"
            "RenderType" = "Transparent"
            "IgnoreProjector" = "True"
        }

        LOD 300

        Blend SrcAlpha OneMinusSrcAlpha
        ZWrite Off
        Cull Back

        CGPROGRAM

        #pragma surface surf Standard alpha:fade vertex:vert
        #pragma target 3.0

        #include "UnityCG.cginc"

        sampler2D _NormalMap1;
        sampler2D _NormalMap2;
        sampler2D _FoamTex;

        UNITY_DECLARE_DEPTH_TEXTURE(_CameraDepthTexture);

        fixed4 _ShallowColor;
        fixed4 _DeepColor;
        fixed4 _FoamColor;

        float4 _NormalSpeed1;
        float4 _NormalSpeed2;
        float4 _FoamSpeed;

        float _NormalStrength;

        float _WaveHeight;
        float _WaveFrequency;
        float _WaveSpeed;

        float _DepthDistance;

        float _FoamDistance;
        float _FoamTiling;
        float _FoamThreshold;
        float _FoamIntensity;

        float _Smoothness;
        float _Metallic;
        float _Opacity;

        struct Input
        {
            float2 uv_NormalMap1;
            float2 uv_NormalMap2;

            float4 screenPos;
            float3 worldPos;
        };

        void vert(inout appdata_full v)
        {
            float timeValue = _Time.y * _WaveSpeed;

            float wave1 = sin(
                (v.vertex.x + v.vertex.z) *
                _WaveFrequency +
                timeValue
            );

            float wave2 = sin(
                (v.vertex.x * 0.7 - v.vertex.z * 1.3) *
                (_WaveFrequency * 1.35) -
                timeValue * 0.8
            );

            float wave3 = sin(
                (v.vertex.x * 1.5 + v.vertex.z * 0.4) *
                (_WaveFrequency * 0.55) +
                timeValue * 0.45
            );

            float finalWave =
                wave1 +
                wave2 * 0.55 +
                wave3 * 0.30;

            v.vertex.y += finalWave * _WaveHeight;
        }

        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            // -------------------------------------------------
            // Animated normal maps
            // -------------------------------------------------

            float2 normalUV1 = IN.uv_NormalMap1;
            float2 normalUV2 = IN.uv_NormalMap2;

            normalUV1 += _Time.y * _NormalSpeed1.xy;
            normalUV2 += _Time.y * _NormalSpeed2.xy;

            fixed3 normal1 =
                UnpackNormal(tex2D(_NormalMap1, normalUV1));

            fixed3 normal2 =
                UnpackNormal(tex2D(_NormalMap2, normalUV2));

            fixed3 combinedNormal;

            combinedNormal.xy =
                (normal1.xy + normal2.xy) *
                _NormalStrength;

            combinedNormal.z =
                normal1.z * normal2.z;

            o.Normal = normalize(combinedNormal);

            // -------------------------------------------------
            // Scene depth
            // -------------------------------------------------

            float rawSceneDepth =
                SAMPLE_DEPTH_TEXTURE_PROJ(
                    _CameraDepthTexture,
                    UNITY_PROJ_COORD(IN.screenPos)
                );

            float sceneEyeDepth =
                LinearEyeDepth(rawSceneDepth);

            float waterEyeDepth =
                IN.screenPos.w;

            float depthDifference =
                max(sceneEyeDepth - waterEyeDepth, 0.0);

            // -------------------------------------------------
            // Shallow and deep water colors
            // -------------------------------------------------

            float depthFactor =
                saturate(
                    depthDifference /
                    max(_DepthDistance, 0.0001)
                );

            fixed4 waterColor =
                lerp(
                    _ShallowColor,
                    _DeepColor,
                    depthFactor
                );

            // -------------------------------------------------
            // Shore foam
            // -------------------------------------------------

            float foamEdge =
                1.0 -
                saturate(
                    depthDifference /
                    max(_FoamDistance, 0.0001)
                );

            float2 foamUV =
                IN.worldPos.xz *
                _FoamTiling;

            foamUV +=
                _Time.y *
                _FoamSpeed.xy;

            float foamNoise =
                tex2D(_FoamTex, foamUV).r;

            float foamValue =
                foamEdge *
                foamNoise *
                _FoamIntensity;

            float foam =
                smoothstep(
                    _FoamThreshold,
                    _FoamThreshold + 0.25,
                    foamValue
                );

            // -------------------------------------------------
            // Final surface output
            // -------------------------------------------------

            fixed3 finalColor =
                lerp(
                    waterColor.rgb,
                    _FoamColor.rgb,
                    foam * _FoamColor.a
                );

            o.Albedo = finalColor;
            o.Metallic = _Metallic;
            o.Smoothness = _Smoothness;
            o.Occlusion = 1;

            o.Emission =
                _FoamColor.rgb *
                foam *
                0.12;

            o.Alpha =
                saturate(
                    waterColor.a *
                    _Opacity +
                    foam * 0.25
                );
        }

        ENDCG
    }

    Fallback "Transparent/Diffuse"
}