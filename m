Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792537605;
	b=DuUabIxR2cKR5YcT7KVnaqmC1pVnrx03rJfCkjNEEu1rytUi9519kdUpxty/vNEXqN1z
	 Ff9MgzOzWiim8zPuuvHyq/N8B/IWz8asn3bjbRxhA40BWvnEf5SbDqnYvRustn5PS1RrS
	 Sb1wvguq8/ZNwV8y6GuQW9sPrR8D5lHerwBv3gPEKu8Qf0xqyCHXiSfy4qNmIRTBJn/pM
	 Byg8c6PEmhx15hZmvpV5SdqIUMEQg4CzwsO6svwwxhMbH0st4Ec/2ThKSZ3GMFilCP32b
	 +NhQJE9Wk7dKJ8HmkgBImpxdteggmE9WsEdOB9107pRHwgevSt6kFgZdgA/HcR753vQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792537605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=va6egunWkEGRYKak1VVc3OBpB5rdaiauwOcFiqC3P6w=;
	b=gWa9LSyjyuxXWY7/rDPIKIDyosamDWTWj1hv2Sv3NKhw0heJjM+NcNU2u4SzhsyKyMUv
	 temq8ujfJibv1yoBftvzutD7svb9cAiC31ZfaVU3AQpetzNuJfo+9yRi4NUmpLEzfXw0U
	 Om/0XU6/JcmwSsdxd71nk/iqPvfqRQscX4/kzwSkN804U5Gl69NJNRXwIz0ekw/2WZ1p8
	 NdVGLuH2zWAfdFfNIvYmfvnxDLN9XbHxHcwGYIeTGPLnZCoFq90Ex5f9Ff/vLCozMSqDf
	 JdrJ/ZZAtmt2kFpYXNz9mytda53cenBsdbzPW726Zk8nh77j9HftPnKYRvYSpoUPkkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=x6u.co;
	spf=pass smtp.mailfrom=x6u.co;
	dkim=pass header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=Vx8QDRTG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51836606A319
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 23:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51836606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=Vx8QDRTG
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35f036b17easo220553eec.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 16:06:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792537604; cv=none;
        d=google.com; s=arc-20260327;
        b=iqnl7uD20yMIq2RKNvPynoVCGvJfCMnCC3AI/0OPz0pxaWmV7P8jX1XGD5ugG5NiSn
         +Ljf5GDaRx7fshoVPmpu4PlxN3pZP1oksAuiEE29bFXP288z1dMPoFNaE3zq586vKzu+
         gNCRwsTH6I02PTXTuR+E6f5a2peHJ1rKfgQUAWT8RQ6boa8vsubzseSchRt9ak++Eedd
         spOkph2miBMoWaO2uG03c62eiMT/wECIez+6yArrzA1LDzWivNmM5MnfDuJGfRpFWPMD
         1vAW7URVEyO/K3OwU41iYQP5aiOT2m7au/gJd6VAnv56hbxAGaDdXdYw30FAQ3FeB/nM
         N2nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=va6egunWkEGRYKak1VVc3OBpB5rdaiauwOcFiqC3P6w=;
        fh=Je+XfjZZELYMeUFG782y9M4oZFPTVtwBgMoamcbwTg0=;
        b=YKxF80zVWploV/Nrxcb6U9SBuQz0jZfu8Vnh2Qv33J2bGJ9Jrh22kQa7Bqr11Fh+vY
         ZjNK4alFCbfTXE8fgaHf1JuZnUOPPhY/7pyyE0VztTJRylUl25n/7nAkj83aDaeIXyWO
         txSn4WHizp+xdrgJ0p7baHoqHSOnfDarAODuXkFTXerCRenP3DlPD8IQ3MT8f9VPV/4U
         cnhI4mfRhNmMID6b3dVfj4rdHVBm+2qvgiu0Il1RFHGEAsCxUkA9zJTw7hkf5T0vHG/8
         jO//FemW0Jvk77Nj4VRfpFDMhsJg2yO/KF/56mgd66Kkhk1iF96MvnQZp43TlCcz6y4y
         yw0Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1792537604; x=1793142404; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=va6egunWkEGRYKak1VVc3OBpB5rdaiauwOcFiqC3P6w=;
        b=Vx8QDRTGOIM8MIkHejpxC+RasA+O2uHxfg4RF2OSPDMWTIKEvLOQl3UFwmRayr7gLW
         gqoSsz/gB1tnTN8Iwl/8XquMxqnkf+nzaNw+3e1b5cUoye6Tp9JohvIRBl6bLN1LzjjJ
         0e5wygiGnx6oAOBEmLq7iNaMKcCwXnwOSYJFvcLd8qMbHYmbxklCgiOg58xeRe09P2Ox
         zdVGGfh9taSpm68P0vsDM3AGCnJNYxj9f+4QlhlEcdqUrn1tpf3WF96Z0TSGMunn4K3W
         xBH75XnbiPY8gRB2z7ImXlSRus0FAxwj1TfrRMpVdNIMdjKfIhaxCLkAo/TssD8Zygtu
         b0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792537604; x=1793142404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=va6egunWkEGRYKak1VVc3OBpB5rdaiauwOcFiqC3P6w=;
        b=aJrY9LG/dns3dgk+kYx4u6LrWGtT53FN/tsKU49BPV71CPQRJch/2o2w+Wfj/TjeZ2
         Hsysd0bCqk5/LaCbldQEKKa2VQ03F70TgObzCPUA6d8ZisCJk0YcdBQoWVgscssNAQ+i
         q44b+KkrZi0qGN/zCh1UDxui+F/rLApAjXDWLOubuuAsGlvGWQLycN97fM5Qhhhp/Ulq
         RQGgYthCxJEtZ9CQm6PWyliakdldfbEoannBZ96dPQM7YRnja8KES6RK6iu9W1YgIeTs
         HV/Qbu7Dk8pD0DWzO5OIfjSqSnzoCS6s6P2pkc8labZr/knQhO8n/OZyRElRfbCLIDCj
         CwWw==
