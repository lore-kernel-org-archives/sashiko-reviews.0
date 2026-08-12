Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC432D2487
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 19:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563549; cv=none; b=BTnESbsuF+wclw+areO0rfYw0oBR5BUSv9OoNbx998+sJ3bplEXtS6nOEtiEQuyLZCLw5eWvmGPjGRnhjc44H6GIMzS0Klo+MmWAy4+5Mal75Ds5IB+EGF/GlXQTk1Az2wZRS2rC6Cs3uJIPYDCjf1oi7OiEO19s4Y/TDhfX540=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563549; c=relaxed/simple;
	bh=tRgGCOewA0lp8S+K3RImRNPbX0DuxXTz1l30c+3uZoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gucuWSmHg1JdFjcaVNiBesgMesYMo/6YPYOKDx35PLyyQkTNzWQrfT2AXUtcCImzCgLBQSUif2k0jrdGc5b4lFpFyiicFJSJpDCQ6zwVh07BrXVEyT1X2aFUppe9jGi5wWiiSQ+qp2TJr3+0bAixDoufT1POowOk2G968aUHtEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BGQ2Hqi8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BGQ2Hqi8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786563547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3C4X2UvQfeeNnOmqDKpOYErY1uer3KEJgj1Xf3vKCt0=;
	b=BGQ2Hqi8coucX8iUVf3f2VeqAu5RB2WiI3/ikT6op+Y1Zq87S1kBvh60w2ZH6jrgXxIWut
	8G/fVhsWio+GSmMHCnQmjDSENa9CjIo17XzmKMf8HNB/kvY1bynrjaEZOiiiLuKtv1HPwH
	wdKtRnFCVy1lztf7DiUVHOmkwGz6woU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-Pc8Cf--4OrGs9OaMiAlgpw-1; Wed, 12 Aug 2026 15:39:04 -0400
X-MC-Unique: Pc8Cf--4OrGs9OaMiAlgpw-1
X-Mimecast-MFC-AGG-ID: Pc8Cf--4OrGs9OaMiAlgpw_1786563543
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49571407d1dso7777905e9.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 12:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786563543; x=1787168343;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3C4X2UvQfeeNnOmqDKpOYErY1uer3KEJgj1Xf3vKCt0=;
        b=hT6aHz5R/Ub6b8yZMf1RLwI7XS+15ukjl5MauWV7rUpsPg4Y5bjdZLT8V7pYDa9BMs
         cNKTo5gzCX0Gt3Y9EHUXJiIL/qxZoRLliTDnV3iT6/7uBqxc/fUJPuhbNA6ZLS9etFt+
         NY0DZpDW+oAVg/1MzPsGxFl0LhCLyxE0mkXytAi84Ut4mTQ5AiKRhkkQkkX52GK+S/ZD
         WHydhp6mSa91w9cGwj+jMLgZhPiBLR7TkCpfpva1TjrJJ/xh1jmpQRMFrWe/qD1orJYw
         sg1CsQgAzxsJv/Ky3ON4JiVGhRwSc9VL2BEhsgkMU9FdUKTPXl1NKKbpS34S/heodXgB
         iBYg==
X-Gm-Message-State: AOJu0YzAz4YQcbT0F6IhEfOE524f0L2aGo7P4Je5r/h6zXTBPTfeC/fv
	3UNKXLs0ibA4KUH9mE1cZiN2cnrYHMiUHkq9E1TkyKRrt1em109YEAAYsHK+EhhvuxmhiNSubQb
	T+A9sY9Bg2RXEMOHbBOxcGjcf8kQvuc+hNtz4QCD9SwZ9+/f3ssJgL2txAiPeRMbUsWJh0zVB1S
	CkcthGZNT2dIAYseH4SIMvoA2RnR4vFOYLYTIUBpmIjmYuMH8eXlVp7ow=
X-Gm-Gg: AR+sD13ykjStzF02LTSD+yZu5ov1y2CVgfFDUffj/P7yYEelolE0+YUIjmVyfxifqqs
	IAduy7yvphYYZ4axROk1IN7ZaLZ3fSnZW8l51tcHD/6Hv89Z43CXgm+rNO0JvBTQQqkpVuwrUT7
	lvOpw9EwHKjCNUr8oPl9FRejw6BVkc8moZQDHd9eSwx94Sjqe//RcZZm7oLlOzEBOEcUx+NWH/L
	zYb7/YXtwJE2r1NSg==
