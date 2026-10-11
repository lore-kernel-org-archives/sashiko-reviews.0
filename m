Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18C23090D7
	for <sashiko-reviews@lists.linux.dev>; Sun, 11 Oct 2026 02:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791687245; cv=pass; b=V968+FMmmHPjeGsZ+D9GS1yRMyABstgMAj45jreEmzsELK/4vlwGZln43VY19svGttDUpFIfGJ6SHJbaUnp8L/EZNGXSVWM6yi5dvOW34Ituz0C5Iy+CBEyVhJEDZrwdbtlY2lpzTVUV4Q3kyyjFGDLUbA/wn4rEmk8N5DXfPzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791687245; c=relaxed/simple;
	bh=TtyBwfmEH3Qw9cTr/b5h+StO88FfqoSbIz9e8paJbwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cmM1AjJQXzQWJICMotmjKgzVDxiGQG1o87gOVNZkU4vWbac7X5tL29QXi9acT9iUQdqIwCw0hEB7ZKg+NipS7ZQUDmpYpyAJAUlSdTmmrj4dEDuqknEtVTbnvg7kJCDDmQacz/85m+GFkx3Ryev6c7pvNcifiLEZzp+djBPU1N8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r4ObPHql; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r4ObPHql"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2e2007dd8bso156970266b.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 19:54:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791687241; cv=none;
        d=google.com; s=arc-20260327;
        b=G4mDHZ5jyTGOAGPbNo2STc/LPSACoFS5TkN0YOxHlt0VdsvXM3lGRYxUyU4e1T4TkY
         6TG4KE055DtCm+XRGL+Bj5quA1tDn54lk8XjiiZ5qJSqN9BROqY6gfndzzoJakOGaDUB
         dzM2IL4JvpBHWCuhtK+kWUxL6JQB+D5KSJyAkUG3NPsQYbSHSxh20MrLZV0lOKrxEwG5
         6/V1XWr7HKrmLimviP2vPTWE5r2Oo2Aacz0QTKfr6ZZ/Bmop1Sl/oXyBKEBKUPZHzB6d
         V6hhBUmsr1yC8qhoaHz9fJti8v1uy42hqu7TEifjAEP1wXMAn/koA37ALN015TjszI1R
         2pvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fyP6CG/MmWFtaGWCfyVtclKnfvDKONsgkJWdCRKUOco=;
        fh=52/KnKaF1gUb0xYMna5CWBSsRTnFE7n1eU1vfpuoOIQ=;
        b=PLPuHDwvKPcqcuQQHOaHLqqxAdJx3Ziu9AF3FQXAi65qlBS85bwmFpS2zo6J+u0qcq
         GZN5CRbMIYQmrUtbEpLxIDn3WkPEG8g33HKkCOxA03wuDSVeNR6SOeI2Vz0it33FZ0HH
         LdYqnRDuOXzNtCk7oGpFgK/erQeMWydJzWjWQh1Ts+lDst0/OC/evbRRBMnIt0qZfKlr
         WGJCadQYWtMwuIjkccdK5Yh0lO/mGZbjBmCYGHKcug3YIsT0bZ6e7yuzJBVE38B/WYOU
         /A/ODxTczG6TX3MV64dpOMHF/OdxjuLD/ghb+sC80MYK5eBjGOnALsVBmu+QCt2ELe5o
         11+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791687241; x=1792292041; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fyP6CG/MmWFtaGWCfyVtclKnfvDKONsgkJWdCRKUOco=;
        b=r4ObPHqlSCnq6cphA7I5/XkCyQUS46pJqtVHaVzUivkITiNHENBAIDzlzEho4hwS9/
         xXYKWZR7pykn4lIktXin3ch8zfoof8Wx0E/eZc/DnmSse0pC0o0wTRca9v6J34Ch4vCc
         ohEycNCP1GSKu/uRy1e7r/YLq1qgGdWEsIEJFxzw0I77YKkgqaOc2NTAlk4kzk49o1Yl
         jrglJDP8IElq6coZsV9m3Nco7LDlJ7X2YfHNbRDt55Ehai/d0CT0joVOOBT2gMgGLhxl
         fJFF9eeumNb56eMjkDmcRuoa7mdsQ5Jy+XKOYREetI5q7h7lHrhbYCvxB81KzO7v0VIr
         3n7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791687241; x=1792292041;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fyP6CG/MmWFtaGWCfyVtclKnfvDKONsgkJWdCRKUOco=;
        b=ydMMe3no4x/UBgkBMZ5UQnBJ7fLibZsYNw4zVHLFRBiNBJobDQ2WScyymCwl5uujK0
         gupfCI5lEGPvvqocnsNtw8M07d02xo2hcmMP3Ugos27803JnJj8AOAn5buyAP2UpUGW0
         N3FsZdS0tDtI3Xtp5YAL33yoPirpf4R4NdzEEWz6VyeLyYE7aQyiCAMjC9JJmlZQew79
         2/VXHrIpFgywKiekAeI+JAS/e2PJ8D2qHrK+OL29CAezM3UuMvfnRvulp1TaW02auDMl
         L+7rfcvPy3Sz6bSAaWGaMP+pWs1+8LRg7ZG7mrZ72rFKaqQ6HoIpZPfKEXTr2kchy8//
         ptww==
