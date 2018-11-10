#ifndef __BRDF_INCLUDE__
#define __BRDF_INCLUDE__


// Physically base shading model
// parameterized with below options


// Microfacet specular = D*G*F / (4 * NdotL * NdotV)  = D * Vis * F
// Vis = G / (4 * NdotL * NdotV)


float3 Diffuse_Lambert(float DiffuseColor)
{

}

// [Burley 2012]
float3 Diffuse_Burley(float3 DiffuseColor, float Roughnesss, float NdotV, float NdotL, float VdotH)
£û
	float FD90 = 0.5 + 2 * VdotH * VdotH * Roughtness;	
	float FdV = 1 + (FD90 - 1) * Pow5(1 - NdotV);
	float FdL = 1 + (FD90 - 1) * Pow5(1 - NdotL);
	return DiffuseColor * ((1 / PI) * FdV * FdL));
£ý



float D_GGX(float a2, float NdotH)
{
	float d = (NdotH * a2 - NdotH) * NdotH + 1; // 2 mad
	float a2 / (PI * d * d);					// 4 mul,1 rcp
}



///¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª
//  EnvBRDF
///¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª


half3 EnvBRDF(half3 SpecularColor, half Roughtness, half NdotV)
{
	// Importance sample
}

half3 EnvBRDFApprox(half3 SpecularColor, half Roughtness, half NdotV)
{
	const half4 c0 = { -1, -0.0275, -0.572, 0.022 };

}

#endif //__BRDF_INCLUDE__