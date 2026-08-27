Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC56940F730
	for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787826826; cv=pass; b=HbB1oMIdpQVJp/ndfTnku27+lFM1s4qt8MVrCiMnUwGBArIylzwlZMCvkTcH/O5IMkxYAfRPsWcHdCHBa7rhOtFi46u3P3ZfMVeZ0tpgziY7rByj9s0SU/9yNeIsy6rspb3g6n3DhDtMgt2zZc0EBq/3nlou2unn31kW23K4uas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787826826; c=relaxed/simple;
	bh=KGhnaUEwIzXBqIWGQ/6ZDCdDoFWPzxMEPr1HCeR4y58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/HQZ7jtlyLuWxpFMPbuDOgb5pQtdF5Jyt4dnfQBy6QvFWlZOg/YPyWqDk4M8Hv9R28QkYdAyv6KZ9a5AvGgCxqAoX270MCNfLNrbv2c5zzq1MnUNFY2rFNIxA3BVxYonr5kge3VNR7SezdDrtcaBSJYLci6XEpF0MF3oTIKzYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtEZgnCi; arc=pass smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtEZgnCi"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4af7283bf83so1466130b6e.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 03:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787826822; cv=none;
        d=google.com; s=arc-20260327;
        b=EVRdq3nS/XVWveJFylq1a5Evb3W4oMc6hRvvJQJ+IaBb7TIoqeCHn54TsJSeGJ8V6H
         i5z1LHGL+mG5aZd1TzMOvl4eR7uQy+TfHxR1cjVyiiPWER8zQOCh1w2ovX4GQ01OoORc
         jymKaMvWdpjtT1/T8Ks9DTuutJFqD3SwHqTjrIlYW3eYD7ATrDsKoSltng2VnNBFbUI1
         RxnbLtDKTKEelTwhNY9vWcgd4Bpcos5WMjIvShEDWZ3XIg8tcxWW5WE+AhW3dBUnN8sD
         StNhkOfJwO/nN+uYhgYsniajDpxXRUrPvDMxGRcBZWUyb0FyrmMz/UU2o3c6iilX57+P
         W3cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/J4+zWslzd7v8Hb8+D1FNou+n4APw0wKKRPrdHi8DTo=;
        fh=7uoEFh05A6iq3eNvcxEMnK0a+SynQ14jGSPE5a9thG4=;
        b=mFIrHB7Fl0/gRITD/d61GRPZm7EnGpf02hW1QWJ4a1+uguI6Plj8W0HviFfrETjO09
         +TyQ30IaZd8d/WE0v9Kx8PziCsygvkrqj0VSLDJZC8K/xYEsOgX9PqrznnVSC7aEaPYq
         7fGBvXVWSM3EjszRi9ao9AvJBrR+6ERZus72u+xazlna4oWgVnOhkwKxnmDXQgCRVy/T
         Gld1YDE2ZHBr47pw2lsvTG51awElcWCG8LK9LqtfdYSpEYC+lPRB7WkSK+My2T3BuOV6
         JzlooM1m9CUg7LN+TuHQ13gYLjoSqi7bvpWy6/xt3Rx6ziR5/bDnpdDLWYp7PrFGMPXM
         jqLQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787826822; x=1788431622; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/J4+zWslzd7v8Hb8+D1FNou+n4APw0wKKRPrdHi8DTo=;
        b=YtEZgnCiY/EPTjVWG34kun6cI9LOKhdijRRLcFS9T9G1C5vnH+GwppwcP+WORehs4N
         1W6C3BdJbTdGjzfmWwa8KTw5KokydGpWRZ/qo+Ccup7+DRjuendzGzoQxNPrYU4zzHab
         vM1Ni+LsGl0S8coaq8GUAkIGvqL/e+lr6kJ4/HjWcAhDfoRh42rQU9JKVJ1vrP54YG24
         EYXzRkL5D/CeIDFenPex7+9Jam3CFuKK+1PA/t4gDdg5okFeXe+W+wBsQZG7TxYmBQtM
         WDmHs/MNlRJVJghfzYAonh4zoYw3VnbmzNlHJ7hIrcWyFLCrwntOfGvpiGG1deF0gC48
         9qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787826822; x=1788431622;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/J4+zWslzd7v8Hb8+D1FNou+n4APw0wKKRPrdHi8DTo=;
        b=mvmD1UBe13inplxO0cXLqXC6NYxAvuhogGAUMr36/cZJDHbTC4yURyFiVt6NrRekvS
         svTw6A2VWIoYwlEBfC/H/CmpyZHHxMSwXBlBd211PXfkC8dXJybqKZOVZm2TPvpYdb2L
         bL1R4iTU9kAW/ie5irZFSuZMEbWv4+AJQ2ez6rx2iESzJgDhjup+fdsCR8mmue9dsDkX
         HkwCTu3d/vnJQUwiyaLv5uEPgp+ZfE0ab7CeCoNTuaZYpDd7C+hXxuwwggIFW8UGoqBp
         GXYTHJVH2wcZk78X7sTOPhoJCTbz7rC1iqbaZcfxLHqKRYkyRtG8X725Q1bNGG/SrCRA
         Xn8A==
