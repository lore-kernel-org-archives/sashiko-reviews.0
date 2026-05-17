Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE4823507B
	for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 01:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778982629; cv=pass; b=loRetySM5OH0bwRZ4yZlqL/F8dBrx4c8fhljSADIo5BSCpYSnSlnVYljtQJOM3bZHvXXJXmHwtKHHbaLiX5S0ukEUzfcAYiNfdO0GIU9ZHl5LzEYah48bOTd7e7FIR6AvihzYu+GpBCpCBGErjdicTo+vvhNoNRL1FzUFJEdf+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778982629; c=relaxed/simple;
	bh=nYJ1lQWEQZMAUa8pscubpFTZASsZvEJcD69gXaCEt2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFO/YaSQd3YLSO9VcLTrttB32y6h591tNDPXUVle4UAoi7z5CV57kn3jgxOU3mj4SoCMs0DlMBYFNJwL/tCTJco+Qc2PHFN/lyZdKHD2Y1ZQ4EG1ltbhQuXqiaCnCglxDvyXk2BCqUBjypJ4D9Dhis6LzAbkNbjWyuHdabWwUIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5LE2+we; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5LE2+we"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a995ab70d1so1812212e87.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 18:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778982624; cv=none;
        d=google.com; s=arc-20240605;
        b=B61BPlFlSkHGZoM/Ub8gAWbR3G7GwOmA70t6FxsdbvWLG0h6bvOiOot/5iLjuG9slj
         qawLbcNHcoA96xWbnE22L3RkWWghmgc3id89LH3hZRhW8xtp1iQ3lFxjBknfyYIjfsNt
         3pOV/m/K4YLaCcM4dgqU2P0irHg6W1ApnlLlgIYIcj1I0GUNyqhA5zAhrDZizSNjGfIm
         69XCrpSwqkalo8oY+YbhdlK7SfgWtFqECvCsumhjkUUoCb91ip3jop9mlnVbJ5QlgBmN
         tTj/9NMR3saQgjjAjzdpaUl07siiUtBLNf4cIvad0y6AhoA//wrGhVaT7nYofaYKM8jG
         GOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hOEykRQTpFKMfjOoZ1QFIYhrfxe+UpeYQRXwMBS6ryU=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=Omuv13WfEoqJcAcn1tcXIpAlJiDbtmbjsgwOZ8x/Jnxbv3pM37SVG76aFa0p+JiP1H
         /Bb4kwDBbJdSpeQa93TLgmBFufJ8qL3zHeg1n7zf05X+5z8yKrgoJRh16om2/rnNU+rx
         PZvZ5IOKcVWDD/9FRSaVENwDYZV4g3oil+lu1pEWWyA4iboDk2ib3OrYleyBuQ2wKXj2
         srbOy+ckAH1Ob/jAX1L7ez7V3pG85+1oCC/mFzN1KKPcUAOk1lCazLG7p+jMcTlFepdK
         9pMjkL/pZVXTHGMUkK3o/ge0ZeGFZhimfMa39tUMfJMuaKnbGeYiypbTWjzJoqo7fDqR
         IJIA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778982624; x=1779587424; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOEykRQTpFKMfjOoZ1QFIYhrfxe+UpeYQRXwMBS6ryU=;
        b=Z5LE2+weWBF+F3ge/Zk/QRAXkpJhkydK7Gozi8IDdikoL+7R8VR9q+oNyVCXfChwva
         RhC46F3iem7Q9ePxmR0CaYo2YFXDoQ8em8YxYz8c9BydxCGPsIYb5F0s9Cy0njzxdeMl
         Z1+B4wfZJXOp58o9EbOXhAsapHuppBPGH/J0GnNA9+DU+Fdb6OhMvRAo+EGvbdOO3znF
         OMTTg7H065n6McBKeOoziiGHwZkWtdthdvtChbQgJ3MeK6hYO30Dd1nZ+5XCn5xumXI8
         819jGbeUcAdbSonxHnWjemJsi3Fo/jMK2KoivaWKph2Exne89IzHjBjKD/Oyak8ufI4X
         OctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778982624; x=1779587424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hOEykRQTpFKMfjOoZ1QFIYhrfxe+UpeYQRXwMBS6ryU=;
        b=gAOvDscHeDksHthQKP0Q4gNWA+Zi90ZFPwGRW69VNHpGXXOghm4vP8MnsmBPJrmrM1
         XaqHrPlo6JueNBCiaGKvL8LptivJ+OzQYA9VStVTa8rBYkKTaY+bZHsQYdDFLL8d6M8T
         X9vbCyISEXOSGwKcOj8tYk2bcb8KOY3G4DdodZZdbeKyqjDJlQNErwlz3h6I0kpk5+tO
         efCCuOVzHcA/C37kv9kRZp8LZmwQchNYYinRUMjxKwvqeo9+4eICXkb7WuXpi6lgT+NR
         2g/H2wnHNDq+O8saMwVA6oCAyB95R+KYoC3Clpk6gvlne5i5qXZ23s7tI/zVvEzleZXJ
         sNWA==
X-Gm-Message-State: AOJu0YxasI+IHdy1o6HDpZNZQX/s4INcofg4jIdfDiekH+zsSHHqGm+Z
	Mo6OyN1YnzSlxng/cM1HeLnCDr+PwQyCXnuR5suUePVlQiHNRZjP/LA+RTw22x49lembWVK7zKe
	/GW8DjUS7EhO+7f5UrRvtake5h0IP7di5FFBu0c4=
