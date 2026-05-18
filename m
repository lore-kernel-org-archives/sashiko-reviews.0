Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F123B332604
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 17:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127148; cv=pass; b=Am01n+eKwXqpH8WQRbhhiDa2yk1ftQy3g61XUk4QasvLItDkazjT7CfMGc+UZJPtxdQgkAZuXy4DHbD7Q1Dpb7lrZQRe07NR0jlBmbrYPinU6UHAzH8AK94UpRJ1gDsTatN7XUhch5O6vSau9tx/W6A5gHuqAzyihLJfCx1rRYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127148; c=relaxed/simple;
	bh=BzdhjOleflNcSnMJTzY3NHEBzuU8Vcjeo0X51qRJ+S4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDWQrjo6LRIGi9hHBoMsdMwNjqSbnhKf2VsOneBJf9w5wVGjH7bqTEstdsd681iDXXq9gv88LoDkxlBB2TZSEjSGlVncoY+DTUtSvkNVbQllb2hxmdP6bx14KA7V76IvL2Y98yeujD7aN6EfQ1QkwYhJKlqXUwL/zihbKKPNC/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d4MjnQqR; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d4MjnQqR"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1353c2f35cfso9344132c88.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 10:59:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779127146; cv=none;
        d=google.com; s=arc-20240605;
        b=g+aHLQ1XqAe9yGp5TxzxZxZM+TeF8Xo5StHfk3xHhUnXpov8TZoOCKnDNeOjgWy2mp
         /s6+pDvfj4BhAvPbzHAJrUNOL0Z6fbaGTg+TNn7h4x4tkzeZTHwGFfZ/XBA/qHHRlqGu
         +pic/yStmngHc/HdGdAcSwDJc92pDJyWdpINvOHQfRg58vMZS/9k3WCCJ3tMrZIcDhC2
         V0L2YgVI269po5z6k6ZWBdWUaUOPxUq4dcCstEPjqlHLntWOFecV0i8MMq3JKT9v9s0g
         hVa9LdgFPCMBqvmTGxeqt0t0d+E8xK8dL9zD6oU+DaIkAGR76ohL006AhKwt1y7joP3f
         M2rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vZiU3URHtdplpUkGm6D2sr/NN6zozFwOe97brJy2u1Y=;
        fh=nbv6DM4vi08SyeDJETOdy9iOEDEaHF787MQQjuXjwzA=;
        b=CpPhXa11Gp9keUkAmSJxbfS4dYNf1Jcb8RnmF5c/FPvFTep9b+O9FMTF+v9EaE7anq
         8I2xl7kIez3k2Gg8mZfGyVx6bTOjmd3dezl+cHTOlMGBBNTdQ62WXCVXbyF7Msd8ush7
         CeuSFbJFSlT/Ah5aPyBxnUJTcR0JV0CP9em8zynM2Wo7DSk0A7GJxpYtcg+8mRWlrLbU
         O+A2KV63S3iDMerVwRHJvkcnGD+GxkT7b7BhYLQb2NRAumxtTLGG1SQJAbxm09On7Y+i
         bYail3oiEDfsHPsyrgx+xfw1nwfCm7eRy2bMB9lkIfF0SMFPFU11jbDALh2/YDLUGEDv
         ZCKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779127146; x=1779731946; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZiU3URHtdplpUkGm6D2sr/NN6zozFwOe97brJy2u1Y=;
        b=d4MjnQqRzLZXWZAy6xJoW4du0of5RvAHZGj3mFAMV35P7U4XmFthrnNeYo2z4r1uKS
         linsOJiteaJ4keDL627tZI4vaYHNHrwyqGy1zp0QyKx89AqAV1xZInEwHdp8i6NM4j2u
         CMDSHJaGQHKBxz+my7K3jTMqm1PlQKcSBUDYieH4Gr6H8DS8uE5zz77SXpYNavVTNWcb
         F9AwNvEqdF53vcxPOZ7SqdHjuX5lummvq1hw4mox2d/5XXalDEPTBbtRUf6C3c+UI6Lj
         Ud3sjKlzPQrWvllfI5L3la5j6LoxGzxsIv+sd3HsMp9Is6qAiUEGWZxUORda+1RaUDmr
         5mXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779127146; x=1779731946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vZiU3URHtdplpUkGm6D2sr/NN6zozFwOe97brJy2u1Y=;
        b=FhQE2Idzv4HYbm0DRYjGiZ3/El9uz8Z5OE2Qze6t4+LdyjFYbKwy1l6qFRZpsFO3eE
         oeymvMe0K3cB/VhZuUBujNtwx8IRhG2ybbyY5ugHM7JWDfJzTRJ1/idVb13KgeTnvY4H
         14ITWHnVkcfwJRfDiDRoS6pTBdLOEurTriS90mCA5gW3OjWIOpc8Zd2EBbkWLjMc5yQk
         Afzx3daVcO4lSnfbs1htP2e/79pxVDWS+TCCGE8SBW8Bvh10It3olwWXhmxbF/Z1LGt5
         1gfKtgx8ur+IJG+bNnYUPhTuUNuARWj/5n8hszo88dr1ZGbneg5mHGKjpo4DqFNNtsH8
         makg==
