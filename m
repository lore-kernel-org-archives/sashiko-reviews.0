Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795055669;
	b=ShogY7sPJQZ3KRCbhszFW7+psP2GEbHe4ICWKrSVR3vm2fwRcstUxYR7jWptlENcntSJ
	 2S3RcYCIJgWHUid5PE4uUKCPA79IxW0r1LbHEOMQkhqjK9QLJWR4RngSc7h6bbuSAY1jJ
	 l6KmW6rUnTXvfVg22zJn0Eez00EW7+GSCGpNgURzmNkLHFyIyMGvHpGSYyejX4iM+z+3r
	 zWa4mmdYFgObLIN6xAX+bes6KNt+RI+b7Edgw+MqzLnoeTM9UOKf3JRxnPmXuWrTA3tds
	 bjF8EeiLl0B4XbKkuB8lGD0/Ai59BKGc3HBAZKJn0tokkABro76JlHJX4nhtGinNGkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=uM0JN8VUfPH6oC5vWX2xf2IB4+IT358j1Ch/z79GA5E=;
	b=XH/qoIXQDnA7Lb8Js7q/J4qsHlOQRY3R/3MALRBIybi1OKp8ef9B0kW8m1uPXPmCtGLt
	 CDoWgu3tFdKIHufcsotts3tdx/iNbLW+R/D70o1SWMxyDGMp/I923SiM3/ZxxumEq83V2
	 eaXMPMqU9yPBce+oKnAEgEy+Adu/OwJeVLgW7yg9oEKv6piXXOIpxaivjyurKO1SXYh0t
	 1oZqDb5y3bKruylInX8qV8hYDoeWOvgEvciPEWTGdDnbUDSBuFyuSCR/gE6RqMB5GbfUv
	 uPuIAbT4v9xFzb2abAEXmCXUFjzeidBoFCYQEpwORI4LqBxb2ctHYBx8j9lt6VBo1pQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VypQyj/B";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BFF606A32F
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 02:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9BFF606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VypQyj/B
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c50a4a2132cso233098166b.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 18:34:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795055667; cv=none;
        d=google.com; s=arc-20260327;
        b=LfFr5y+mBPbP02Z1Mc/EJbyUT9ILmbykDKEwXTsweHJSXF+NHwCujBObzszL3ChGnZ
         3AcmC71Mk+6RDXQcs81EYyXd2QPPKsL1iuNMM21Dk8YN1GIKhm00Fc483s3HiK0rcSXu
         8Pdj6Y70aD34nRa8yQhy5KMr0YT+0fZQC2fY9l/07urCFuNGT/J/jJvAJ23MP9/VhFOj
         YZ6qdiSGhvUa/4UJ478pNCjAEX/WzHu/rAVzSPmqYl1QkxEW7LrtaTVnofgz+ItOBaf/
         ERGK5rAdJCIEY0PcOc6XzUXJGoMQUd1acggeISX/jkZAV76xO2iTJF/kpKGe8hzffqRs
         oDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uM0JN8VUfPH6oC5vWX2xf2IB4+IT358j1Ch/z79GA5E=;
        fh=SuGro3LuLsk6byufPAfAAQQSIx1YKDKO0TNpiyde+AE=;
        b=gg50+CfSdv9JnQog0bUwivUkQ2LPb1r8qf9KgXhGlPhM6Ox5/VPzFz8EUn6VDi8uxx
         Er1MLLyQRap3B0zfYgi3/6730IllQAegf7NnnaEWg7KrapVSdihyciBowDOkjMKre1Po
         I85TRuyxmNls962XiyYpvbMMl2787B96PkzkCnjE81WrIrq63wjehrGA72ZPDssVVSr/
         EFzD9j7CdcdnaSA1xF40tgojPFKTAG0E+QI6oQtL16BhU2dAlv/KzvkAp579KFdAK1QI
         yxkTWw7rp8yfmNQrzK6RWPMnleN+nO361wp0s+VykO98SbPf7nWLzCsEl4tDzFrTLPmp
         d5uw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795055667; x=1795660467; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uM0JN8VUfPH6oC5vWX2xf2IB4+IT358j1Ch/z79GA5E=;
        b=VypQyj/BSujW868wRTkeH2QG0p5PTymOQJdYsSvzP8ZsCO1BF3Eit1iLPO7pCnwYPb
         HdZGPBf+r+qC4nIh1YDjAm8kDrhYP4nCPrLs3DUCndUDyABCHfWFFxzFvoCQSLiqh+gk
         8CBFUXAcjkyKMQ2aZ5MTyZh0t5PCMsKX04piKziH0mJSWpPMtApY12l9iz2VGPUHx3NP
         nl1TP8IMUN+zLSIp0sb2uQ2QWtKjmoq3Q1lybXCFx0dJemPF5cNulFQ+05cyWxInlsmE
         u8Wivn5ppMSxccb2evKVq27BolV3A9uWN03MCHKg9hDDYXNpmmm+KYykykztvi4jeOcq
         odwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795055667; x=1795660467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uM0JN8VUfPH6oC5vWX2xf2IB4+IT358j1Ch/z79GA5E=;
        b=W7RxDQ/r+HbdcCG2M+d5nHk8fQg44MXfSRdkz1jp6EIokv9s+K4jxs4Q+JIITusOU7
         NnP7s89SgGmUv4n8t7SfjUdAH1SnbbErJ7CRHOeHOGxVgR5bbxBcbkbiT30zAdktZ+XV
         jD9qTtFO3Wnxtcefo2OI1uSZYgHWc+6tIHQhIRce1R3OxaSy3KHXE3Jy+cVgIUGZvlsm
         WZKJ7ZtaBNELmXjTTytv8OiJIQ5d7MCVclVeAM8oqaYO+0ZbahjGvNEhhXdDIuHFCeNB
         A1jrv4XawxyuiQro2zCY+rZaVHJhtOkIoH/K8n0ghSGNW2U0XNV89+KwapfYEGv0lp5O
         VfRA==
