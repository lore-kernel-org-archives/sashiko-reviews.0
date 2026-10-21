Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792616795;
	b=aMDrwkkU8vdvNI2MjJ+0CgoTxt87ozvmqIppfalSTycump9IxZZTCrXQmsmp0nGH2Qyg
	 jOTuwQ6IanbLte669zeYuZT/Sv1iSUyq+oTPW/tfo1aMvO1ozpKoHNNIUaqazGyv39QnB
	 68mRjnr73H8U/WOfuXzbsebo8lE2MTZziEjyhdq48ILh149bTojBFXtoN1VDmGAiOpTmQ
	 xX7UB78Afs1WNJivSSqioZTh0iXAT4sxnPqWc+T3YLFMi+rCjmzLds0auFJK753Lchw/j
	 pp87osH+dNI+7wOk/b3XPV/m51TU+jgwqhdYYZMU5mg6dKJKkH+MgoEX5Kue9dliBWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=kWYWdLeh8a0ul/gh6sx4fqQNXniHPCZwe4oYqk6UNQk=;
	b=NI6dEKtgXfnM2jXPv8wUZUbaYQDsDb1a3K5ANUJttnVss+eBupzYyaFo/njxG+qZkPPP
	 cPpsZl4g99afJ+GYp4OU3ZFB+xE9IuPxLriml69KnoJAN9PISsAIWhCn5vGAEtUKDeKAN
	 n/dL3tMCS+DXcJCsTqznDCF79rotPQHHM7I2cV8Q0cRKmZZZQ1MMZxFbQuVsE7YiObF9O
	 d/GPtDOwbdHF4LN7it8Yjzu+N1+6qiB/QMUYByOuH1gQeRuyX8vuNTYKBtZ4lew5Y4x0J
	 NZ1Eu+FqHVbaeNYgmTdeScyZIHVfpZCUVJb/JR/VkQ7s4vWrk5y3cPE52/sPrqYbIZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=x6u.co;
	spf=pass smtp.mailfrom=x6u.co;
	dkim=pass header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b="H9Kz3/te";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C52606A31B
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 21:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59C52606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=H9Kz3/te
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-353804b591eso2205556eec.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 14:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792616793; cv=none;
        d=google.com; s=arc-20260327;
        b=dSAg9t/m19LsHcqQVHf/rx6HoULIkbaj34Gu7jasgO9+0taVAv8WKwaYsrHA5QKj8t
         wJMXo1/h4bSEvyr61dDV0hNeck4Yhj05o9AKfdwwJSsXOCUK9djqIn7NT36HkkGtrhlx
         gfw4RRU5K6vWI7sJGYcXw7Z/ax2FZUH1Q6TR0XapgXODYeAWbtyGH0kTri1wgn5nP3EB
         lOM/jO59TjIXhLWRVbXbNRVg7K0CGvStf3yUWx0d8IGA32eQfGn3iAFZ3iP2ccn1KOf4
         yYIq6vyPhOVlW7jh1WNq3Jdc9qTlJ+xY4So69mw/ZViiTaG8qZHB1Uzk7yh9BsxCPLnn
         DikQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kWYWdLeh8a0ul/gh6sx4fqQNXniHPCZwe4oYqk6UNQk=;
        fh=Je+XfjZZELYMeUFG782y9M4oZFPTVtwBgMoamcbwTg0=;
        b=Ug/M3dNOU3u5qHoktLp1X6MAbrr9mxemysEzms4S9il9N70HB/jdalBNHOH/xb1Nap
         IRto8h9BsexgnU2O9Svqz4VolHdc2tsktLOY4MeKNjuJus+PJ/ureiDyuRZ0nW/5k8Xq
         ABmNQ5LigpyalGGO7g58oxWR+ayemqs9kRJcEabNSAoEVw+U1MzTyZ2R0UfN+DK2LH5R
         7Gy+g9DFagSo4NypjnsecmKx0/WUqC4zC5jfbV8Hhn0iTrxPuFAgISNJJOw7OPhAlnUN
         kRjozANjQGMV3rlCr9nn4DKkR+emQbBtqn6TvchazTRu8k+aaK3vsW60N7+GnlQpyh/A
         Zo5w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1792616793; x=1793221593; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kWYWdLeh8a0ul/gh6sx4fqQNXniHPCZwe4oYqk6UNQk=;
        b=H9Kz3/tenQ6wDysrhJFtzIFjm/Ifn3UsnsKm7FlhIhi3Q2PZxIPbtPPzI0ppsRaD/n
         M4e6+N5U7/gxfIuoWQufE+u0DuDiCvhisc/Z6E5waHqLErM1TfALF0gd3Rg0m1RhIbxi
         na6hHuRs0fhMMlyoNAIRorubqfxrLXSJMbgGsqFjv//dY0SNtl7sgCKYe2zkuQ4JBH4N
         MWxycqz7mdIoFK4JXEAd0OeOfsYelS7yiPEzfCWMrhsrabirSt6n9HDC/T+I4U2tElO3
         R31xyiMQIRPjBTLfTjkAjrpOEzFvCnEgOTIdvilw76N0iq0cDO3lGxhRWbXCyTweVNfr
         iB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616793; x=1793221593;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWYWdLeh8a0ul/gh6sx4fqQNXniHPCZwe4oYqk6UNQk=;
        b=1zd+MBXLJBh2kW7JT1s1gvHmFY7uqB5f7d+yvCp/XF9Wus7llEjy+AGlGNej3I/48p
         qyff2F7r/mbrZWoGpaFLpSthMT6+k0C0Uvo8LRtMSXDpCmaGViLrAYmAxXp3GZok8Zvq
         5oTec2YGUa/Y5JPtVFHw5GT5dXNzgJckjQBywflKidIRstAf5VMQa78x5iqsMgdZs9CU
         uNqB3LsttpOb9mm0WLXwv4fFzjzpengfAfNpPRzxhQZWSOijyT8gPTecUv6UcNkuALnY
         4RGDDn3uSTN6aIJK3ggPynqprJp4jtTIYiVCnfb1TqwBGotOTvjxiS6903QyTSu5SZfn
         10Ow==
