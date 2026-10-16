Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A763D3EDACD
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144492; cv=none; b=jNR/oGwVPocz8ddZ3+xQr49EuuC815muKzHIOdsN5iGuhuLshha9jRBhkcN0+RQCjBaIKrfBQPkm92BAovlT5VUSoHuWIhT/fGL4YU8QqT/5PyIPjl4lBrJUbLT4c5CRMkTVIpsqWkIpE1ZxUEk2+ifIJ3IoQ45zqWHXUDyzMns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144492; c=relaxed/simple;
	bh=+GhGoOAkBBz1fzKdP5R0bSo0LpaUHy/fVgbOgRbknRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q0n5MecLflc4VMtQBAO2toFwegkqa130p2lj5Cgrmw/LSITiy5yrcY9OPIL5NKTWZYmeBmul3YCNjuKoEXnMZmmUfWGCfCKexbUjroJsecOowhXhcNMzRV/BEnzcTlYmDjU5Lq+zPcbp8v/P7GN4ipwoxxa/REt/n80B7uanBMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dF4+0vy/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dF4+0vy/"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c6955a7c3so1835864f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 02:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792144489; x=1792749289; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JeX5qu0jqIGuN6Nb/UvF9AVHsIrlUZq1NMBeYBrcscU=;
        b=dF4+0vy/DA5G3QwWDlWxdAxp3UaaKeg2OXepA5SaoChW0UZPTLsshh27z2dGfBYBFo
         GXIHU+T07ZPkVtEjX3ZDoGOC0WunUiaNrRgMbmlLDOMQ6LGnIF3k0ZmAwjGcsbYmNS0o
         fV9vbGWTx6KOVKPh4J+fHSHDd4pClZGq8kXPfnOcs8f/2qgpA5TY21vH+jMI3k5Q2b48
         lJ2sG6Xof38M5M+E/SFikY0g8UksE1A8WtYbSWNwIvlpnuxHFA3BaHyG/6b/T2ReBIV+
         hLtVxFNHAxXCxayAKE8EOewu6+Tl6LEOkjMD3sjJ81xA/wjRpBLjGSWLIoi8XmYlJ+3Y
         qVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144489; x=1792749289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JeX5qu0jqIGuN6Nb/UvF9AVHsIrlUZq1NMBeYBrcscU=;
        b=eILkYSwFVlxcaowiEfCywDo5/2e8PYKgoMTxps7X0RwuteAkhudz6DzwYWS3kxNqw2
         gJysVCZf1IJWMkCfwoi4GJIYJr70T9wGbCIrDH8Zey+4YWZLTiZJnHSPGMOWTuZEyVLC
         x7UTaETGgEBr6xB9Lbj6eo2didrEKtj5ziELl+8IZQXp50MrRlJtElR3QaVqDIOdqpLv
         tb7Br5nP5P3Io+mXqgRPZIEubhMrx0xA/YC6YnGRNOeKM8PGQSo7jGjX6CwJJE/hBr9u
         b+bPaI/70R3kvz/uKGgS7vYGE/rNu2y4Gc2J7uz59P1iNHdyRg2pX8GXqNVEl3SxFDai
         rIgg==
X-Gm-Message-State: AFq9FYLCblYWMXOjXgd/1Vdn1h/FhPtH3tEgJtQKdPwWqoJaF5W4FBGD
	SLNmruvXS7eLKUAjR/opGVJRPOwRsNqAorw8avCSxVNqnwCkj4UfNJKCF4sBPw==
