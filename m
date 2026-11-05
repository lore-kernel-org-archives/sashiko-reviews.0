Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793850005;
	b=MDSgdsAeyWD9NeDCWFa/W5Iy5SfSWgo+HMZfoULfnnBzgi5FmRfKryjwLAHoZQ844Awu
	 CMgZNjaaqh+xbGp36TTZgXES7aKUsX7kXDZHosXHot+OkJy5hWj2KiK0gUInyyBS74Pha
	 UDS+qcQ516kn015NrG2ueVh8iQ9CfDVlSLu6/M9vl7AW2YWcnboy+BXKwDOveuHx//Fnc
	 NSlfYAheiruGuL2b3yDzifmxqFVua8b8uXosiw6K5+OUt0vPv8FMIsNLmwbrId5O2XTcf
	 LNbJTyS0UMLJju1xYDWEzujHjTPZtldZnCwpnB7jJVpOsWBiMWUNx6LcedyzLwSTrDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5LUE2uGbYietmUvUa8zlMC5H0i4xuvRsDA3cqPloBd4=;
	b=Yc2fZ+6nfEpodZWGsE6s/fmJ2agHP9pFzlI6fh3j4VJkT1X2U75Zu9ITKMn9wzC4WcmG
	 rLNH86Ozs9sCIT0jnXR23DdC/+eyC/tY29cTBnzJO8EHn4CLWBttlnk42B+DNcrAXY7Kp
	 wjxdOkm9efJYPYFMj0zpN+2A8UVZ7NOlkHE46drmOJxoBZb3pfd94ufKaje7ZnsxzCJxw
	 jx/7QZosLIgPzwxJrkD0eeuISEbNBbvEf/eBJVq2kv9zHC8dWX4Tq10Wh0R8p07lwMVIr
	 E9iOCuTAyGnS37ugXrfZAHPMJ5ZjkLnz4/K5fJ6qJPqV7lxx7BWDt7HaAXJcYqG1fqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D4yFEoPC;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32110606A326
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 03:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32110606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D4yFEoPC
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so281221a91.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 19:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793850004; x=1794454804; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LUE2uGbYietmUvUa8zlMC5H0i4xuvRsDA3cqPloBd4=;
        b=D4yFEoPClH4nX3Wj24KBtBApbjTfMoDm0RW2UJ36rCMAxrX3UTrN2CZx0IWkMzmb8U
         Pk7M53F+s9GX0jTicpI0wls2jsm8xT3jKEKRSDR1DIbUhsEnr//Pg1cIzsfPUJPMTsS4
         /V6EUj+RAQumKCuUjzdPotE0cA6oUq6OdHF1Utpb5ob2IbLti443jlJi0vvpF/tKS4DE
         e3HytgGr1r2GV/Sj73EffZVWfdH8dM9Gh2mB6ZA/ncRU1xgXYqBhU7SmeOdDOrNhGAO4
         bWm4JWoXHTzjOk5bvehMx+SSRnuP41/kYlIz7/M82SeTw7vtGp5sY41e37Wok6G8DYMe
         O0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793850004; x=1794454804;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LUE2uGbYietmUvUa8zlMC5H0i4xuvRsDA3cqPloBd4=;
        b=Xmm+oSh5aAetrHlR0++9aiChEy+dilbR8eHu5547wUodwRoNphotyBLIBeBxQJjQcg
         lKTtAGIJkIkKqHvRpxdUZlOQyYkFtSDHH3Gw2JA2HWsCTbv17dPD2pxqQlzelgVZrSCA
         UsI0lzSX5Nabg6dck+FxpbH3DkM9TYqM2VO4dtgmmciuPK3nFJiVxTfDmMH2SjOubYkw
         u+D4ykBJOuveo4RMvCu7DC6swp7VWgmF4Ix5hyASxhHJHJBlMw5JQ5gvDTbRZwkzOhnl
         ltlSHVwOCoR8UUg5gJ/UyKFZJ3lnIVW0YyaZnrDXW0/ObWd/Vu5mluSovQRKF2xG41DO
         lwkA==
X-Forwarded-Encrypted: i=1; AKwUvBwKUdWMC/JvXtI0vEdxgI1g8QeijhunLDKIou8fMYJ2TLS3ezx27vJbokOWu1GTyWbwuIBegEWs3qv3dtJx6FE=@lists.linux.dev
X-Gm-Message-State: APuU4Z+dAT/1u6tf+x3pdLhzrinAVJV7j4u8NVZuX0VLpKkakcJ7kl0a
	plnn/eoJ0HgBYVMT+9O83RNm4OjXh6i3Psu2B1jGGSqoq46XBOheBt+h
