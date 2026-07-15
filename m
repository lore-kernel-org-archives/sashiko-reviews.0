Received: from mail-ed2-f2.google.com (mail-ed2-f2.google.com [74.125.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140FE3B14D1
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 18:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784138872; cv=none; b=l+AUxRAu3cTRmI0dwrCGT5APV1sj3cPJ2mtWgIsTM3eSRFoy1KkDQ5aclCl+iDXbnfHVXkuoXl3ZBJSrGJQTLoOpDgeonxenURSrae1rtRkeu/J2+GvX/l+l4esqqsV4UMCRNkKlFYU8E3cKhfMSeg/FG64XCm/Awxd2ZAP0L7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784138872; c=relaxed/simple;
	bh=GQK0Peds9I7KUMB7R8rkxQQmjsehlzQVUOhctRGDiU4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=G5lUUZ4Jyp/z+bADs9Fmo7aO57WdkBCcOCcAXbS2HhI4Zl7cW/AYKDztJpKyrPSENJkOETRCcJM/In0rImAOGPNsy6CYdqe+6jqw1id2AwZpUw1fUSrNPbq0+sUsfUE9XJH4f3+r8J95WcE4D+Qm5JB36ze+31GXfjxoiNfAye8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jK+XIA3u; arc=none smtp.client-ip=74.125.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jK+XIA3u"
Received: by mail-ed2-f2.google.com with SMTP id 4fb4d7f45d1cf-69af1ce9674so4185211a12.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 11:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784138865; x=1784743665; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7KxN0L3gv7/RdHQHqJVTM6RwHNzjV3feXG/+TNo5Yuw=;
        b=jK+XIA3u919LyyuN4NRNP74OPyMndSur3iPAIM282QP8jgAvpKLqwwg0weNEDgZK6b
         UK+TraYozoD6gWBqHoc4dagjyeWDjfhr5G2MTbjWAvo9uh+t8XGPduWFO6WmFKlR3A3e
         eX5fZzhXQjPctbpf5111G/jkHjUfLdYlLD7uzpM05rVGsk9Ec75VFVJ9J0MPzSgCnaTA
         d8tFbQ4+4lel5DjxdWsHq0I1PjuDncOq1YtmTUUn1cNOpSF8SQ0XVTjNg1o/5e5+QnXX
         Qfd0ao2SDza+w++49S19qqnberJ/sPaAdDEgPwGawnEtgmHFev6EmPdjIccWmWQ9i0+5
         46Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784138865; x=1784743665;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7KxN0L3gv7/RdHQHqJVTM6RwHNzjV3feXG/+TNo5Yuw=;
        b=q95UVLOxdi9gZvIlRnlf8QZdelNAWFluVds2jA4MYBP/lCEDNa+I8W/go7J7SGOaqd
         FSD0Z9Qhy2D6u8tB+0UVRwhVBJE5D9nVUHhCzrX8kQPrFYI2ZWXNQEe4SDggXnulTC/j
         SYE5pKd+GLn3Y4Oj4HYULqn2orST0ok1NZWlCASVIRebuZoMxkMXtv4r6h/3q8XChXy9
         gO2b1cL/qoqVKl/VubQuF1tIYRAsg+fuEEJhJyl7oqZkqxYtAgHp451zBH/SKwcrFzkv
         PdY59RASrsO6LZ1+bKgDp5Zd4y7iOzvEaGV6i9+VprmF0uPC+M89ML4ltmjgBqorQjKc
         uFDA==
X-Gm-Message-State: AOJu0Yz/xNicb9Mt4TIfBB9eybbTemmB1jEws+lFkeZZJehhX17iAe5H
	1AFEmw7irtdKds7G3bKmwg1+A6P39AoEYFuUhQOc9lLjsbJk4Y1p6JeDxNaXwnU/
X-Gm-Gg: AfdE7ck0nyWFI4kpGXiCsx8xZgGEdVyCSf+TnlYVZDp3eP8aAHsV5RbMPP1ZQMPbKS6
	Tp8vMvO0laYOPDRVJdAWsayremQICPQfrn+mNB5kdAog6pqYfhvyUh6shDizy4WbzxhpGHnlEiI
	ZuBqt6b0wD9RDF4X8fEHeWvxaJiTXCl2jr5mNxQ1IMEMK37yKxCWsx103h9RGRF5ntdXat5pHGG
	y0x/m/yup/N8Ul39lvyGKWjohJYiI/6rx9mHtEAV/h7b/IEj+W1mIV2n12evqgRDvAZ4rXR412q
	CP2CtKD8+mHUj8Jxfk1KpX4COjHOz8UTh3UKaLfZLuplJE5vQ8qDFI62OrpSfRxAJw0l4P/t0jg
	eeaIXvGz5BRUwkAOlO3N1z8souuVHcHmWmUyfncZtK0nbzr7B+tm3biCTabHwA1WJkX9ZN29H96
	WkznqpFV/3aMClLFjTueVIpabv2Gq82AePkcAM3JX5OXmCdYNuII/c+H9jVJ8BeX05zwya/wSkz
	bug798YpAuIxxloIFmlS4FrL0ztbt+8IKhWLhKtApuYS9chfjtpLjQ=
X-Received: by 2002:a17:906:7305:b0:c16:4df6:1768 with SMTP id a640c23a62f3a-c16794753d9mr251675666b.42.1784138864668;
        Wed, 15 Jul 2026 11:07:44 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871262casm74339466b.6.2026.07.15.11.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 11:07:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 20:07:43 +0200
Message-Id: <DJZCFZ2YF8V7.XFGQH4GPJCD@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 1/2] bpf: Disable raw mdoe for bloom filter
 map_peek
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Amery Hung" <ameryhung@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260715172127.2416388-1-ameryhung@gmail.com>
 <20260715172127.2416388-2-ameryhung@gmail.com>
 <20260715173852.DE47D1F00A3A@smtp.kernel.org>
In-Reply-To: <20260715173852.DE47D1F00A3A@smtp.kernel.org>

On Wed Jul 15, 2026 at 7:38 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] bpf_map_pop_elem() and bpf_map_peek_elem() leak uninitialized ke=
rnel stack memory on queue and stack maps if the map's spinlock is contende=
d.
> --
>
> --- Patch [1]: [PATCH bpf-next v1 1/2] bpf: Disable raw mdoe for bloom fi=
lter map_peek ---
> commit 89de02f623877f9e477f4639136b8a23b2fbbd7c
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Disable raw mdoe for bloom filter map_peek
>
> This commit prevents an information leak by disabling raw mode for
> bpf_map_peek_elem() when used with a bloom filter. It notes that unlike
> queue or stack maps, bloom filters use the value buffer as an input and
> do not fill it.
>
>> bpf: Disable raw mdoe for bloom filter map_peek
>
> [Severity: Low]
> This isn't a bug, but there is a typo (mdoe) in the commit subject line.
>
>> bpf_map_peek_elem() tags its value argument ARG_PTR_TO_MAP_VALUE |
>> MEM_UNINIT, telling the verifier the callee fills the buffer. This holds
>> for queue/stack maps, but not for a bloom filter, which reads the buffer
>> as an input to test set membership and never writes it.
>
> [Severity: High]
> This is a pre-existing issue and was not introduced by this patch, but
> since the commit message mentions that the MEM_UNINIT assumption holds fo=
r
> queue and stack maps, does it hold true if the map's spinlock is contende=
d?
>
> Looking at __queue_map_get() in kernel/bpf/queue_stack_maps.c:
>
> 	if (raw_res_spin_lock_irqsave(&qs->lock, flags))
> 		return -EBUSY;
>
> And similarly in __stack_map_get():
>
> 	if (raw_res_spin_lock_irqsave(&qs->lock, flags))
> 		return -EBUSY;
>

We should probably do memset(value, 0, qs->map.value_size) like the case be=
low
in the branch returning -EBUSY.

> If the lock fails (e.g. due to deadlock detection), these functions retur=
n
> -EBUSY immediately without zero-initializing the output memory. Since the
> verifier assumes the buffer is initialized due to the MEM_UNINIT tag, cou=
ld
> a BPF program read uninitialized kernel stack memory if bpf_map_pop_elem(=
)
> or bpf_map_peek_elem() is called on a queue or stack map and hits this
> contention path?

