Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5B138D01E
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 14:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786976773; cv=none; b=olORb171a7pCK4tcSi0WDJJ404RKSsqfmgAdRAUvlMAO3AenybRYHUH+fkDEir2yi1PsESMv3oUIu4Y2bRvWzxXc1/re2I0IucdyIyU2g/c93qPRbstkqebki8bZoyu9aXL+JFVvCk2rh++evizsbipuecGTkLlKx7HjtNHUYf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786976773; c=relaxed/simple;
	bh=5Fx/jLBt4NjgKsouyRUj62+jA3S0tsigRG7T1AupIoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AqWJwP4+WUfRai4D5joh5H7xwhcIjrkmM/ORb5/5KgV/slRaHtQzdq+JlySpAY1dYKMD90UNdPBHOHBR6CKQK2fPWulxqo0lFYm4qhRz7tZo4HMuXxTehAuCGK+OIal7/vrPQomq6n3w1k6axLsd+tpXHr0CqlMmd10gS4I98/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PTjgDSTs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PTjgDSTs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786976771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0xVoO4PGa93cBgoTmsmPlqVbYL9tE4BTnM50GMQnOmg=;
	b=PTjgDSTsljrm5GjZRBzhVnvweLDUBh9qVsbPEflutoYkydiWjTMJitWn+uhtz6aa1QNAmQ
	AXx5Y/v6ZjvJwbPlWP02Hj+EyZTFXiBTRA8EDuCMuE1I9v8G8TiWUiMKBoacC4uu06fjbL
	WRzykh+JZndv3da5zCtZErTB4PvCnYo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-ErI39yUfPpWUemr6_7rauQ-1; Mon, 17 Aug 2026 10:26:09 -0400
X-MC-Unique: ErI39yUfPpWUemr6_7rauQ-1
X-Mimecast-MFC-AGG-ID: ErI39yUfPpWUemr6_7rauQ_1786976769
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-482a5e9400eso476878f8f.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 07:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786976769; x=1787581569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xVoO4PGa93cBgoTmsmPlqVbYL9tE4BTnM50GMQnOmg=;
        b=hoayrf2tl/jdjTF0kd0HsxbCC9PRj105opKhnHIkTfWo4bxPiTkShO3FJXjg/6fgXj
         cSCdvW0dEuY0ePURG+ZcGF6u8FBBFWMKAFy7qfNdTJZVJJBOVc1ylR3p945nbYzDtKiy
         F9s84WlvPsBErTohBXu1YK7Gl4c9yv5ij9j6xhgaVXGoeA6olq5qecOCmuCjLcXZK9xz
         eu+E6gJf9vxDR3AsOLTN1jOdzdUSDWkx3qIK/YvWN+L1z91Z4XUkHiqlrnJ32qFrKrBc
         NSNyK4aiff5q7fuPcpJ5K0vz4f3JLqE7+5GRY/08n4H6K5NmazfiEkX725B6ncO/q+hq
         QPPA==
X-Gm-Message-State: AOJu0Yyw8wueCmtLZDNTN71QTfDKigxD+O/8floQjUeCH9rn+ib3Nazu
	y7ODyB57zf7dj2ndV243fUi115yFm5jLBp2sCS0IeNVp6OEJ7/Pl5b7XnRNTzoSqM0gCGhSxuLz
	3pc/CHTOMkNze1uCasgUAZldSRcnthX7/kzn9m3z/t6Ys8RB2kzogLmVD40JI7H4mgbyAoA1U8P
	V9F6zf+vIxvYzX82qcJRJ5s3qZ1FbzE7aDdljinxQRTn7oYddDX4AD
X-Gm-Gg: AR+sD10SvGuYVv1leK488URmRanNqvVWZ+nOmrQGladSV3uuOM7r2RxGZsjVykgom41
	ZyIFkugc8gSPbwFJMhz7oC+pSayeUROS2k9RS0aSpQvFnDLXMqRebfdjMBsi/uYB5ar651VTSSb
	/HFsEa3mCjcY1cHuPaSruFknCz4soLIn0FGkCQHUR2pLi09Uk00ymfxO5iHAVS0I5VnO5WPYGQG
	fGWwXekMt/h9tpRQA==
X-Received: by 2002:a5d:4b45:0:b0:47f:8f8f:db74 with SMTP id ffacd0b85a97d-482a908a3ddmr728343f8f.12.1786976768686;
        Mon, 17 Aug 2026 07:26:08 -0700 (PDT)
X-Received: by 2002:a5d:4b45:0:b0:47f:8f8f:db74 with SMTP id
 ffacd0b85a97d-482a908a3ddmr728270f8f.12.1786976768264; Mon, 17 Aug 2026
 07:26:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812181300.3712426-1-jtaubepe@redhat.com> <20260812181300.3712426-12-jtaubepe@redhat.com>
 <20260812183533.423061F00A3A@smtp.kernel.org>
