Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C8D3B42E3
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 07:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781161848; cv=pass; b=uPs07CsoKcMfAOqrMRXUU4aDf55QFwZk1X6BtboiBErxJcdrMin6/4qfgI7Q91FbyMHL+zKZsFYpPoEYbcOgcQO4796hx5EknKYdG5pL9gMS+Ue8cALvdW15QHilU/QxPvtHwyUiTU4SbV1/FkrmlT83JUAmElvjeIIb+GWOnzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781161848; c=relaxed/simple;
	bh=SDrj9QLyrkFNYM/bIRWCwbK7r7eFm1ZtCfLFN6N91Mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c402fbh9WxTYnUhexOsIK39JeQ/hhAElYBOvSIY4YIcsZtVI18rQ7NoLlbqB+9aQOca/KcCAQoNKjedhjtwhjVm3VZlAJa2JF6CxO7VW8asKAsQPmZXrFvKO8ZhWdmLBLQcK+1Vi8do6ZDRjrDABpnld6JbOeWc4xZwPBZYqmEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8g+B0LD; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8g+B0LD"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6606d5900dbso2961059d50.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 00:10:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781161845; cv=none;
        d=google.com; s=arc-20240605;
        b=FBJG6jxPKgn71KAo9p/mic5A9/M/zArH+f7cJrIn7JQcEYvMC27hVPyUlcAHM4IQqH
         lE3CkHK/hsfwUc3CZOkIvuwHtFJ8RZgvIpVMIM7pveoitHSkbfH5Qox99Q3yuk3JVZhG
         tmku/BRi1hXopwJhIBSpnN0fC5qlp1l/8yCyRaR8OwLVVUV2hSz8XXEj8gNTJMApaGKa
         5aaQasyzI0q2/YljhRZ9B7AsyK0gfK7OlfUbgkoiwoR81a/5zbMfVGTMC1z/+4WJvMkW
         wl2XJCweDXFEbVPimEXei6E6YzNwMxK5ixPgDj0JpOnum11EhUmh6kGm3YHgpOtkyHaL
         J1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/lURB3/LzIdITeZ1AKaYes4tHMeiGZ75b15AvCb6ZJ4=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=d1fOjGabYNHZjDLlBELYxn3jcJoCUwtQvBuNB2lztCKfweXLx+DfkOHnJU21/vdu9u
         bxVXViWYZPWWVwXIu2vRBK6p2VmS/cAgm5t2hFBU+Cs73P+CDe9pHVxlEn6DpmxRM4lK
         R/6q2Pkf+nfHZliblKuz6llY/2VJMQ5fu2BxRypHw2mxXr54NYOZHwJJh7gtfkA9/UG1
         CDs2zTLAp42n2bAIA2fbv02/JtzJR0gLaBCpeLzxE6HHq+4bGwycyEV0F0PEI2M4hk1A
         G2DaGz+tJxS4THRqFiIs1B09X6OhjwQRTxiSBAclgyfwQlpTWx2l7PcqSC4JYAfh6uA/
         e8TQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781161845; x=1781766645; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lURB3/LzIdITeZ1AKaYes4tHMeiGZ75b15AvCb6ZJ4=;
        b=P8g+B0LDWeEB2iXx43DYD413kPq+e6Btv/HFsWkkaM1DfPzbSdSJXhOWgW8bIUf8Mg
         5s2yDlLfmBXlZMaOOm2DFt2Mx7jk0Rk2GGX4fQ+C5D+QOo67QdXGECI7KuTFGtvy5z+m
         Vt8LenkyT45+YfzDbIkkCYu+RQvaAaIRVX/QnivowUzoy9C3ilG4DjW51yAZVpr3G/Qs
         6Z8Eob+sBDIzNmhoRIfkxBFdq1jDbWXRhPm7DVqd8HF8+c2kI6djVaBMecs04RdRhiNF
         skHOTBx07AaIyGlP9Kv416vzSp5nafaiv6NWkqaO18O7V8E8jS644jTQowZCi0EZR/5y
         Ah5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781161845; x=1781766645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/lURB3/LzIdITeZ1AKaYes4tHMeiGZ75b15AvCb6ZJ4=;
        b=L1hZJ4SGlwpvfHZl7HtbJDwZe9z0rzESIBlx/Q5NZ8gP/2lmXs0NIMMYPjpgmrevzb
         IC6Xbf+cRS/jg43PuY85VRbMJOgZYk0khiLGOlmp6rRdHwK4Kz6G0gTiLNQUVl7J5oZ8
         XSYaj2Fv803Dd/2jFnfl8jhN5lyKl8av3FuLPO0esX63aQQ8MgDAyq6Ohb8S3jpv1gQF
         bkTLnrQHJBsjVO2l7qaIkPX4yYNnMvxxpAFCnNzmQS8Qy6QyFRf+bbIB5ecXKfvsJdHH
         c/JzdvEDzemRV+lpk2dXRxwKhRel6vGuVMtt0QhIzA7EAnncv43EZwKzIrUnr5COAxs9
         gUyQ==
