Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793523593;
	b=b4FnYK+FmgwVQZMZ8w2FgzDST+w0Rz230t2h4WpEb+58RtGuhPn25JMvXiFQAg5x2U6d
	 zHpGpiW8YQpDDpVfIToEmPa+7dLMSrsbyinmlx291JoMKiOy71uFsvGh1FzLLEOMn1DnO
	 K+ecS1jJ/V/Zl6H0FwfUk1b01pITqCBMAtZDwtxRVZURCdXzOpVJUD1CqKygiPgbZ330X
	 wyrXUg3g4lwAgEKZcdt6iupCkarRxqBoksbceIv8xe/AIcbRFOyFd6FysFMIfzpXrLLPr
	 1Vu6w4gbYld1QSvzh2mxriAyo+FBtALsinz/q9do+ZC1kytZGZspqxmRbzBajoOQd6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793523593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:Date:Message-Id:
	 To:Cc:In-Reply-To:References:X-Mailer;
	bh=Qot3DPVKnGE0VVwUhDNO4+shB6YIfE7k5yrGO2m+J5M=;
	b=H2pCPI9z6QrNDopBViqLo1YnLnd7C5PulvY99TVTbEv05LutJ9ESFrSPvaVpsZe0HhDR
	 oCgZBXpw2GVJNZthawOprZ26K+QEyxml8ZDvdwNkSLE2wZrkdTzxQ4OC3+F3Wib2K9oAG
	 fmXT/dEGvRPtMgM+TZvp+40eFUuvWQJPiLgpFTkxZpwTX8DK06lY1XskzRI+BAXkA36IP
	 tSBTTfLT2qvdnxOq9S8d/3MTZBBGkQQn13sqe4NsnHh6y65WjwQ1vfkR9ihhk02OIVk9I
	 MFRpoehNBASiPEGaLepqgvuPgPZaeIvyTPCtcm7SxhtgqHuuZ7K+ccLSdJINJAx3hpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LgLIqsz7;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4A2606A325
	for <sashiko-reviews@lists.linux.dev>; Sun,  1 Nov 2026 08:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC4A2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LgLIqsz7
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a24f47293so1295150eec.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 01 Nov 2026 01:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793523592; x=1794128392; darn=lists.linux.dev;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qot3DPVKnGE0VVwUhDNO4+shB6YIfE7k5yrGO2m+J5M=;
        b=LgLIqsz70wZ8OOjI5Q7a+K52V6GACFIkP9LdvDJIWTqaZFmdSPFvwKebPrUMxsHRLV
         ZHWZYeZ+PRgixHLnDDhdDH7RWkuANajEbGThCb3TZKkMeLf/RMY7ibCB9G+DMjyePbvP
         oRnl5vap290ufa8Dc/NtCVnHpvZyZUYpPcsDbsq8rLMrkDM7pW/HYCXAS/EBao+Q7zpZ
         sRbeud7eb/1snCMTvFf89jON/SjFynmF8Qnszw2my3PG/E6bkyYdSRXPrxcPyTufU34O
         eduNEzMYky90j9rAlw6cTBq71MMPei0ZAtoPqrKQiN0zpGZd/Ov6fZcgi7lMd//+3i/A
         +MzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793523592; x=1794128392;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qot3DPVKnGE0VVwUhDNO4+shB6YIfE7k5yrGO2m+J5M=;
        b=FX2PP93W6W9IhckmxJgY3L7g7BdlmW8BSMyfe8UU/RNiIaD9w4gbrmJNrMPi67jWep
         7OBrFbi1ire7FqVfu3DECb0Ilud5V5qQ9m4nk8QaBfzIbsbykHI7+zEqN+lkDD9ZsxNZ
         TbBHJiAEFQuR5sO6qypQG/rnsu02of00+BejOONfbxBUeMYQLRDKf17ZZFSPDG1Hlt4j
         RJJrw2JJrWteL4bnnhVB81IzXlvsUEJ2W1qAsxKykXsVfGw2LvZZOwoKSPVDu751VEL7
         Y+Q8L6lPldgcuM9MD2Ax3wMN1bmy4Mi/siXyl/KddPOjurt1fbKBmHbMTLgWbMkowhjB
         CvRw==
