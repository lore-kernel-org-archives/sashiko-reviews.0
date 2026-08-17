Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2780C3DC4D8
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 14:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786976894; cv=none; b=m5gqW8Yg5jI1DUiNgGYxFKWEUF/eHGbuDX4y9lrbpXqDn+MVKhwMoJ48wcaaPOyvd8wDKjrqJn7sxbVhoEDqXDuW8Tk90LVDRgv4OzL2fU6pRE0HlEFoDwaFLn5GhjNEsdDl+rVUPPlA/LKfqWHpJAcHYK6PoGEkdZ2rIBvA6Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786976894; c=relaxed/simple;
	bh=ebK4JTWNGalX4olCZUecdqpw1kufV9MCQKO9oWLpqkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=JS2NraW4uPKY5D2tdZ7NMb9A1uwVPeta6N/Oqn21c/FWcIx8rV7JNvCsblY77xw9sLqt4uW7pHAW+GzxRsEft/BcE0lbq8zGpIkjjG4Qbwxt+bg6SKc2CyOfDpxTp+pzjEU0mQ6MtBFkKJ0IY9DCQDjMdRx8jS0Nh0E/Sdi6vUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JBqHL/9D; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JBqHL/9D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786976892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UllUGbRWJw/dlX8G8YFIieU4twUeb3DnEeZ/NqEjam8=;
	b=JBqHL/9D7GPfSLk5ei9sUnyaihRu3s7d90CPKlU2B2Dpf6bQHLzIOWtVpcj5UH9+Gfbnuo
	yyah7it3d5o2q1KPlPac0EWlFRF37p1tAF2WovtSVaD8XP4S+jOaw+a0FdJJWfPW1mV+yl
	Ma1SnXA98zbHFnCJ4azqikUKOgQajy4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-NQzaNdesPw6-Pc9LZQEXKw-1; Mon, 17 Aug 2026 10:28:10 -0400
X-MC-Unique: NQzaNdesPw6-Pc9LZQEXKw-1
X-Mimecast-MFC-AGG-ID: NQzaNdesPw6-Pc9LZQEXKw_1786976889
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f7039fa59so2769552f8f.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 07:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786976889; x=1787581689;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UllUGbRWJw/dlX8G8YFIieU4twUeb3DnEeZ/NqEjam8=;
        b=eW01Cmdpvy4DvOljy5Wxo3CP/7sLqoZH6YEeXFVZVI/JYWVDcP51FcmojAVBBv/peE
         OnvjKJzZQozBsR2I1J8BB9K5OnBj/X/5ZRfBe6LSX0U9RsEA8rC8Em2lN9wr92i09NrB
         5F+d/I2faL9/Ge4DfAylRavv2fVDG1tjcwkK0sm3+Iwy4In7hs8GEQ4YzJ0P4hGBfVvF
         476U0pjBTcqj/AGaxozfLHx0OlGZJgLqGp11EcStLWot1ofFqkk0SQBi3LoVqYQU0rp8
         WSV3Ul+5urIRy9MeZ7IpPCN4wjzhk6ZIKQ7Vxnlb6Lf68KyRWRKPPbJSujUqNZOOCEWU
         SYDw==
X-Gm-Message-State: AOJu0YzXEwdnw/Dn6uE9hZfbsDov0RoP1xum8F9bdGxSYoXUeXON2uR/
	msVqLG8U3PIbsz+KXeZV8YPCHMDJO2IDqFrFFl2wn/hr2aQZ1dLT+pZ9ZXfU+MMI05mPy3iF0uc
	j8jdYBTVlulnhSgjvWRT8piltmbhQSQ3T78OV53yMQMnT0dF2b1rqlcQqpvz+Ek7yWG8rQlklgD
	YGqhciPg/cT4JCkuVDdOs6V3rH4BsvM+rCJgHZg+DGTPTW/8DSjgu60OI=
X-Gm-Gg: AR+sD10UwdbvDKKatdcdG422BLAwCVanV7B6PORxyfvO4KQh2wOD8H6Mgd4Xv/aAoWN
	xtv3lzuRcfwT+h9oo3le8GxWVq2kO5rv1diwkshUQgmNOjMp+t27edQrkZOovqRhOYFRg4iwRG2
	6lU6Ddw/RzwpLU2UTXlNTyYJUoZWU3jJ32JgMrcbePV2SwsyquIEubl4FGmw1xCafiovAoicCTj
	dG16Uj8jICr3pk/7w==
X-Received: by 2002:a05:6000:615:b0:47f:d0fb:ea40 with SMTP id ffacd0b85a97d-482a90d8d18mr631803f8f.21.1786976889171;
        Mon, 17 Aug 2026 07:28:09 -0700 (PDT)