X-Gm-Message-State: AOJu0Yz6RNAfGidp5z8Tpvu2RLiCmdowPGMb6ibr71dY6CWyiL9k/ns3
	082JFUJr2CrPEPqn6ECdD4BMzxsf18SfI0+6/0uuItL+aWVHcFr+ZEqJLxZo2CQIptCouNfjssb
	tuq10BM3kFtoXJDJC7pH2M0jtHrqzcpspjtrU+BHhH+/afdhZAB2hx6iwg60=
X-Gm-Gg: Acq92OF0OPlmIvAXzhYoWhdhJS2m+DwbkUOY7njL3AFx13NoSUdYO0d39sfdyUpB2EE
	iC+1g0kveFtFRFD6egy3MxTM5b5xp8czEQTcP11v7bW2pNHHg5kgAxuvLFIbIwTg6y4s+/H7xDZ
	KH22xq5WYU7caogOOgqnGL1vs1JdaFABMgtkS1H+8y+rx08eKEfq0ou/8QaD8K7Y483cU9c8nAP
	WfGp3BqHG5SQUMDsMb7sehZi5ZKp6t5RxwOzJD9bg0zf/WDOMc9TVvWqFKb3oJb/v0/kKX8ZQWg
	hcDSwWiv+CA1LKzvnohp2qPjjmxiPV3+YvwVJLA2TXyNp75DGJknKwLxdrM=
X-Received: by 2002:a05:7022:699b:b0:132:d182:3dd6 with SMTP id
 a92af1059eb24-13504515a28mr7763476c88.16.1779127145579; Mon, 18 May 2026
 10:59:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260517114026.6817-1-vasant.hegde@amd.com> <20260517121248.0E501C2BCB0@smtp.kernel.org>
In-Reply-To: <20260517121248.0E501C2BCB0@smtp.kernel.org>
From: Chun-Tse Shao <ctshao@google.com>
Date: Mon, 18 May 2026 10:58:54 -0700
X-Gm-Features: AVHnY4J0e7nff7V4CwWJo5iWI6qRb5Hh7pWeyl_OeHVpiPpiXw5-pUQ08QZ7RqI
Message-ID: <CAJpZYjUSvQ+iFdo+21-2B5gTs-T8GJ8yxOXk53bLgAuoGNmniA@mail.gmail.com>
Subject: Re: [PATCH] x86/events/amd/iommu: Fix cpumask of IOMMU events
To: sashiko-reviews@lists.linux.dev
Cc: Vasant Hegde <vasant.hegde@amd.com>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Chun-Tse Shao <ctshao@google.com>

Thanks,
CT


On Sun, May 17, 2026 at 5:12=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] PMU initialization fails for IOMMUs located on NUMA nodes withou=
t online CPUs.
> --
>
> commit ef1363d0a37870d7cf1f1095cd3ebf42cc5a8bdc
> Author: Vasant Hegde <vasant.hegde@amd.com>
>
> x86/events/amd/iommu: Fix cpumask of IOMMU events
>
> This commit changes the IOMMU PMU cpumask from a single global mask to a
> per-IOMMU mask based on the NUMA node of the IOMMU, allowing per-socket
> performance counter collection.
>
> > diff --git a/arch/x86/events/amd/iommu.c b/arch/x86/events/amd/iommu.c
> > --- a/arch/x86/events/amd/iommu.c
> > +++ b/arch/x86/events/amd/iommu.c
> [ ... ]
> > @@ -440,6 +445,20 @@ static __init int init_one_iommu(unsigned int idx)
> >               return -EINVAL;
> >       }
> >
> > +     dev =3D amd_iommu_idx_to_dev(idx);
> > +     node =3D dev ? dev_to_node(dev) : NUMA_NO_NODE;
> > +     if (node !=3D NUMA_NO_NODE)
> > +             cpu =3D cpumask_any_and(cpumask_of_node(node), cpu_online=
_mask);
>
> If the IOMMU resides on a CPU-less NUMA node (like a PCIe expansion switc=
h
> or a memory-only CXL node), or if all CPUs on that node are currently
> offline, will cpumask_any_and() return a value greater than or equal to
> nr_cpu_ids?
>
> > +     else
> > +             cpu =3D cpumask_any(cpu_online_mask);
> > +
> > +     if (cpu >=3D nr_cpu_ids) {
> > +             pr_warn("Failed to find online CPU for IOMMU %d.\n", idx)=
;
> > +             kfree(perf_iommu);
> > +             return -ENODEV;
> > +     }
>
> Could this cause PMU initialization to fail for IOMMUs on CPU-less nodes?
>
> Since AMD IOMMU performance counters are accessed via MMIO space, they ca=
n
> be driven by any CPU in the system. Would it be better to fall back to
> cpumask_any(cpu_online_mask) instead of returning -ENODEV when a local CP=
U
> is not available?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517114026.68=
17-1-vasant.hegde@amd.com?part=3D1
>
