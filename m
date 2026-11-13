Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569848;
	b=px16aq/zlIjH78d+piZ5FaYN68w2HZQfyobeSQI9YcsGoFDPDgbiiI/YJTbnAUbi2d09
	 cDAlq0HFw9WAf0XcQrvSXxIN1s61fAylSCUFDOJVWDnLfPuaMGV9tsfej4GxmvrZbjpX9
	 VYHy5gzFQxMQ5tmwQOaMGzK+tXtTs9g2dJ+RNm57zmVJx+3k9bM95tPUrrt7VO+JBVa4K
	 I5yZWMoGdN/Wdjh4fYckBqSbAef3ojF/IGIQJJmDO51lzaz23A4QO/iWXuXocjaIgLQDj
	 MMsmSjBRcE7WuSBKWgwnyf3J4QU2HICjboCAfALj74f7Kvxc66LP+bqh3OQclJ2nyiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569848;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=eqDaFOXbn6o3S8HHZlHZu0Vt6yoGbjygKulRUdW7kQ4=;
	b=kIEVR6u6IugIm1cbKptbuERGFO2Br3OlL0RgZ7j+xOydVoKh+lGUUr1vAC6DwOdkkjAG
	 I3DJzQjINiU0hCq3Kqyjb+r9oUoqGwFbItE1+Gt92mcJWV/2hFBuuoWPIcGKLER5LcNO6
	 Z7qbYVlB3iz7OeVEfqJazGGVFvk2WejxHxpg8ozYkfwuRfPk4lA1nMqb+R87VDY4qvYdl
	 H8n1vkANMekJn3FlC1v/77DHj3uUYP7TTg4nqmDwxo/goowiYsJLWeyDlhk7zPQtZEiwb
	 otCdQJqvwGEyP0b1d2Ztfl37ZnxshWl/qUEdO3r29wYrAZsxr7/EY9NNM4oI05wx0UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=XMutx78q;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=w+C5MlwO;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B012C606A323
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 11:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B012C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=XMutx78q;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=w+C5MlwO
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 9B4621D00410
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 06:37:26 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 13 Nov 2026 06:37:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794569837;
	 x=1794656237; bh=eqDaFOXbn6o3S8HHZlHZu0Vt6yoGbjygKulRUdW7kQ4=; b=
	XMutx78qZZJRLQBEXzsM8JfnagfBjawSSER4G2o/lHAG4GclepEtc397hOUipJMY
	z4lTMbAmk4ggZwaelA2gCoHXmjMR6dStPLtBXXMenhT0Ql2p0Xnv3507K231VCRF
	Oi1whI3yML1yqwmCTfvQMppSkY17Bonh1uOVmthFwcK3KUOgUh+UDz/DSeDQijnF
	28D+uS9reJr1SVbr+VUm0ZAx6RAxSfWvUmruo300gu0URXxLJFufHKBJ4iiR1PK5
	pxxfruk3XN8GHq8Pdz4iNh8WQc5W7N2HXhZHUbP3bOm/b6Ctg0DenyLnhcpBFOxT
	8s7E9/c7hf5EiS5Zdg/jMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794569837; x=
	1794656237; bh=eqDaFOXbn6o3S8HHZlHZu0Vt6yoGbjygKulRUdW7kQ4=; b=w
	+C5MlwOo/fDVHYBD0Yw3/zx5Jp25EhMJTgU0Jg8PC8Dpq5FP591YE5zfr0wOPv+a
	LDK7kDZadY35KqzMNxWkVF8MHPFANB+YlnnzxWVC97ej6J++HELDKvx8gN2V715N
	STm06619ceX5QsG5dNNFWzMAF1+5dGZ1UrBDRGbNbJENBWMIOm2BvaOHFK17oVCp
	hndemLShkyFAYMtJZ5UtUUs78YpfyIn/6nAZBlG7USgA2qewNVuU7scntIAIAVKF
	FEeOs3j4so5KYczmeJw052ZJmo4dYWhHO3Mfg1aZDWSEtDJbc1yD9hRYnSkRecxL
	Q9H21PMwSFVMaP15vv4Ag==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794569837; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PHNhc2hpa28tcmV2aWV3c0BsaXN0cy5saW51eC5kZXY+;
	s=fm2:rsa-sha256:hqrwUp0w/27wCZJZN1p7nNbYdf7rgxvbtOvaiQ1sbJQUgYr
	wRecX7bZoCSx04Tvl9pE/hayu07TtUURhD/Vqb3flH5I0+mvqRy4ePqVU905tDIs
	OmJ4t49Kx+ebA+OCvzlYlxLFnx5BengYN4s0Rv5pUsfnxG96FxMIwi5rsEIDEcyk
	VxCeM9d4Q10evlHcFrFCjarjw6QZV5cw0k2ye8cd/yezasOW7i7uj+cyWaWahRVL
	mJTxrBQn2XT5A5vuLWrp3Ae2aY6/VsDciALQd9Xvf+/iGRR7KcDIPZe2hvYmZ8A9
	FVaF2Td3n/G2kp6+nClIvU8PMiGsY4mZPYaTrqg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:hcQpqBspszF/VCz1NmfPwhsfTCNQAReFRYNvZ9kSFUo=:hO/C540qRnhOl18EbccET9beT52alCAQHyu6g6Clb98=;
