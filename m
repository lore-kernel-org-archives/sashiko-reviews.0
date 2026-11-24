Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480471;
	b=iRTnfToBBJ3v+7N48xh0VF0wuY/om3o9GUSg3l9prEyTm6/aOznXKMoZhpEj3UgKA180
	 V6qDrjfgDvHKTLCDBFj2TwaJCvLjHkUowkoA13MB2YBtSE13ZO6t89/xSzzs9wYWtjJkg
	 FctQqJEzn852RJJcDBDX9pYfsBAX/riGrbY/8N254WaiawH/oxvN6DI7pTp6FhzGHA3D/
	 XOU2jlJZ2XjE2uDWasMmnBLsAqaNjKxlflWpM5QtZwNHl4pzg3Mr4F+jDfpYadsIvVWM/
	 hkGETt2UipE+RqMWNTyFWDuhexP8N9LnATZfG4gCvJEAAbw2L6eRcZCqad1W4VVcHsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=6crECWKKQv2zAsDKPQ3Smbpft+Vpc6B0Dn2GFB4AR8c=;
	b=H5a0Ao8FsGOLImgiF2lnc87UpE+T6V+fh5URSOpcHcwodux/0Yf3thEGecmcCUhqCacX
	 JgfGHrdzBjjvJ+Xrhw4ncxAwgxU2pcXjqZ7ONJJ+XlaQTTgNJI0Md2kR7gl7RCkG3MOEl
	 m1QcL2rYBNcFtg3aOfHSFBBL+vG8upzbQB1cCKO2AJ/HGynIh5MAjR6aL3vYh9wWQgB3b
	 y40v+7zYOsRJ+S3K2Rkt9Id8KfhTdJWn0/DoGCdM1wMzDFNE3oJuwYWqcYbZKYTe2ey1M
	 QGxOtxFx5wYJapRjr3Mz7ZjM9aVCHEvuXbwJvmlDIk+xhk3VXn+FU6xEcHzGDEKdrXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWB19PW+;
	arc=none smtp.remote-ip=74.125.231.203
Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F0A606A322
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 00:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6F0A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWB19PW+
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-5734e8b3f03so384149b6e.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 16:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795480470; x=1796085270; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6crECWKKQv2zAsDKPQ3Smbpft+Vpc6B0Dn2GFB4AR8c=;
        b=ZWB19PW+3SH5/6vstd9XvL3yl8icPtBZUULHYholyrwjMb7BYw8sBvs7dBs22juZHc
         ZAgNfMsfc+HYGzAyrD71QendEY8hx4RyXSyCyW7z2rG+uZma3kqs3i0ILuecS3m3lS4Q
         8FkbxxB3Zu580hSZHrPQFnUkwKu17eah6Hd5r/6As6H4umVx32I+rdiFmkj6Hh2kZvUM
         KDGZbuV/uZPdKTEVN/AElxSkfSZMRTawGqTa3kj4Fx5ozibZ1w4tw0B4Iv8hiuoVbzm9
         Ai+gZoUIf7JHnRYG/pkrLSfBk8veO/ydvs8fU2mHriylAXitwE+jBDcMiP++B/tveM83
         wNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480470; x=1796085270;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6crECWKKQv2zAsDKPQ3Smbpft+Vpc6B0Dn2GFB4AR8c=;
        b=jWpd6UZrGWXoOQeEpq1az8Kx4H9sW46peP8+9D605O5OJ8IP2HGtPf+sFmfNWwE1il
         RXmYPAZxqrbrzGVbau6eoKPPTo4QYOWrRaXKI1ELkFufszqbueDzHxDYvJDpaRGi8RZ6
         WJHqSWiuJcis8jR9up0xPVLW8pBi71ewTfkIfQk9dt0QpfdYnJvG6HTkYYE/er1fyIhg
         KdMYKNeb3lwuuDoeBELy2MTeVepntjH5i36WxcerQgu8tpLGRU5+9o8HaM3CLfKmxIA5
         3CBOhEI/5c2Kougo3RdU14Y2B+zyUbM9/rUCcH3vwHTPmpTHKazVDrf5LGVzA8z6AiqX
         837g==
