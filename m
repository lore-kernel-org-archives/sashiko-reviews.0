Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864996;
	b=GHahJCroR8mz50U5g+F+iynFXIyZlg3lhlrItt4OmQkMUBAeu4Od4kFA4YajaponSz3V
	 TuBziL5+nWeRRTSD+bWZEowFAFhsj6daIA68ul7pBiJenfxdoRjtPd1FskkV7/nttTpnz
	 ZY8JapJYlngk+Q+qFkBCcwgEL8nuI5+4IszhWVltdHXUuFaIZvGRdpjI1X9qhqd8x1jV/
	 g6qNf4zhQVvpWGYisLD8IN3HXLnc27i0uXcTlVeyEpFQJUwSilax+L9rjYSp9+zqkUrgB
	 tPg/3KslsfDbJ5+3vKHNI9JLAieMziAPyi5wQWhVcFUnVNaH/Oqy12vBMlDFRpzZXlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864996;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-ID:
	 X-MBO-RS-META;
	bh=WZ2kHCM2Jt6bsHOY5bYOgrVnEII8MD5ukPE+LJNqpAM=;
	b=fMUPwGUad4/HBST/pVzCjGje41Sxo7PnMe94SwII/V4lqy9rij2Fwz871TyQH63VpEQV
	 c/si7NKxY1HpQVm9X+xVJgU91mKCoP4F+g5UO/FPPcRsXgF0/gpqeGGxxBuNASKpEb0kr
	 uekbZ9EfYc08d7JwHXNKBtCyc+lZAc12CRbzbT4GoqqLTDpWuMYZalMGOheCD2L5vreZs
	 l9yqDLSvQm1q5vxzP4yFOMST3l6sOTVd1/QBrNDnmxtzijYIVrfNwDgPSanlPCu7IiBDp
	 JPl0i4hdhcimHOBWJcPXDAgs/7tnQY2tVVOMgaebHy4oJzPHap06AXWf1m/FI3x4H6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=g9gLx1Dy;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB34A606A328
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 07:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB34A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=g9gLx1Dy
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jKvbh1xmfzMldS;
	Thu, 05 Nov 2026 08:49:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793864992; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WZ2kHCM2Jt6bsHOY5bYOgrVnEII8MD5ukPE+LJNqpAM=;
	b=g9gLx1Dy/UmZT+wWDLx/UUol8BGKhKqP836HjBAy23wKN+/aIjqsd9MFsy8LXpfpfoSgfX
	PV4EzolsAi8i8jXa2ORU7oDv1cBhe6FaOUnEeu6ld35q+wHfKAh2cucG1QUZzV8A1B0mq1
	q/l9kgx+ohjjg0DFuUz1P9GzHZ9i/E0pm8nQhFAqWubU/8q4KuhI5zLgulWsbwlYMOj05Z
	TJGpUo7i2vanTYHm1xaLfbm/OuHJqwOqGoT/8eNIqIchYGrS4Ys31Xv2zb6gB+//1f1tbW
	4UhBB2yfDNxfidYMx77BblxdIz5/vFk1+dzWPM/uLXcOUF5oSyi6pbMo1/YCKw==
Message-ID: <75367a9a19c1e9a007422e0a1b8ed0acaca2492a.camel@mailbox.org>
Subject: Re: [PATCH v2] dma-buf/sw_sync: Optimize the retrieval of fence
 reference counts
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Edward Adam Davis <eadavis@sina.com>, sashiko-bot@kernel.org
Cc: media-ci@linuxtv.org, sashiko-reviews@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org, 
	robin.clark@oss.qualcomm.com
Date: Thu, 05 Nov 2026 08:49:49 +0100
In-Reply-To: <20261105052707.55911-1-eadavis@sina.com>
References: <sashiko-outbox-198550@kernel.org>
	 <20261105052707.55911-1-eadavis@sina.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-ID: 138597b0ebf596f7525
X-MBO-RS-META: grptiyux6188h3jp9sca11gsrqamht4e

On Thu, 2026-11-05 at 13:27 +0800, Edward Adam Davis wrote:
> ---
> v1 -> v2: use dma_fence_get_rcu() and remove link & erase pt node

Ideally, one avoids sending new versions within 24 hours :)

>=20
> =C2=A0drivers/dma-buf/sw_sync.c | 6 +++++-
> =C2=A01 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index 8df20b0218a9..261bc98b1ed6 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -221,7 +221,11 @@ static void sync_timeline_signal(struct sync_timelin=
e *obj, unsigned int inc)
> =C2=A0		if (!timeline_fence_signaled(&pt->base))
> =C2=A0			break;
> =C2=A0
> -		dma_fence_get(&pt->base);
> +		if (!dma_fence_get_rcu(&pt->base)) {

You must hold the rcu_read_lock() while doing that, don't you?

This probably works "by coincidence" since the surrounding spinlock
also disables preemption, like the rcu lock does.

That spinlock, why can't it guard the dma_fence reference? Doesn't obj-
>pt_list hold its own reference?



P.