In-Reply-To: <20260812183533.423061F00A3A@smtp.kernel.org>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Mon, 17 Aug 2026 10:25:56 -0400
X-Gm-Features: AcwNN1WoAXOWHM0UvOaW2H_aN_oGR153U8en9mLKgo-ACm1moZ0bC2Z130Jd7D8
Message-ID: <CADRr4bfgy_e=2QjTKxGrUWXvKW6KoJZZOmDabgzp0yYx3SSfAw@mail.gmail.com>
Subject: Re: [PATCH 11/13] scsi: lpfc: enable FPIN notification for NVMe
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K-eABTiGTBnlxxWupyUYUfiZB0wLPkqW-X1CQ4bo7IE_1786976769
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 2:35=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Low] Logging Formatting Defect: Error message is improperly split acro=
ss two consecutive `dev_info()` calls.
>
> Pre-existing issues:
> - [High] Concurrency / Use-After-Free: Lockless access to `ndlp->nrport` =
and `nrport->remoteport` can lead to a Use-After-Free due to concurrent unr=
egistration.
> --
>
> --- Patch [11]: [PATCH 11/13] scsi: lpfc: enable FPIN notification for NV=
Me ---
> commit 6d41021b653095acd49d1f7828d07c1405835a16
> Author: Jesse Taube <jtaubepe@redhat.com>
>
> scsi: lpfc: enable FPIN notification for NVMe
>
> Implement set_rport_marginal callback using nvme_fc_set_remoteport_fpin()=
 to
> enable FPIN notifications for NVMe.
>
> > diff --git a/drivers/scsi/lpfc/lpfc_attr.c b/drivers/scsi/lpfc/lpfc_att=
r.c
> > index f4e8164b94abb..d54899cceed99 100644
> > --- a/drivers/scsi/lpfc/lpfc_attr.c
> > +++ b/drivers/scsi/lpfc/lpfc_attr.c
>
> [ ... ]
>
> > @@ -7134,6 +7134,30 @@ lpfc_set_rport_loss_tmo(struct fc_rport *rport, =
uint32_t timeout)
> >  #endif
> >  }
> >
> > +static void
> > +lpfc_set_rport_marginal(struct fc_rport *rport, bool marginal)
> > +{
> > +     struct lpfc_rport_data *rdata =3D rport->dd_data;
> > +     struct lpfc_nodelist *ndlp =3D rdata->pnode;
> > +     struct lpfc_nvme_rport *nrport =3D NULL;
> > +
> > +     /* Break early if NVME_FC is not enabled */
> > +     if (!IS_ENABLED(CONFIG_NVME_FC))
> > +             return;
> > +
> > +     if (!ndlp) {
> > +             dev_info(&rport->dev, "Cannot find remote node to ");
> > +             dev_info(&rport->dev, "set rport marginal, port_id x%x\n"=
,
> > +                      rport->port_id);
>
> [Severity: Low]
> Does this code format the output correctly?

Will fix

>
> Because dev_info() prepends the device name and KERN_INFO to every
> invocation, splitting the message across two calls without a newline on t=
he
> first will cause the prefix to be injected in the middle of the sentence =
in
> the kernel log.
>
> > +             return;
> > +     }
> > +
> > +     nrport =3D lpfc_ndlp_get_nrport(ndlp);
> > +
> > +     if (nrport && nrport->remoteport)
> > +             nvme_fc_set_remoteport_fpin(nrport->remoteport, marginal)=
;
>
> [Severity: High]
> This is a pre-existing issue, but does this lockless retrieval of nrport =
via
> lpfc_ndlp_get_nrport() safely protect against concurrent unregistration?

Will fix

> The macro performs a lockless double-fetch of ndlp->nrport without acquir=
ing
> ndlp->lock:
>
> drivers/scsi/lpfc/lpfc_nvme.h:
> #define lpfc_ndlp_get_nrport(ndlp)                              \
>         ((!ndlp->nrport || (ndlp->fc4_xpt_flags & NVME_XPT_UNREG_WAIT))\
>         ? NULL : ndlp->nrport)
>
> If a concurrent remote port loss triggers lpfc_nvme_unregister_port(), it
> could free the NVMe remote port memory before setting ndlp->nrport =3D NU=
LL.
>
> Could this code then read a dangling pointer and pass nrport->remoteport
> to nvme_fc_set_remoteport_fpin(), resulting in a Use-After-Free?
>
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812181300.37=
12426-1-jtaubepe@redhat.com?part=3D11
>