X-Gm-Message-State: APuU4Z/3nQUco15CQRAdUBl9RvVbAwypgQphyFsXC6FI5NtwxNvzr8gl
	fjdbbojAQCQbQd2lvddBVrufDYXIdt8Z/NTecqr8feI9JdQ4z9hKTyr6f1i/4MxaG0n7gQ==
X-Gm-Gg: AZFdTZdu/b873k1+M5qw8aHOzHGagv7q76vLF4jUIVs1RmcFsy+NHaksHUwnBY0R7Ti
	Ia1OlnO5AZL/s43aX761L5R+SzANzvVNg0s0CiUAwYdveFaTd6XiHktdVKWxEBNEaQaTBmB6o7S
	ATHrhrO92GS0dhWBxVDqPACayV9E+B5FBHhObcEw9Wa/hgC1r2s3AylAkVFGLvoEWSEWtMzHvcO
	Dp2ugKQFDmZ+rfN5kHuBoKKdI0IDcA3+zD/OgQ2yNySIPao68OKG0WYyisSgHNMJG2pBfiG5avn
	Xr80/6Vy85g3VtVWJotJOkdIKjPa5IUjeKy7vN5RcWhfQStSam/nwG5LPakZpCZFvBJS9k4mIN1
	Qt8EC6OjM/PV+r7FYvKCqahTz/907pfaPbxYbdAfueaRtQz6yjybc52HYgoFKrGLtPTYmc6ozRf
	SmoptlNQmjw1E0ytUFThXq02EkOZbJRxpz0phdmzeITYCigS8XRnTzVWp+Y8pFlclpZ9N1DLhhQ
	cGoXX5N5aDGSXbVcoUqVr2j+fuHdBbe+qARW5k0gx/2pVXBq1Kgjxpyjl9iDZKkVe8a0I+ILaSn
	3RJMpOs9X0bjUUjBOfYrvDA1URZrGqTMGbrAg5bQkzI1vQ==
X-Received: by 2002:a05:6808:50a4:b0:4fb:c2dd:c7a5 with SMTP id 5614622812f47-57a0bb863e2mr10864879b6e.31.1795480469686;
        Mon, 23 Nov 2026 16:34:29 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::d500? ([2600:8804:5716:d800::d500])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a347636b9sm10287193b6e.7.2026.11.23.16.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 16:34:29 -0800 (PST)
Message-ID: <6e5b4d8f-3270-43ad-9a2e-b7f37110dfe0@gmail.com>
Date: Mon, 23 Nov 2026 18:34:28 -0600
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
Subject: Re: [PATCH] drm/mediatek: ovl: Report coverage blending on older SoCs
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20261120-rbrue-suez-mtk-ovl-coverage-v1-1-35040085fc37@gmail.com>
 <sashiko-outbox-226021@kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <sashiko-outbox-226021@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 2:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] drm/mediatek: ovl: mtk_ovl_layer_config() sets OVL_CON_AEN on