X-ME-Sender: <xms:Zfb2avCT-tojmG4Ikepw-p54Wlm9eUwu96QJgpS8e03i3ED6zqXKGQ>
    <xme:Zfb2agVxabpjuFZFE55yrfdaf9tLdiiaOi5g3IR8DfhCsw6E-85mYGPe-onXhwe-n
    NZLr0-AC6gAggAX9NGiRYjQYYR0yHI-bZTIK1kzqkGYEy-pPRAqTLNc>
X-ME-Proxy-Cause: dmFkZTEDiFGDLqF2H9+O9kclr9WMnCL6OtmFN7CRKWU2znaeciKnGD6T5j5ItjEVdHlbGD
    YqBOW+DNJB3dxdSQcDHRdnBA8Y7s/6uO3tiPJMyD4uWrj6XfbTOwNenN9IscialPmsIZTK
    0iXO6p/j6egEf168nQnX7Ck6iDbBV5k8fS1NCDx9srTPTp1fs71+kDyys9TsxsMrai3vEK
    +ri/I9u4ybluZLH5CI9YpmOiwlGpVMB4Y4GEpFea1kOP42w2C9SvPojFV8FOhqAVm34u82
    VKymHdXDCNJQNZsoaCTkpz9i0gZrK8MW0epDqLwnQl7FJ5LF1BzvR1o+nFKuQX8UZdb6IW
    vOonpJG+PF8aQuzJD8V+7aUD8HkmaFjkS3opKaRUMsNBqhGJataxqpCMThvDzXTwmxAXHz
    woFgxf15w7KvjgekxfLIoHkjn7nIBQg8vaHS/krIq2iahPBj4zymyaZrWQmE4zWSH034dX
    sK1RskPxfHErcP1SFbw32+61oRvnbATkD8cHsRr5EtKz8079tRU6jZV1uzy+hTrFmZBHN1
    rklbhmOOVcg1/Bz3kp1d+I+NtKAEHa34pfcAyYPJKNVPYQyb4eczQ9pzyVhHqytdgdCQXO
    0GSL4s2CbPUYh0tnyuKXggyeCYqA60zBxDp/vBqOH017HTQVKwjQYdZ7uyBg
X-ME-Proxy: <xmx:aPb2asthTUH2x8jA2KOwo1d3rh6en4ZcMR3WviUnQxNyoPSM1862vA>
    <xmx:aPb2an9DeWTknrfvXqc42PZmXbc0v-go1eebiGOYUyjyrJo5WOhSJg>
    <xmx:aPb2aunyVYsbVLl4cnBH2qPOM0Uf2YGHWWzaod_a0tT3Bar_JyQzQw>
    <xmx:aPb2avMOCFp0ldrdZ_SDhy2jWGzMP8RkeSQzvVn51CLQ7Ep9lYDaYw>
    <xmx:bfb2alyWeOT9UQF5g9D6se6HL21AL870fqnXN6bf27AtiRM2unC88dvf>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D0D2E32A0099; Fri, 13 Nov 2026 06:37:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-ThreadId: An903QizF2Ds
Date: Fri, 13 Nov 2026 12:36:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: sashiko-reviews@lists.linux.dev, "Arnd Bergmann" <arnd@kernel.org>,
 linux-mm@kvack.org
Cc: "Andrew Morton" <akpm@linux-foundation.org>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Jason Gunthorpe" <jgg@nvidia.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Matthew Wilcox" <willy@infradead.org>,
 "Malin Jonsson" <malin.jonsson@est.tech>,
 "Richard Weinberger" <richard@nod.at>,
 "Russell King" <linux@armlinux.org.uk>, x86@kernel.org
Message-Id: <2c9ad267-7908-4b62-940e-dc877dba5a75@app.fastmail.com>
In-Reply-To: <sashiko-outbox-212715@kernel.org>
References: <20261112112528.1116405-1-arnd@kernel.org>
 <20261112112528.1116405-2-arnd@kernel.org> <sashiko-outbox-212715@kernel.org>
Subject: Re: [PATCH v2 1/6] ARM: remove support for highmem on VIVT
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Nov 13, 2026, at 12:26, sashiko-bot@kernel.org wrote:

> [Severity: Low]
> Should arch/arm/configs/mv78xx0_defconfig also drop CONFIG_HIGHMEM=y?
> ARCH_MV78XX0 selects CPU_FEROCEON, which selects CPU_CACHE_VIVT, leaving
> CONFIG_HIGHMEM=y unreachable there as well.

I have already sent an unrelated  patch to remove that file, so
changing it here would only cause a merge conflict.

      Arnd
