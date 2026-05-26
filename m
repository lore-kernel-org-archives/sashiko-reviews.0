Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439D52139C9;
	Tue, 26 May 2026 08:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779784002; cv=none; b=DQZCVtcqQ/g34CeMHJFxiJ/4A1xJj5OZO1/ClMfKOu2P7F7xMc8TKdml+IU1MP8zMwgYfHBUDp3Mfoevh61PUnWxwFS/GTZCFxfWK27zQyZ5MyvJphiV8uq/ZOd5hvkujdCx7P/BuQe1ogZ29XKJ3vCf/GQ3iWVguqYbC4y+FKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779784002; c=relaxed/simple;
	bh=oSA/IT5um6LVlHgyL+zO+y5tvOE5NRiq02LWFFW2Uqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j59ONd1KT1FmdIThWsWBbcgztGk5IeTqPG9d8Br0WSPdKgWknfEBvwUGfZ3a1SkijM7ROnFyd+xEhO7H3yqhl9ClE8C2qBy3ItRsD2bfRw+P6SD8uNqLZJFtlSPqKWvsMU/jzeaJxnq+v/35fX+AaOvsSUJ7OMrVvg1XUFG3d/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=nU2guSM3; arc=none smtp.client-ip=212.27.42.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="nU2guSM3"
Received: from L30177.local (unknown [213.36.132.10])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5A600B00579;
	Tue, 26 May 2026 10:26:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1779783999;
	bh=oSA/IT5um6LVlHgyL+zO+y5tvOE5NRiq02LWFFW2Uqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nU2guSM38EBcVF/0gJ6so3SJp+0PfC8kVC+pDU2WoYQrhAcdtlm8uA8zDwfSxNzf4
	 3en/bSV86rYeUR8UhT2bOGF9eeMuX74BNavGqzqp39c9kDEobtWC7/i7pW28hGPGEN
	 N2EGlKrf6NLuJlfntGPCQFA3RNAbXX+8VgTLvTl14+rgTj3pqKUjvJWVpYErimY/lN
	 qikSX5ewB9avneSiSVqJPsJoxcyRVFlETJQ2atjoEeZftDe7vmE0ViWxZuayf0nWPV
	 D401aFRYoD8+/lzpoWxiAIagH4y8yffeA/V4JISz+b14xfLO+Q2i2zN+aKJsUKDbWI
	 c1NkUsOgUzyJA==
Date: Tue, 26 May 2026 10:26:36 +0200
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 2/2] i2c: imx: fix locked bus on SMBus block-read of 0
 (IRQ)
Message-ID: <ahVZPLHymdsZtgg5@L30177.local>
References: <20260525-for-upstream-i2c-lx2160-fix-v1-v2-2-26a3cc8cd055@free.fr>
 <20260525182420.05AA01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525182420.05AA01F000E9@smtp.kernel.org>

Hi bot,


> i2c: imx: fix locked bus on SMBus block-read of 0 (IRQ)
> [Severity: High]
> This is a pre-existing issue, but does this function also need to set the
> TXAK bit when len is exactly 1?
> 
> When the length byte is read here, the hardware immediately starts clocking
> in the next byte, which is the first data byte. If the block read length is
> exactly 1, this first data byte is also the last byte of the transfer.
> 
> Because TXAK is explicitly cleared earlier in i2c_imx_isr_read for length
> transfers, the controller will ACK this final data byte if TXAK is not set
> at this point.
> 
> If the slave holds SDA low as a result of receiving an ACK instead of a NACK
> on its final byte, would the subsequent attempt to generate a STOP condition
> in i2c_imx_isr_read_continue fail and permanently hang the bus?
> 
> The atomic path in i2c_imx_atomic_read appears to handle this safely by
> setting TXAK when reading the second-to-last byte.

once again, see the answers on v1:
  https://lore.kernel.org/all/ahRoKMLtrirbowbj@L30177.local/

regards,
  Vincent