>    XRGB formats
> --
>
> commit ecc63cbd272ca62ff2a9d686e47d8eb659dfe660
> Author: Ryan Brue <ryanbrue.dev@gmail.com>
>
> drm/mediatek: ovl: Report coverage blending on older SoCs
>
> This commit sets .blend_modes = BIT(DRM_MODE_BLEND_COVERAGE) on MT2701,
> MT8167, MT8173, and MT8183 OVL driver data to eliminate the DRM plane
> init warning when exposing alpha formats without a blend mode property.
>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>> index 5445870716f94..81a4143f294d5 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> [ ... ]
>
>> @@ -667,6 +663,7 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
>>   	.gmc_bits = 8,
>>   	.layer_nr = 4,
>>   	.fmt_rgb565_is_0 = false,
>> +	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
>>   	.formats = mt8173_formats,
>>   	.num_formats = ARRAY_SIZE(mt8173_formats),
>>   };
>> @@ -677,6 +674,7 @@ static const struct mtk_disp_ovl_data mt8167_ovl_driver_data = {
>>   	.layer_nr = 4,
>>   	.fmt_rgb565_is_0 = true,
>>   	.smi_id_en = true,
>> +	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
>>   	.formats = mt8173_formats,
>>   	.num_formats = ARRAY_SIZE(mt8173_formats),
>>   };
>> @@ -686,6 +684,7 @@ static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
>>   	.gmc_bits = 8,
>>   	.layer_nr = 4,
>>   	.fmt_rgb565_is_0 = true,
>> +	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
>>   	.formats = mt8173_formats,
>>   	.num_formats = ARRAY_SIZE(mt8173_formats),
>>   };
>> @@ -695,6 +694,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
>>   	.gmc_bits = 10,
>>   	.layer_nr = 4,
>>   	.fmt_rgb565_is_0 = true,
>> +	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
>>   	.formats = mt8173_formats,
>>   	.num_formats = ARRAY_SIZE(mt8173_formats),
>>   };
>> @@ -704,6 +704,7 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
>>   	.gmc_bits = 10,
>>   	.layer_nr = 2,
>>   	.fmt_rgb565_is_0 = true,
>> +	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE),
>>   	.formats = mt8173_formats,
>>   	.num_formats = ARRAY_SIZE(mt8173_formats),
>>   };
> [Severity: High]
> Does advertising BIT(DRM_MODE_BLEND_COVERAGE) on these SoCs cause
> mtk_ovl_layer_config() to set OVL_CON_AEN on opaque formats such as
> DRM_FORMAT_XRGB8888?
>
> DRM_MODE_BLEND_PREMULTI is 0 while DRM_MODE_BLEND_COVERAGE is 1.  When
> .blend_modes was 0, state->base.pixel_blend_mode stayed at 0, so
> mtk_ovl_layer_config() only set OVL_CON_AEN when has_alpha was true:
>
> drivers/gpu/drm/mediatek/mtk_disp_ovl.c:mtk_ovl_layer_config() {
>      ...
> 	unsigned int blend_mode = state->base.pixel_blend_mode;
>      ...
> 		if (blend_mode || state->base.fb->format->has_alpha)
> 			con |= OVL_CON_AEN;
>      ...
> }
>
> With state->base.pixel_blend_mode now initialized to
> DRM_MODE_BLEND_COVERAGE (1), blend_mode is non-zero and OVL_CON_AEN is
> always set.  Because these older OVL blocks map XRGB8888 to
> OVL_CON_CLRFMT_ARGB8888 and do not support OVL_CONST_BLEND, enabling
> OVL_CON_AEN makes the hardware read the X byte from memory as per-pixel
> alpha, reintroducing the XRGB scanout regression fixed by 995d4d558eea
> ("drm/mediatek: ovl: Fix XRGB format breakage for blend_modes unsupported
> SoCs").
>
> Checking whether ovl->data->blend_modes includes
> BIT(DRM_MODE_BLEND_PIXEL_NONE) instead of testing blend_mode as a boolean
> would preserve OVL_CON_AEN behavior on coverage-only SoCs.
>

Thanks. DRM_MODE_BLEND_PREMULTI is 0, so with the coverage-only property 
the default blend mode becomes non-zero and mtk_ovl_layer_config() would 
set OVL_CON_AEN for XRGB planes on these SoCs, undoing 995d4d558eea. My 
test only looked at ARGB planes, which is why the registers matched, and 
the commit message's "both are non-zero" was wrong, my bad.

v2 will only look at the blend mode where the OVL supports premultiplied 
blending, the same test mtk_ovl_fmt_convert() uses, so these SoCs keep 
enabling alpha blending for formats with alpha only.
