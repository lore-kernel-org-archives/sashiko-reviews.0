Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697186;
	b=dFJ2hXNb2ih8RPZOHbyCNvrUD3DfE0eYlBG6JTsYGj9YKyT8EI043+t73y32Xnlxa74b
	 cSPNUWB10SiXbhbe+LWADfSMJYqDlU4QYqIzkyZNuDloEZWuupub6Jr2i9/w1LTh46bTr
	 0eohZRTbUKF9HktssqE0WpKvlya16AG3HpMQhc9eh7dCIA98J6ISYDpEWkqNpuc5uEg9G
	 wzsoFSk6+fi0EksKuHRihmmaAVWY/fD/coYKd/ckTT9s/Guc5HyL9DQIoe73dcMHOn/OG
	 48OdKpjwFec1ejbagq+cW/A5p/GQLvp6Xu6Q/OeVw24xmjvbA77YLJtEvHWFeSCNT1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697186;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=bwIiMJQ2t5zyKzPUlNJW85EPjdSNL2+dojUyrtUSlA4=;
	b=TaW2lepP/yLuwTvPbPzYdD7HRtkfSxbBh2r3vZ8gO9b7+SNHs96q3s0C9H0xB2mi4PHm
	 SBLanONQr4T1TLgmxCMfbZaVYOJ1YpBwc+FVusXokwtmIiy9+nwH6zkhiQqVBUpUlHN20
	 M9nHv/razn8uXJD2n9Wb930UHx1Y+YdgT30LddZeW6+TtiTS/xQmKWjLiMtvxEyZrkrpE
	 UDqNrbQWuRUD2pVuQWHa42x01g8yqPVJiv59TkXk95VE79awl73aabF2Ul7CFxSCp7uEv
	 QK+nidUpgp18NY8XaenNDnD5LsxrRpaXf5RrDfLIhjhUWnHYZaANVN3RyXQujJQWXWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=HzvHYmN1;
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BA1606A31C;
	Thu, 26 Nov 2026 12:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2BA1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=HzvHYmN1
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xWYrn-00000003raV-2FFL;
	Thu, 26 Nov 2026 13:46:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=bwIiMJQ2t5zyKzPUlNJW85EPjdSNL2+dojUyrtUSlA4=; t=1795697183; x=1796906783; 
	b=HzvHYmN1qo3GkA9i8wjcDZSTAdiI1tZo3EDVC1Bs4GW0W8ALEJrpjsq0pGeYnmWN4fyk8mnlQqf
	NVnJcmw/1lSct7oRSt80zPdLyJomGjTtDtjww7/dAsfWUycGNwv1F5GGkW57I4mkVbTKrNNlhA41k
	o4YECgPoNpjDuZfi/9yvz9GGJqaMTa/MVR0i7WWiTga81d2y6+sPClMMiCXBuCRvDLlUP18MX+usp
	hTNY0weTq1yS3CeX8nhnUWPOgHFF2ZQY5AejD1n36SJehQVHLXOXC6J51kple8eJGKHO+lf/8NLuU
	r+n5Io0iguXFulLwG9hKiNCkj6d4zoh7dMWA==;
Date: Thu, 26 Nov 2026 13:46:07 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, imx@lists.linux.dev,
 devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 Frank.Li@kernel.org
Subject: Re: [PATCH v2 1/3] ARM: imx: enable STOP-ON mode in idle if wakeup
 requirements permit
Message-ID: <20261126134607.0cd4da28@kemnade.info>
In-Reply-To: <sashiko-outbox-235350@kernel.org>
References: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
	<20261126-imx6-idlestop-v2-1-c6987e7a392f@kemnade.info>
	<sashiko-outbox-235350@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Nov 2026 11:13:50 +0000
sashiko-bot@kernel.org wrote:


> > +bool imx6sll_check_pll_are_used(void)
> > +{
> > +	/* check for any clock active which provides more than register access */
> > +
> > +				/* uart2 | dcp */
> > +	return readl_relaxed(ccm_base + CCGR0) & (BIT(29) | BIT(11)) ||
> > +				/* uart | gpt_serial | epit | ecspi */
> > +		readl_relaxed(ccm_base + CCGR1) & (BIT(25) | BIT(23) | BIT(15) | BIT(13) |
> > +						   BIT(11) | BIT(7) | BIT(5) | BIT(3) | BIT(1)) ||
> > +				/* pxp | lcd | i2c */
> > +		readl_relaxed(ccm_base + CCGR2) & (BIT(31) | BIT(29) | BIT(11) | BIT(9) |
> > +						   BIT(7) | BIT(3)) ||
> > +				/* lcdif | epdc | pxp */
> > +		readl_relaxed(ccm_base + CCGR3) & (BIT(11) | BIT(5) | BIT(3)) ||  
> 
> [Severity: Low]
> This isn't a bug, but in drivers/clk/imx/clk-imx6sll.c, BIT(3) of CCGR2
> (0x70) gates csi (omitted from the CCGR2 comment) and BIT(3) of CCGR3
> (0x74) gates uart5_ipg / uart5_serial rather than pxp.
> 

According to page 536 of i.MX 6SLL Applications Processor Reference Manual, Rev. 0,
it is a second pxp clock. Is there any autoritative source here?
I have tested pxp a bit, had no problems with just one clock but did
not really test all functions. I do not have access to uart5 to test anything.

For the scope of this patch it does not matter, both belong into this list.

Regards,
Andreas
