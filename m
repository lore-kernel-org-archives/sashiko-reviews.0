Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073681;
	b=TYzL1SDXqeUasVYxVXDTtFq7rbK0dRpOskvwS8z4lZkm0rKdjUK/9/vt8GJH6JMp/PAa
	 tpkAFQe+FzDXy8ZiuCaSwe8tRqO59HJKx4vMi9+JOVuAYt91yGc4KGYFxoO7WPdGtf7wQ
	 hc6bSp19St7mKCp6OzwMTCICCYs9XZ5GO4+fbxYjz61F0KVD2Lf9pEpmkbDk6mxwSnCDi
	 h8Pn0X/xvExp96gLHnsHR2lp0/BjTkBX9MRUcsfsw0DY2VHw6rxwW/QHuVwMKKZiREmZi
	 +MiEf7oS5h5AApg7ClwJ4TzeQKiv8vu+dYOEQHNCT8/77vNTWG+2NE77leE/cNhkpLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5dzY65Mn7sGu+M2q54e119fF4Se6lQQQL75QJGZYrpw=;
	b=iG6biBHxDDmQ14o2ieIqCdKst4ZXFzY46BM+QXJ2L2qaj8QMP4yAarEdZ5ZbPL4+e8sF
	 jyPgsmNdsU/Ah5AKpNxd1dmxsMfBlUt7bH0/Pkd4Gop+WHxl+tsyQpYDNhSFUoIrA/JY1
	 tzH/ZGLXFhIJzS21qztZVA0KhfLisVvVoCnuWzf9RDawr5omrUSi7pxQJKqbAbmn2iZAx
	 TU2VvuNe/v8JQ5nQqThNllOkxwz+oIpT/q3cJAVlSTfY3wpI7S1m9pb9CaAog5NB3PHjr
	 lhWXW7mZhlohoLveWZ5jqdLL2tzQ1BuvcG2UMMhVvORQXBSB2u6+gpxhJUr9Unher9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BoB8Fn+5;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BBD606A320
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 07:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5BBD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BoB8Fn+5
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so3844895e9.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 23:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795073679; x=1795678479; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5dzY65Mn7sGu+M2q54e119fF4Se6lQQQL75QJGZYrpw=;
        b=BoB8Fn+5cJFPA9uFPqUyPrZj0yEpqQTNBSZcH+dLEg2Bu49fjg7UClcggo42mTiqi3
         A6YznijN4nKwWJSYr9fxTPcWljh/FAUSWzenPPrLErSMm/6zIsF2j++2IU4OQbs7mpBH
         FZwag4uHkuSc9sF6PGj0rXcrStqApHdX3cKtpuJouSpHJwfOJvE54+YVU9PJ838qtoAL
         DsZHBZB8K0z73JZCPaENJnpgEBJfQlboVzA2QswCEZnceM6xl4sW3aL6FboIdu23DLNq
         kMVBIeHnbpVF+GgJn2VjEZ5qp8TfPlNFKE2OHq2v2djZer7KlO9kVati/VKhBDkT4Fx6
         WcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073679; x=1795678479;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5dzY65Mn7sGu+M2q54e119fF4Se6lQQQL75QJGZYrpw=;
        b=B6si2cqjT/rAJtksMe+qzpE2WDW9U/OGpSTeUEa/G5/IukCN16Ec2axBNvKbRLwc3C
         LcbA1ZzG+gYa5fUA07plV9e5jgN437tD1AhaAjhyL5fAH1odeKZJ1nnfHPSvVv9HpM2e
         1egOSyHkAYZlTR/9ZQu4Kl3PZujkircAkuW9jF+cGDSeGEaBV7V+sxcvwREK5fe536In
         8sH87gy23XzvdSD3lprCxup3R8LKTWRnrNuJ3wF4MTmupLSgeA2DtECCduYSDMJb+f0e
         0fJjZsbLR1qR+d92YL3eE+UuG+W9HSHYoo4J+kt8HyNa6QCVz47mjcFxLu0CsatDlrM3
         J6RQ==