X-Gm-Message-State: AFq9FYL1uadR4tkkI4ICVA4PdzyM3uGTqnQSzkTo31HLwL+uTlngBjuR
	vZJlr5+2IRWO6Oqk8/m0aLkU6q/wLnDRcRpQq4ktkKJtt0mHNKZ3f7lhCkpjE8US/v+25GMWlx0
	N04Eu25wbqMtnA0dqmuF/vAV8nGcWHElQmfk7gUhlq2jOI3VBuUsIbWAH
X-Gm-Gg: AYBFou1zoBT0OQx/0cv8S1ymztCwQzT9TckLXYDIIVdwTYxa4fr31QzY1C1qb6dSamK
	KVBrLejP9Yfr5YOiaiXkagx87oZBi9swZK4DU774fJeQnKSG4ORB9fTRZDaCoPGgxv/tOfQ4Vqn
	eTMBkxwzqvLquFe3T+LICXXaZEynbC6tqBCYwDO4bZyd5XrZlGLDZx5x1ltibfsQN37X2jhc/fc
	Nb3KgxV0+nLvXKLvuChQXeuBrFWrOdLooxOpXReDgw1nXoQFUc0Tpoj4PXKihPVzeJrCStuBXji
	5lD3Wnz2MwNOu7zxFhG2FWtbD8z+H2XvRH/oNoGaxT08cxAL63Nm2/bVrkvvB6EeehA+RkGB2Vm
	ixyYo33YhM7Zc5gSLqgNelr7yBmygOdsVb/l6jqaeGNb/YLl5MnaYEQRvhMhv5uMN915xPI49Xa
	dOR9qmeSQeLp2lqH7MnPsQxg==
X-Received: by 2002:a05:7301:4615:b0:351:595:750b with SMTP id
 5a478bee46e88-3674e050444mr4469109eec.36.1792616793196; Wed, 21 Oct 2026
 14:06:33 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016202909.1289496-1-dhu@x6u.co> <20261016202909.1289496-6-dhu@x6u.co>
 <sashiko-outbox-174933@kernel.org>