X-Gm-Message-State: AFq9FYI8rTMXyQHzfLNuRl06OqomotezWfEXvO5PIRCoOQxk9hN4O+NR
	Ki5mZZLED8BpeKkS/G97KsgaLJa+gLw3u+58AwCw904htP2xctglQv4v92xOHn3KhlPjntMy5Os
	1nFPj4Ck7RxnQDxzJss1nWFikocANJeR/H6+zsfGmHhWRwm9h3/SKflz3
X-Gm-Gg: AYBFou0YEC5nxB8TnyDhn3e8wDtd3KTfVthAwbd6fFNj8rQKI3eHaGT66hch5840IFe
	g82TXvebtQ7Q03TjqIJu4EWAyjMg0CliGi3OZK+agM3+k7M21G1jyp2G/vIEjl+hEgEYkDziE4b
	6luw5jFUeyGq39eOf6cN/9N8XfqjkG/B/kd8qLRD8uBQozi6uur4rETKmn537m5XDl2CDhmfqQN
	UNTm2Q9j37IjZKWC1rrS4BRxOXD7wYXBqElHE3nZDJe1+GoHElgX8QlhPS4sB4ffaf3t73hcFcV
	rrOB+D9Qku2a/MB9GUkkYyijH+H0KEt6RHKfUSU++RLOtxj6sFKVWgdM8qIWI5r1aUUeE0sDbbD
	W/KcqFVebZBTT8XcXFetXj+o3ikwNhc7gkgbq6/P0sv929e06u8Sm
X-Received: by 2002:a05:7301:150e:b0:35c:8abb:b4ae with SMTP id
 5a478bee46e88-3674f21ac5cmr985386eec.25.1792537603985; Tue, 20 Oct 2026
 16:06:43 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016202909.1289496-1-dhu@x6u.co> <20261016202909.1289496-4-dhu@x6u.co>
 <sashiko-outbox-174922@kernel.org>
