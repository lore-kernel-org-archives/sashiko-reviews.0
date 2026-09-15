Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282044AC141
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 15:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486577; cv=pass; b=A+nPRo1II/vlxSF4sraSgCY2ReeG1Eqph/sta8zq32w0jT9pc1GZ5GbLNf4NOW0RPDAaSmICd+aZXArqtb5xhJLXWOi1vT+cp2MrrO5aga+TAw7Y9fnxQWflWM5q4MDf47aO5iEFEQJdlnaLxHCgvOiYs2t3sS30DxZynqt5d2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486577; c=relaxed/simple;
	bh=YI+W8R6LmUfiHRf+cLLJ3hjHCzqafGPuDCd4ahQ21/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JKgMuvX8OPonth5bp/pkqqdP+ogmDz2mFv+PqbpjMjMWiEhvAg1zAC+/NvLo1uSK2gZu+b1xboWh0x9brYuu+5/PF27/cDg955LPaUrQSsFvOvERBYPy0SAzHYUGvjBQMq8zyRPyCS1n9F68Njx9i7Du5H0P5xIpiL10s7OV7LM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DW/oUH4w; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DW/oUH4w"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f56039dso78835266b.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 08:36:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789486573; cv=none;
        d=google.com; s=arc-20260327;
        b=fJx+ggV/P0Qpuwa4gr3dqOU2XJHnBTWGOeRdzRCzCswe/EsOv3aEJABnGz2ek2G6/7
         syrxwVR8rcDSKg2f7lWWACprBFpumtJbdnxFCdTPlPtbf91CtSmRw8owH3BTZvOar1RC
         0LcERknfDMOGcQK/gJPOHNfegk8C1rKSFGAu2Gc0RLn46rMc7R8LHwUHcV0WJ+mGK5Et
         QLkpSWlbG3P0EArBLGAHhjpZXVh754GS7aOuzUa9wZtjGAI7bGKkWLdo2inmid3fMwRA
         ZzOakI0588G5t6vJy2U8B11JMTbeVRN6YDWyMZ1eSs21xQkdnbYG7QHm67NvI9akb6U7
         ZyGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mUkY5Sia6l4PhBlX1ZDLMGsOaNUKMVJcdyjNi1/F244=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=eqkgapJnJcm2nFQFuZ+/ixl1Nsytx9a8e30p/Sm0dORNPjJKO238iIv0HGt4wTEcmj
         lbkMpKEe7R5X5B/Q5xNnEnzuqZNNJ5lessqISq4XbNPifPSJzHZr7/Zhy6JM3J8gGf6b
         V3yAu+cKGBjoDPXG/bXk45DtmdPc9pThfDz8Bl8xEuB1ZttEDFYZmn24xBTfXKReMiyE
         sMtPz4HJJmJvwDHtz8Y/YRbqFCxdmItbSDn195Z1eL1a17Cl+63t2JVUG6y9WcMIuxYQ
         LXI/FTsGD0mIYBILXKe8fSzKMO4/8p8SVqb/zpLsoC795tLrHKnSfpU8AMSeG4DdOCf0
         GbyA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789486573; x=1790091373; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mUkY5Sia6l4PhBlX1ZDLMGsOaNUKMVJcdyjNi1/F244=;
        b=DW/oUH4wqkoUjs3jBYkKbx6uaXJyC98D8XbJiS1YVDLrSWuKEFhyHxKBd5CpXW7YhD
         0YIl0mj72sUfgm+T7Ng0wCBkhx8/JVS20TDmbw3EiexHmL/dX8+yYRBavId//Q/nr7AN
         pHE9BUIEJE1WTV/iEbxYKqEFOhfGp2Z6M8F1XlGaf3C48FiDo9ZQY5xpHPl35QUJREFG
         CZCDdNHTfkaWe/hDaM/PFMWM6OebcMAmYR8sbdHHcP4Nfiyy9mmMG/Gyocm4ltseLH1r
         ArKFe2zXzOqIE2NEJIkCsxPJdvhM0pNcggoapjA/8vzn1Cr897LDBZxk6pAnUD6pysHa
         HvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789486573; x=1790091373;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mUkY5Sia6l4PhBlX1ZDLMGsOaNUKMVJcdyjNi1/F244=;
        b=vWP+A38hIL9KHyKrd27Gw2YIP0C0fAbqNnHYn29NfTbUYX2KgD3euHazDbfCaZhS2t
         wINkau8xzkzqXdrUho5B4GdwgtTU7UplyBWGxPZrW7EXP2AjvknIx/dNzhPFcdETzu3h
         H6EqdqzX/L4B/JGZWPI6NkRCroTLCd38zUv3Us++OXYXL5SqT5B9z5e56fr0ELCVHBv8
         M2rhX/kyXkv8nqbVJHUJKDjpEA+DxQzN3w3330iLahse8Um12x3H9qANXhSs4u3wGrzr
         Fb0qj4bzP8H/Lg8z9tbj3/82Q+QlJENksLx4v4fZwb6EkqVX03bmGaOqhIdjq7gMLUSt
         2dig==
