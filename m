Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793654896;
	b=plSm/HkIpXy1Ei4FAS06//j3sUcSbLTONQvJTUyS8BborcXTfy0YH71bY9H9Iw0zbrlb
	 UFDzK/fJY6wKTdF9F++wT7415sLgyUHUMfemdVDH4PdxUHmn75yrMBifwtBwXje8wT0yi
	 gApkBBiztMqMjZ8KvxLANZKK6ZUIk7j6L3+H/2TNrAtkM34WMR5MEdeA0bvuBRJvGr9F3
	 69551QqgX6T2TgftPxnxqX0EAqG/PFadRpeGd2Gu8rQE0qwLmpzwQOyGdpK1dE2Dore5Y
	 xzXRKcTRAsNGFHhRLnJXKJwdVogHj33BKCG8IcQ8Fli9t/BStXhgyztyZwtVZXG23tA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=05WhMxae0rz15h1TGq0mYQ3vTYNApMzOi4Y++NBdM+w=;
	b=0IQmzNCe4FtgYRMAT456kQRmAu5lRZLJeIKiusb7tWJ8SkXdEEQ3Jmfv13Eq56L/ZY+W
	 Rd0y5UhhZ6+EkZkJVO1m9COg0iK6blTLNQd9OKAV8jcBdeXbIyBT+k8g2UDQRtHgGhH00
	 IkpjKOhqKzQ4fJhbepJX157qoJdPR1XRAw0Z7OxVYmNr7S0/b6tDn4zEXXSVAdWrUPUOQ
	 HGttwhClDOTksohTq2JNSOGf4JBIR0v9vwfoLkKc3sQlBpIrKTrgvz4YpdSUJDOqtdmGi
	 +FD+sbYu6X/LxWhDh7RGVSGl0AxDhv8Vb4xRK+QOxj8pagJp1xe5+ZtXzARkqD2vIhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=x6u.co;
	spf=pass smtp.mailfrom=x6u.co;
	dkim=pass header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=xMC1QKI5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FAE606A326
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 21:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38FAE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=xMC1QKI5
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a18fc7a38so6409974eec.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 13:28:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793654895; cv=none;
        d=google.com; s=arc-20260327;
        b=qmP6lKYSuLpe4pP+SfMm2IF/pQ5V4+D6Wh6bL3TIno1Hz0HX45HCr672Il0O0dw1LD
         CYJ1iFahf2RtQ9zO218TcHPGIOnGKWTE9rOzl8Asix4/wxww8E8Hr65WqSKLonm4tp7I
         yo1VwPjRJFxna1rm46r8O/jgBuahIFR/5dn1+h3f6NE5rvO5SR5Ijgx0P38J3khmodJ+
         vN3b+8u+vt1snRmxZN1djaDBhJZKcEgC3KXBDhc0wED47AkCEU73r1DZfQer+KX0dOwG
         mPDbh2fc7tLSGQCSUxCou2EFxWnecKFxLe7ZLZnG9eftfHa7QEnAGwuIxKi5ykVsgth7
         53Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=05WhMxae0rz15h1TGq0mYQ3vTYNApMzOi4Y++NBdM+w=;
        fh=/qU+yrYvr4MDoF1NVWDDCongjaKy85ReHk7GnUSfThw=;
        b=OniEZpsTEI/Dopqr66Jz9Rh5Jl7u3bqIFx9Ms0kZzrNFyt1k1UCBsh5oGCE4ymQLm2
         87T4aoR3DzkjclkUyXorQAS0+bKf/hPX+Sq+/ucPBbjZv2oOeCSYtOVE0TRAakJSm/Ez
         +KBBY50yPOTyrVvniGE1WQvNqnew70Anar4RdEI/lRNFFy1US1K/4RJfvJsOb1VImjYI
         csrdLRYoJMO1QVLhZRaDkDgRFW9Gw9TR2JmGzNazDiquS0sdtDO7o7yUUEWI8Mksd34m
         cKk9dxAqaJtsS2jQqJ8Fvu4v9hRtbuXxxsNb8dNXzyHRxuyqsSuYWYzSFF0jAiulc+Hy
         J6tQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1793654895; x=1794259695; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=05WhMxae0rz15h1TGq0mYQ3vTYNApMzOi4Y++NBdM+w=;
        b=xMC1QKI5KZ58jzYrjpdbrZJaS0GQm7egVCGNhP0WBZF8asORwYZnX5zuS6Qo02sSId
         FuV7dOSkG4McnoSdnmsebNXtRvVJvm9WtE5QewUFtVlrelurTjstBHEbuA+0Ae/9ubmv
         xcv+XzTs4TsIUUWdg6bKZnXCzS7Ix0Tqna+XxyocInb1dkbxhAS1SxcE9uxX6XYggG9/
         eC1ZvlfZpnU+npwnZEKsE7mYKeaWxiipmbPRxvIFr/wXeO/sN6QLLkZ7c1r7+xPkYRjx
         rWqa7Nzwd5GJ6zTZBAm9RzDWsfE+6RYXBYI9WMkSRhvfne9MwYJuzOoxDrdM1MqyedF5
         lkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654895; x=1794259695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05WhMxae0rz15h1TGq0mYQ3vTYNApMzOi4Y++NBdM+w=;
        b=24EvQC+Vi4+YGGjbmaQ6vLa+pWGqxBk6ypJFp3/rRkx6XXKUCqL53+bIrtAn8NAAJI
         0wNgElVtBFkIc73Lb6o0ZlyNi2eNTkfJff6Zzag0P6PhReuu4+IP18AUHS1FVThEsyRs
         7GCp8xW5eOUPGWhK5X09tiD5QOizqzBw9jLSleveh4sZeurCmwNQSugbt7ceMyIwV/39
         4T5YnBl/keJVFG3EzLLQjh57ET6OWseGOlGYfQMI2x2XwaT66rBfIXC5my2xKr/raA1p
         J5TeRR9FQM3gTvE+S8I7BpzsF+0O59apyDr8RiHPukzHEKzvTkJ0zURxzPs1DDAiir2p
         2H/A==