X-Received: by 2002:a05:6000:615:b0:47f:d0fb:ea40 with SMTP id
 ffacd0b85a97d-482a90d8d18mr631737f8f.21.1786976888730; Mon, 17 Aug 2026
 07:28:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812181300.3712426-1-jtaubepe@redhat.com> <20260812181300.3712426-13-jtaubepe@redhat.com>
 <20260812183150.8D6D21F000E9@smtp.kernel.org>
In-Reply-To: <20260812183150.8D6D21F000E9@smtp.kernel.org>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Mon, 17 Aug 2026 10:27:57 -0400
X-Gm-Features: AcwNN1XLatY5Taw4cTwgpB3wMNqMPw_hgtm3FqHct2QwAtVw9HD1Z6ojicQ0gq4
Message-ID: <CADRr4bf1m+M2Y7yrvZE6gDALobybuvovJHqeWHjdyVBFVW+piA@mail.gmail.com>
Subject: Re: [PATCH 12/13] nvme: fcloop: Add set_rport_marginal to sysfs
To: sashiko-reviews@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Tbv90dooXDoqnBS7B-AtD164pJo1MrXdthOZWQLtvYM_1786976889
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 2:32=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] The `opts` structure is allocated on the stack and passed uninit=
ialized to `fcloop_parse_options`, leading to undefined behavior and use of=
 stack garbage.
> - [High] A reference count leak occurs on the error path in `fcloop_set_m=
arginal_rport` when the target port or remote port is missing.
> - [High] Lockless access to `nport->tport` and `nport->tport->remoteport`=
 creates a TOCTOU bug that can lead to a Use-After-Free.
> --
>
> --- Patch [12]: [PATCH 12/13] nvme: fcloop: Add set_rport_marginal to sys=
fs ---
> commit 0c2a40a45b26fd619c8713ddb24578a051043b92
> Author: Jesse Taube <jtaubepe@redhat.com>
>
> nvme: fcloop: Add set_rport_marginal to sysfs
>
> This commit adds a sysfs attribute to allow setting a remote port as marg=
inal.
> This helps facilitate testing of multipath failover by simulating a margi=
nal
> link in the fcloop LLDD.
>
> > diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.=
c
> > index b63af3b643a64..51a50743128db 100644
> > --- a/drivers/nvme/target/fcloop.c
> > +++ b/drivers/nvme/target/fcloop.c
>
> [ ... ]
>
> > @@ -1663,6 +1677,31 @@ fcloop_set_cmd_drop(struct device *dev, struct d=
evice_attribute *attr,
> >       return count;
> >  }
> >
> > +static ssize_t
> > +fcloop_set_marginal_rport(struct device *dev, struct device_attribute =
*attr,
> > +             const char *buf, size_t count)
> > +{
> > +     struct fcloop_nport *nport;
> > +     struct fcloop_ctrl_options opts;
>
> [Severity: High]
> Does this leave the opts structure uninitialized?
will fix.

>
> Looking at fcloop_parse_options(), it uses opts->mask |=3D token during p=
arsing,
> which performs a read-modify-write operation. Since opts is allocated on =
the
> stack here without initialization, could this use stack garbage and resul=
t in
> false validation bypass or incorrect functional behavior?
>
> > +     int ret;
> > +
> > +     ret =3D fcloop_parse_options(&opts, buf);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* everything there ? */
> > +     if ((opts.mask & MARGINAL_OPTS) !=3D MARGINAL_OPTS)
> > +             return -EINVAL;
> > +
> > +     nport =3D fcloop_nport_lookup(opts.wwnn, opts.wwpn);
> > +     if (!nport || !nport->tport || !nport->tport->remoteport)
> > +             return -ENOENT;
>
> [Severity: High]
> If nport is successfully found but !nport->tport or !nport->tport->remote=
port
> is true, does this leak the reference count on nport?
yes, will fix

>
> The fcloop_nport_lookup() function increments the reference count of the
> returned nport. Returning -ENOENT early here skips the fcloop_nport_put()
> call, which would permanently prevent the nport from being freed.
>
> [Severity: High]
> Is it safe to access nport->tport and nport->tport->remoteport locklessly
> here?
Yes it uses a reference count.

> Could a concurrent write to del_target_port take fcloop_lock, clear these
> pointers, and free the targetport memory while this function is actively
> dereferencing them, resulting in a use-after-free?
>
> > +
> > +     nvme_fc_set_remoteport_fpin(nport->tport->remoteport, opts.margin=
al);
> > +     fcloop_nport_put(nport);
> > +
> > +     return count;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812181300.37=
12426-1-jtaubepe@redhat.com?part=3D12
>