X-Gm-Message-State: AFuF++lo2SlahlZjvO6IUwMBayONx/S0A0EW1Q9jDf5jIWy3DIcg4iA+
	GOAMwReH1LcVgPzstmSwk+QwT4Uw4yTX46oRFbpIbzdlQgQ9uDF1ovo8Xb7uZag6I7bWlAm2LwI
	IiWW0YrDxOrEDfPtf8INXvcVbwmzAc6UdhjALSFY=
X-Gm-Gg: AR+sD123f7MvoGtLqqa+9liMeexXrxSoA+oYr8CUE5SWknL2/QFpnU3nJsAVoNI0Rr1
	2JDCbCXw9UrZgsXtSp1KC8qo1K34Cjog9aNvHzFXSGfzSyJg0LvHQiE7NXTToIsWlWZN+wkD9qp
	3m3MCxOZoHMJ5VLMsx46jh/6BfS6R6z4xzxPecuCgrOSizdqa05csPTFnH+vixuEF3jqGl73Ssg
	+3XoBwOKOOZjIdXN7avJKP/09XF4uXM+WVOiMg5lkpvzG7ZTKDlnwGTik5eRr3dYTtlBcqRut/4
	GphXP4Bn42PuT97eAV6sLkn3Ka1NDakBgnK4i5O1NVkB
X-Received: by 2002:a05:6808:c235:b0:479:f7e7:4a81 with SMTP id
 5614622812f47-4b36635caadmr13710332b6e.0.1787826821869; Thu, 27 Aug 2026
 03:33:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260827051859.45511-1-blbllhy@gmail.com> <20260827053814.E0FFC1F000E9@smtp.kernel.org>
In-Reply-To: <20260827053814.E0FFC1F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Thu, 27 Aug 2026 03:33:30 -0700
X-Gm-Features: AcwNN1U6O7n56pozCKPz0ZzPS2sbkmywmMLVd2N2WSupAdPYymth3eZVW_zVk7c
Message-ID: <CAMB2axPQ1LVXNybsPY7RNa+12+7mtLaahvr0vFL-xHf8sbJK8A@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: Fix NULL pointer dereference in __bpf_sk_storage_map_seq_show
To: sashiko-reviews@lists.linux.dev
Cc: "Cen Zhang (Microsoft Security FORGE Labs)" <blbllhy@gmail.com>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:38=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Socket local storage elements are removed from the RCU-protected=
 BPF map inside the socket's destruction path (`__sk_destruct`), violating =
RCU-001 rules and causing a use-after-free of the socket because the socket=
 can be freed while a BPF iterator is still using it.
> - [High] `bpf_selem_unlink_nofail()` concurrently sets `SDATA(selem)->sma=
p` and `selem->local_storage` to NULL, causing guaranteed NULL pointer dere=
ferences in concurrent `bpf_selem_unlink()` and `bpf_selem_unlink_map()` pa=
ths.
> --
>
> commit cabffb2f3787054c5c6ba2a413eaf5dc639ba23d
> Author: Cen Zhang (Microsoft Security FORGE Labs) <blbllhy@gmail.com>
> bpf: Fix NULL pointer dereference in __bpf_sk_storage_map_seq_show
>
> This commit addresses a NULL pointer dereference in
> __bpf_sk_storage_map_seq_show() during concurrent socket closure. It adds=
 a