X-Gm-Message-State: AOJu0YzsGsWUzPGr7ZAD1G5AX6OkesaTZktTPG1j+Fdr2Dqe9hBR7Osi
	22ezYu6CVSb/L6cq8CoIqW+oAc4Bzxo4nyZPqTE3DBOVVcP2I/CISrZiWrr784Z27PozoAquW2t
	9779GYlJYsC5hwNnbab7h5n2aqG4LphtMgM55lmlN/w==
X-Gm-Gg: Acq92OGRHy7fQmKocYTabX+tFjdwFubIpWJKlvrgw8+/UyRXtiZVNTxmSjSs+invDGS
	nMZYsdsaMeLCQbIXufEX7UMpfbOWpjSpBR1eQET4btoMKZ53GOF2Qz8r4WwPiGyGi/W+BXGoOda
	qR6Xzv3nxXb6Emd6N4nwXww8zA3ulhynJ/5Nmaw6lMCGcKJnpyKWDXt7Xga7h8PL4bPxyWBs+zy
	ejzbP4Dd07A2KNVlJiwuQeOuH+/HyQSTVMUvATulf1UgW1xcsrRYft/P23gsvMwNYl/uqfeYV9J
	T3EIeCgs5XB4IBVkejV+gVTCel33a22ZaZnznN9Dwsv93ptDJw1YaiA6Xx5t9gQpE6YcDw==
X-Received: by 2002:a05:690e:bc5:b0:65c:7129:5c66 with SMTP id
 956f58d0204a3-6626d1487c4mr392669d50.41.1781161845515; Thu, 11 Jun 2026
 00:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260611043317.512843-2-sun.jian.kdev@gmail.com> <20260611045842.7A5B71F00898@smtp.kernel.org>
In-Reply-To: <20260611045842.7A5B71F00898@smtp.kernel.org>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Thu, 11 Jun 2026 15:10:34 +0800
X-Gm-Features: AVVi8CdiSOLVCehH25tG7w7TBAKHBVE1AWI-I4Fj09Gt1yRAE0iIiUg_XBa2Gaw
Message-ID: <CABFUUZFQXxYVdi_QqhGG8WTTf=F1BqOmroYj50mv0w70Acf5Bw@mail.gmail.com>
Subject: Re: [PATCH bpf v3 1/2] bpf: Run generic devmap egress prog on private skb
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 12:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Critical] A maliciously crafted or buggy BPF devmap egress program can=
 cause a double free of an skb by returning an action code that implicitly =
