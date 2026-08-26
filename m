Received: from sg-2-2.ptr.blmpb.com (sg-2-2.ptr.blmpb.com [71.18.227.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27E9476061
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 17:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.18.227.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766660; cv=none; b=FSNWocDfdylXPpCWoxXrpFlQVlZzQ63vWI2eF4yZuBVgo+gfhwKbLAGJgdq1/oasKCEVi7bny1llmq5AmJrht8WGTJnAkR0bjSILx877IFcJzRxZNCWLEdJaEFlhBuuBnpRMbsfpOrqXJDlRuGp6lolb6a4QkBYDpxc4F+uE6gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766660; c=relaxed/simple;
	bh=NeVGf9M8jMXs1Lfou5xEkSja4Xlp0VdOpnt4LFn4qgY=;
	h=In-Reply-To:Subject:From:Date:Message-Id:References:To:
	 Mime-Version:Content-Type; b=Lk+FgI3CDuZjiHqkzOWcultjxQU/WMcj3U020OoUx+0DaMmpW2yOaX91rbMDfkTAbB0g/1p6/wcTougegT5fv1sY/vcB51CvP6d0GKBtJ+idpyU8fNBnLzQruIZqcjZJt0uJkcf4/3vqiJQ57b+gOGTnrhspE4jrVAxOCQ4qJRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=imm0nv1nhtv.is-a.dev; spf=pass smtp.mailfrom=imm0nv1nhtv.is-a.dev; dkim=pass (2048-bit key) header.d=imm0nv1nhtv.is-a.dev header.i=@imm0nv1nhtv.is-a.dev header.b=mxk7oq4Y; arc=none smtp.client-ip=71.18.227.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=imm0nv1nhtv.is-a.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imm0nv1nhtv.is-a.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imm0nv1nhtv.is-a.dev header.i=@imm0nv1nhtv.is-a.dev header.b="mxk7oq4Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=lark2602131731; d=imm0nv1nhtv.is-a.dev; t=1787766637;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=RaLT5uR+REqZHMuEvFsXRN02KTsNHZXOxQJackBcB6M=;
 b=mxk7oq4YxJ5Rd2XlpRayaubOju9NS2t2GETNrelqZz+m15/7fdhkGDkkSzfAtfHCfrvV1j
 9YS5ouu1W4Q9W0UWNEC7XJaB6LTi/mnLAi2TJ3ZKGTjZ3RMXQybqjIv5d0LudOCcooye9a
 w741kIp3cvUu9nmj+98cGwcFKXQzRHlswZ53QXT36m6sbHySzt9+7vDDRqDzMP3KdTDSSv
 FPJIu5XR3gxxoiMytF0DwigamPrM9/mT/h5yDx6V7XbS+LVdjMvEbmN3QuiSxX4aKvW48l
 jvOt6u17AH2EHgWYRlpT0spWShtjTYQDiRAAnaTFKizCCNQx/Hk/I0qelL0sLA==
Content-Language: en-US
X-Original-From: NepNep7601 <neptune@imm0nv1nhtv.is-a.dev>
In-Reply-To: <20260826172156.AE0231F000E9@smtp.kernel.org>
Subject: Re: [PATCH] drm/amd/display: fall back to software I2C on hardware engine failure
X-Lms-Return-Path: <lba+26a8f276c+8c252c+lists.linux.dev+neptune@imm0nv1nhtv.is-a.dev>
User-Agent: Mozilla Thunderbird
Content-Transfer-Encoding: 7bit
Received: from [192.168.100.185] ([58.186.164.158]) by smtp.larksuite.com with ESMTPS; Wed, 26 Aug 2026 17:50:35 +0000
From: "NepNep7601" <neptune@imm0nv1nhtv.is-a.dev>
Date: Thu, 27 Aug 2026 00:50:34 +0700
Message-Id: <c9d73643-b95a-4145-96b9-f05b2c3c67e7@imm0nv1nhtv.is-a.dev>
Autocrypt: addr=neptune@imm0nv1nhtv.is-a.dev; keydata= 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 w7556xiTImYhxhLT4QiuJfjqiGM=
References: <20260826170549.21985-1-neptune@imm0nv1nhtv.is-a.dev> <20260826172156.AE0231F000E9@smtp.kernel.org>
To: <sashiko-reviews@lists.linux.dev>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8

The patch is a single fallback fix. I have asked Claude Opus 5 to 
confirm the bugs, here is what Claude has to say:

On the first: agreed, that looks like a genuine leak. dal_ddc_open() has 
already succeeded when setup_engine() fails, and that path calls 
release_engine() without the dal_ddc_close() that 
dce_i2c_submit_command_hw() performs on every exit. I'll send it as a 
separate patch.

On the second: the per-connector locking argument holds -- the i2c core 
takes a per-adapter lock while pool->i2c_hw_buffer_in_use is global to 
the resource pool, so two adapters can interleave. I haven't confirmed 
whether the hardware buffer is genuinely shared between engines, so I 
can't say whether it corrupts transactions in practice.

On 27/08/2026 00:21, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Pre-existing resource leak in acquire_i2c_hw_engine leaves DDC pin permanently open on setup failure.
> - [High] TOCTOU race on shared I2C hardware buffer flag `i2c_hw_buffer_in_use` bypasses global mutual exclusion.
> --
> 
> commit 715340ad0a0bb4f4ee8ee30d4c2c692856bedacf
> Author: NepNep7601 <neptune@imm0nv1nhtv.is-a.dev>
> 
> drm/amd/display: fall back to software I2C on hardware engine failure
> 
> This commit implements a fallback mechanism to the bit-banging software I2C
> engine when the hardware engine fails to complete longer transfers. It retries
> the transfer on the software engine instead of outright failing, which resolves
> EDID read failures on DCE6/Oland hardware.
> 
>> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c b/drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c
>> index f5261e8d76785..238c17e6f51db 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c
>> @@ -72,9 +72,16 @@ bool dce_i2c_submit_command(
>>   
>>   	dce_i2c_hw = acquire_i2c_hw_engine(pool, ddc);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does acquire_i2c_hw_engine()
> leak the DDC pin on setup failure?
> 
> In acquire_i2c_hw_engine(), dal_ddc_open() is called successfully, but if
> the hardware engine is busy (e.g., locked by DMCU), setup_engine() returns
> false. The error path then calls release_engine() without calling
> dal_ddc_close():
> 
>      if (!setup_engine(dce_i2c_hw)) {
>          release_engine(dce_i2c_hw);
>          return NULL;
>      }
> 
> This leaves the pin leaked in the opened state. As a result, subsequent calls
> to dal_ddc_open() will return GPIO_RESULT_ALREADY_OPENED, which breaks all
> future I2C transfers (and display hotplug/EDID detection) on that port until
> reboot. Is there a missing dal_ddc_close() here?
> 
> [Severity: High]
> This is a pre-existing issue, but does acquire_i2c_hw_engine() have a TOCTOU
> race on the shared pool->i2c_hw_buffer_in_use flag?
> 
> The function checks and sets pool->i2c_hw_buffer_in_use without a global
> lock:
> 
>      if (pool->i2c_hw_buffer_in_use || !is_engine_available(dce_i2c_hw))
>          return NULL;
>      ...
>      pool->i2c_hw_buffer_in_use = true;
> 
> Because I2C adapter locks in amdgpu_dm_i2c_xfer() are per-connector,
> concurrent I2C transfers on different display connectors can execute
> acquire_i2c_hw_engine() simultaneously. Both threads can read
> pool->i2c_hw_buffer_in_use as false, proceed to configure their respective
> hardware engines concurrently, and set the flag to true. Can this bypass
> global mutual exclusion and cause hardware timeouts or corrupted I2C
> transactions?
> 
>> -	if (dce_i2c_hw)
>> -		return dce_i2c_submit_command_hw(pool, ddc, cmd, dce_i2c_hw);
>> +	if (dce_i2c_hw && dce_i2c_submit_command_hw(pool, ddc, cmd, dce_i2c_hw))
>> +		return true;
> 
> [ ... ]
