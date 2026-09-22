Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16C452941C
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 09:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068125; cv=none; b=Fm+NdzxgK1PO15yuNSb0l5a7V2KJmYT+GMS9JVsGHkwcmrZlxmUpW5L8W1+6KFaRB6ioQpdw8CZf6nFx22j3T7e1Iqjulq8r78Ekdi/eLCkYsyAkYrOLQZeYH1hZ8HBY08/XE/EW87i3t/MfxiBNZOQoyqZ0waxx21Uo1Wwx3f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068125; c=relaxed/simple;
	bh=Ke5Hu9q/LBx4PaOcH9h+hxaQxCesen7RbrSiJl0uAmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VljPLvoalqADrEfnFg/pHsf/B1wC1Fo169qJjseOoVuQ9Ygs/BL0l/HEMiNOntnGz8KMxRMGn0ABRpvTiI0pC8kqgHpfpN1+MaqVRJhKC5OxPNeg+1vRaj7D+HCY5ycE/C12uh4UAQaABUiCXV/zfeOiG8YHJ62ji/z4wmjQXT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbYS/c0m; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbYS/c0m"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so6008169a12.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 02:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790068122; x=1790672922; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTXrnoLoVJCuS9ADi1i1j1z6MUlrlfKtSYdHYbXCKbo=;
        b=kbYS/c0mJhAzv9cgDqSBcQCKNFo3hANZS+opRr/4+MA2jQlrm87kf7v1tOZPSQSj7V
         yNQjgY4RPDEMedZX4ojEjpIG44sjrNNBwgqen6vV5nk5lJkVyPgNaukWrttheTRJ33Lz
         z7i7kftmizc1zA8NFBGIx8QSfRWkVpANWdOeyhVSkZAGvpnRKKeiTuhHaca9L462fGdd
         VIX91wPwmn0nnRp1Uvtdx90Z++ogAKujactie5t0gWbvWpr1NIG8mAx3FGwPpaarVX7N
         PM/4nQnVQ/B6VbfveKRzv1NflT31IjQG8/hHTbaqHPop3CN6cCHJYF7WjpGRb2u8ApHP
         HoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068122; x=1790672922;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dTXrnoLoVJCuS9ADi1i1j1z6MUlrlfKtSYdHYbXCKbo=;
        b=Kw3Aq8InSA4/AyYFxbpVbYkUgzUDSuZabKTRf6adef4Ypiz4tJS2CwU7JQw0eXKwPi
         u94Ii8oQ64QVWVoNmaLlMTwHY2ojRjXNoKld0zSgR2X5tGm6IMbxplebw0O2X0+uZUTG
         j2pt+YNQEetrP5GpbqrV01Kh5udAspeYdL4Qr6Fd8H4I1bS7SIO+Kxq9MfkjTQarw6yx
         SW1UfYG4wk7xNQ+bnUQ7jQPzCO3v1R3X7EL0piYxNq0LjSsPjxeNTIOD/7oZTNK53M7s
         rGyuIA419IIvolwU1mdvTGiMD9wHAT3WNBi4Nl/pcPHbDZxuzmBEJ6+K7GWh7FchhkL4
         4piw==
X-Gm-Message-State: AFuF++kYVfVDH2ujIEH0thORLzjkeYXRTxt7bxnoK3NI6RGp4hQR5zuA
	LzAutYWpS937TxNEQ+V7w29CHUryT/MpQtS4ksYOJrwU2ajlEd34Iv5NzPoEkw==
X-Gm-Gg: AYBFou2ZZci2cmVmG2zVahbHGwi4ygVh2qb389D3JojVWOkN/RgyHp4R7gnWQa6//cZ
	E4dl/HWGZyj8EZPxUBF3wg57tZ225ivPGfjzgv9TDUupGJ8QzR+zX76yG3Q1N+1X1DSzxZtjePh
	ZluSxCmO/60nzvc8sMwfdAx6kcnv1VgW5HQ7MqDLQINwTr1Ri08JAEFdsYEIGOLysW1TCzGMnCe
	jZbJVllXIRfeIySSZMpl7ov5nc5o4Rgggbk2cmJHh46MX/HzF1JZFdRJF04J9DtDblArRo08L0j
	njSyS/EcPCf0cvN6hWiD8nxkUBLPvNhNRYPnLKGTPUVukpS0rJigLJwFBQ679EPw6eRwlJVKAPr
	d4LOtB5UVC4KX8ozXsU/y5z5vZAI2xJDk+3qFPAcoyklAxKlGmQXywJd5v4yD0GlBz0hIW7ySwn
	6VVCLG7XxhT2a1miD07cV/0gVktoucFzJmot6d2ozgOkwYHKY95/VPvEsUvJW5X1/cuWzbLryIL
	YL8ZI75ALHvGIWr7WAUe28D/EsVguPnjJQ2PhTPMON560LZg/A4stZNf/KUNkSlPusjC67uxKCH
	b41J56SiFXj0r3xo9FXO0RWxaaRTKQoQ2aK0m0Gxl4LuZeGp
X-Received: by 2002:a05:6402:f08:b0:6aa:9d7b:cdb7 with SMTP id 4fb4d7f45d1cf-6aa9d7bd216mr1932146a12.3.1790068121665;
        Tue, 22 Sep 2026 02:08:41 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa44f7aa0sm631529a12.16.2026.09.22.02.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:08:41 -0700 (PDT)
Message-ID: <17884261-52ab-484e-a39a-01e67f7a1d2e@gmail.com>
Date: Tue, 22 Sep 2026 10:08:38 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/13] dma-buf: introduce initial file I/O
 infrastructure
To: sashiko-reviews@lists.linux.dev
Cc: media-ci@linuxtv.org, dri-devel@lists.freedesktop.org
References: <cover.1789997898.git.asml.silence@gmail.com>
 <5490ee42c4452fd4198b245ead20fcf7438c066e.1789997898.git.asml.silence@gmail.com>
 <20260921135344.035B81F000FF@smtp.kernel.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260921135344.035B81F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 14:53, sashiko-bot@kernel.org wrote:
...>>   }
> [ ... ]
>> +int dma_buf_io_init_map(struct dma_buf_io_ctx *ctx, struct dma_buf_io_map *map,
>> +			struct sg_table *sgt)
>> +{
>> +	unsigned seg_shift = ~0U;
>> +	struct scatterlist *sg;
>> +	unsigned long tmp;
>> +	int ret;
>> +
>> +	for_each_sgtable_dma_sg(sgt, sg, tmp)
>> +		seg_shift = min(seg_shift, __ffs(sg_dma_len(sg)));
>> +
>> +	ret = percpu_ref_init(&map->refs, dma_buf_io_map_refs_release, 0,
>> +			      GFP_KERNEL);
> 
> [Severity: High]
> Does this GFP_KERNEL allocation violate DMA-buf locking rules?
> 
> dma_buf_io_create_map() calls ctx->dev_ops->map(ctx) while holding the
> dmabuf->resv ww_mutex. If the driver then calls dma_buf_io_init_map() under
> this lock, the GFP_KERNEL allocation could deadlock if memory reclaim
> attempts to acquire dma_resv locks.

Most of these look trivial, going to fix them. This one, however,
doesn't sound true AFAIU, I haven't heard about any blank ban on
GFP_KERNEL allocation under resv lock.

-- 
Pavel Begunkov

