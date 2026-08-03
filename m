Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE2E30C161
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 14:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785768780; cv=pass; b=VsElJFPLDqoNtwgHmqqEETIKongFHU4+lIl/8hldfUANLZap1nfofqC4SXQIPMs3ecHNtN/w34Max8PxSeiOTELW4fshiWJw4Q4kDd/b+v2lGzcyVgPm025WJITOE8bzc91gXVE+cIydnTEGgfzbOgw2wDr2hzn23iKesR9/3y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785768780; c=relaxed/simple;
	bh=/s1sQ2l3V+Zh5c4gyB78SFEqAxnr/utg14r4UNS3vFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CbknhzmpcytcRlNzMLGuw4tt2OcAJP7/8jE75BQOwbjI+yjTCElR0lVCdDQePHxVn0SqIKBVd3+WHAqW9W6ZezRC3lix46hECDPjeCqW1DHUamACfFYxKFqce9wQjktIlpetY4+CKxw6mAfJYJFC9rJk3az/GOpVuAc6szIVyDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBZ2J825; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBZ2J825"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15c42a45adso623177866b.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 07:52:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785768777; cv=none;
        d=google.com; s=arc-20260327;
        b=rmCbU0AlMyBVYe7/C8K0/fhH21EgnLc6qzRIWjVJlNFiUNJYINShoa1JMQ8lTA1eFP
         U++iNnNyIPhwBP35iAURVb+K474qGX5xMkC9mI/dAh7/4+mVMVqj7kdVBbVe8jmtkTnI
         8BsYsFW1MNWvI88WZNlwC2qL5LCE8g1PyhEVHgF1BqzJhO4X/MYYfl8OZpz+MppS5Zj8
         MQulnMn+ihgQ2bb1htOd815eWH4tjCfNK/ic9s5DkFZ24zr76CNUEMwR4uEuAnxveq7V
         xFvgurTym/q/ujKzwD+PAgLG3v1K6R/s+Vwu3kYSLHsejJ7f6gmUglWqk7JTZgj53+e1
         EpHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gaqZa2jsEJ+PXDdqAGoYYjGFntXfTS4TlPa6oioaHio=;
        fh=W4zgvaciPvu+gyNBZoCQAqBlb+JTJZHKnm39esXowU8=;
        b=pp7l98VfEUaRtQT2+7F0t9bvP+8Eq/JcbejC/4dAxI739+Kk3bfdFr/jiVwY7R4Xct
         SPCwqse9/0d/PI7anQNU1v7C0XuYYQNxMlAkurCqLeh1pkrfReRmm0zk0B4l7t93QdgX
         eqABrWOImkouY42iJ4bvZM9NwncPS1L1NYbIy97WySnbETOFDBs4zH28vsuXEBkI1HWr
         8QvkLhJ/mpS0djEm3X/W9qcvx3Qw859fu7TTaWsl7dX0RAeAdtoh5xeQHVnd7VFs9SKt
         iphAF10P9fNqgLIHunz9H7fs7YltOt6RfHW75OELCHfHlK1tqGJzRfRouRIaXAxr2+qr
         +E8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785768777; x=1786373577; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gaqZa2jsEJ+PXDdqAGoYYjGFntXfTS4TlPa6oioaHio=;
        b=DBZ2J825uqR8CSXQ5mv/UVFn0wG8U7YBq3qKqmF4MEycWU6dkpAWU2XNpYObRVvmRO
         zl2oUhXCxFxC52d23ZQnvbs4QnIH81R14+6SBD0pahlJNTpucYptCfJLwEuAyGMs//po
         voYcXcHmVHmb24vISCp1VggSX11A6VWBeLNsl86IBkyek8QP0dJKx3Pg0lBnhTJ9TJOt
         Xkyv2/qpcH/fl5HGG++qyI7nVrs6twQV9kZ7kSdTkpIPrwdw7n0fNr6+NjYzqSSUjm5D
         xVfcGiB3btLxIhKxVWqyKfGHix+3UQemy6/HwfQQ69O3VnanUn8+0kBSB2EaZeL12WTb
         bYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768777; x=1786373577;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gaqZa2jsEJ+PXDdqAGoYYjGFntXfTS4TlPa6oioaHio=;
        b=eVAPzyOXTFPWtmp+inRd5ixw7JFdbyVq9LAnMIJ4GdCtvf9+9I3geJVlFFSP2/UpcH
         FBtzkT/0zibe9XZOMOXKD2t59KQz7iW0z7z8EbIjuFnpRo4FCcGYU+jFYdPce7hnRgw2
         F7uXaPo2swfJjlA5KnVxhwnMn4yI9KxJs/7HtGIhCUvZdzY5H5rCP1Gz7O4vmf6cFcTo
         hV1eDEHLRlrbA3quh0e7k2D1YwbtUvFsTXFGh1Wkp6LUtFIltORli42zMSbPU8mCRa4h
         9IN8qv6E5eFxwvXAZbywLTWMAT4IG7eKmbYMyKAAPbFFAkxWtSv69wQXS1J/jwBYh9yQ
         ItVA==
