Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484208;
	b=FVebtScJosJJrzPiDnNhoa/7faZOpRndNCwksIdzaJWyFMaQCzHOOfGwejgdHfch480p
	 MYGAAHX9CmYP5ycw6aOLSgRFoRH1X5lS/Jkf1wA+TnrEKFjpiKJlLEYc3jJzF7OMep8/j
	 RO5WLWHT7fButzxxDBQs6IUnzt9foa/L+SnrRTB2iI24kRgTRpx215hVwxK1lYYEpQvBI
	 zCYGRZY5MZWvR7Me6v/xIwj5RR0bnkShp010DmpGSJz0SQLlf/cK/KP8igaFHgI9Y2YZr
	 vcFx8T7i0H3W//pSfOQ6uN+5X1GU5sss01uLUtGc0LzMak25PieiUkFew53IX7QpNpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484208;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=Y1DkdK48Xnp7vfevJCGquLuztwnwhnHgqI63IQ/k7p8=;
	b=Qq0TzOoPoe+rmAzSl7mxZe68fyhJJ1659VEj9kr7w2hf+lxFGcYYz35dL93N929HZwxy
	 ImpmIl2BkK2aKNHq2sMwsvG6s788s1naeiXljXu+j83j5mqvVioA98cDKmaoMDlqbCB9I
	 XBu9Cwnuj4v6HzKMMsdTHbm+pH0oKlcZKUQGOWW9WzoJ1ywtX8qfiHWKQmrSM2P8wx35G
	 HflRkv6oq9N7UAPY5SoIViK5axkGoZP2sWzMOI/C7sTs3ehMvBeDwZdQ1yR0SRSP8rwR+
	 hQ+KY0bP8ET2i+XWj/658CgPPRU1cWA5XEKyknK30CaIqHjd6KX2WgF63j9g86gis9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=RvQ68wl1;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25D3606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 11:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E25D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=RvQ68wl1
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261112115004euoutp01097292e7ae21e5e37f1087780829ed90~nSeBx9XPu3249632496euoutp01n;
	Thu, 12 Nov 2026 11:50:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261112115004euoutp01097292e7ae21e5e37f1087780829ed90~nSeBx9XPu3249632496euoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794484204;
	bh=Y1DkdK48Xnp7vfevJCGquLuztwnwhnHgqI63IQ/k7p8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=RvQ68wl1U3qESoNVCuQUGyiyIfaNWCHYP1CNXcF+brxHCVeBy6KR97gpchCpx9iJq
	 90l1wzn0qYwPoNTXMO0DMbwDiHQ4Uw1U/7fDn5TPgan/wGVnhM5Eh4ZwWx+Gs6kMfH
	 c1VN7qorE8gyJMvtqMBWKPxW6bm4RYU6F9gNrCHA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261112115004eucas1p1ef74480795d4b0447b2f5fc9b5d9e528~nSeBeNxz42728927289eucas1p1f;
	Thu, 12 Nov 2026 11:50:04 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261112115003eusmtip2a3ff1ea0c43c9febebf9d2d008bea473~nSeAHeWqa3153931539eusmtip2g;
	Thu, 12 Nov 2026 11:50:03 +0000 (GMT)
Message-ID: <92566ded-cc28-4cc6-9899-cf2421045455@samsung.com>
Date: Thu, 12 Nov 2026 12:50:02 +0100
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
Subject: Re: [PATCH v2 03/15] zram: lz4hc: reset the dictionary stream once,
 not per page
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
	sashiko-reviews@lists.linux.dev
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
	<justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
	<James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Heiko
	Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
	Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
	Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Minchan Kim <minchan@kernel.org>, Jens
	Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>,
	linux-s390@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>, Nick
	Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, Chao Yu
	<chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers
	<ebiggers@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, David
	Laight <david.laight.linux@gmail.com>, Sungguk <sungguk.na@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>, Marek Szyprowski
	<m.szyprowski@samsung.com>, linux-crypto@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <avKrj0h8fBNSrfCi@google.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261112115004eucas1p1ef74480795d4b0447b2f5fc9b5d9e528
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106144252eucas1p272c9e37d66ad385db070f941879aecb1
X-EPHeader: CA
X-CMS-RootMailID: 20261106144252eucas1p272c9e37d66ad385db070f941879aecb1
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
	<CGME20261106144252eucas1p272c9e37d66ad385db070f941879aecb1@eucas1p2.samsung.com>
	<20261106-lz4-vendor-upstream-v2-3-ee04c3f0d7dc@samsung.com>
	<sashiko-outbox-201613@kernel.org> <avKrj0h8fBNSrfCi@google.com>



On 11/10/26 06:31, Sergey Senozhatsky wrote:
> On (26/11/06 14:49), sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found no new issues
>> in this patch, but noticed 1 related pre-existing issue it does not
>> introduce:
>> - [Medium] zram: high-order memory allocation using kzalloc in
>>   lz4hc_create() [1]
>> --
>>
>> commit 2f51683dc7418bdcd0730283cb7003d8754fcd5f
>> Author: Michal Wilczynski <m.wilczynski@samsung.com>
>>
>> zram: lz4hc: reset the dictionary stream once, not per page
>>
>> This commit moves the LZ4_resetStreamHC() call for dictionary-backed
>> streams from lz4hc_compress() to lz4hc_create() so that the stream state is
>> only reset once at creation time rather than on every compressed page.
>>
>>> diff --git a/drivers/block/zram/backend_lz4hc.c b/drivers/block/zram/backend_lz4hc.c
>>> index d8aa01bb258fe..06286c805cf7c 100644
>>> --- a/drivers/block/zram/backend_lz4hc.c
>>> +++ b/drivers/block/zram/backend_lz4hc.c
>>> @@ -72,6 +72,7 @@ static int lz4hc_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
>>>  		zctx->cstrm = kzalloc_obj(*zctx->cstrm);
>>>  		if (!zctx->cstrm)
>>>  			goto error;
>>> +		LZ4_resetStreamHC(zctx->cstrm, params->level);
>>>  	}
>>
>> [Severity: Medium]
>> This problem wasn't introduced by this patch, but should zctx->cstrm be
>> allocated with vmalloc() or kvzalloc() instead of kzalloc_obj() [1]?
> 
> That's how I have it in my local tree - vmalloc(LZ4HC_MEM_COMPRESS).
> Michal, I suppose you don't base the series on top of linux-next or
> Andrew's tree?

No it's based on v7.3-rc4. I'll rebase v3 on linux-next.

> 
> We reset the stream when we setup params, so I don't think we need
> to do anything in lz4hc_create().
> 

Agree your change covers it. I'll drop this patch.

Thank you for having a look.


Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
