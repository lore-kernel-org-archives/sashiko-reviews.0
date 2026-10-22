Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792703430;
	b=RhqVjOAxnwoOukW5gigTi83srfJSp2GlNgy/3sOr2QPPiajoMpeUoi9hP8Yv/Hru9Y8G
	 m8n2i+1QzaRDqbKMOArtx9SBURpAO0kVc2JwdKwhgPlovBTRHWASsarxHfCPVlsRWzvjJ
	 BpzGHvAH/DwCbRU4dVwDrepY9rBu0bTPQqmI6T/5V13ROUfOiFCUtKN9QgV/Zz+wtnfCy
	 XnbFuq01aM44ISkYDppFbPN0lODrXOZy0Ie58XsjNyUf/Fsu8JlJzbKNf51nYRzpaDoex
	 F6QhzRCjqbFVyYU+tOFH23JKubgg3GBN9sVOPh49Q2IWJEGi2HlWVQw/SucfpmGuiIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792703430;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=kzCUZY7PIb9I9YRhQJpxedmyaV7krb3GSjQv8r92ors=;
	b=anYA1IZk687K0URgm3MSWqk6N7uH1x92NvbILNxe+yRQzDbCQIt0lzjuY03vbMnPPjrj
	 a2+K5jaSEg9fMC0wdioOiu8gZCoqJ84iS29UXtTE2OJs+FsZno4zPrdp07c0y14dMRWDJ
	 LPEs7U+ET9jNIvSKZq6PTclNtfbyko5JiGG5H4mN6IHQ2MZ/QXW4J30qa/EGXIxK8mR5m
	 q2DIU0jRo+/0wFxQLkENX0lcQAVC7I2M9vO6S7/ctWs2NAxPuz3TlcuSQOIKjT4qYBPJx
	 bJQWHe3rwLZ9Pi4Yh2ipdhMM/evRARPFTJY1Nm49o2k/gFodE1egZNTemrSi6bExS2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=Igalia.com;
	spf=pass smtp.mailfrom=Igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=RqXbR505;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85430606A319
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 21:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85430606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=Igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=RqXbR505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=kzCUZY7PIb9I9YRhQJpxedmyaV7krb3GSjQv8r92ors=; b=RqXbR505PjcQ1K3Yqlz5lUhv+g
	xc+QiqUQp0ZdDdDzV+XMaDnx64+cwSIO2ePNOPpItvdziHQnF2aMEUy0jXOpszIVdFcfQr7oWbBhN
	da8e+gWNKU5rTAQ7eYU250oIQgPZkXnu4zDFCH9r0mf7hzfdjBn3aiODBtVg2fRtksoo+k7aiLp/B
	eAJYK7LpQdfq/u1wULHmU2t8L4iFG46knf5tJtjICtYnWJE49iOoPj7+gNqFx/wY+e49OQKqZAOQV
	NK//NXN5uXruEX780+vWmFajznezDki6h3zvtL3nXxBPVmsx25kcj7X7BSnLfI6+Zl36+VcDoZekf
	VDqZc+HQ==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91] helo=[192.168.1.133])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xK03O-007BVG-SE; Thu, 22 Oct 2026 23:10:27 +0200
Message-ID: <85a6e366-b6ae-4d60-897c-b04c7fbb273c@Igalia.com>
Date: Thu, 22 Oct 2026 14:10:22 -0700
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amd/display: Update colorop pipeline tests for
 new fixed matrix op
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20261022173655.2318987-1-John.Harrison@Igalia.com>
 <20261022173655.2318987-4-John.Harrison@Igalia.com>
 <sashiko-outbox-181891@kernel.org>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <sashiko-outbox-181891@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 10:50, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/amd/display: undeclared DRM_COLOROP_FIXED_MATRIX breaks KUnit test build
