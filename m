Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D9F449B1C
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 05:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784611000; cv=none; b=rQ5aAAAJRqr3amTG4Il36ezC2ulmt7GJXkJMWdPg0dwCafssiacG6hH/K1Kd1ZhcIlzMKVpS1184iWe9DGaLNbKnOX1q1bw3hCaM4fE8V0RjIt6s7RuCTTECAr/RFGhtoAggZxMEQ/fkikYpYmsPvMjCm3+Nb0VVK/wM4PoDe64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784611000; c=relaxed/simple;
	bh=7pIYrY41PzHNLZbMfPguFEZowSjaKqcViIt1vmo+yuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HrQtj+xgAo94xpJkaTuUt4A6sEawsytoTgHalPk/ylJwVRJpdV6y3z623HsR33/iLcvnnKS3dWeATZfY4eiXYzlxqO4SGp1eactj6gh2awWS2DFetPxaZjD+pt3o9DejnNiLDVvqhY5LqIIXE8iB8avNHCfRlrfVLh+e/NpmtVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mwobhdj4; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mwobhdj4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=p1CC8dUCndmZIRQpUX0YhW8XcYtLe9TT/Y80ofu1FH8=; b=mwobhdj4YjRGVHeYNv7VlNrjZy
	juE7lnaCKept7XFWMa+2s1erI3CVADa4F/oy8Wx4fsg6GvsiDqbP+zC+DsPCmaNqAzOJDreuqj78a
	vKQikyM6vI1jEWAQp2TvjfEBEtAB2kiFwAUdhg+q4Zqq9DR3XZ2xwXpZZ66T5Q9OwgjycAMT9gUmQ
	MhN9G19VWQH5XjdXWGGi2Rk5RdMosSCvJV/1ek7VvK7bdDMyGMWFJ2nYC3xJgyOVL4PJtgoilQMmh
	AgUpqYNuVKByvJStNZQJbKQiJ+ZZEC6MzG43LCjGkyb/q5Qhfw9A2Xbr8gwhxxq2/3X1Dz9xMiqvo
	5I2wHTwQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm2qK-00000008QNJ-1bMq;
	Tue, 21 Jul 2026 05:16:36 +0000
Message-ID: <5139b222-08c8-4d2c-a1e1-c8af55cdef54@infradead.org>
Date: Mon, 20 Jul 2026 22:16:36 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] accel: Arm Ethos-U NPU: fix most uapi kernel-doc
 warnings
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20260721050257.3546073-1-rdunlap@infradead.org>
 <20260721050608.B6DDC1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260721050608.B6DDC1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/20/26 10:06 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The commit message explicitly claims to resolve kernel-doc warnings for the `flags` and `id` members of `struct drm_ethosu_perfmon_set_global`, but the patch entirely omits adding the corresponding documentation.
> --
> 
> --- Patch [1]: [PATCH v3] accel: Arm Ethos-U NPU: fix most uapi kernel-doc warnings ---
> commit 0321c04e286a508fa979adef1d2ae1df38206a86
> Author: Randy Dunlap <rdunlap@infradead.org>
> 
> accel: Arm Ethos-U NPU: fix most uapi kernel-doc warnings
> 
> This commit updates the kernel-doc comments in the ethosu_accel uapi header
> to resolve several documentation warnings. It adds missing struct member
> descriptions and corrects prototype names.
> 
>> Warning: include/uapi/drm/ethosu_accel.h:230 struct member 'perfmon_id' not described in 'drm_ethosu_submit'
>> Warning: include/uapi/drm/ethosu_accel.h:274 struct member 'flags' not described in 'drm_ethosu_perfmon_set_global'
>> Warning: include/uapi/drm/ethosu_accel.h:274 struct member 'id' not described in 'drm_ethosu_perfmon_set_global'
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> 
> [Severity: Medium]
> Does this patch accidentally omit the documentation updates for flags and id? 

Yes, I couldn't find any documentation for them.

> The commit message mentions resolving the warnings for 
> drm_ethosu_perfmon_set_global, but the actual changes do not appear in 
> the diff.

Ack, that was an oversight on my part. I'll send a v4 tomorrow.

-- 
~Randy