casts to a negative integer.
> - [High] skb_copy() zeroes out skb->mac_len, causing generic XDP to opera=
te on the wrong skb->data offset and potentially read garbage from uninitia=
lized headroom.
> --
>
> commit b95ebb55a25ce44657b1e9ee2add3b1177f06853
> Author: Sun Jian <sun.jian.kdev@gmail.com>
>
> bpf: Run generic devmap egress prog on private skb
>
> This commit introduces a fix to prevent multiple destinations from sharin=
g
> the same packet data in generic devmap egress programs by copying cloned
> skbs before running the program.
>
> > diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
> > index cc0a43ebab6b9..14506834345aa 100644
> > --- a/kernel/bpf/devmap.c
> > +++ b/kernel/bpf/devmap.c
> > @@ -512,8 +512,10 @@ static inline int __xdp_enqueue(struct net_device =
*dev, struct xdp_frame *xdpf,
> >       return 0;
> >  }
> >
> > -static u32 dev_map_bpf_prog_run_skb(struct sk_buff *skb, struct bpf_dt=
ab_netdev *dst)
> > +static int dev_map_bpf_prog_run_skb(struct sk_buff **pskb,
> > +                                 struct bpf_dtab_netdev *dst)
>
> [Severity: Critical]
> The return type here was changed from u32 to int. Because xdp action code=
s
> returned by bpf programs are unconstrained 32-bit unsigned integers, what
> happens if a program returns a value with the highest bit set?
>
> Could this arbitrary unsigned action code be implicitly cast to a negativ=
e
> integer, causing callers to mistakenly interpret it as a kernel error?
>
> >  {
> > +     struct sk_buff *skb =3D *pskb;
> >       struct xdp_txq_info txq =3D { .dev =3D dst->dev };
> >       struct xdp_buff xdp;
>
> [ ... ]
>
> > @@ -521,6 +523,18 @@ static u32 dev_map_bpf_prog_run_skb(struct sk_buff=
 *skb, struct bpf_dtab_netdev
> >       if (!dst->xdp_prog)
> >               return XDP_PASS;
> >
> > +     if (skb_cloned(skb)) {
> > +             struct sk_buff *nskb;
> > +
> > +             nskb =3D skb_copy(skb, GFP_ATOMIC);
>
> [Severity: High]
> Does skb_copy preserve the mac_len field?
>
> Because skb_copy allocates a new skb and zeroes out the structure up to t=
he
> headers, mac_len is left as 0.
>
> > +             if (!nskb)
> > +                     return -ENOMEM;
> > +
> > +             consume_skb(skb);
> > +             skb =3D nskb;
> > +             *pskb =3D nskb;
> > +     }
> > +
> >       __skb_pull(skb, skb->mac_len);
>
> [Severity: High]
> Following up on the skb_copy question above, if mac_len is 0, will this
> pull 0 bytes instead of the expected header length?
>
> If so, the data pointer would remain at the mac header instead of the
> network header. If an egress program later modifies the ethernet header
> and triggers the mac update path, could this push the data pointer
> backwards into uninitialized headroom, leading to protocol corruption
> or leaked kernel memory?
>
> [ ... ]
>
> > @@ -710,7 +724,10 @@ int dev_map_generic_redirect(struct bpf_dtab_netde=
v *dst, struct sk_buff *skb,
> >        * return 0 even if packet is dropped. Helper below takes care of
> >        * freeing skb.
> >        */
> > -     if (dev_map_bpf_prog_run_skb(skb, dst) !=3D XDP_PASS)
> > +     err =3D dev_map_bpf_prog_run_skb(&skb, dst);
> > +     if (err < 0)
> > +             return err;
>
> [Severity: Critical]
> If dev_map_bpf_prog_run_skb returns a negative integer due to an implicit=
ly
> cast unsigned action code as mentioned above, will it hit this error path=
?
>
> If dev_map_bpf_prog_run_skb already dropped the packet via kfree_skb, wil=
l
> propagating this negative value cause higher level callers to execute the=
ir
> own error paths and free the identical skb a second time?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611043317.51=
2843-1-sun.jian.kdev@gmail.com?part=3D1

Thanks for the review.

I checked the skb_copy() path and this concern is valid. skb_copy()
calls skb_copy_header(), which does not copy mac_len. I will preserve
mac_len explicitly after skb_copy() in v4.

I will also avoid mixing errno and XDP action values in the helper return
value. The helper will return only errno and pass the XDP action back
through an output argument, so invalid action values cannot be interpreted
as negative errors by the caller.

Thanks,
sun jian
