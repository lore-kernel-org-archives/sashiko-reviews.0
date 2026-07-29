Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB084B8DFF
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334143; cv=pass; b=T+5Hj+fIeOhyYzNvzE7+vbkHyg9wqTGYPnLMY3qp3AiQxgTfi2IqZKwBbvPkfctmJVovj4oXNUNYJhZKl0q6mltQ5xzAyaWxKBgSN+Nf+ATky8ETlfJzKbTQ/xPlRaDDuvROGSfluNogJkdtAxcB3uveoovoq/vYncs1b2E2se0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334143; c=relaxed/simple;
	bh=C9xtxbuUwTl2/4FiNCbCnz92H6bjM6ISYPijuuaBP7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uxkl4niooELbLs1lwjSe0sgplJO13amaOSSEAWgKUiuvZuyTHs3yrHZPtrwHhkvYTEerNy92ml2DG7FP8bo1KLJ6/wWfYk/c9nvoomEctMzxro/5bUsixrHRp1swjDsnZY7jC780dkMpnyA2OqwgQMODCjBqvJb+c7esV/5B4cQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCWFLhR3; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCWFLhR3"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6685001353fso926264d50.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 07:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785334136; cv=none;
        d=google.com; s=arc-20260327;
        b=L6IhVdwRsgHsgcF6zJ6Pas2tp2BalVXumNh34QxH5rlbdLbcl8EFOkLXZ2DDMhx6rL
         m18qACjUxxiFgco3iONYlq6bnEIJBg4YNe73fp4MH2S3yCmT0GD9uRMyAa9oGmMGCYZr
         D5ScnDsDBPF1SY/jSyhkoIfQqiik6D468TIrUZs5TY+qQ6VwU91EIGMKbnmBiwjXDqz7
         YrcC6Nc6WZOPPEJ5bIQGXEmAf4FmCsUyTfDDtRYlqQPaIDTTxKr2siFviYCIGZnumHvK
         KYB8wyQjSQ5BsuAehQMdv1CngiJzOKiKtTk+SiruChZFc2CrTCED3YvcXW2fQHdOowkW
         acPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ILQW7wTx7MCavtjYKz64KhhUuc2hqgjwomjCvbjS/JA=;
        fh=l7ViLnppvkkSQ+LRUx3Qov8iJmCPcv0PVZg4trlzbMc=;
        b=p/PUAa3QaeVuqO3xSDWFkog9YkeIVaIuGP5lIZLOdvbntsGaSoUzMEDRorDpxx/4QR
         krqE2TCNKvvuJt8dey4PtGj5cJnr/MhD1xsX+ghokVZHh5wusAXHY/g2PCOLGAPBK4TF
         Z4ia4+UMBV1WBuXN+Mr1PGeL0E5xILDPYAbOV0EbCKxStlrtUYEb9ZAPajeFNTG5QVeY
         j4nMQvsUkyaEJRbiVjQMsf8UMAX9+MvtYx4Ke2GYvTKXOcakNcMEQi4xFC2gKDIN2xIv
         mVrTlFX/UKyR6ZlSCUdKy1sgiGQkccguuDcH8uAZGi6vS4DSexds4kNeiB50dQMMo017
         tQxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785334136; x=1785938936; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ILQW7wTx7MCavtjYKz64KhhUuc2hqgjwomjCvbjS/JA=;
        b=GCWFLhR3ENpaYNp1ggYcnrXQfLM6oJeYlp+LBEkrQJmT+MydrgIK2FiAGcknNTxu4f
         WF1PlqiuSPARocAWneMsu/uKoyw0m9K+9f4ekQpVNrWuZzCx9DdCscfYxtiHB2eDJ//v
         C0JKW65iT8aE6RLMpsE5zixuga6PXHwuvBHCoyoCziYUqxfttd+ZcNdOl2jQEJwV5rKJ
         JKTA21w6A9hOzM+ZlWf4c0QvpgsYW9clL8QPW1g5qP1vESkL8vmkZ8m3LtnpNNVoUOO2
         Nc70hihlBxElxPn0yRgnPUZSzsBKMWRv0p37UpDnjvkBltLrUZgBlHr9Ry4oyi3XqNZM
         ExIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334136; x=1785938936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ILQW7wTx7MCavtjYKz64KhhUuc2hqgjwomjCvbjS/JA=;
        b=gUkVOk5+oQt3HkNLLDDWFYpq9PRI3IkEwkDbeidxzzWR2I1/jPLhBfeHTQRjT4MFp4
         iTXFlw0ZlsebozQzspLbSjAf96b1ATbGpOYz3eS3+tRT92p9oyDon16gnp8CAK37mCuc
         xvmLA3Mc6Pa+AMEYjwjBpExcZA13ZKG9TVXQZSZsjve/9bwQ9Dk5wLDn1FCcZunZpSsR
         LiN64I4yALn4vOteL1RFtn7RJZYhYRD4lgvFkGX2B95Sn/bvsrbTep7BqG/iqzniUaNX
         In8ikp/o1B0ZkJDridRzhC8NZ/ive2qSUEV2gPXbvpTNIuU/zkPRSTC3zgid7a71Kjdk
         Lw0w==
X-Gm-Message-State: AOJu0YzGAyZSBtZzFJ7da2MHARrsctMvyV5ad9gHhBOAt3jKpTzYLeuo
	ihL4+9d4vy7Fk6yEUFv8Fbp/IfXlUbxqcCKgf0hSKJeOMnXsjFqIQVto72aQjBCtQqtlZ8kX23s
	WqY+6JYz3igwV7Ztp822zTm1vDrOcB2Ubw5fm
