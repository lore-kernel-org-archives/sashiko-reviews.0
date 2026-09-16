Received: from mail-yw1-f228.google.com (mail-yw1-f228.google.com [209.85.128.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8EF463B88
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 08:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546023; cv=none; b=pJxqf4n0HkiQl55FAhZ/JxobKV/GcLbl8ymiDeLZDw9lnVs2YwjT8GjJHJlRg8DTENfwFSHhhYPvpYuIE6jTCiwO9huVVY6IHPfGAdqZUpihPQmEqUfAOlUkCpPWXjtFoQB1Xb9wyWCKwIPbHrEaNnkRvnaIcE4K48U3HU6xq2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546023; c=relaxed/simple;
	bh=YZDq/gbVl1c40R+ShgSWanlUxOIWWE1spHQhO1jFOY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DMd7nHpvGt9aaz5TcNSU/G6BkcZtvetpOSaKnv4m1tXY5ZRO6Rb1R6MBL/dyszk8zlTXxKMbDjrbGXeDJ0Nssx81uixowrFRdwXEdEDurr+dvTO0oJ/aSGgGTqR38ReaDPEchQ3j1ajpnNcXxphQI5dqqUbUae7npt+zCJrzzAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=V9ffP94E; arc=none smtp.client-ip=209.85.128.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="V9ffP94E"
Received: by mail-yw1-f228.google.com with SMTP id 00721157ae682-87f4e914a45so41673597b3.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 01:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789546005; x=1790150805;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUYWYiA2FXJ3iVZjkmsszHUhApoNaGKXUatbNFhTAdc=;
        b=tbGnJsivMA2laQL4y9xdRXWgyjxrv8s3da4DQ1VqntO688owHOVMsvyFGwoSMriiHP
         +kASTmLxVEt1a9ZUglQXiJpOtddBjDpyTJ4rynYgDLKu5a2smc9z3uOFrZln7LtXhBYe
         jhbfJ0ukFFKaAEuU9dPMhXVKkRMZWJJTN29pTEbaH3pc6q6hpWatiO7MvQ9SNU+6bp9z
         6oW8UnvBljeOjFon/lwYceTvPSP7UD79DPfKN47RyKbg8eFjuG0cfDop7dslAQpaI3ES
         XAkgGzNmiSrFiM43z3NV0uid/X45BWYC2u0dhYQRZOKHthptrFRHy9lm0rgvwernmbUj
         XFaQ==
X-Gm-Message-State: AFuF++nMAnbSB0h8Ffr+BteAwcpl0su6AENkf3a4ua0zb9ubvtu1cBQw
	0Bbek0Qy4Z32BQDHZM22Bp6aMmLnvOvS26bUPAa0oTBOjpC5H/nV8nBxma31RpSBZ+/02RoI577
	ydvrsMWVxh4lIwieKvsJpydyS6Z0Ml8Mj8hrTX9MVV864Eg4zqWWZjWcjPeTKfHgM2ZZGaF2IVx
	NwhGkj87I4xy/mlPX5zGysn/wr0bU7nkR7O46DTFK3X8zzT3G5jDUkTiSI5LNwKb+XYARC3gOjh
	KmP/t1+U6TpCm0dNX69Ah3TPTXx1klCsxSM
X-Gm-Gg: AYBFou145L9LT7R7D0wZLjfyzRgOfHmHznBnFrUc9A795BZyTU3ckeBnHZb2zYFzroO
	cpllEj9A8NU6Q3RHVI8TApcO1SqhjbByrTqLAHEwPs7K7BMok6K1HUu+BR24C225NsSkaFANHn/
	CDGfgcCnWfBLx3fLtLf5GwTuFkuaWXhTkQ+SgBkRvGW1fPlZSwg765G90Y3INou7Avipq003jkU
	q3C+5ag0giUbx87MmvNLCzcWAKE7qL5t9TL59iqPXpi4QNJG/zyCV7l9BeKUOQ6ZZJxFJZ0bji3
	GvbpsxQmUbP1G7MHKqDzCDGYKCgANJWSC4q7W+hecu7zPSFD6aK1N4DvOyG16cPweZI33VYc2yv
	gxz5nZSHFznSTEPaRg74MBHxjc0nKww0QxhCIhvCiSEC5RxEX3e5TyiYOw1lCH5ZYqmZh9ulgy2
	x3p7PXq7gKLl0ksQFaS6Xju0D9N8J7wpfHjrBJyiTbEU+NR1ID
X-Received: by 2002:a05:690c:389:b0:845:ddf4:a3a7 with SMTP id 00721157ae682-892216ee518mr5328567b3.16.1789546004534;
        Wed, 16 Sep 2026 01:06:44 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-891e3de9e77sm350307b3.0.2026.09.16.01.06.43
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 01:06:44 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-854f274dd69so6634910b3a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 01:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789546003; x=1790150803; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUYWYiA2FXJ3iVZjkmsszHUhApoNaGKXUatbNFhTAdc=;
        b=V9ffP94ESCUElo9qb4h4HZXnf4KlEulv0xJbC9UG+5H7lDvxrTopwYE6ycEOv8HgUQ
         a89amCxjVIPfbqqcj3Tvx3h6Hishu/HQ2CsJ5SfJC2b1xgkMf48IciajQ4AUaBRf7SCI
         uBFN9zkazbPKVpwBgOv4ipbZ+WtwDvOHufy/Y=
X-Received: by 2002:a05:6a00:3317:b0:858:6307:5f7d with SMTP id d2e1a72fcca58-872372c5f8bmr3534255b3a.8.1789546002024;
        Wed, 16 Sep 2026 01:06:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:3317:b0:858:6307:5f7d with SMTP id
 d2e1a72fcca58-872372c5f8bmr3534174b3a.8.1789546001316; Wed, 16 Sep 2026
 01:06:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915-silent-16-bit-truncation-of-srq-size-v1-1-3199f8fe94bc@nvidia.com>
 <20260915132428.2C67B1F0089B@smtp.kernel.org> <20260915184615.GQ13683@unreal>
In-Reply-To: <20260915184615.GQ13683@unreal>
From: Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>
Date: Wed, 16 Sep 2026 13:36:28 +0530
X-Gm-Features: AcwNN1UEHoeJgKZ1Swpa6bmtdkVhSv-V6m0T2HYUyy5i06laUVrXdtAjr4QydiE
Message-ID: <CAH-L+nOnpYLZkPh5Msvcy0pBY0VBi0tGZhP1-Q8_DC_X_wNSEg@mail.gmail.com>
Subject: Re: [PATCH rdma-next] RDMA/bnxt_re: Limit SRQ depth to the firmware
 command field
To: Leon Romanovsky <leon@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-rdma@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000d69b5b065b95250f"

--000000000000d69b5b065b95250f
Content-Type: multipart/alternative; boundary="000000000000b7ddb9065b9525fe"

--000000000000b7ddb9065b9525fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Leon,

Thank you for the patch. We recently made a similar fix in the OOB driver
(which is queued to push upstream).

We will check the Sashiko report on your patch and propose a fix.

On Wed, Sep 16, 2026 at 1:03=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:

> On Tue, Sep 15, 2026 at 01:24:27PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> > - [High] RDMA/bnxt_re: silent SRQ desync for legacy userspace due to
> non-power-of-two cap
> > --
> >
> > commit a0fff360dfd527e4f635aa0d8696bce687733ce9
> > Author: Leon Romanovsky <leon@kernel.org>
> >
> > RDMA/bnxt_re: Limit SRQ depth to the firmware command field
> >
> > Firmware can report an SRQ depth above 16 bits, but CREATE_SRQ carries
> the
> > allocated depth in a 16-bit field. Requests near the advertised limit c=
an
> > therefore truncate the command value and make firmware use a different
> > depth than the allocated queue.
> >
> > > diff --git a/drivers/infiniband/hw/bnxt_re/ib_verbs.c
> b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
> > > index ef08d42f377e6..43ff3e7a459fa 100644
> > > --- a/drivers/infiniband/hw/bnxt_re/ib_verbs.c
> > > +++ b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
> > > @@ -2229,8 +2229,8 @@ int bnxt_re_create_srq(struct ib_srq *ib_srq,
> > >     dev_attr =3D rdev->dev_attr;
> > >     srq =3D container_of(ib_srq, struct bnxt_re_srq, ib_srq);
> > >
> > > -   if (srq_init_attr->attr.max_wr >=3D dev_attr->max_srq_wqes) {
> > > -           ibdev_err(&rdev->ibdev, "Create CQ failed - max exceeded"=
);
> > > +   if (srq_init_attr->attr.max_wr > dev_attr->max_srq_wqes) {
> > > +           ibdev_err(&rdev->ibdev, "Create SRQ failed - max
> exceeded");
> > >             rc =3D -EINVAL;
> > >             goto exit;
> > >     }
> > > diff --git a/drivers/infiniband/hw/bnxt_re/qplib_sp.c
> b/drivers/infiniband/hw/bnxt_re/qplib_sp.c
> > > index ec9eb52a8ebf7..63dcbb9d80f4b 100644
> > > --- a/drivers/infiniband/hw/bnxt_re/qplib_sp.c
> > > +++ b/drivers/infiniband/hw/bnxt_re/qplib_sp.c
> > > @@ -159,7 +159,8 @@ int bnxt_qplib_get_dev_attr(struct bnxt_qplib_rcf=
w
> *rcfw)
> > >     attr->max_ah =3D le32_to_cpu(sb->max_ah);
> > >
> > >     attr->max_srq =3D le16_to_cpu(sb->max_srq);
> > > -   attr->max_srq_wqes =3D le32_to_cpu(sb->max_srq_wr) - 1;
> > > +   attr->max_srq_wqes =3D min_t(u32, le32_to_cpu(sb->max_srq_wr),
> > > +                              U16_MAX) - 1;
> >
> > [Severity: High]
> > Does capping max_srq_wqes to 65534 break legacy userspace applications
> that
> > rely on power-of-two queue sizes?
>
> Sashiko has a point, the power-of-two is negotiated with
> BNXT_RE_UCNTX_CMASK_POW2_DISABLED bit.
>
> Thanks
>
> >
> > If a legacy application requests an SRQ size that rounds up to 65536
> > (e.g. 32768), bnxt_re_create_srq() will pass dev_attr->max_srq_wqes + 1
> > (65535) as the maximum to bnxt_re_init_depth():
> >
> > drivers/infiniband/hw/bnxt_re/ib_verbs.c:bnxt_re_create_srq() {
> >     ...
> >       srq->qplib_srq.max_wqe =3D
> >               bnxt_re_init_depth(srq_init_attr->attr.max_wr + 1,
> >                                  dev_attr->max_srq_wqes + 1, uctx);
> >     ...
> > }
> >
> > In bnxt_re_init_depth(), this results in min(65536, 65535) and returns
> 65535:
> >
> > drivers/infiniband/hw/bnxt_re/ib_verbs.h:bnxt_re_init_depth() {
> >     ...
> >       if (uctx && !(uctx->cmask & BNXT_RE_UCNTX_CAP_POW2_DISABLED))
> >               return min(roundup_pow_of_two(ent), max);
> >     ...
> > }
> >
> > Because 65535 is not a power of two, legacy userspace masking (e.g., id=
x
> &
> > 0xFFFE) becomes mathematically incorrect, immediately corrupting ring
> state
> > and causing producer/consumer desynchronization without throwing an
> error.
> >
> > >     attr->max_srq_sges =3D sb->max_srq_sge;
> > >     attr->max_pkey =3D 1;
> > >     attr->max_inline_data =3D attr->max_qp_sges * sizeof(struct sq_sg=
e);
> >
> > --
> > Sashiko AI review =C2=B7
> https://sashiko.dev/#/patchset/20260915-silent-16-bit-truncation-of-srq-s=
ize-v1-1-3199f8fe94bc@nvidia.com?part=3D1
>
>

--=20
Regards,
Kalesh AP

--000000000000b7ddb9065b9525fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Leon,<br><br>Thank you for the patch. We recently made =
a similar fix in the OOB driver (which is queued to push upstream).<br><br>=
We will check the Sashiko report on your patch and propose a fix.</div><br>=
<div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"=
gmail_attr">On Wed, Sep 16, 2026 at 1:03=E2=80=AFAM Leon Romanovsky &lt;<a =
href=3D"mailto:leon@kernel.org">leon@kernel.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Sep 15, 2026 at 01:2=
4:27PM +0000, <a href=3D"mailto:sashiko-bot@kernel.org" target=3D"_blank">s=
ashiko-bot@kernel.org</a> wrote:<br>
&gt; Thank you for your contribution! Sashiko AI review found 1 potential i=
ssue(s) to consider:<br>
&gt; - [High] RDMA/bnxt_re: silent SRQ desync for legacy userspace due to n=
on-power-of-two cap<br>
&gt; --<br>
&gt; <br>
&gt; commit a0fff360dfd527e4f635aa0d8696bce687733ce9<br>
&gt; Author: Leon Romanovsky &lt;<a href=3D"mailto:leon@kernel.org" target=
=3D"_blank">leon@kernel.org</a>&gt;<br>
&gt; <br>
&gt; RDMA/bnxt_re: Limit SRQ depth to the firmware command field<br>
&gt; <br>
&gt; Firmware can report an SRQ depth above 16 bits, but CREATE_SRQ carries=
 the<br>
&gt; allocated depth in a 16-bit field. Requests near the advertised limit =
can<br>
&gt; therefore truncate the command value and make firmware use a different=
<br>
&gt; depth than the allocated queue.<br>
&gt; <br>
&gt; &gt; diff --git a/drivers/infiniband/hw/bnxt_re/ib_verbs.c b/drivers/i=
nfiniband/hw/bnxt_re/ib_verbs.c<br>
&gt; &gt; index ef08d42f377e6..43ff3e7a459fa 100644<br>
&gt; &gt; --- a/drivers/infiniband/hw/bnxt_re/ib_verbs.c<br>
&gt; &gt; +++ b/drivers/infiniband/hw/bnxt_re/ib_verbs.c<br>
&gt; &gt; @@ -2229,8 +2229,8 @@ int bnxt_re_create_srq(struct ib_srq *ib_sr=
q,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0dev_attr =3D rdev-&gt;dev_attr;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0srq =3D container_of(ib_srq, struct bnxt_re_sr=
q, ib_srq);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0if (srq_init_attr-&gt;attr.max_wr &gt;=3D dev_attr-=
&gt;max_srq_wqes) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ibdev_err(&amp;rdev-&gt=
;ibdev, &quot;Create CQ failed - max exceeded&quot;);<br>
&gt; &gt; +=C2=A0 =C2=A0if (srq_init_attr-&gt;attr.max_wr &gt; dev_attr-&gt=
;max_srq_wqes) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ibdev_err(&amp;rdev-&gt=
;ibdev, &quot;Create SRQ failed - max exceeded&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D -EINVAL;<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; diff --git a/drivers/infiniband/hw/bnxt_re/qplib_sp.c b/drivers/i=
nfiniband/hw/bnxt_re/qplib_sp.c<br>
&gt; &gt; index ec9eb52a8ebf7..63dcbb9d80f4b 100644<br>
&gt; &gt; --- a/drivers/infiniband/hw/bnxt_re/qplib_sp.c<br>
&gt; &gt; +++ b/drivers/infiniband/hw/bnxt_re/qplib_sp.c<br>
&gt; &gt; @@ -159,7 +159,8 @@ int bnxt_qplib_get_dev_attr(struct bnxt_qplib=
_rcfw *rcfw)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0attr-&gt;max_ah =3D le32_to_cpu(sb-&gt;max_ah)=
;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0attr-&gt;max_srq =3D le16_to_cpu(sb-&gt;max_sr=
q);<br>
&gt; &gt; -=C2=A0 =C2=A0attr-&gt;max_srq_wqes =3D le32_to_cpu(sb-&gt;max_sr=
q_wr) - 1;<br>
&gt; &gt; +=C2=A0 =C2=A0attr-&gt;max_srq_wqes =3D min_t(u32, le32_to_cpu(sb=
-&gt;max_srq_wr),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 U16_MAX) - 1;<br>
&gt; <br>
&gt; [Severity: High]<br>
&gt; Does capping max_srq_wqes to 65534 break legacy userspace applications=
 that<br>
&gt; rely on power-of-two queue sizes?<br>
<br>
Sashiko has a point, the power-of-two is negotiated with<br>
BNXT_RE_UCNTX_CMASK_POW2_DISABLED bit.<br>
<br>
Thanks<br>
<br>
&gt; <br>
&gt; If a legacy application requests an SRQ size that rounds up to 65536<b=
r>
&gt; (e.g. 32768), bnxt_re_create_srq() will pass dev_attr-&gt;max_srq_wqes=
 + 1<br>
&gt; (65535) as the maximum to bnxt_re_init_depth():<br>
&gt; <br>
&gt; drivers/infiniband/hw/bnxt_re/ib_verbs.c:bnxt_re_create_srq() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0srq-&gt;qplib_srq.max_wqe =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bnxt_re_init_dep=
th(srq_init_attr-&gt;attr.max_wr + 1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_attr-&gt;max_srq_wqes =
+ 1, uctx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt; }<br>
&gt; <br>
&gt; In bnxt_re_init_depth(), this results in min(65536, 65535) and returns=
 65535:<br>
&gt; <br>
&gt; drivers/infiniband/hw/bnxt_re/ib_verbs.h:bnxt_re_init_depth() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (uctx &amp;&amp; !(uctx-&gt;cmask &amp; B=
NXT_RE_UCNTX_CAP_POW2_DISABLED))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return min(round=
up_pow_of_two(ent), max);<br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt; }<br>
&gt; <br>
&gt; Because 65535 is not a power of two, legacy userspace masking (e.g., i=
dx &amp;<br>
&gt; 0xFFFE) becomes mathematically incorrect, immediately corrupting ring =
state<br>
&gt; and causing producer/consumer desynchronization without throwing an er=
ror.<br>
&gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0attr-&gt;max_srq_sges =3D sb-&gt;max_srq_sge;<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0attr-&gt;max_pkey =3D 1;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0attr-&gt;max_inline_data =3D attr-&gt;max_qp_s=
ges * sizeof(struct sq_sge);<br>
&gt; <br>
&gt; -- <br>
&gt; Sashiko AI review =C2=B7 <a href=3D"https://sashiko.dev/#/patchset/202=
60915-silent-16-bit-truncation-of-srq-size-v1-1-3199f8fe94bc@nvidia.com?par=
t=3D1" rel=3D"noreferrer" target=3D"_blank">https://sashiko.dev/#/patchset/=
20260915-silent-16-bit-truncation-of-srq-size-v1-1-3199f8fe94bc@nvidia.com?=
part=3D1</a><br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Regards,<div>Kalesh AP</div></div></div>

--000000000000b7ddb9065b9525fe--

--000000000000d69b5b065b95250f
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGtzCCBJ+g
AwIBAgIMEvVs5DNhf00RSyR0MA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYyMDEzNDI1N1oXDTI3MDYyMTEzNDI1N1owgfUxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEYMBYGA1UEBBMPQW5ha2t1ciBQdXJheWlsMQ8wDQYDVQQqEwZLYWxlc2gxFjAUBgNVBAoT
DUJST0FEQ09NIElOQy4xLDAqBgNVBAMMI2thbGVzaC1hbmFra3VyLnB1cmF5aWxAYnJvYWRjb20u
Y29tMTIwMAYJKoZIhvcNAQkBFiNrYWxlc2gtYW5ha2t1ci5wdXJheWlsQGJyb2FkY29tLmNvbTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOG5Nf+oQkB79NOTXl/T/Ixz4F6jXeF0+Qnn
3JsEcyfkKD4bFwFz3ruqhN2XmFFaK0T8gjJ3ZX5J7miihNKl0Jxo5asbWsM4wCQLdq3/+QwN/xAm
+ZAt/5BgDoPqdN61YPyPs8KNAQ8zHt8iZA0InZgmNkDcHhnOJ38cszc1S0eSlOqFa4W9TiQXDRYT
NFREznPoL3aCNNbDPWAkAc+0/X1XdV1kt4D9jrei4RoDevg15euOaij9X7stUsj+IMgzCt2Fyp7+
CeElPmNQ0YOba2ws52no4x/sT5R2k3DTPisRieErWuQNhePfW2fZFFXYv7N2LMgfMi9hiLi2Q3eO
1jMCAwEAAaOCAecwggHjMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcB
AQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQv
Z3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2ln
bi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAy
ASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNv
bS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29t
L2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwLgYDVR0RBCcwJYEja2FsZXNoLWFuYWtrdXIucHVyYXlp
bEBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAUACk2nlx6ug+v
LVAt26AjhRiwoJIwHQYDVR0OBBYEFJ/R8BNY0JEVQpirvzzFQFgflqtJMA0GCSqGSIb3DQEBCwUA
A4ICAQCLsxTSA9ERT90FGuX/UM2ZQboBpTPs7DwZPq12XIrkD58GkHWgWAYS2xL1yyvD7pEtN28N
8d4+o6IcPz7yPrfWUCCpAitaeSbu0QiZzIAZlFWNUaOXCgZmHam8Oc+Lp/+XJFrRLhNkzczcw3zT
cyViuRF/upsrQ3KY/kqimiQjR9BduvKiX/w/tMWDib1UhbVhXxuhuWMr8j8sja2/QR9fk670ViD9
amx7b5x595AulQfiDhcN0qxG4fr7L22Y/RYX8fCoBAGo0SF7IpxSukVsp6z5uZp5ggdNr2Cq88qk
if7GG/Oy1beosYD9I5S5dIRcP25oNbcJkbCb/GuvWegzGfxCCBuirb09mTSZRxaBmb1P6dANmPvh
PdqGqxfFrXagvwbO15DN46GarD9KiHa8QHyTtWghL3q+G6ZHlZUWnyS4YMacrx8Ngy0x7HR4dNdT
pqAqOOsOwDmQFBNRYomMdAaOXm6x6MFDnp51sIWVNGWK2u4le2VI6RJMzEqLzMZKL0vTW+HPqMaT
hWv2s5x6cJdLio1vP63rDxJS7vH++zMaY0Jcptrx6eAhzfcq+y/TkHJaZ4dWrtbof1yw3z5EpCvT
YDxV0XFQiCRLNKuZhkVvQ8dtmVhcpiT/mENrWKWOt0DwNEeC/3Fr1ruoyriggbnRmBQt1bC5uxfv
+CEHcDGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYt
c2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1FIENBIDIwMjMCDBL1bOQzYX9NEUsk
dDANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgvNw6XqmBBymXVmQNNlCJ0rHkszWk
SvdMYqGLjRUPoVYwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYw
OTE2MDgwNjQzWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAtoYnrTzCMb6JACEIhpwOgwJkPrVSWFMPdKpWlBbE/h5wVynEwdkRINO4U8DfEGeJ
DRJaa7CddpXFPD+Sgh45uYdrfsoOt7PV3bMh4fnuo9QoltLpP1NYICLUViIMm36Rh+7qm5KaAh7L
b15VZ11JwaB0lJ+qMG51adp9L9jOxQTONEKlulfjfXZTPD5giCvfHfMyYvRWZZ3/zEwIBRgYGBZU
2820Itct2isKHrRJh+5/ZFhNy6jOvUz54WIPgKz/V2DuoRj5NTqfLd8lx77A8VRvitEuTd0dKb7l
UIaPnNlBMqyhiNvY0My5ISx9PQxmrS88gTuroXgcr4eBRfrxdQ==
--000000000000d69b5b065b95250f--