X-Gm-Message-State: APuU4Z/PHtfNycMAWMybIAPJvlbuu3kr4pMBtZBVQyAEUHx+BFIyVImd
	MQ+fcHpVCTPYaA9m5aGsatBVY7rBMlUrfLnPK5FaGo3eslbxowtkKlrbCnBozQMJmP12ytbw
X-Gm-Gg: AYBFou16LStoyeNeAJYn4jOqFXXTwF26soFkgdhdGlaBlaBccg067GF8+kZ/3UM/ktQ
	3Nhx6AYJAppQPGfr/Fa5/86vAhfZe1hOMAmtt2SNmw0xvJQQPclwVgr3bQC25mmFaIMqsdc1XeC
	wOw4Iu1nQHOpxLFuu0/+tEZmazNem4B+3kePq61ry4N4BRcbtO42ubAjEHj5tsJP3QVnzS9Nq8L
	xovB+3eNG6qre4PDNdx0asq271+iFmzLdes7i6r7WFO87EMsAJN6Vz35p/sTuPkAMRo47EgMcL4
	Dxcaht99teQR0BOf30lUvw2jacrYU8BHvH6Ylwu+NW7saCRDrtsbgHdRKvAmRgmZQTh02E9n/ip
	ep0vUdho3xqNnLJIpmnSWTqgCTTMirbdaYu8r1GdBe44guF+g9Dk15DdPLn+jD95b3+ChX2Mu2M
	MWVtTy06kbFzoH5lbhE07un8VM+Pb8ff9VWMHq0SBg6rcVZX+PkgQr8J32FqkSarJku71fSDTVt
	1j/YrlPvItJOKugR6MBipZLYXI9dXMOWPwz3H8ocOV7y+t6LrCj8zOT94N4wASo0Vd1P7l4XUa0
	raYbnCTjPxwMFdWlTSboUuppxRZpoVVZzVZBY7EuiqdB5XAmGUx7Aw88HucGmLCqgsFSSdRTuI9
	UVrpUpg6cTR43vsJ1nRfPjk1hLa0=
X-Received: by 2002:a05:7300:ce08:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-36a42401de6mr10143619eec.9.1793523591850;
        Sun, 01 Nov 2026 01:59:51 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a5eee0f20sm6176212eec.17.2026.11.01.01.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:59:51 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/hmm: honor write requests for owned device-private
 pages
From: Aveline Noir <jm5905938@gmail.com>
Date: Sun, 01 Nov 2026 19:58:21 +1100
Message-Id: <179352350180.2.12918668886938034091.b4-reply@b4>
To: sashiko-reviews@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Francois Dugast <francois.dugast@intel.com>, Christoph Hellwig <hch@lst.de>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, sashiko-bot@kernel.org
In-Reply-To: <sashiko-outbox-192310@kernel.org>
References: <179343062238.2.2773026701442863377@gmail.com>
 <sashiko-outbox-192310@kernel.org>
X-Mailer: b4 0.16.0

Hi Sashiko,

On Sun, 01 Nov 2026 07:29:15 +0000 sashiko-bot@kernel.org wrote:

> Since no MMU notifier fired, mmu_interval_check_retry() returns false and
> walk_page_range() restarts at the same hmm_vma_walk.last address. Won't this
> spin forever on the unchanged SOFTLEAF_DEVICE_PRIVATE_READ entry while
> holding mmap_read_lock(mm) (or mmap_write_lock(mm)), svms.lock, and
> prange->migrate_mutex?

Oh, I missed that. I'll try to fix it.

Thanks,
Aveline Noir