In-Reply-To: <sashiko-outbox-174933@kernel.org>
From: David Hu <dhu@x6u.co>
Date: Wed, 21 Oct 2026 17:06:22 -0400
X-Gm-Features: AclHuK-lcx90TPDfg-Lq0J2OEZDmBrzuG5Q6fWUZQ163-gBYp3YHDnk87q0sPjQ
Message-ID: <CABdL-LQUmwnxs43kZfZX1Py-WS8EzEA3JFfgpSCGW6szT9Pe2w@mail.gmail.com>
Subject: Re: [PATCH rdma-next v3 5/6] RDMA/irdma: Support UMEM attribute for
 CQ creation
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 4:56=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Critical] RDMA/irdma: integer overflow in irdma_setup_umode_cq() CQ pa=
ge calculation
> - [High] RDMA/irdma: unaligned CQ and shadow UMEMs bypass 4K page offset =
check
> --
>
> commit 79df0143a3db151761db4b97121b37dcf76bacb9
> Author: David Hu <xuehaohu@google.com>
>
> RDMA/irdma: Support UMEM attribute for CQ creation
>
> This commit adds support for one-step CQ creation using
> UVERBS_ATTR_CREATE_CQ_BUF_UMEM and IRDMA_IB_ATTR_CREATE_CQ_SHADOW_BUF_UME=
M
> to pin user buffers and set up hardware PBL entries directly from UMEM. I=
t
> also updates irdma_cq_free_rsrc() and irdma_resize_cq() to release UMEM a=
nd
> PBLE resources when the user ring reference count reaches zero.
>
> > diff --git a/drivers/infiniband/hw/irdma/verbs.c b/drivers/infiniband/h=
w/irdma/verbs.c
> > index 4b7e9c2d9cff5..02ed7ab99e48d 100644
> > --- a/drivers/infiniband/hw/irdma/verbs.c
> > +++ b/drivers/infiniband/hw/irdma/verbs.c
>
> [ ... ]
>
> > @@ -2746,14 +2768,18 @@ static int irdma_setup_umode_cq(struct irdma_de=
vice *iwdev,
> >                               struct irdma_cq_init_info *info,
> >                               struct uverbs_attr_bundle *attrs)
> >  {
> > +     struct irdma_cq_uk_init_info *ukinfo =3D &info->cq_uk_init_info;
> >       struct ib_udata *udata =3D &attrs->driver_udata;
> >       struct irdma_create_cq_req req =3D {};
> >       struct irdma_pci_f *rf =3D iwdev->rf;
> > +     struct irdma_sc_dev *dev =3D &rf->sc_dev;
> >       struct irdma_ucontext *ucontext;
> >       struct irdma_cq_mr *cqmr_shadow;
> >       struct irdma_cq_mr *cqmr;
> >       unsigned long flags;
> > +     bool cqe_64byte_ena;
> >       int err_code;
> > +     u8 cqe_size;
> >
> >       iwcq->user_mode =3D true;
> >       ucontext =3D rdma_udata_to_drv_context(udata, struct irdma_uconte=
xt,
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
>
> [Severity: Critical]
> Can ukinfo->cq_size * cqe_size overflow 32-bit arithmetic or truncate whe=
n
> assigned to the __u16 cq_req.cq_pages field here?
>
> Unlike irdma_create_cq() and irdma_resize_cq(), irdma_create_user_cq() an=
d
> irdma_alloc_cq() do not check attr->cqe > rf->max_cqe before setting
> ukinfo->cq_size:
>
> drivers/infiniband/hw/irdma/verbs.c:irdma_create_user_cq() {
>         err_code =3D cq_validate_flags(attr->flags, dev->hw_attrs.uk_attr=
s.hw_rev);
>         if (err_code)
>                 return err_code;
>
>         if (udata->outlen < IRDMA_CREATE_CQ_MIN_RESP_LEN)
>                 return -EINVAL;
>
>         err_code =3D irdma_alloc_cq(iwdev, iwcq, attr, &info);
> }
>
> Because ukinfo->cq_size is u32, cqe_size is u8 (32 or 64), and
> cq_req.cq_pages in struct irdma_mem_reg_req is __u16, a large user-suppli=
ed
> UVERBS_ATTR_CREATE_CQ_CQE value (such as 0x00400040 or 0x04000040 when
> cqe_size is 64) causes cq_req.cq_pages to wrap or truncate to 1.
>
> When that happens, min_size becomes 4096 bytes, ib_umem_get_cq_buf() pins=
 a
> single 4KB page, and irdma_setup_q_pbl_from_umem() accepts the 1-page UME=
M
> in PBLE_LEVEL_0 physical mode while __irdma_create_cq() ->
> irdma_sc_cq_create() programs the unvalidated cq->cq_uk.cq_size into the
> hardware CQP WQE. Could this allow hardware DMA writes beyond the single
> pinned page?

This is pre-existing, not an issue in practice, since rdma-core
(libirdma, in `ucreate_cq`) userspace rejects such case.

In theory, this could be an issue if we look only at the driver. Happy
to send a new patch for this, or fold this into v4 ( if v4 is needed )

>
> > +
> > +             umem =3D ib_umem_get_cq_buf(&iwdev->ibdev, attrs, min_siz=
e,
> > +                                       IB_ACCESS_LOCAL_WRITE);
> > +             if (IS_ERR(umem))
> > +                     return PTR_ERR(umem);
> > +
> > +             iwcq->iwpbl =3D irdma_setup_q_pbl_from_umem(iwdev, umem, =
NULL,
> > +                                                       IRDMA_MEMREG_TY=
PE_CQ, &cq_req);
> > +             if (IS_ERR(iwcq->iwpbl)) {
> > +                     err_code =3D PTR_ERR(iwcq->iwpbl);
> > +                     iwcq->iwpbl =3D NULL;
> > +                     ib_umem_release(umem);
> > +                     return err_code;
> > +             }
> > +     } else {
> > +             if (!req.user_cq_buf)
> > +                     return -EINVAL;
> > +
> > +             spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags)=
;
> > +             iwcq->iwpbl =3D irdma_get_pbl((unsigned long)req.user_cq_=
buf,
> > +                                         &ucontext->cq_reg_mem_list);
> > +             spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, f=
lags);
> > +             if (!iwcq->iwpbl)
> > +                     return -EPROTO;
> > +     }
> >
> >       cqmr =3D &iwcq->iwpbl->cq_mr;
> >
> >       if (rf->sc_dev.hw_attrs.uk_attrs.feature_flags &
> >           IRDMA_FEATURE_CQ_RESIZE) {
> > -             spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags)=
;
> > -             iwcq->iwpbl_shadow =3D
> > -                     irdma_get_pbl((unsigned long)req.user_shadow_area=
,
> > -                                   &ucontext->cq_reg_mem_list);
> > -             spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, f=
lags);
> > +             if (uverbs_attr_is_valid(attrs, IRDMA_IB_ATTR_CREATE_CQ_S=
HADOW_BUF_UMEM)) {
> > +                     struct ib_umem *shadow_umem;
> > +                     struct irdma_mem_reg_req shadow_req =3D {
> > +                             .cq_pages =3D IRDMA_SHADOW_PGCNT,
> > +                     };
> > +
> > +                     shadow_umem =3D
> > +                             ib_umem_get_attr(&iwdev->ibdev, attrs,
> > +                                              IRDMA_IB_ATTR_CREATE_CQ_=
SHADOW_BUF_UMEM,
> > +                                              IRDMA_SHADOW_AREA_SIZE <=
< 3,
> > +                                              IB_ACCESS_LOCAL_WRITE);
> > +                     if (IS_ERR(shadow_umem))
> > +                             return PTR_ERR(shadow_umem);
> > +
> > +                     iwcq->iwpbl_shadow =3D
> > +                             irdma_setup_q_pbl_from_umem(iwdev, shadow=
_umem, NULL,
> > +                                                         IRDMA_MEMREG_=
TYPE_CQ,
> > +                                                         &shadow_req);
>
> [Severity: High]
> What happens on RoCE if userspace passes a non-4KB-aligned buffer in
> UVERBS_ATTR_CREATE_CQ_BUF_UMEM or IRDMA_IB_ATTR_CREATE_CQ_SHADOW_BUF_UMEM=
?
>
> In irdma_setup_q_pbl_from_umem(), the page-offset check is skipped on RoC=
E,
> and region->address is passed as virt to irdma_alloc_iwmr():
>
> drivers/infiniband/hw/irdma/verbs.c:irdma_setup_q_pbl_from_umem() {
>         /* iWarp: Catch page not starting on OS page boundary */
>         if (!rdma_protocol_roce(&iwdev->ibdev, 1) && ib_umem_offset(regio=
n))
>                 return ERR_PTR(-EINVAL);
>
>         iwmr =3D irdma_alloc_iwmr(region, &iwdev->ibdev, pd, region->addr=
ess, reg_type);
> }
>
> Inside irdma_alloc_iwmr(), ib_umem_find_best_pgsz(region, SZ_4K, virt)
> compares the virtual address alignment against the physical page offset, =
so
> the intra-page offset cancels out and returns SZ_4K even when
> region->address is not 4KB-aligned.
>
> Later, irdma_handle_q_mem() -> irdma_setup_pbles() ->
> irdma_copy_user_pgaddrs() populates the PBL using
> rdma_block_iter_dma_address(&biter), which masks off the low 12 bits
> (~(iwmr->page_size - 1)). Doesn't this set info->cq_base_pa (or the PBLE
> entries) and info->shadow_area_pa to offset 0 of the 4KB page rather than
> the user buffer's offset within the page, causing the hardware to DMA to =
or
> from the wrong offset in that page?

This is pre-existing, and not an issue in practice, since irdma-core
(libirdma) ensures alignment.

In theory, this is an issue if we look only at the driver. Happy to
send a patch for this, or fold it into v4 (if v4 is needed)

Best,
David