X-Gm-Message-State: APuU4Z8tu2yJt8v8GU0gIhtfU/ZLYJkTvkLsr6qtUOKFMRejgOdDpthA
	xyuFkCxyuhoNZyu0ad8357UF0qq/EiPrdWwZQKOPRlwws+syn2lF0vWs2CmFI2kplO+NvztDdpq
	gLAFIgHKb56NopT3n8iq81vjzBYcQzA4Tonjr0bkmirgcD82ZcucK5A==
X-Gm-Gg: AYBFou1gk4mHqGzp31f/mGWO76cdZc5i5Jk782zDzzo+xlDrDap3rGduye5rnxlrfmd
	pOkphAcbViR89rc04AgZnUPAKvZkRwiD6H/hnNtG3LVpNPNrlzrA4mTdkDCV6xaN0IStlMzctCJ
	TEyLrGq2lcL2kuCR6HusgKSO6KKsJQ50A7OT1003ySfMpLzlUuk8lyKcWZ1NxJ0Su699+p5iqZc
	5AoPE75zo0WCRHr2GXgi/WH5Mg33kt6Q7/G9ewaA0Cil/NAnLaaKdHsr4RlPeoiw6e0omHjlNwV
	5H3X7qBB3HyAvn0XB9VjFVREXL5g/Q0M+k63GolFcUvYmTPSqYCfsjNGKVw4216S3izo4Nc49os
	mFhAFfxe1QCQoOCmj/Z2Tv4LB+EvZCdsT4QgZSrJNgaJgzVIFOGc9cApyOikfTMZrXp8ijJ6Gjt
	QMjqBUbBLiDiZCPR16nfwDcXDFB5mKmn1pYJ4qzxUZ/Vlj
X-Received: by 2002:a05:7300:a9f:b0:369:fb01:2eb7 with SMTP id
 5a478bee46e88-36a4235f45emr16292049eec.13.1793654895131; Mon, 02 Nov 2026
 13:28:15 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261030181512.2056056-1-dhu@x6u.co> <20261030181512.2056056-6-dhu@x6u.co>
 <sashiko-outbox-191412@kernel.org>
In-Reply-To: <sashiko-outbox-191412@kernel.org>
From: David Hu <dhu@x6u.co>
Date: Mon, 2 Nov 2026 16:28:04 -0500
X-Gm-Features: AclHuK_7wNCsAnLumnQoSsGTieVm4sqRwJoszEVTk588c59ZDICEF5LaB7IXra8
Message-ID: <CABdL-LQPkSO74Fn+Cv1XxCmESq+7cNFG1-Km6FwqKYh_hQ+3AQ@mail.gmail.com>
Subject: Re: [PATCH rdma-next v4 5/6] RDMA/irdma: Support UMEM attribute for
 CQ creation