X-Gm-Gg: AYBFou1bJp0dnBJSsZiDuKGoe0Yhrl06wPVUntgaePti9lf88uSvjeHfHqCgXx15W6b
	dZuxj9243OgXBq1DgRGvWxTYnKgDgQbx/AQCI4i0vn53U1KhPxIUmWYUfN7yIIccxWY/fRR9tT6
	J5u/PWXiVcz/Uy4Hx+nvVTL5o7yqccB8y8KnECbXIuVHsLjzLXePgYIKNhfxYELS3WHEii6mOwt
	Ml1kMGDEQRWrxUW1gpdzluB8fLSLGRYES3IIu1lboc7bP1YmmKEgQrUhZz8w0/yL12Geu3Hhjjx
	HCO1Zorc3VZNJySY3l692qCbUcwVT/RNvsgVhKUY9tMIR7nH1zFDiCEo4C5lZZlZgzAye/H518M
	5Gzlc75zlSKuKh8799F9wmgsmXwV17E/YFt3wHc2OO/dYHqFZL+IUvMZqRHJjuX4NlbZF/VZ3iO
	HPDdhyzeEJ/SxT9E8HK4H4GIadrVDipops03iYnW5PbJne8S5PDYf+KPSLrrRJWedrHmQxyVaI7
	djV+HL7KKq5esNIZxxHjTJulWrgHYzyrgdPJx+OD3NLSzWAMjCJomkXoyOWGiaAPiNUyHdX/m3H
	wQLmQiyTBNQMItA4vKhlvhzxmEfZ+rI621KkU6WCaCinfBHzkp/3qPmkK0FS7Sr7Suij6jx5ROQ
	qV7k=
X-Received: by 2002:a17:90b:1a88:b0:3ae:3f20:7056 with SMTP id 98e67ed59e1d1-3ae89746c9cmr16276951a91.31.1793850004529;
        Wed, 04 Nov 2026 19:40:04 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3265a52sm1382575a91.10.2026.11.04.19.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 19:40:03 -0800 (PST)
Message-ID: <fcbd337e-71e4-4b34-b1db-800390a61ffb@gmail.com>
Date: Thu, 5 Nov 2026 11:39:51 +0800
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
Subject: Re: [PATCH 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
 <20261103022202.2139674-3-shanchun1218@gmail.com>
 <sashiko-outbox-194466@kernel.org> <auuHy9_GAzYZL9V5@SMW015318>
Content-Language: en-US
From: Shan-Chun Hung <shanchun1218@gmail.com>
In-Reply-To: <auuHy9_GAzYZL9V5@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Frank,

Thanks for the feedback. I will address these issues in the next revision.

Best regards,
Shan-Chun

On 11/5/2026 3:30 AM, Frank Li wrote:
> On Tue, Nov 03, 2026 at 02:43:08AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 11 potential issue(s) to consider:
>> - [Critical] dmaengine: ma35d1: premature register setup in ma35d1_desc_alloc() and prep
>> - [Critical] dmaengine: ma35d1: active DMA after timeout and double completion in IRQ
>> - [High] dmaengine: ma35d1: missing PDMA_TBINTDIS in ma35d1_prep_dma_memcpy()
>> - [High] dmaengine: ma35d1: unvalidated SG segment lengths in ma35d1_prep_slave_sg()
>> - [High] dmaengine: ma35d1: broken residue and status reporting in ma35d1_tx_status()
>> - [High] dmaengine: ma35d1: unlocked PDMA_TOUTEN RMW in ma35d1_pdma_interrupt()
>> - [High] dmaengine: ma35d1: state bugs in ma35d1_of_xlate() and free_chan_resources()
>> - [High] dmaengine: ma35d1-pdma: fix signed dma-channels pointer and zero bounds check
>> - [High] dmaengine: ma35d1-pdma: unsafe teardown order in ma35d1_pdma_remove()
>> - [Medium] dmaengine: ma35d1-pdma: disable channel timeout in ma35d1_terminate_all()
>> - [Medium] dmaengine: ma35d1-pdma: unreleased ch->desc and stale ch->cfg in ma35d1_free_chan_resources()
>> --
> 
> Please fix these issues.
> 
> Frank