X-Gm-Gg: Acq92OEQoaMwOq0ioltB/RATC7rgFY2jL5bBZqmbIfZyeFc8Fqo74pL+H5aQH5+wDF/
	04BL3CEqeXzk+qjFnRclO8pbEbJtBPc3vFQ7jNx5OG6xlsDZPBqUNqUzOAtq4gv7NXSZ5KbCunz
	NQCsN3sYBjhFTH5Yqn8bULJA/feej99sv4HXTvTMAAitwTTp3gq2DQy2OgzqGCko8aHU491/2E2
	e7rzLofX7K33dWVqV79UU1r+2mBDcnpoVJGbwZFVx8ZJWYjHxhYuw/XyOSTLciippKLpNWheo8a
	ePNijfbDzPeMFUhW2pWqwaUmNJPyUluLY80Tzjs=
X-Received: by 2002:a05:6512:118a:b0:5a8:e32f:6edd with SMTP id
 2adb3069b0e04-5aa0e5baa13mr2904320e87.0.1778982624275; Sat, 16 May 2026
 18:50:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515123018.80147-4-kerneljasonxing@gmail.com> <20260516123127.1A234C19425@smtp.kernel.org>
In-Reply-To: <20260516123127.1A234C19425@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sun, 17 May 2026 09:49:46 +0800
X-Gm-Features: AVHnY4IkiF7kus0UIm1_JsybGIshEID6rvZs8CBtI_oGvGHBAcRvdcmb7VqBtVo
Message-ID: <CAL+tcoBbv-dO9CEm5cWHyZ7Xt4siJfvWuWndizXX5KYO65xFeA@mail.gmail.com>
Subject: Re: [PATCH net v2 3/5] xsk: drain continuation descs after overflow
 in xsk_build_skb()
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 8:31=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] UAPI breakage and transmission batch abortion due to returning -=
EOVERFLOW to userspace
> --
>
> commit 1d238b3786b35997fb62e781dd7528f204ca8b34
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: drain continuation descs after overflow in xsk_build_skb()
>
> When a multi-buffer packet exceeds MAX_SKB_FRAGS and triggers -EOVERFLOW,
> only the current descriptor is released from the TX ring. This patch
> introduces a drain_cont flag to properly handle the remaining continuatio=
n
> descriptors, preventing them from being misinterpreted as the beginning
> of a new packet.
>
> Link: https://lore.kernel.org/all/20260425041726.85FB3C2BCB2@smtp.kernel.=
org/
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 0a6203c425766..9c51eed6ee99c 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> [ ... ]
> > @@ -1062,6 +1064,26 @@ static int __xsk_generic_xmit(struct sock *sk)
> >                       goto out;
> >               }
> >
> > +             if (unlikely(xs->drain_cont)) {
> > +                     unsigned long flags;
> > +                     u32 idx;
> > +
> > +                     spin_lock_irqsave(&xs->pool->cq_prod_lock, flags)=
;
> > +                     idx =3D xskq_get_prod(xs->pool->cq);
> > +                     xskq_prod_write_addr(xs->pool->cq, idx, desc.addr=
);
> > +                     xskq_prod_submit_n(xs->pool->cq, 1);
> > +                     spin_unlock_irqrestore(&xs->pool->cq_prod_lock, f=
lags);
> > +
> > +                     xs->tx->invalid_descs++;
> > +                     xskq_cons_release(xs->tx);
> > +                     if (!xp_mb_desc(&desc)) {
> > +                             xs->drain_cont =3D false;
> > +                             err =3D -EOVERFLOW;
> > +                             goto out;
>
> Does returning -EOVERFLOW to userspace break the expected UAPI here?
>
> The original code suppressed the -EOVERFLOW error to silently drop the in=
valid
> packet and continue processing the batch:
>
>                 if (IS_ERR(skb)) {
>                         err =3D PTR_ERR(skb);
>                         if (err !=3D -EOVERFLOW)
>                                 goto out;
>                         err =3D 0;
>                         continue;
>                 }
>
> By using goto out with err =3D -EOVERFLOW, doesn't this abort the transmi=
ssion
> batch prematurely? Any valid packets queued immediately behind the malfor=
med
> packet would not be processed during the current system call.
>
> Additionally, if the batch is aborted before any valid packets are transm=
itted
> (when sent_frame =3D=3D false), the __xsk_tx_release(xs) call at the out =
label
> will be skipped. Will this cause the global TX consumer index to remain
> un-updated for the dropped descriptors, leading to a ring slot leak from =
the
> userspace perspective?
>
> Note that a later patch in the series ('selftests/xsk: fix multi-buffer
> invalid desc tests for drain_cont') acknowledges this behavior by modifyi=
ng
> the selftests to tolerate the early return, but does this actually fix th=
e
> underlying ABI breakage in the kernel?

Yes, Stan also pointed out. I've already removed this part in the incoming =
v3.

Thanks,
Jason

>
> > +                     }
> > +                     continue;
> > +             }
> > +
> >               skb =3D xsk_build_skb(xs, &desc);
> >               if (IS_ERR(skb)) {
> >                       err =3D PTR_ERR(skb);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515123018.80=
147-1-kerneljasonxing@gmail.com?part=3D3