X-Forwarded-Encrypted: i=1; AL+hErFE61Ppe0aKz0j2KD5xBw/XN3kjDOQymYVKSDbu4mg9Dep0NTkgUpobtXjvJuG/O3HLJMGMQJg2VbK0YDNYNDE=@lists.linux.dev
X-Gm-Message-State: APuU4Z9eyz8SbCWANezPpT7lR90rXfaTvwwvOrsabBydBW2RspbQX9y9
	nnOyYK8k79S7qReyPygYo3FIeScZ63dWpQ1WjzY/xfCIwrAlMFnAEB/y
X-Gm-Gg: AYBFou1ZBcq+zLzMFoDcrYZ80z43FTJ2rsK5SvMbRbR2jWj8YB0cWP17dnjZI0w0jYz
	RadtZrTQZK2+gDbGYBprNoXFPGJOGyP1OrjNd/5KxYuVI7zM3e6xR4qPHeG+iLWCbx5aAV5xWFj
	YgfWlZ7WZR3HiEawKwf9WB03M9srz2CQHH43Jcl/aU1yg3fivlVTRR81xrJ3xTqMKbyzLVo7/tj
	FU481/NeBRvACRKbH/4W0X6s3Rw7tZHCrTolzYND5CKfEGg2EWg6DeH3UIyDYeR/fQKrOHuyYkk
	j4TV88Y5PDAVShIPvTOTEJrLdspjGV64Og/C4hJEwLVBMKtzQuxfcmL9T4Uj07KLBXdodkYF1t2
	/E/liIPukTFaOXc3pqCkFk9lST1srPHsfLKT6chdKPbg8/xcMaeTWLqfETcFKvG4IUbJkqV/0eC
	jaWeHNLAodJiIlOU4ig9VQubtcjl5GEUm0JHV6F2IJKVBUgGLOcYlwLDOS/2vDcTiuqY+WysaaB
	xyWfvLrc7WbA6abaTk8aaG/RajLXDFT8ylEXNfuO+4AZIdC8LSyjsX8Hy9Q9e1dXr5HWQ8iUomW
	7FpOIgyRC6gDDGAp8c1q4Rhz1elyWgnW/MCrFJpAZqa7aITmdRXgfu3kILeyX68/4GyF
X-Received: by 2002:a05:600c:8707:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb860f6239mr6955965e9.3.1795073678900;
        Wed, 18 Nov 2026 23:34:38 -0800 (PST)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526541fsm26479515e9.0.2026.11.18.23.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:34:38 -0800 (PST)
Message-ID: <9f7e4f67-6147-4ffa-b5b1-3628b6e8bc23@gmail.com>
Date: Thu, 19 Nov 2026 08:34:37 +0100
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
Subject: Re: [PATCH] mtd: spinand: set request type explicitly in
 spinand_{is,mark}bad() functions
Content-Language: hu
To: Miquel Raynal <miquel.raynal@bootlin.com>, sashiko-bot@kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 sashiko-reviews@lists.linux.dev, linux-mtd@lists.infradead.org
References: <20261117-spinand-set-req-type-in-bbm-functions-v1-1-f46d5b3b8cf3@gmail.com>
 <sashiko-outbox-219169@kernel.org> <87wlqajzo3.fsf@bootlin.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <87wlqajzo3.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Miquèl,

2026. 11. 18. 9:45 keltezéssel, Miquel Raynal írta:
> Hi Gabor,
> 
> On 17/11/2026 at 16:27:11 GMT, sashiko-bot@kernel.org wrote:
> 

<...>

>> [Severity: Critical]
>> This problem wasn't introduced by this patch, but can the 2-byte marker[]
>> read in spinand_isbad() [1] collide with free OOB space on chips that
>> reserve only 1 byte for the bad block marker?
>>
>> spinand_isbad() treats a block as bad whenever marker[0] != 0xff ||
>> marker[1] != 0xff, reading OOB offsets 0 and 1.  However, several vendor
>> ooblayout_free() callbacks expose OOB offset 1 as free space:
>>
>> drivers/mtd/nand/spi/gigadevice.c:gd5fxgq4xa_ooblayout_free() {
> 
> The bug is in the gigadevice driver. It was arbtrarily decided to keep
> using 2 bytes BBM like in the raw NAND world.
> 
> You may fix this driver in a separate patch, but that is not a
> prerequisite for me.

Ok.

> However, why is this not stable material?

Sorry, I forgot to add the stable tag. Will send a v2 with the tag added.

Regards,
Gabor