X-Gm-Gg: AYBFou3YYRRz8qdM0PINvjFvO6+Iq9CeJ/rc9NB4klfOwqOHmqxVjFiGBPmkKksKbVG
	/OfwbeEc88x4hUv5ZE7vtkAsrH7c96MGIpQJCuTrh5PsWH4WhL5qBcGV250BhyCcgzBOgmW10Sk
	xOe6EQQSY4UUtFwl2NytAKBrYjr/k5gQcczrQbvxgvO2b1ZMP00AXXSr03MsJZBsfCDqMMNHXbO
	MIpzKsacMAAUDfXNUlTUppInOSMk/EOTrtAxloowOR/aOHM0xkTbJWFZ4PpQllmpGQD3cbeBo27
	utZ408w47KavY7aeANT6Gz2F7Z+xsfAEOuB4bvNgTaAGpIUyE2RUTaZ31CWralzT6+77VBJix75
	GFa8Bvn3EULdFcUV9TPmwWiRux0Wfovq6CqSnxJSsiHXAg2IOkH2tAXFiSCIRt3kEXUBCC/YqcB
	WYdnv6SFOE/gQjt95weNrrWhrOFMS2VhbOx2rQzXQvJl/Tjy7RtonShnev5ZMdb3DhK6a1KxUH4
	zP6jewDC9THlVFTzAUtWNJeJDDaC/+P2hInoA1cLFm6guChrxiZksbEo7VTJJQKrBVj2c9+us2j
	cDNSCtNy6Hdg6pncE7PcDAFbyzi+rkhHrKSCGgI/YgtE2f22
X-Received: by 2002:a05:6000:188a:b0:48b:b1a1:a002 with SMTP id ffacd0b85a97d-48dbacf561dmr47371303f8f.24.1792144488776;
        Fri, 16 Oct 2026 02:54:48 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd409989sm4328469f8f.0.2026.10.16.02.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:54:48 -0700 (PDT)
Message-ID: <54387709-f72d-4e4e-aafc-8ebc61a62b52@gmail.com>
Date: Fri, 16 Oct 2026 10:54:45 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-buf-io: document dma_buf_io_init_map
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, media-ci@linuxtv.org
References: <cover.1792142927.git.asml.silence@gmail.com>
 <79e1cc681326365d2105203b318d8a27ed7e90d7.1792142927.git.asml.silence@gmail.com>
 <sashiko-outbox-174086@kernel.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <sashiko-outbox-174086@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 10:41, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dma-buf: incorrect return value documentation in dma_buf_io_init_map() kerneldoc
> --
> 
> commit b6debb4c02ab1cee94fc3f78293f8425b78664d4
> Author: Pavel Begunkov <asml.silence@gmail.com>
> 
> dma-buf-io: document dma_buf_io_init_map
> 
> This commit adds kerneldoc documentation for the dma_buf_io_init_map()
> function.
> 
>> diff --git a/drivers/dma-buf/dma-buf-io.c b/drivers/dma-buf/dma-buf-io.c
>> index e432194a5dfc0..f724936e223b1 100644
>> --- a/drivers/dma-buf/dma-buf-io.c
>> +++ b/drivers/dma-buf/dma-buf-io.c
>> @@ -43,6 +43,18 @@ static void dma_buf_io_kill_map(struct dma_buf_io_ctx *ctx)
>>   	dma_buf_io_map_release(map);
>>   }
>>   
>> +/**
>> + * dma_buf_io_init_map - Initialise the map.
>> + * @ctx:	[in]	dma-buf I/O context the map is created for
>> + * @map:	[in]	dma-buf I/O map
>> + * @sgt:	[in]	the backing scatter-gather table
>> + *
>> + * Importer's helper that initialises @map for the provided I/O context
>> + * and scatter-gather table. The importer should call it once for each map
>> + * on creation.
>> + *
>> + * Returns a map on success, or a negative errno code otherwise.
> 
> [Severity: Low]
> This isn't a bug, but the kerneldoc states this function returns a map,
> while the actual implementation returns an int (0 on success) and modifies
> the map argument in place.

Slipped through indeed.

> Could this be updated to accurately reflect the return value and use the
> standard "Return:" tag format expected by automated kerneldoc tools?
> 
>> + */
>>   int dma_buf_io_init_map(struct dma_buf_io_ctx *ctx, struct dma_buf_io_map *map,
>>   			struct sg_table *sgt)
>>   {
> 

-- 
Pavel Begunkov