X-Gm-Message-State: AFuF++lArW3bpARzeU03De+/VqLzNoWpWMf8hDKx++PKOgB7qbjAoBPR
	IM55yMr3nnPtYaFxqKDZUpSXhjZne9MbECe9dyvs1UtSNMgTpUlORfjrjZA0TQlVf0nxKzz1ot/
	KTc/G62uEmQkwIWf7Gla7jlsutnlXWqKgxXT0fgtHHA==
X-Gm-Gg: AYBFou1SDbrFl1l0vne+X+dWhpfjadPtntP9GcksW18TWy6u/BmeJ+9V/deJ0gRVec/
	dwEeUIYEC5cachUhlYfrVSJ5IUoeifUjdEf8eD9nc/40/r9Svwwrw/xv3uuVB217iacMz2xJkDO
	TBDA+ZGA9cTyTUW5zrdqW6/W/vkXxZ0RKNJnBqg0I6sRW4NLt2TXi8NO3l8xL/MV8zrhGuXWgQQ
	dBDFGSoNwgZY+Ve7I0N62kd4Jkc6YetiCS4Cj6Et6bX2iD0KuuYT3LqMYI62WhItcSMlIVYFvy3
	HveQq1/NrJ9/Dk9APvpR8Dr5ho+80Sx7efkSgs8eA09G/vF000ESSyudlVkUqkt2rvkW0ik=
X-Received: by 2002:a17:906:c111:b0:c29:6c88:1213 with SMTP id
 a640c23a62f3a-c29d772f566mr132538566b.8.1789486573000; Tue, 15 Sep 2026
 08:36:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915143640.36292-1-puranjay@kernel.org> <20260915143640.36292-4-puranjay@kernel.org>
 <20260915150203.4C55D1F000FF@smtp.kernel.org>
In-Reply-To: <20260915150203.4C55D1F000FF@smtp.kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Tue, 15 Sep 2026 16:35:59 +0100
X-Gm-Features: AcwNN1WK90HKyYW_TdUL2USpB3yC1jJ4otSuSwe7x5DBLdol3PqnDqGMvZ-Sn-4
Message-ID: <CANk7y0iw06voTJoXOWWwvUch67MKUetQa=YbwOUXV+nRVj_Xag@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/4] bpf: Add bpf_call_rcu_tasks_trace() kfunc
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 4:02=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] bpf: Deadlock risk calling bpf_call_rcu_tasks_trace() from NMI c=
ontext
> - [Medium] API behavior change in bpf_timer/bpf_wq returning -EBADF inste=
ad of -ENOENT
> --
>
> commit 144bc88aada0f77bf3ad5ba54cb25dc2ae7529ca
> Author: Puranjay Mohan <puranjay@kernel.org>
>
> bpf: Add bpf_call_rcu_tasks_trace() kfunc
>
> Sleepable BPF programs hold rcu_read_lock_trace(), not rcu_read_lock(),
> so a plain RCU grace period does not wait for them.  A program whose
> readers are sleepable needs this flavour to defer reclaim safely.
>
> > diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> > index 6debb92fc8740..b76e2866693af 100644
> > --- a/kernel/bpf/helpers.c
> > +++ b/kernel/bpf/helpers.c
> > @@ -1428,7 +1428,7 @@ static int bpf_async_update_prog_callback(struct =
bpf_async_cb *cb,
> >       if (prog) {
> >               prog =3D bpf_prog_inc_not_zero(prog);
> >               if (IS_ERR(prog))
> > -                     return PTR_ERR(prog);
> > +                     return -EBADF;
> >       }
>
> [Severity: Medium]
> Will this change break backward compatibility for existing BPF programs?
>
> Because bpf_async_update_prog_callback() is shared, this changes the
> user-visible return value from -ENOENT to -EBADF when bpf_prog_inc_not_ze=
ro()
> fails (e.g., when a program's refcount reaches zero).
>
> This affects existing UAPI helpers like bpf_timer_set_callback() and
> bpf_wq_set_callback(). Programs relying on the specific -ENOENT error
> code for fallback logic might break.

Will fix it in v4.

>
> > +__bpf_kfunc int bpf_call_rcu_tasks_trace(struct bpf_rcu_head *rh, void=
 *map__const_map,
> > +                                      bpf_rcu_callback_t callback, str=
uct bpf_prog_aux *aux)
> > +{
> > +     return __bpf_call_rcu(rh, map__const_map, callback, aux, true);
> > +}
>
> [Severity: High]
> Could this lead to a deadlock if called from NMI context?
>
> The bpf_call_rcu_tasks_trace() kfunc uses call_rcu_tasks_trace(), which m=
aps
> to call_srcu(). call_srcu() internally acquires sdp->lock, which is a
> raw_spinlock_t.
>
> If a BPF program running in NMI context (such as BPF_PROG_TYPE_PERF_EVENT=
)
> calls this kfunc, and the NMI interrupted a code path that was already
> holding the same sdp->lock, the NMI handler will spin forever. Since the
> kfunc is exposed without NMI-context restrictions, could a userspace
> process able to attach perf events trigger this deadlock?

The rcu side changes will land together with this and make it safe to
call call_(s)rcu()