X-Gm-Message-State: AFq9FYKKqY4PfhDG+hTET18VShoZdW+5SLNXRoGy3piaTmDW/eoDshXy
	ICn1SZhG5eEseY11f09XjQ58Xz3Mq2c+Z/ErvXecpZ/aOpENillghdcMk20YgxvcTimN8H+Hl/j
	jzUt1aET4pzX0Fos4e3NarjxOnMEBjgEbkjFT1OA=
X-Gm-Gg: AYBFou0meCUg2UAnjak9szgam7ztv2IWUqJeC615jsBMoRrlmIUk+Va9hZx3aCpwfn9
	8jJPEnf8pLqKppcGklknspnlhPd6vkyWK8x0iSV5VdDrMzZDsAuLTlTrymArJAf5ro+bBO3+aL8
	6Ld1w+m/DTMCo3EmW7kXcp2GcMBdT+Y/ZJch9Pg3OYH+QZ/fXR04F6mJ6SxivPcHjhkC3ng4SmY
	Z9K51ov9tDTz00bHXTcSmAqvHqieSHngesHa0b7pchXGZI571VicQpsVVD07gFFTb8vmSb3/xgn
	4QraIhnoxRAy6+xsuVYdrl4RmrbX2JX3m9mhpOQG70CmTcOBBb1Iki/lfn2bn2Ku2qG71hKv8Fm
	hbiEUfZJDlRBV+xcCgqLuj6VwmCuOcoZLbQk/A0sE1WOKvg4cwOz7rhZdIJr8tNED/6RuBVaspK
	/J+eO7P5ivmszChMiyN9C1OOTHxbZA8y6NY4gHPdn4PjGGXFBt5ARpG9fawn0IdgtxC+ENjBhk0
	rKe3Lsjf/L+xIAcTfL27zNLuUt8hZ5PtcKDRsxk7aDkC8+K0j3YfhvS0/ifvdcYHWCUqqjwqqGn
	5mm2J8O2
X-Received: by 2002:a17:907:2d12:b0:c2c:d06f:cf89 with SMTP id
 a640c23a62f3a-c31a9a10df4mr535728966b.2.1791687240866; Sat, 10 Oct 2026
 19:54:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007040009.137568-1-atharva.a.vartak@gmail.com> <sashiko-outbox-162620@kernel.org>
In-Reply-To: <sashiko-outbox-162620@kernel.org>
From: Atharva Vartak <atharva.a.vartak@gmail.com>
Date: Sat, 10 Oct 2026 22:53:49 -0400
X-Gm-Features: AclHuK_VRhFl2QnU4-PLdqLkG3n2BnlNN5bAfz2ea1QbUuSDNKyKsM4qI9CZFqE
Message-ID: <CAMaGtJZa8FvAYP9aq3JZsL6u6xN1MpaM_mj0yAmhp+RDAfg76g@mail.gmail.com>
Subject: Re: [PATCH v2] net/smc: hold a reference on net_device returned by pnet_find_base_ndev()
To: sashiko-reviews@lists.linux.dev
Cc: Alexander Gordeev <agordeev@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, linux-rdma@vger.kernel.org, 
	linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The bug was found through manual code auditing.
It was confirmed with a proof-of-concept that triggers a KASAN
slab-use-after-free report.

Regards,
Atharva

On Wed, 7 Oct 2026 at 00:07, <sashiko-bot@kernel.org> wrote:
>
> > pnet_find_base_ndev() resolves the base net_device for stacked devices
> > under RTNL, then drops the lock and returns the raw pointer without
> > taking a reference.  All three callers dereference the pointer after
> > RTNL has been released, creating a use-after-free window if the device
> > is concurrently unregistered.
> >
> > Take a reference with netdev_hold() before dropping RTNL and add the
> > matching netdev_put() in every return path of the three callers:
> >
> >   - smc_pnet_add_eth()
> >   - smc_pnet_find_roce_by_pnetid()
> >   - smc_pnet_find_ism_by_pnetid()
> >
> > Fixes: 0afff91c6f5e ("net/smc: add pnetid support")
> > Fixes: 1619f770589a ("net/smc: add pnetid support for SMC-D and ISM")
> > Cc: "D. Wythe" <alibuda@linux.alibaba.com>
> > Cc: Dust Li <dust.li@linux.alibaba.com>
> > Cc: Sidraya Jayagond <sidraya@linux.ibm.com>
> > Cc: Mahanta Jambigi <mjambigi@linux.ibm.com>
> > Cc: Tony Lu <tonylu@linux.alibaba.com>
> > Cc: Wen Gu <guwen@linux.alibaba.com>
> > Cc: Willy Tarreau <w@1wt.eu>
> > Cc: linux-rdma@vger.kernel.org
> > Cc: linux-s390@vger.kernel.org
> > Cc: netdev@vger.kernel.org
> > Signed-off-by: Atharva Vartak <atharva.a.vartak@gmail.com>
>
> Sashiko has reviewed this patch and found no issues. It looks great!
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007040009.13=
7568-1-atharva.a.vartak@gmail.com?part=3D1
>