> --
>
> commit fa1c05a038fce65c050bce3e6d89515560ce7081
> Author: John Harrison <John.Harrison@Igalia.com>
>
> drm/amd/display: Update colorop pipeline tests for new fixed matrix op
>
> This commit updates the expected colorop pipeline arrays in the amdgpu_dm
> KUnit tests to begin with DRM_COLOROP_FIXED_MATRIX.
>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_colorop_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_colorop_test.c
>> index 90cc5592ef5de..00f1d5b33b1f0 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_colorop_test.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_colorop_test.c
>> @@ -192,6 +192,7 @@ static void dm_expect_colorop_pipeline(struct kunit *test, struct drm_device *dr
>>   static void dm_test_initialize_default_pipeline(struct kunit *test)
>>   {
>>   	static const enum drm_colorop_type expected[] = {
>> +		DRM_COLOROP_FIXED_MATRIX,
>>   		DRM_COLOROP_1D_CURVE,	/* degam TF */
>>   		DRM_COLOROP_MULTIPLIER,
>>   		DRM_COLOROP_CTM_3X4,
>> @@ -257,6 +258,7 @@ static void dm_test_initialize_default_pipeline_caps(struct kunit *test,
>>   static void dm_test_initialize_default_pipeline_dpp_3d_lut(struct kunit *test)
>>   {
>>   	static const enum drm_colorop_type expected[] = {
>> +		DRM_COLOROP_FIXED_MATRIX,
>>   		DRM_COLOROP_1D_CURVE,
>>   		DRM_COLOROP_MULTIPLIER,
>>   		DRM_COLOROP_CTM_3X4,
>> @@ -278,6 +280,7 @@ static void dm_test_initialize_default_pipeline_dpp_3d_lut(struct kunit *test)
>>   static void dm_test_initialize_default_pipeline_mpc_preblend(struct kunit *test)
>>   {
>>   	static const enum drm_colorop_type expected[] = {
>> +		DRM_COLOROP_FIXED_MATRIX,
>>   		DRM_COLOROP_1D_CURVE,
>>   		DRM_COLOROP_MULTIPLIER,
>>   		DRM_COLOROP_CTM_3X4,
>> @@ -299,6 +302,7 @@ static void dm_test_initialize_default_pipeline_mpc_preblend(struct kunit *test)
>>   static void dm_test_initialize_default_pipeline_no_3d_lut(struct kunit *test)
>>   {
>>   	static const enum drm_colorop_type expected[] = {
>> +		DRM_COLOROP_FIXED_MATRIX,
>>   		DRM_COLOROP_1D_CURVE,
>>   		DRM_COLOROP_MULTIPLIER,
>>   		DRM_COLOROP_CTM_3X4,
> [Severity: Medium]
> Does this break the build when CONFIG_DRM_AMD_DC_KUNIT_TEST is enabled?
>
> This patch adds DRM_COLOROP_FIXED_MATRIX to the expected[] arrays in
> dm_test_initialize_default_pipeline(),
> dm_test_initialize_default_pipeline_dpp_3d_lut(),
> dm_test_initialize_default_pipeline_mpc_preblend(), and
> dm_test_initialize_default_pipeline_no_3d_lut() in
> drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_colorop_test.c.
>
> The commit references Fixes: 6d103ad11583 ("drm/amd/display: Add fixed matrix
> colorop to color pipeline"), which in turn depends on f6c58e4ae87c
> ("drm/colorop: Add DRM_COLOROP_FIXED_MATRIX"), but neither commit is present
> in this branch.
>
> In include/uapi/drm/drm_mode.h, enum drm_colorop_type does not define
> DRM_COLOROP_FIXED_MATRIX:
>
>      enum drm_colorop_type {
>              DRM_COLOROP_1D_CURVE,
>              DRM_COLOROP_1D_LUT,
>              DRM_COLOROP_CTM_3X4,
>              DRM_COLOROP_MULTIPLIER,
>              DRM_COLOROP_3D_LUT,
>      };
>
> In addition, amdgpu_dm_build_default_pipeline() in
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c still starts the
> default pipeline with DRM_COLOROP_1D_CURVE:
>
>      /* 1D curve - DEGAM TF */
>      ops[i] = colorop_kzalloc_obj();
>      if (!ops[i]) {
>              ret = -ENOMEM;
>              goto cleanup;
>      }
>
>      ret = colorop_curve_1d_init(dev, ops[i], plane, &dm_colorop_funcs,
>                                  amdgpu_dm_supported_degam_tfs,
>                                  DRM_COLOROP_FLAG_ALLOW_BYPASS);
>
> Should this patch only be applied to a branch that already contains commits
> f6c58e4ae87c and 6d103ad11583?
>
What branch is Sashiko using? The web page report says it is based on 
77f548b127c6de34ce271fa09ba270cb1ef9f2da which is a hash that does not 
exist in any tree I have locally. My patches are based on drm-tip, which 
very definitely contains the FIXED_MATRIX support (merged August 27th 
according to the patch itself).

John.