To: sashiko-reviews@lists.linux.dev
Cc: intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 2:33=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] RDMA/irdma: wrong DMA direction in irdma_setup_umode_cq() via =
ib_umem_get_cq_buf()
> --
>
> commit 8981c5869a8245f4b87a31412a16b517815f3a39
> Author: David Hu <xuehaohu@google.com>
>
> RDMA/irdma: Support UMEM attribute for CQ creation
>
> This commit adds support for one-step user-mode CQ buffer creation using
> UVERBS_ATTR_CREATE_CQ_BUF_UMEM and IRDMA_IB_ATTR_CREATE_CQ_SHADOW_BUF_UME=
M,
> sets up hardware PBLEs directly from the pinned UMEMs, and adds UMEM and =
PBLE
> cleanup in irdma_cq_free_rsrc() and irdma_resize_cq().
>
> > diff --git a/drivers/infiniband/hw/irdma/verbs.c b/drivers/infiniband/h=
w/irdma/verbs.c
> > index 9f4905fdb791a..41e56ab8aa6df 100644
> > --- a/drivers/infiniband/hw/irdma/verbs.c
> > +++ b/drivers/infiniband/hw/irdma/verbs.c
>
> [ ... ]
>
> > @@ -2767,26 +2793,87 @@ static int irdma_setup_umode_cq(struct irdma_de=
vice *iwdev,
> >       if (err_code)
> >               return err_code;
> >
> > -     spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags);
> > -     iwcq->iwpbl =3D irdma_get_pbl((unsigned long)req.user_cq_buf,
> > -                                 &ucontext->cq_reg_mem_list);
> > -     spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, flags);
> > -     if (!iwcq->iwpbl)
> > -             return -EPROTO;
> > +     cqe_64byte_ena =3D dev->hw_attrs.uk_attrs.feature_flags & IRDMA_F=
EATURE_64_BYTE_CQE ?
> > +                      true : false;
> > +     cqe_size =3D cqe_64byte_ena ? 64 : 32;
> > +
> > +     if (uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_CQ_BUF_UMEM)) =
{
> > +             struct ib_umem *umem;
> > +             struct irdma_mem_reg_req cq_req =3D {};
> > +             u8 shadow_pgcnt =3D (rf->sc_dev.hw_attrs.uk_attrs.feature=
_flags &
> > +                                IRDMA_FEATURE_CQ_RESIZE) ? 0 : IRDMA_S=
HADOW_PGCNT;
> > +             u32 min_size;
> > +
> > +             cq_req.cq_pages =3D DIV_ROUND_UP(ukinfo->cq_size * cqe_si=
ze,
> > +                                            IRDMA_HW_PAGE_SIZE);
> > +             min_size =3D (cq_req.cq_pages + shadow_pgcnt) << IRDMA_HW=
_PAGE_SHIFT;
> > +
> > +             umem =3D ib_umem_get_cq_buf(&iwdev->ibdev, attrs, min_siz=
e,
> > +                                       IB_ACCESS_LOCAL_WRITE);
>
> [Severity: Medium]
> When IRDMA_FEATURE_CQ_RESIZE is not set in
> rf->sc_dev.hw_attrs.uk_attrs.feature_flags, the UMEM passed via
> UVERBS_ATTR_CREATE_CQ_BUF_UMEM backs both the CQ ring and the trailing sh=
adow
> area page (shadow_pgcnt is IRDMA_SHADOW_PGCNT, and irdma_setup_umode_cq()
> later sets info->shadow_area_pa =3D cqmr->shadow from that same UMEM).
>
> However, ib_umem_get_cq_buf() in drivers/infiniband/core/umem.c hardcodes
> DMA_FROM_DEVICE instead of deriving DMA_BIDIRECTIONAL from
> IB_ACCESS_LOCAL_WRITE:
>
> drivers/infiniband/core/umem.c:ib_umem_get_cq_buf() {
>         return ib_umem_get_from_attrs(device, attrs,
>                                       UVERBS_ATTR_CREATE_CQ_BUF_UMEM,
>                                       uverbs_create_cq_get_buffer_desc,
>                                       size, access, DMA_FROM_DEVICE);
> }
>
> Since the CPU writes the CQ head index to the shadow area and hardware re=
ads
> shadow_area_pa via DMA, mapping this UMEM with DMA_FROM_DEVICE omits IOMM=
U
> read permissions (and skips CPU-to-device bounce buffer syncs).
>
> Should irdma_setup_umode_cq() use ib_umem_get_attr() with
> UVERBS_ATTR_CREATE_CQ_BUF_UMEM when IRDMA_FEATURE_CQ_RESIZE is not set (o=
r
> unconditionally, as noted in the commit message) so the buffer is mapped =
with
> DMA_BIDIRECTIONAL?

This finding is not practical.

The AI finding alludes to a very narrow scenario on older HW (Gen 1,
iWarp) without CQ resize. With iommu on, `DMA_FROM_DEVICE` leads to
lack of IOMMU_READ for NIC iommu group, and leads to iommu faults,
while NIC tries to fetch CQ consumer index from shadow area in dram.
This will only happen for VA, since dma-buf in iWarp is rejected.

However, `UVERBS_ATTR_CREATE_CQ_BUF_UMEM` will never land in kernel in
case of VA, since `fill_attr_in_buf_umem` (in ucreate_cq) skips VA.

Further, switching to `ib_umem_get_attr()` would also mean mapping
DMA_BIDIRECTIONAL for cq buf for Gen2, and Gen3 (when cq resize is
possible), defeating the standards established in ib core.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030181512.20=
56056-1-dhu@x6u.co?part=3D5