X-Gm-Gg: AR+sD11getY0dWjl3RZy2SCH7fZTtj6NajhkOBwpvgBvfvhrnpqSe2SaCHK4x0C6gTt
	D7g5peDqV2nSrzrpheW9wtOANz4IThRqe9qN1b9lYMkqFGcsZvDYTy92cXgSB7LifEE9qWN819j
	KT+RLRD0gZuuXB70w0sjRiPiDb0yGM1wJc8QbSE25iSYIdUwA4QmqpXICrwIWqgUnK+icvOqiyA
	O4TLn0M+WVXzSgJkTbKEojwaTSVv04bjcOZW50K9fHojJB6WmCflEuuhjfV3Wy9zcyVsclNhlMX
	k1cxBuCH3O6HOIJykXdSLVt8gSyJeWjTtk3BNaeRAOGoeZs5WJ8PQw==
X-Received: by 2002:a05:690c:f0a:b0:80c:85e5:8741 with SMTP id
 00721157ae682-81f993df989mr36253797b3.63.1785334134768; Wed, 29 Jul 2026
 07:08:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716230411.2767394-1-tarunsahu@google.com>
 <20260716230411.2767394-5-tarunsahu@google.com> <20260717025913.067B41F000E9@smtp.kernel.org>
In-Reply-To: <20260717025913.067B41F000E9@smtp.kernel.org>
From: David Jeffery <dhjeffery@gmail.com>
Date: Wed, 29 Jul 2026 10:08:43 -0400
X-Gm-Features: AUfX_my5xPWn2PPlT7ZWQqD-dmkDU18YDfPkQgQ3vbI39xQlspjH-YQORqbG6Us
Message-ID: <CANghDUUFrGN3CiJmRhQS0jtDwNnoWbKv490E=UxDXGgKsy6m7A@mail.gmail.com>
Subject: Re: [PATCH v19 4/7] driver core: do not always lock parent in shutdown
To: sashiko-reviews@lists.linux.dev
Cc: Tarun Sahu <tarunsahu@google.com>, linux-pci@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 10:59=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Unprotected read of dev->parent introduces a Use-After-Free race=
 with device_move() during reference acquisition.
>
> Pre-existing issues:
> - [High] Dropping and re-acquiring device_lock(dev) allows dev->parent to=
 change, resulting in locking an obsolete parent.

We could add additional locking around device_move to exclude moves
during these times to quiet both the AI tool's concerns. However, both
these concerns are already not possible in reality. The only user of
need_parent_lock in the kernel which will use this code path is usb
devices, and none of the rare devices which use device_move will move
a usb device which has need_parent_lock set. Thus, there is no actual
device_move which can cause these conditions the AI tool complains
about.

The AI tool is finding a non-existent issue by applying a very
specific special state as a general condition. If really wanted, I
could add a patch which locks out moves during these times as a form
of future-proofing, but from my view of the code all it would be doing
is creating additional code and complexity to the driver core while
currently fixing nothing.

> --
>
> --- Patch [4]: [PATCH v19 4/7] driver core: do not always lock parent in =
shutdown ---
> commit 6be56e5bea0fe214a5199c9f806c49e62e60127f
> Author: David Jeffery <djeffery@redhat.com>
>
> driver core: do not always lock parent in shutdown
>
> This patch modifies the device shutdown process to only lock a parent dev=
ice
> if it is strictly needed, rather than unconditionally. It also defers
> acquiring a reference to the parent device until the point where the pare=
nt
> needs to be locked.
>
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 82a7af1f3ba2e..31f95e86856e0 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
>
> [ ... ]
>
> > @@ -4925,12 +4921,32 @@ static void shutdown_one_device(struct device *=
dev)
> >  static void shutdown_one_device(struct device *dev)
> >  {
> > +     struct device *parent;
> > +
> > +     device_lock(dev);
> > +
> > +     /* use parent lock if needed to avoid race with probe/release */
> > +     if (dev->bus && dev->bus->need_parent_lock && dev->p && !dev->p->=
dead &&
> > +         (parent =3D get_device(dev->parent))) {
>
> [Severity: High]
> Does moving the parent reference acquisition out of the list_lock critica=
l
> section introduce a race condition where the parent could be freed?
>
> In device_shutdown(), get_device(dev->parent) was previously called while
> holding devices_kset->list_lock. Now that it is evaluated locklessly in
> shutdown_one_device():
>
> CPU1
> shutdown_one_device()
>     evaluates dev->parent, but is preempted before get_device() is called
>
> CPU2
> device_move()
>     changes dev->parent and calls put_device(old_parent)
>     dropping the last reference and freeing the memory
>
> When CPU1 resumes, could it pass the freed pointer into get_device() and
> dereference it?
>
> > +             /* the parent lock needs to be acquired first, so re-lock=
 */
> > +             device_unlock(dev);
> > +
> > +             device_lock(parent);
> > +             device_lock(dev);
> > +
> > +             __shutdown_one_device(dev);
>
> [Severity: High]
> This is a pre-existing issue, but does dropping and re-acquiring the devi=
ce
> lock here allow the topology to change?
>
> If a concurrent device_move() reparents the device while device_lock(dev)
> is dropped, it appears we might lock the obsolete parent. When we re-lock
> dev and call __shutdown_one_device(), we haven't verified that dev->paren=
t
> still matches the locked parent.
>
> Could this defeat the need_parent_lock synchronization and allow a
> concurrent probe or release on the new parent to race with the shutdown?
>
> > +             device_unlock(dev);
> >               device_unlock(parent);
> > +             put_device(parent);
> > +     } else {
> > +             __shutdown_one_device(dev);
> > +             device_unlock(dev);
> > +     }
> >
> >       put_device(dev);
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716230411.27=
67394-1-tarunsahu@google.com?part=3D4
>