X-Gm-Message-State: APuU4Z8hi/Dw8eNS8L/8bkA5DUfu2keB0/KTTtjuDN+lUn0Hz5MKZwPX
	SY7rSsKE6fw9XUdJTq5DjR8VRU44iv8WIV4VGLTGLdpQcEGaFlgovs11zrdP+GkSaYJWBjZhvYV
	iBm5QkemcnLgK7UgnvHxL1G+LcECI9rsMSqaR2L+BXQ==
X-Gm-Gg: AYBFou27IBwsEeGjKg9M6fx3gL06ee7a5dKHyC2U/9ggR/azjwXAtWfVc4HJ3zvS8hj
	RYZOrvXyguICbpBIreAaEZ87f4A7phL1RUMxP46Z8SEoMhkVD4lua4Idu4FK5lk0ux3YpeWi/pJ
	IwngJyESeBYHZ1MIUrG+l/zZhnTFeDdeOmQTSmUtybLlNpx2zQaI7rEQsQP5EuW2W9AOGRB7yrY
	D2nshQzluWXPFpgQDZqKb5mhChIRZ5s38+V0ehphnAiX0CdrIkB5zku5cWvMCwq5ztWgtx2Nio4
	FgGAj+CswQXa+0GdBaFjtSlbHnAQGMp/eQ3GyRv+vZx1oAQLvHH6YCr/iyMwcs0Rd91y3gAiHkY
	MU3Txw0Gk6a5soXVZfwHp8BOZTXmn6rGF/oP4UYezeu0cvAh3McdRaWdksUUPNl3aeDKBJg==
X-Received: by 2002:a17:906:8358:b0:c51:282b:5489 with SMTP id
 a640c23a62f3a-c51282b56e9mr57464466b.3.1795055667022; Wed, 18 Nov 2026
 18:34:27 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
 <20261119-mglru-fg-v5-15-9eee2fe97a2d@tencent.com> <sashiko-outbox-221996@kernel.org>
In-Reply-To: <sashiko-outbox-221996@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 19 Nov 2026 10:33:50 +0800
X-Gm-Features: AclHuK9Yac_j-zeuFnMHQ2zFU_qaUoG-2sXXeJATZdyMK3cX3pLJ77pbVaVCnZE
Message-ID: <CAMgjq7DctjL5Mo3q7qmVTRTi0JNqYxfEynDE6z1qqp6MH+RnFg@mail.gmail.com>
Subject: Re: [PATCH v5 15/17] mm/mglru: folio LRU refs based active/inactive
 number accounting
To: sashiko-reviews@lists.linux.dev
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, 
	Hui Zhu <hui.zhu@linux.dev>, damon@lists.linux.dev, tj@kernel.org, mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 5:29=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mm/mglru: raw folio_clear_referenced() in lru_deactivate()
>   paths

This is the only issue from sashiko this time, and looks trivial,
which is a good sign.

> --
>
> commit b8ed2e873fb1f3b844c7ba1fec4ae00c0c04fb88
> Author: Kairui Song <kasong@tencent.com>
>
> mm/mglru: folio LRU refs based active/inactive number accounting
>
> This commit switches MGLRU active/inactive LRU size accounting from
> generation-window tracking to per-folio reference count thresholds
> (LRU_REFS_ACTIVATED).
>
> > diff --git a/mm/folio.c b/mm/folio.c
> > index 06c9cde834f76..3b5ae5b516504 100644
> > --- a/mm/folio.c
> > +++ b/mm/folio.c
>
> [ ... ]
>
> > @@ -552,10 +523,12 @@ static void lru_lazyfree(struct lruvec *lruvec, s=
truct folio *folio)
> >           folio_test_swapcache(folio) || folio_test_unevictable(folio))
> >               return;
> >
> > -     lru_gen_clear_refs(folio);
> >       lruvec_del_folio(lruvec, folio);
> >       folio_clear_active(folio);
> > -     folio_clear_referenced(folio);
> > +     if (lru_gen_enabled())
> > +             __folio_set_lru_refs(folio, 0);
> > +     else
> > +             folio_clear_referenced(folio);
>
> [Severity: Medium]
> Should lru_deactivate_file() and lru_deactivate() also call
> __folio_set_lru_refs(folio, 0) when lru_gen_enabled() is true, like
> lru_lazyfree() does here?

It's very trivial, the folio passed to lru_deactivate_file should
already have their refs cleaned befoing arriving the folio batch.
There is a tiny time window they could get referenced again, in that
case, keeping the new ref or dropping the new refs both make sense.

Oh and since the folio is offlist, it won't cause any statistical or
counter issues either.

So it's not really a problem, it's fine either way.
