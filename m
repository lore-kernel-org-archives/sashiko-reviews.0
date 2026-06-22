Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E0D37B00F
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 11:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782126896; cv=none; b=ZFXKr6r9p00G+eHTU9UqIuHpwGPN/ysnxPaodSgTjZswojeXLgT2lUdqa9q4FlpXwc0uNvV/28lM3y0R2o8ns3dZfcYJyBFs96w1wHKGY4CUDkj15FPul5FZC3OUYr7npuqvgCGw6TtEk9glKAU6zL9zfGey5P2tihRLtNq7vnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782126896; c=relaxed/simple;
	bh=nNuroTXzyDCIlMfy5EdJRUco77OZtGc+jQyUccvR2mQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=R4RjT3Y7SbEHNPRk/5AEWd8WdqRin21QzZgfLqVSEIplnv2LgvNNqTh0hDgV4hZeZ1MbuMKaRjeMOpeXcpfjnUTzs9Co28sEfvxOPORIMb0kLQnf8zb+nLRevrZ8yl1U7isq8cBDBNScc6dVwUptEd/bN5WbRdpWgPN5YXeR13w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=drJyBHxh; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="drJyBHxh"
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782126882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q/Nt3ZSEojCnMHuRAvkMdzlZf6jTkFZDkHqjLomvQeg=;
	b=drJyBHxhy30BfYWGegAA+3LmSsD0Ef+pGgUI24dfKe5gd47LLinKTkqUXn60ZNYuRacpqB
	9pl4wTp4tKMLs+k/YpTCJkvPwxiBz9/YBVptH0PgfzJ5YKN+olr1fsp2XDP/SNnvaqYj3/
	1R5DjlALrv0OL27yGMm/qdoFEFaedbM=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 11:14:40 +0000
Message-Id: <DJFJ96IPBX9H.33CCUBF385H1W@linux.dev>
Subject: Re: [PATCH v2 12/13] mm: Move __alloc_pages() to mm/internal.h
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Brendan Jackman" <brendan.jackman@linux.dev>
To: <sashiko-reviews@lists.linux.dev>, "Brendan Jackman"
 <jackmanb@google.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-rt-devel@lists.linux.dev>
References: <20260622-alloc-trylock-v2-0-31f31367d420@google.com>
 <20260622-alloc-trylock-v2-12-31f31367d420@google.com>
 <20260622102105.53D141F00A3A@smtp.kernel.org>
In-Reply-To: <20260622102105.53D141F00A3A@smtp.kernel.org>
X-Migadu-Flow: FLOW_OUT

On Mon Jun 22, 2026 at 10:21 AM UTC, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Missing EXPORT_SYMBOL for out-of-line alloc_pages_node_noprof() c=
auses widespread module linker errors.
> --
>
> commit 42f7742177beb0066c00a7aa081250feb5859171
> Author: Brendan Jackman <jackmanb@google.com>
>
> mm: Move __alloc_pages() to mm/internal.h
>
> This commit moves the __alloc_pages() family of internal functions to
> mm/internal.h to restrict them to the mm subsystem. It also moves
> alloc_pages_node_noprof() out-of-line into mm/page_alloc.c since it
> depends on __alloc_pages_noprof().
>
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index 36f0d625a4390..38238203ef7b0 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>
> [ ... ]
>
>> @@ -5419,6 +5419,17 @@ struct page *__alloc_pages_noprof(gfp_t gfp, unsi=
gned int order,
>>  }
>>  EXPORT_SYMBOL(__alloc_pages_noprof);
>
> [Severity: Low]
> Since __alloc_pages_noprof() is no longer visible outside of mm/, should =
this
> EXPORT_SYMBOL be removed?

Yep.

>> +struct page *alloc_pages_node_noprof(int nid, gfp_t gfp_mask, unsigned =
int order)
>> +{
>> +	if (nid =3D=3D NUMA_NO_NODE)
>> +		nid =3D numa_mem_id();
>> +
>> +	VM_BUG_ON(nid < 0 || nid >=3D MAX_NUMNODES);
>> +	warn_if_node_offline(nid, gfp_mask);
>> +
>> +	return __alloc_pages_noprof(gfp_mask, order, nid, NULL);
>> +}
>
> [Severity: Low]
> Does this code cause module linker errors? alloc_pages_node_noprof() is c=
alled
> by the alloc_pages_node() macro in include/linux/gfp.h, but it does not h=
ave
> an EXPORT_SYMBOL.

Yep. Doesn't show up in defconfig but if you set CONFIG_BLK_DEV_UBLK=3Dm
then:

ERROR: modpost: "alloc_pages_node_noprof" [drivers/block/ublk_drv.ko] undef=
ined!
