Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4563E00AB
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 14:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780671311; cv=pass; b=hS6J25qs2jpKoe+AHWN2ebmcnnGiDtobl6PZXSlAaEGu32p9eQozZdaru8V6qzMgCV8nIeYu057ndQhsuyy7ZnocYjQEl2kp0nk7SHgZlwhFAEms1db5b6XpwKXLdPxoIBqKmnRAkRQLxkD8xOoScP8vOog4wO7rYE6E0WlnrTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780671311; c=relaxed/simple;
	bh=uAyomS5JQN29ENBomMwzxMcVDyQgqPKS6joeV5zeK/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fiqZa3wsBvcj/m9SS+Jisor0313Oyt5zDo1e5Bxl2JnYzfASbxb8Reb0txS7JVc+mQOf6NR/V8I6YUyzhHDeuk/7a+yv63B7IldUIZplZcK5rxUWMl9DSm3DEIlMObAvYZW9diA3ACKiYnPET+XwVQPWtKTNoz2/P359YVYRQto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GmQkpPj8; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GmQkpPj8"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef5146b56so2018728f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 05 Jun 2026 07:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780671309; cv=none;
        d=google.com; s=arc-20240605;
        b=ZXLoQg7o+DbbuPloD5DDzpNV3G1/QLa+//I6hABof5wiNjelKPE7pgQsxSZepaBThe
         FKo4Jm8E5nMTH3yac/94S/BQYZWgmSFRL2hSET6iABSzHoNegT0XCClDgu4OhpFafcVc
         4wndZDJKKtmo8d6m9TAt0Ekp/PBXFmEV35iCox70tnKWfb0pN8/N8LvI2RKPiO4/6a+k
         7pUqmQbZPEpWSzDeWzqlx3ONI/i4tSUySR1IoohQsRtjYKVYIW9LjNXafAm3G/afuFIY
         TaFraVUftUKlB0vO97JPcNTbFKtJjaRiR2V77SbY0uCCL1U0H2dZLEW4bzuYxpnpCHSn
         sxwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ga5I8YlfP9EVgN78rA8flUbrTYvBmVk8NvjmWyk37Eo=;
        fh=Ubq1rulsywyCU10+7K7q/O35o4WLROh46KME/Dc8mdA=;
        b=ZSEpIsq9byhioEx8PyB3ODzi0Eg0vuHoiX08QLC8bRYJUvxxrnQN2ahcVLMrOJQLAN
         eFpgck3AEsxhPClwCsg7VoEIFIOXOgvFXEzEJ8ykB93udJwHeeHIrvCT9LOHAbkUZRBL
         NU/UYDdXkJz90DIwlFmGFUI62jbBh8wL5DjTRKFsrvhTi6jZJJ7meIgqvV5lCRbAef5E
         wFWM9r8qnaPKQ14SCWnTh5EcZFqXdBhJC5H/l5Lv6jEauFnaPT2AQQZL16ZAKoXn7LRF
         5q2kwbr+pUU5UzOJg2sKZuuRd9RHEhnjLQGr8uPgEfNcZsEkYeYZ8VrZYVEiZ8YCYLnO
         20Og==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780671309; x=1781276109; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ga5I8YlfP9EVgN78rA8flUbrTYvBmVk8NvjmWyk37Eo=;
        b=GmQkpPj8Ku8ppv9SmiZqFLEUpj1v43sUr0Z7V3jY7W3m2hYEEZZwgIYaTUG+32J8tT
         zSSiyIC/FJZIkBmnY5Fn2ivPyAVEtTWgZmyqbuJLxMAhUWuz51eHuGh2VNize/cHJQZ3
         a9f1D5oX5wXi7v/GluOR7oLSzrbB7lHIUmKiQ7Fs5+AGj5GB+astougrKdjZ2yeIVhYA
         1vFw2aPKvVj94HA1XQi/iPtxkiPXMkCyZblVpwpJYeinc0e0fUUWixu37imicIXdqTeG
         LtG45fa5RdZ+l2pcD3mBDTLrIcHDPnrRsfp/2Rd8n7S10PsQkpLoz33NvFFruz17py2L
         NdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780671309; x=1781276109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ga5I8YlfP9EVgN78rA8flUbrTYvBmVk8NvjmWyk37Eo=;
        b=W8fH26zmCY/jCRB2rTbrQWIb5cL+do6Axmds8nQl/CUSJnltJDwmaSiZBKj9/cUB53
         1qa7URQfCnZhUUvF5DbHLeyQW9EW6EXKEsHm6TEwUATHBO4k6yuiAE8Fg4HsV5y2IPpc
         XqQeE54CJWvAnh7hhM5heB6t9v0ajXv+EwddL7jShvZQna7N0bRaK6IjHZHlPpVRwIip
         FAfDbA1d2Oe/fXP6PaxJmQhom1TfIgGcS9aTOmfuOqvSx5j8rbj02mhcKwHX/cR1aij5
         QhOS3sCeG+aWEI3eKIF/WYLwa1EaDE4SK4Vy7n+JnGSbLOFOnpP/AFzk7A92OrQyyktz
         P8Bw==
