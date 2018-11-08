#ifndef MOBILEBASEPASS_INCLUDE
#define MOBILEBASEPASS_INCLUDE
#include "UnityCG.cginc"
#include "Common.cginc"


struct FVertexFactoryInput
{
	float4 Position		: POSITION;
	float3 Normal		: NORMAL;
#if defined(USE_TANGENT)
	half4  Tangent		: TANGENT;
#endif
	float2 UV0			: TEXCOORD0;
	float2 UV1			: TEXCOORD1;
	UNITY_VERTEX_INPUT_INSTANCE_ID
};

struct FVertexFactoryInterpolantsVSTOPS
{
	float4 Position :	SV_POSITION;
#if defined(DEPTH_OUTPUT)
	half4 Normal	:	NORMAL;
#else 
	half3 Normal	:	NORMAL;
#endif

#if defined(USE_TANGENT)
	half4 Tangent	:   TANGENT;
#endif

	float4 UV0		:   TEXCOORD0;
	half3 ViewDir	:   TEXCOORD1;
	half3 LightDir	:	TEXCOORD2;
	UNITY_VERTEX_INPUT_INSTANCE_ID
};


FVertexFactoryInterpolantsVSTOPS MainVS(FVertexFactoryInput Input)
{
	FVertexFactoryInterpolantsVSTOPS Output;
	UNITY_SETUP_INSTANCE_ID(Input);
	UNITY_TRANSFER_INSTANCE_ID(Input, output);
	float4 wPos = mul(unity_ObjectToWorld, Input.Position);
	Output.Position = mul(UNITY_MATRIX_VP, wPos);
	Output.Normal.xyz = UnityObjectToWorldNormal(Input.Normal);
#if defined(USE_TANGENT)
	Output.Tangent.xyz = UnityObjectToWorldDir(Input.Tangent.xyz);
	Output.Tangent.w = Input.Tangent.w;
#endif
	Output.UV0.xy = Input.UV0;
#if defined(DEPTH_OUTPUT)
	Output.Normal.w = Output.Position.w;
#endif
	Output.ViewDir = _WorldSpaceCameraPos - wPos.xyz;
	Output.LightDir = normalize(_WorldSpaceLightPos0.xyz - wPos);

	return Output;

}

sampler2D _MainTex;

half4 MainPS(FVertexFactoryInterpolantsVSTOPS Input) : SV_Target
{
	UNITY_SETUP_INSTANCE_ID(Input);
	half3 Normal = normalize(Input.Normal.xyz);

	half4 baseColor = tex2D(_MainTex, Input.UV0.xy);
	baseColor.rgb *= baseColor.rgb;

	half3 color = 0;
	half3 diffuseColor = baseColor.rgb;
	color += diffuseColor;


#if !defined(LINEAR_OUTPUT)
	color = sqrt(color);
#endif

#if defined(DEPTH_OUTPUT)
	return half4(color, Input.Normal.w);
#else
	return half4(color, 1);
#endif
}

#endif //MOBILECORE_INCLUDE