X-Gm-Message-State: AOJu0YzW6VUh1iwy2sXCYOpXoDP0yAXlFOWYgS08F2lXQHr2GA6LXiSv
	t6ekFALftYsxmzd5gHQczTJ/RM1UeGxpK4Wk8vDBq8Q3Rpk6xzhPFGdjjeMAi7dO+gft+RNTTGh
	sHO/s2PwC2/CDplBfi/Mt55Rxdr1ePdYHGS5H
X-Gm-Gg: AR+sD13zjQ/D3X3lEdpY+mS4Mn0HLvnlX4e79Xfwt53qXQxFaM0+F5YQm6yj9h0GVQQ
	W6EtaqH2EZDd+3gfpTrcTII07criRjfcyUv8zR3osmSgbAcdGR4SX8j9bj2NJYeEyukeplotEL4
	/hvFCb/Q0aAUvTS/8LRYMkfsmgRYMvvvylgBU75sV1/LT4vjJwVCaQrTLekWmvytQ4RewsWZD6r
	KkoOwoy7xa+kSGpVqfe3esrZQNFpsO9AuH/Ndh7ld63TsYH6XqNIfbzxKyyP5XsI7Ay76p5OSG2
	vds9SqIufqN03sN2ZIdtIm924tiKMA/pErkDcHIXFrBDMhXI2pC+uiTPfdFXBGAT7nER6No=
X-Received: by 2002:a17:907:1c18:b0:beb:d461:7b09 with SMTP id
 a640c23a62f3a-c1fe79cb8d4mr727328766b.11.1785768776864; Mon, 03 Aug 2026
 07:52:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803134839.2103051-1-puranjay@kernel.org> <20260803135329.2327280-3-puranjay@kernel.org>
 <20260803144919.2D8C31F000E9@smtp.kernel.org>
In-Reply-To: <20260803144919.2D8C31F000E9@smtp.kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 3 Aug 2026 15:52:42 +0100
X-Gm-Features: AUfX_mwMzyeDA_Llb19LD0lSRMTtOT-ohduGZiy-4600iqiO6ncPTdl5EcnNmtQ
Message-ID: <CANk7y0j12i-Ck9h=Lh-tVD2wv=rp-OKydnkX=tz0436Sgr2GdA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] srcu: Make call_srcu() safe to call from any context
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 3:49=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Tiny SRCU's call_srcu() remains unsafe to call from NMI context,=
 leaving it vulnerable to list corruption.
> --
>
> --- Patch [3]: [PATCH v2 3/6] srcu: Make call_srcu() safe to call from an=
y context ---
> commit e3be0303432c7c7afdd4ed014dae0987e25bf7d3
> Author: Puranjay Mohan <puranjay@kernel.org>
>
> srcu: Make call_srcu() safe to call from any context
>
> This commit updates Tree SRCU to make call_srcu() safe to call from any
> context, including NMIs. It defers callbacks via a per-CPU irq_work when
> interrupts are already disabled to prevent list corruption and deadlocks.
>
> > srcu: Make call_srcu() safe to call from any context
> >
> > call_srcu() has the same constraint as call_rcu(): its callback list an=
d
> > locks are only touched with interrupts disabled.  srcu_gp_start_if_need=
ed()
> > enqueues under raw_spin_lock_irqsave() and may walk the srcu_node tree,=
 as
> > do callback invocation and grace-period work.  A call_srcu() with
> > interrupts disabled can race a list operation in flight on this CPU and
> > corrupt the list or deadlock.  call_rcu_tasks_trace() is call_srcu() un=
der
> > the hood, so a sleepable BPF program freeing an object can reach this.
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does Tiny SRCU also need a
> similar fix to safely handle NMI contexts?
>
> In kernel/rcu/srcutiny.c, call_srcu() relies solely on local_irq_save(),
> which does not mask NMIs:
>
>         local_irq_save(flags);
>         *ssp->srcu_cb_tail =3D rhp;
>         ssp->srcu_cb_tail =3D &rhp->next;
>         local_irq_restore(flags);
>
> If an NMI interrupts call_srcu() exactly between assigning the tail and
> updating the tail pointer, and the NMI handler invokes call_srcu()
> (e.g., via call_rcu_tasks_trace()) on the same srcu_struct, could this
> overwrite the tail pointer and permanently detach the list?

See next patch it fixed tiny srcu.