X-Received: by 2002:a5d:4749:0:b0:47f:8ff9:c9bc with SMTP id ffacd0b85a97d-48159fe3dbamr560749f8f.14.1786563543188;
        Wed, 12 Aug 2026 12:39:03 -0700 (PDT)
X-Received: by 2002:a5d:4749:0:b0:47f:8ff9:c9bc with SMTP id
 ffacd0b85a97d-48159fe3dbamr560719f8f.14.1786563542767; Wed, 12 Aug 2026
 12:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812181300.3712426-1-jtaubepe@redhat.com> <20260812181300.3712426-11-jtaubepe@redhat.com>
 <20260812183447.69D111F000E9@smtp.kernel.org>
In-Reply-To: <20260812183447.69D111F000E9@smtp.kernel.org>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Wed, 12 Aug 2026 15:38:51 -0400
X-Gm-Features: AUfX_mwPGs6928oyO7D9lNr3R67WeJ-UrYuYK8ZSaH9YZfKKzZ1uertCx9vvxe8
Message-ID: <CADRr4bdf=r802GE8Duz-VMWZ9XFEtjg4n+xWwiO2Ws7Q0C0Q7w@mail.gmail.com>
Subject: Re: [PATCH 10/13] scsi: qla2xxx: enable FPIN notification for NVMe
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aR-3EANnHP50gUhGkm1aLDOz6FlO9BiGqNENmMLkTWI_1786563543
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 2:35=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Lockless access to `fcport->nvme_remote_port` in `qla2x00_set_rp=
ort_marginal()` introduces TOCTOU Use-After-Free and NULL pointer dereferen=
ces.
> --
>
> --- Patch [10]: [PATCH 10/13] scsi: qla2xxx: enable FPIN notification for=
 NVMe ---
> commit 1b0bf8a2abd4965d07b3b9fd652b0926356c721b
> Author: Jesse Taube <jtaubepe@redhat.com>
>
> scsi: qla2xxx: enable FPIN notification for NVMe
>
> Implement set_rport_marginal callback using nvme_fc_set_remoteport_fpin()
> to enable FPIN notifications for NVMe.
>
> > diff --git a/drivers/scsi/qla2xxx/qla_attr.c b/drivers/scsi/qla2xxx/qla=
_attr.c
> > index a4ca22024edeb..92db7d584eeb8 100644
> > --- a/drivers/scsi/qla2xxx/qla_attr.c
> > +++ b/drivers/scsi/qla2xxx/qla_attr.c
> > @@ -2789,6 +2789,15 @@ qla2x00_set_rport_loss_tmo(struct fc_rport *rpor=
t, uint32_t timeout)
> >                                              rport->dev_loss_tmo);
> >  }
> >
> > +static inline void
> > +qla2x00_set_rport_marginal(struct fc_rport *rport, bool marginal)
> > +{
> > +     fc_port_t *fcport =3D *(fc_port_t **)rport->dd_data;
> > +
> > +     if (IS_ENABLED(CONFIG_NVME_FC) && fcport && fcport->nvme_remote_p=
ort)
> > +             nvme_fc_set_remoteport_fpin(fcport->nvme_remote_port, mar=
ginal);
>
> [Severity: High]
> Does this code introduce a Time-Of-Check to Time-Of-Use (TOCTOU) race con=
dition?
>
> The nvme_remote_port pointer is read and dereferenced locklessly here. If=
 a
> device loss event triggers qla_nvme_remoteport_delete() concurrently, it =
sets
> fcport->nvme_remote_port =3D NULL and allows the NVMe FC transport to fre=
e the
> remote port memory.
>
> If qla2x00_set_rport_marginal() checks that nvme_remote_port is non-NULL =
but
> is preempted before calling nvme_fc_set_remoteport_fpin(), it will pass a=
 stale
> pointer to freed memory, causing a use-after-free.
>
> Alternatively, because the pointer is fetched without READ_ONCE(), the co=
mpiler

This is not a valid solution, there would need to be a lock in
fc_port_t or else we would
get a use-after-free. Unless there is a better solution im unaware of
im going to ignore this
as it already exists in the driver.

Thanks,
Jesse Taube

> could reload the now-NULL pointer from memory, leading to a NULL pointer
> dereference inside nvme_fc_set_remoteport_fpin().
>
> This pre-existing vulnerability is also present in qla2x00_set_rport_loss=
_tmo()
> just above this new function.
>
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812181300.37=
12426-1-jtaubepe@redhat.com?part=3D10
>