X-Gm-Message-State: AOJu0YwAIM+O3HsyJq2Bpam2l80kLkaq6TMycRaiTixD7tjhYcIcaGEn
	VGyX56UBc/AmNJ7r+fCor/5U4upPLNu2lM9QQO2u4ot0zGraztGKx+Ry0aOZyhHHxxjCkFGmCzQ
	TU/IvDB93JTMexI59867V/ebV+J6uCzuEaAPKC8k/
X-Gm-Gg: Acq92OGaEKh8jmrV0eCf1dpLXXBnliU96zdLVE/E4qNtEaXfRF4U3wSUT495mE/uZ6g
	o37qiMerR8fHZY/xZiXFsi6/fTCfB4V7aTfVCIbe6VkYJFkpwlQ5vaMHQ72on3V8UBoCqVKf+lT
	9TeAoivcXxwjaj4WyCzVGKFR8QZTnCjqhIf1EhGZzDpUioQiMSN1MgXIutACdlPo97dMbD1pX2H
	AlHtv5gjqKwXKwBmJT+HhN+TwvcbKham+YYR4j4yAf0h9/tLeOwAh/uTriGm0WBRIrtu0AZJgQ4
	zkzv+C1d87r2kJRH98hDGOLt28pPy2LtPeMzpfpISUaUcOmN
X-Received: by 2002:a05:6000:4312:b0:460:395c:7404 with SMTP id
 ffacd0b85a97d-460395c7421mr2318434f8f.20.1780671307856; Fri, 05 Jun 2026
 07:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260605133541.22569-2-boqun@kernel.org> <20260605134935.B6C0E1F00893@smtp.kernel.org>
 <aiLgJkKzwEDGWNtY@tardis-2.local>
In-Reply-To: <aiLgJkKzwEDGWNtY@tardis-2.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 5 Jun 2026 16:54:55 +0200
X-Gm-Features: AVVi8CcIvUHIO2p_9VW6ZHI2m65-lN84pQk89kmG3nnyyy__psHz_pZWj_Nq3k4
Message-ID: <CAH5fLgimUgbK_dVwq7RQimOugqJka2bM_u2r5S=3aze_8uCnbA@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: rcu: add RcuBox type
To: Boqun Feng <boqun@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, ojeda@kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 4:41=E2=80=AFPM Boqun Feng <boqun@kernel.org> wrote:
>
> On Fri, Jun 05, 2026 at 01:49:35PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> > - [Critical] RcuBox::into_foreign drops `self` instead of forgetting it=
, causing a guaranteed Use-After-Free.
> > - [High] RcuBox::drop bypasses the custom Allocator A and hardcodes kvf=
ree_call_rcu() for types that do not require dropping, causing undefined be=
havior for non-kvfree compatible allocators.
> > --
> >
> > commit f69c06884595bb68a76f4f1dd4014ee9e2c9e31c
> > Author: Alice Ryhl <aliceryhl@google.com>
> >
> > rust: rcu: add RcuBox type
> >
> > This adds an RcuBox container, which is like Box except that the value
> > is freed after waiting for one grace period (via {kvfree_,}call_rcu()).
> > To allow containers to rely on the RCU properties of RcuBox, an
> > extension of ForeignOwnable is added.
> >
> > > diff --git a/rust/kernel/sync/rcu/rcu_box.rs b/rust/kernel/sync/rcu/r=
cu_box.rs
> > > new file mode 100644
> > > index 0000000000000..943fe3e8974e0
> > > --- /dev/null
> > > +++ b/rust/kernel/sync/rcu/rcu_box.rs
> >
> > [ ... ]
> >
> > > +// SAFETY:
> > > +// * The `RcuBoxInner<T>` was allocated with `A`.
> > > +// * `NonNull::as_ptr` returns a non-null pointer.
> > > +unsafe impl<T: Send + 'static, A: Allocator> ForeignOwnable for RcuB=
ox<T, A> {
> > > +    const FOREIGN_ALIGN: usize =3D <Box<RcuBoxInner<T>, A> as Foreig=
nOwnable>::FOREIGN_ALIGN;
> > > +
> > > +    type Borrowed<'a> =3D &'a T;
> > > +    type BorrowedMut<'a> =3D &'a T;
> > > +
> > > +    fn into_foreign(self) -> *mut c_void {
> > > +        self.0.as_ptr().cast()
> > > +    }
> >
> > [Severity: Critical]
> > Since `self` is consumed by value here without being wrapped in `Manual=
lyDrop`
> > or passed to `core::mem::forget()`, won't it be dropped at the end of t=
his
> > method?
> >
> > This seems like it would immediately schedule the memory for RCU free, =
causing
> > a use-after-free for the foreign code when it later accesses the pointe=
r.
> >
>
> [Cc Alice]
>
> I fixed this locally by:
>
>     fn into_foreign(self) -> *mut c_void {
>         let ptr =3D self.0.as_ptr().cast();
>
>         // FORGET: Leaking it as a pointer, the caller is responsible to =
free it or unleak it by
>         // from_foreign().
>         core::mem::forget(self);
>
>         ptr
>     }

I prefer to avoid use core::mem::forget.

    ManuallyDrop(self).0.as_ptr().cast()

Alice