> NULL check after re-reading selem->local_storage to prevent dereferencing=
 a
> cleared pointer.
>
> > diff --git a/net/core/bpf_sk_storage.c b/net/core/bpf_sk_storage.c
> > index 1d295a8769fad..7228520aa2b6e 100644
> > --- a/net/core/bpf_sk_storage.c
> > +++ b/net/core/bpf_sk_storage.c
> > @@ -806,6 +806,8 @@ static int __bpf_sk_storage_map_seq_show(struct seq=
_file *seq,
> >               ctx.map =3D info->map;
> >               if (selem) {
> >                       sk_storage =3D rcu_dereference(selem->local_stora=
ge);
> > +                     if (!sk_storage)
> > +                             return 0;
> >                       ctx.sk =3D sk_storage->owner;
>
> [Severity: High]
> This is a pre-existing issue, but does this patch fully address the
> underlying TOCTOU race?
>
> If a socket without SOCK_RCU_FREE (e.g., AF_UNIX) is closed, __sk_destruc=
t()
> in net/core/sock.c calls bpf_sk_storage_free(), which unlinks the storage
> from the BPF map.

It looks like a valid issue that should be addressed in another patch.
Probably need to defer free in sk_destruct if local storage is used:

#ifdef CONFIG_BPF_SYSCALL
      if (rcu_access_pointer(sk->sk_bpf_storage))
              use_call_rcu =3D true;
#endif

>
> Couldn't a concurrent BPF iterator in __bpf_sk_storage_map_seq_show()
> operating under rcu_read_lock() find the storage element before it is
> unlinked, and read ctx.sk =3D sk_storage->owner? The socket is then
> synchronously freed by __sk_destruct() without waiting for an RCU grace
> period, leaving the iterator to pass a dangling pointer to the BPF progra=
m
> via bpf_iter_run_prog(prog, &ctx).
>
> This appears to violate the remove-before-reclaim ordering (RCU-001) sinc=
e
> the socket is removed from the RCU-protected BPF map inside the socket's
> destruction path.
>
> [Severity: High]
> This is a pre-existing issue, but might this only fix a downstream sympto=
m
> in the iterator path while leaving other concurrent map operations
> vulnerable?
>
> When a socket goes away, bpf_selem_unlink_nofail() in
> kernel/bpf/bpf_local_storage.c sets SDATA(selem)->smap to NULL without
> holding local_storage->lock.
>
> If a concurrent map deletion calls bpf_selem_unlink(), it acquires
> local_storage->lock first, sees selem->snode is still hashed, and calls
> bpf_selem_unlink_map(). Could bpf_selem_unlink_map() then unconditionally
> dereference the now-NULL SDATA(selem)->smap, crashing inside
> select_bucket()?

Callers of bpf_selem_unlink_nofail() (i.e., map_free and destroy) do
not race with bpf_selem_unlink() so this should be a false positive.

>
> kernel/bpf/bpf_local_storage.c:bpf_selem_unlink_map() {
>     ...
>     smap =3D rcu_dereference_check(SDATA(selem)->smap,
>                                  bpf_rcu_lock_held());
>     b =3D select_bucket(smap, local_storage);
>     ...
> }
>
> Similarly, it looks like bpf_selem_unlink() could use a potentially NULL
> local_storage for lock acquisition:
>
> kernel/bpf/bpf_local_storage.c:bpf_selem_unlink() {
>     ...
>     local_storage =3D rcu_dereference_check(selem->local_storage,
>                                           bpf_rcu_lock_held());
>     err =3D raw_res_spin_lock_irqsave(&local_storage->lock, flags);
>     ...
> }
>
> >                       ctx.value =3D SDATA(selem)->data;
> >               }
> >               ret =3D bpf_iter_run_prog(prog, &ctx);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827051859.45=
511-1-blbllhy@gmail.com?part=3D1
>