In-Reply-To: <sashiko-outbox-174922@kernel.org>
From: David Hu <dhu@x6u.co>
Date: Tue, 20 Oct 2026 19:06:32 -0400
X-Gm-Features: AclHuK-t7bu1YsPmx0t33N8Kecw-SsexQz8g2itTSLrXXxZiXwZB62bKOmc9ccc
Message-ID: <CABdL-LTgFTwJPTD0vyScNsvCSAW_04TgOyO1swVBgHxDcmJsfg@mail.gmail.com>
Subject: Re: [PATCH rdma-next v3 3/6] RDMA/irdma: Support UMEM attribute for
 QP creation
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 4:46=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] RDMA/irdma: invalid sg_page() on dmabuf QP umem in irdma_cop=
y_user_pgaddrs()
> --
>
> commit 200a925805870f2d575192eafe96be3cef694b7d
> Author: David Hu <xuehaohu@google.com>
>
> RDMA/irdma: Support UMEM attribute for QP creation
>
> This commit adds support for the 1-step queue buffer creation model for Q=
Ps
> via UVERBS_ATTR_CREATE_QP_BUF_UMEM and ib_umem_get_attr(), while retainin=
g
> backward compatibility with the legacy 2-step MR registration model.
>
> > diff --git a/drivers/infiniband/hw/irdma/verbs.c b/drivers/infiniband/h=
w/irdma/verbs.c
> > index b2ffdc8e3d677..ab25445f38282 100644
> > --- a/drivers/infiniband/hw/irdma/verbs.c
> > +++ b/drivers/infiniband/hw/irdma/verbs.c
> [ ... ]
> > @@ -713,6 +708,52 @@ static int irdma_setup_umode_qp(struct irdma_ucont=
ext *ucontext,
> >               ukinfo->rq_size =3D ukinfo->rq_depth >> ukinfo->rq_shift;
> >       }
> >
> > +     if (attrs && uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREATE_QP_BU=
F_UMEM)) {
> > +             struct irdma_mem_reg_req qp_req =3D {};
> > +             struct ib_umem *umem;
> > +             u32 total;
> > +
> > +             /* Legacy context does not provide depth info */
> > +             if (!ucontext->use_raw_attrs)
> > +                     return -EOPNOTSUPP;
> > +
> > +             qp_req.sq_pages =3D DIV_ROUND_UP(ukinfo->sq_depth * IRDMA=
_QP_WQE_MIN_SIZE,
> > +                                            IRDMA_HW_PAGE_SIZE);
> > +             /* In case srq is used, this will be a single page */
> > +             qp_req.rq_pages =3D DIV_ROUND_UP(ukinfo->rq_depth * IRDMA=
_QP_WQE_MIN_SIZE,
> > +                                            IRDMA_HW_PAGE_SIZE);
> > +             total =3D qp_req.sq_pages + qp_req.rq_pages + IRDMA_SHADO=
W_PGCNT;
> > +
> > +             umem =3D ib_umem_get_attr(&iwdev->ibdev, attrs,
> > +                                     UVERBS_ATTR_CREATE_QP_BUF_UMEM,
> > +                                     total << IRDMA_HW_PAGE_SHIFT,
> > +                                     IB_ACCESS_LOCAL_WRITE);
> > +             if (IS_ERR(umem))
> > +                     return PTR_ERR(umem);
> > +
> > +             iwqp->iwpbl =3D irdma_setup_q_pbl_from_umem(iwdev, umem,
> > +                                                       iwqp->ibqp.pd,
> > +                                                       IRDMA_MEMREG_TY=
PE_QP,
> > +                                                       &qp_req);
> [ ... ]
> > @@ -3532,6 +3574,64 @@ static void irdma_free_iwmr(struct irdma_mr *iwm=
r)
> >       kfree(iwmr);
> >  }
> >
> > +static struct irdma_pbl *irdma_setup_q_pbl_from_umem(struct irdma_devi=
ce *iwdev,
> > +                                                  struct ib_umem *regi=
on,
> > +                                                  struct ib_pd *pd,
> > +                                                  enum irdma_memreg_ty=
pe reg_type,
> > +                                                  struct irdma_mem_reg=
_req *req)
> > +{
> > +     struct irdma_pbl *iwpbl;
> > +     struct irdma_mr *iwmr;
> > +     u32 total;
> > +     u8 lvl;
> > +     int err;
> > +
> > +     /* iWarp: Catch page not starting on OS page boundary */
> > +     if (!rdma_protocol_roce(&iwdev->ibdev, 1) && ib_umem_offset(regio=
n))
> > +             return ERR_PTR(-EINVAL);
>
> [Severity: Critical]
> Can passing an IB_UVERBS_BUFFER_TYPE_DMABUF descriptor via
> UVERBS_ATTR_CREATE_QP_BUF_UMEM cause a NULL pointer dereference or write =
to
> the wrong page during iWARP connection establishment?
>
> In irdma_setup_umode_qp(), ib_umem_get_attr() resolves the buffer descrip=
tor
> through __ib_umem_get_desc_dir(), which accepts both IB_UVERBS_BUFFER_TYP=
E_VA
> and IB_UVERBS_BUFFER_TYPE_DMABUF. Previously, IRDMA_MEMREG_TYPE_QP MRs co=
uld
> only be registered via irdma_reg_user_mr() -> ib_umem_get_va(), whereas
> irdma_reg_user_mr_dmabuf() hardcoded IRDMA_MEMREG_TYPE_MEM.
>
> When irdma_setup_q_pbl_from_umem() calls irdma_handle_q_mem() ->
> irdma_setup_pbles() -> irdma_copy_user_pgaddrs(), the driver extracts the
> first SQ page from the scatterlist:
>
> drivers/infiniband/hw/irdma/verbs.c:irdma_copy_user_pgaddrs() {
>         if (iwmr->type =3D=3D IRDMA_MEMREG_TYPE_QP)
>                 iwpbl->qp_mr.sq_page =3D sg_page(region->sgt_append.sgt.s=
gl);
> }
>
> and irdma_setup_virt_qp() assigns iwqp->page =3D qpmr->sq_page, while
> iwqp->sc_qp.qp_uk.sq_base remains NULL for a user-mode QP.
>
> On an iWARP device, irdma_accept() and irdma_cm_event_connected() map
> iwqp->page to write the LSMM or RTT WQE:
>
> drivers/infiniband/hw/irdma/cm.c:irdma_accept() {
>         if (iwqp->page)
>                 iwqp->sc_qp.qp_uk.sq_base =3D kmap_local_page(iwqp->page)=
;
>
>         cm_node->lsmm_size =3D accept.size + conn_param->private_data_len=
;
>         irdma_sc_send_lsmm(&iwqp->sc_qp, iwqp->ietf_mem.va, cm_node->lsmm=
_size,
>                            ibmr->lkey);
> }
>
> drivers/infiniband/hw/irdma/cm.c:irdma_cm_event_connected() {
>         if (iwqp->page)
>                 iwqp->sc_qp.qp_uk.sq_base =3D kmap_local_page(iwqp->page)=
;
>         irdma_sc_send_rtt(&iwqp->sc_qp, read0);
>         if (iwqp->page)
>                 kunmap_local(iwqp->sc_qp.qp_uk.sq_base);
> }
>
> With a dmabuf-backed ib_umem, calling sg_page() on the scatterlist breaks=
 in
> two ways:
>
> 1. When CONFIG_DMABUF_DEBUG is enabled (where dma_buf_wrap_sg_table() cle=
ars
>    page_link) or when the exporter does not populate struct page pointers
>    (such as uverbs_dmabuf or P2P/MMIO exporters), sg_page() returns NULL.
>    This leaves iwqp->page NULL, so irdma_accept() and
>    irdma_cm_event_connected() skip kmap_local_page() and pass a NULL
>    qp_uk->sq_base into irdma_sc_send_lsmm() / irdma_sc_send_rtt(), which
>    immediately dereferences qp_uk->sq_base->elem.
>
> 2. Even when sg_page() is populated by a system-RAM exporter, if userspac=
e
>    passes a non-zero page-aligned offset within a coalesced multi-page SG
>    entry, ib_umem_dmabuf_map_pages() advances sg_dma_address(sg) and
>    decrements sg_dma_len(sg) in place without updating sg->page_link:
>
>    drivers/infiniband/core/umem_dmabuf.c:ib_umem_dmabuf_map_pages() {
>                 if (cur <=3D start && start < cur + sg_dma_len(sg)) {
>                         unsigned long offset =3D start - cur;
>
>                         umem_dmabuf->first_sg =3D sg;
>                         umem_dmabuf->first_sg_offset =3D offset;
>                         sg_dma_address(sg) +=3D offset;
>                         sg_dma_len(sg) -=3D offset;
>                         cur +=3D offset;
>                 }
>    }
>
>    As a result, sg_page(region->sgt_append.sgt.sgl) points to the start o=
f
>    that SG segment rather than the SQ page at the requested offset, causi=
ng
>    kmap_local_page(iwqp->page) to map and overwrite the wrong page.
>
> Should irdma_setup_q_pbl_from_umem() (or irdma_setup_umode_qp()) reject
> region->is_dmabuf, at least when !rdma_protocol_roce(&iwdev->ibdev, 1) (o=
r
> unconditionally if dmabuf queue rings are not supported)?
>

For irdma, dma-buf heap based queue is only supported on RoCEv2 (CVM),
not for iWARP.
So this is not an issue in practice.
