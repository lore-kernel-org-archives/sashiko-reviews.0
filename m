Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D863A6EEC
	for <sashiko-reviews@lists.linux.dev>; Tue,  2 Jun 2026 19:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780427308; cv=none; b=ikDFxL0HYsAYdSVLaJcgjpiuiq7tRMOIOALjfQ+f0AizRuytPKs3JA+UYZli2PwSHa8nghckd6Wj+WjVHYQsw2PymoL//0ETlHJsQsXqR6+F7WXT0NtKUTMrBoa6ZmdyGy8ZHaIj3yh01DpL0H+1g+WiKcwHg/TfvD+QEXQPyRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780427308; c=relaxed/simple;
	bh=iWNJSn4uo8JSQotP+QmyWfX5z49t2zzsZf5KGuqaKsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KYoRNKEpmiOWNdVPDfj+mexKrZslcvE17AzpOSrEEO4Z4Vw6eHMIUibWzygplSnHm14v4/ok3fC0ajuUG/VdgnYW9Ms3J3pOQC2+SwMYii4hIQoWxHU0OsNXv8o2YJ2FvvKFy2M2uP2obn05bLlndRToZKIGDMXGcPRCJEHPBX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CGlcTgjB; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CGlcTgjB"
Message-ID: <f921a5e0-6a86-48ae-9ac2-d58f42519476@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780427304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bkJRJHzsiHH/1/ryNQ7smNyOStVTjUbqlqi+pruClso=;
	b=CGlcTgjBOVDRMQOBGLrIu1j+aOShnoFf8/oKphdQCd3VAZeoYkPvRoBU56Yk3KYkF5iRHV
	2+aIhDsLeeiKpjjKEbVsT+spE8y9+l5Y5usXfIz6jaC19qRhfp0V5HUIUet7cywXMxEo1W
	/ew08AWC1+AL9OIOMM+iFfD7ENy1bDY=
Date: Tue, 2 Jun 2026 12:08:10 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/4] crypto: ccp: Fix memory leak in SEV INIT_EX path
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
References: <20260601-sev_snp_fixes-v2-4-611891b28a86@meta.com>
 <20260601235540.C089C1F00893@smtp.kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20260601235540.C089C1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 6/1/26 4:55 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> Pre-existing issues:
> - [Critical] When SEV-SNP is initialized, `sev_init_ex_buffer` is explicitly transitioned to a firmware-owned state via `rmp_mark_pages_firmware()`. However, the driver never reclaims this buffer back to a shared state before reading it. Immediately after the `INIT_EX` command completes, `__sev_do_cmd_locked()` unconditionally calls `sev_write_init_ex_file_if_required()`, which invokes `kernel_write()` to read from `sev_init_ex_buffer` and save it to disk. The host CPU's attempt to read firmware-owned pages inside `kernel_write()` will trigger an RMP violation (Machine Check Exception or #PF with RMP bit), causing a fatal host crash.
> - [High] The `sev_init_ex_buffer` is allocated without the `__GFP_ZERO` flag. If the NV memory file does not exist (returning `-ENOENT`), or a short read occurs, `sev_read_init_ex_file()` returns 0 without fully initializing the 32KB buffer. This uninitialized kernel memory is passed to the SEV firmware via the `INIT_EX` command. Later, `sev_write_init_ex_file()` writes the entire 32KB buffer back to the host filesystem, resulting in an information leak of kernel heap data to disk.
> --
>
> commit 9089d07a571c9b175950b197e846ef7b16492229
> Author: Atish Patra <atishp@meta.com>
>
> crypto: ccp: Fix memory leak in SEV INIT_EX path
>
> This commit fixes a memory leak in the SEV INIT_EX path by freeing
> allocated pages and clearing the buffer on failure. It avoids freeing
> pages if they have already been converted to firmware-owned memory.
>
>> diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
>> --- a/drivers/crypto/ccp/sev-dev.c
>> +++ b/drivers/crypto/ccp/sev-dev.c
>> @@ -1550,7 +1550,7 @@ static int __sev_platform_init_handle_init_ex_path(struct sev_device *sev)
>>   
>>   	rc = sev_read_init_ex_file();
>>   	if (rc)
>> -		return rc;
>> +		goto err_free;
> [Severity: High]
> This is a pre-existing issue, but does allocating sev_init_ex_buffer
> without zeroing leak kernel memory?
>
> Earlier in __sev_platform_init_handle_init_ex_path(), the buffer is
> allocated without the zeroing flag:
>
> page = alloc_pages(GFP_KERNEL, get_order(NV_LENGTH));
>
> If the NV memory file does not exist, sev_read_init_ex_file() sets
> ret = 0 on -ENOENT and returns without initializing the buffer. Short
> reads also leave the remainder of the buffer uninitialized.
> Later, sev_write_init_ex_file() writes the entire 32KB buffer back to
> the host filesystem via kernel_write(). Could this result in an
> information leak of uninitialized kernel heap data to disk?

Fair point. I am not sure if the firmware implements writing to full 
NV_LENTH
so zeroing the buffer at allocation time is idea IMO.

>>   
>>   	/* If SEV-SNP is initialized, transition to firmware page. */
>>   	if (sev->snp_initialized) {
>> @@ -1559,11 +1559,23 @@ static int __sev_platform_init_handle_init_ex_path(struct sev_device *sev)
>>   		npages = 1UL << get_order(NV_LENGTH);
>>   		if (rmp_mark_pages_firmware(__pa(sev_init_ex_buffer), npages, true)) {
>>   			dev_err(sev->dev, "SEV: INIT_EX NV memory page state change failed.\n");
>> -			return -ENOMEM;
>> +			rc = -ENOMEM;
> [Severity: Critical]
> This is a pre-existing issue, but does reading a firmware-owned page
> from the host CPU trigger an RMP violation?
>
> When the buffer is explicitly transitioned to a firmware-owned state
> via rmp_mark_pages_firmware() here, the driver does not appear to
> reclaim this buffer back to a shared state before reading it.
>
> Immediately after the command completes, __sev_do_cmd_locked()
> unconditionally calls sev_write_init_ex_file_if_required(), which
> invokes kernel_write() to read from sev_init_ex_buffer and save it
> to disk.
>
> Will the host CPU's attempt to read firmware-owned pages inside
> kernel_write() trigger a fatal page fault or Machine Check Exception,
> crashing the host?

NA. Already invalidated the theory in response to v1.

https://lore.kernel.org/kvm/1dd5c998-ad2a-47dd-9875-c8fd5db6d374@linux.dev/

>
> [ ... ]
>
