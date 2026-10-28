Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.225.128
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793149510;
	b=OQXi+2qaA6PNyVxu/ZVhyD0TsJ1u7LIgGwB+Ud02+qSFGMOzq0id1znNj13b4T6J/eqX
	 WjHikpPt+TpI8o3dPJQyHlsrdOKBrkG0dnaNjs5+AlneHiWxe01U23L6ErzXmcaupw2TA
	 wGMaxbTFnkgGtAfN9AqR9Zbg1aw34Nmfy/p0WlaYr9HBMyheL0P2FqQdDhZRQOQ/1gmtx
	 iS1yvayKqhbEit7B84VdLPn2HnYW2lERaIIJ0uE4uGEEm/p2XT6Kt2A68Xamu06DRedTa
	 +DPV8uyuCBvwLgntpMgCC9G69eAU0D8u1w0KkYuAb91zAesohpD899Hp6NTlS4BcCLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793149510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=f2rE3NDE9kGP6isczzJJL2zdizHNny9LG2ue9EGEuV0=;
	b=vyA8flsHehbf7QeE+m9cUGpL0CY0jw247T3YGfzlETsZHflq9ioRjBpQiHciRjlI31NE
	 hLMXEMMgOj9z1yU9VFKRvl6zqTYLWsUxtmmuN0pglqUmnCWZMwKN4B6uYhQl0y0dYY5KQ
	 IM+QwCOOJNRiH17JHzxfcQ2n3R2QgCRGddjmDy7urEzozUe1aTMB3jsfzJgwOQUXjrBCG
	 tC+frdicHNk0apcbE4Eh9JQtXpASJbFX+8UjkGmVBn2ydcLdvz6S4Diopx6vBwXEkOD1B
	 MHhd2FeQ361xlgWAuVmJVzJhjnY0AKHEojF95xVOYy2tACGvZi1es758T1GEJjRO7rQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h8AIDZES;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.225.128
Received: from mail-wm2-f0.google.com (mail-wm2-f0.google.com [74.125.225.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7785B606A329
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 01:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7785B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h8AIDZES
Received: by mail-wm2-f0.google.com with SMTP id 5b1f17b1804b1-4a2d6bfe8d6so1437545e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 18:05:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793149509; cv=none;
        d=google.com; s=arc-20260327;
        b=jeNJQm24VUVMCBGj/OJDwOMwzECJUA95zoeGKMeH5Ihz5PV2Sk95bffwD7IWUdlQN+
         roxz3vln0qUZoJx/S3l6Hxf7TEgVY6yHBQRY8CI2har0MU2BalT70HziF9QpKzvfrxbK
         WFSJSFFpu49Ut9ncijjAgXEDD61xCz8ITYP3sDREw87boxt2h0W7yosXS0m8CCHemtDU
         fs8QnPH3i4+uYWb1/CqnIDlTBRubCcV8muRRVAzuCvKZt0HcPgAKZnaXMLm2NUlAX5zJ
         iBSthcg6MCmwDH19mFL7++2JBO4rB3ZNwx4bwLdIoxtNGEQzeFIrODRZx2+IfdQm/aP5
         7hCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f2rE3NDE9kGP6isczzJJL2zdizHNny9LG2ue9EGEuV0=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=e7o8FxqA9TfeULKWqrIzm/UJ+qXgucK/scG1ybky8Ol7gQ+3zfbrC1aZkdoCIqqrgt
         mDuNQTdqfnkzIQD3wMXVb/CiIrWOBTZWxg/HPy0OAgdUlnaCUnO5N6PsVBUlClYa3q0d
         CDfdkC7TvhKCumVsp9Oj5s97Uc4O/VG4KXgWEiT0FsZTT4iZEpOEA5p4DMRkhz2pYcpn
         DonuEmnnJfcW1vyCBoX9rQUu/WdsKhz2MYOpxTAGH2ffbluuEk2W0aMsIX2CbxphsRaz
         sgqddtF0OWEPghOxgoitiFs9LrdSHGsYZEryiFJlqLmWByB3N9fhWyg7ZqUvHjOa/N99
         7nOg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793149509; x=1793754309; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f2rE3NDE9kGP6isczzJJL2zdizHNny9LG2ue9EGEuV0=;
        b=h8AIDZESUJtvF2WUWjmQ4f3l6PUJ3k0wz/mcR/rI9/fz9uCtGnH9+zcX/T0yZkD42k
         f3DiJjny9b6LHXBnf7UcbDYS2Wal/ZYY3o0eUgacqvuWyFywLJedvvY2zgEx9y4dXry+
         vDB1RiLMVMNgcqZuDu6qI3c7RlI20rgeCbG/H/Za0wMhC61wOjz5c9dejN3xcUseIEUl
         T3aMGcIkniGuVFRxVB5JHLFfBNWcbg9YUoIuRjglJuHJAS7huub34XDmUSCLGhJ9y0IM
         8pCDZ3fTOQvdfiIhtz1vcnpnYkBjBdzjzHUd2D7fiLRLO/APedX2JaxPledF4F2twvpz
         F+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793149509; x=1793754309;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2rE3NDE9kGP6isczzJJL2zdizHNny9LG2ue9EGEuV0=;
        b=PE/ZNMKHIQcMZPuai+NORhJsQIVYVM4iwKGSQuejsZmAvX2zKJDkthHywN/Q5cRvJN
         LvoVvDluo3Z2ujCiq+WJ4cMHdS+e9Hr5JEvS4CfXQ4nBPc1nifyFlJclmodKUfGIwndu
         zDV2mwf3tfik3O5sqevEfZ2xRsvOjPVfB+3CY8MIdtVu9ypz7o4VaY5Hl0g7k5KG4nZx
         cAextDxFLlAkxO30Ub9AuIHkBVE54NzYK+WCENmgQ+9uwOvkQhwxnzKyPXiPGxyqrLkv
         uuwT7Q5ya7Mm+CjrfJweHcMwtOPXltrCAL/L7RB898d8EjEjUd/DyIt+v+veAU4TGkEK
         FG4w==
X-Gm-Message-State: AFq9FYJOLdmy4M4Tp+JjW8alxztM126QYlV/4MOREmO7lJuJ+BWPOLy0
	GRqCaDA4ra7NxIB/ORKDzNl1gX5D+fCmV6FHWD5EzYmErfwEW/ABz5nT2d2FszXIQmBN3vV8IPn
	7Nxow9nULJPQw3iPwgUfys8gLkCXuunB02VXd
X-Gm-Gg: AYBFou28Tg0kVRGWGRgPq19g97lSNbWjy05VW/qnHfkybN2fvIFx2qEMeBhRWzyVIQ5
	HoNCsm4ZEsinVgkD37HTBaCF5tnMRGwHPFw0cEv3a4Jlg9565jIJSva8kxSEPCAfIQTy/Wm1mLg
	VuHyFug9MwoT1BpCQ4zlkNawbuCJv4kzJBNDIaDRADI+a3VYe+tQ9cZ7e/PU6kJUKSHnT3DGH06
	NLKRIAzE9bFJRK9i5AjCQsk8XrZDkrFS4yaLGjFUpa+mWQv/ZAQiVRAuCxFsr9asLvj55qJjIwH
	QlO5EqXQSOAs/vDhkfRXI7zD9mmUclcwI5zaIl9NYMi8YuMI6j5i1rsIFl4pFvEjI6z5qWc5nAC
	0oYaEU62xBmtpPGnEOapKLl+vbqQSiP1eMpupvp+UTyr9HCDFzBfrhgKuelOv9k+j5EaIzd3x3A
	lzdaHy1wLhloSm8qC7va169lesUtKJZd0Pf9zAJzEfe2Yko0G+BtpkiYTnaswvldIIgrS6UeD8u
	0maVzLdcZqeos/s+A==
X-Received: by 2002:a05:600c:3516:b0:4a8:cb23:f71b with SMTP id
 5b1f17b1804b1-4a966c4175cmr14124645e9.18.1793149508615; Tue, 27 Oct 2026
 18:05:08 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1793147364.git.memxor@gmail.com> <98e3a499d89e01ddfb83fcf91e34b2a0e36e1007.1793147364.git.memxor@gmail.com>
 <sashiko-outbox-187297@kernel.org>
In-Reply-To: <sashiko-outbox-187297@kernel.org>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Wed, 28 Oct 2026 02:04:30 +0100
X-Gm-Features: AclHuK95I9JL3fStnIQS-CsCNB98uLDQyIp3GOawxHVoMRxm7qYeaDFYr7zdMS8
Message-ID: <CAP01T74tsmsPD=PKVKZkvWVfV=mnKw5SbcPJ9-Npu+NK3J2mzA@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next v1 08/11] bpf: Let the callback of
 bpf_user_ringbuf_drain unwind
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Oct 2026 at 02:01, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] bpf: missing callback dynptr invalidation on bpf_user_ringbu=
f_drain() unwind
> --
>
> commit 5e41f31a219e475ec387e971ce587d69bc948017
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> bpf: Let the callback of bpf_user_ringbuf_drain unwind
>
> This commit adds an unwind pad to bpf_user_ringbuf_drain() so that its
> callback can exit via unwind_exit while releasing the sample, clearing th=
e
> busy bit, and queuing any pending wakeup. It also adds
> BPF_FUNC_user_ringbuf_drain to helper_has_cb_pad() in the verifier.
>
> > diff --git a/kernel/bpf/ringbuf.c b/kernel/bpf/ringbuf.c
> > index 447863ece26a3..fdd997f36f73d 100644
> > --- a/kernel/bpf/ringbuf.c
> > +++ b/kernel/bpf/ringbuf.c
> [ ... ]
> > @@ -852,8 +854,23 @@ BPF_CALL_4(bpf_user_ringbuf_drain, struct bpf_map =
*, map,
> >               }
> >
> >               bpf_dynptr_init(&dynptr, sample, BPF_DYNPTR_TYPE_LOCAL, 0=
, size);
> > -             ret =3D callback((uintptr_t)&dynptr, (uintptr_t)callback_=
ctx, 0, 0, 0);
> > +             bpf_call_cb(callback, &dynptr, callback_ctx, 0, 0, 0, ret=
, unwound_at);
> > +             if (0) {
> > +unwound_at:
> > +                     /*
> > +                      * The callback left with unwind_exit. The sample=
 is
> > +                      * consumed and counted like after a return, so t=
hat
> > +                      * the wakeup below is sent for it, and the helpe=
r
> > +                      * leaves through the door below, as the error pa=
ths
> > +                      * do, with the r0 of the callback.
> > +                      */
> > +                     unwound =3D true;
> > +             }
> >               __bpf_user_ringbuf_sample_release(rb, size, flags);
> > +             if (unwound) {
> > +                     samples++;
> > +                     goto schedule_work_return;
> > +             }
> >       }
> >       ret =3D samples - discarded_samples;
> >
> > @@ -867,6 +884,8 @@ BPF_CALL_4(bpf_user_ringbuf_drain, struct bpf_map *=
, map,
> >               irq_work_queue(&rb->work);
> >       else if (!(flags & BPF_RB_NO_WAKEUP) && samples > 0)
> >               irq_work_queue(&rb->work);
> > +     if (unwound)
> > +             bpf_unwind_leave();
> >       return ret;
> >  }
> >
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 3c39cc0f358a1..fd63ff36eb909 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -11409,6 +11409,7 @@ static bool helper_has_cb_pad(enum bpf_func_id =
func_id)
> >       case BPF_FUNC_loop:
> >       case BPF_FUNC_for_each_map_elem:
> >       case BPF_FUNC_find_vma:
> > +     case BPF_FUNC_user_ringbuf_drain:
> >               return true;
>
> [Severity: Critical]
> Can a callback for bpf_user_ringbuf_drain() smuggle its R1 dynptr (or a
> slice derived from it via bpf_dynptr_data() or bpf_dynptr_slice()) out to
> the caller's unwind pad in R0 when exiting via unwind_exit?
>
> In bpf_user_ringbuf_drain(), struct bpf_dynptr_kern dynptr lives on the
> C stack frame of bpf_user_ringbuf_drain(). When the callback exits via
> unwind_exit and jumps to unwound_at, bpf_user_ringbuf_drain() releases th=
e
> sample with __bpf_user_ringbuf_sample_release(), clears rb->busy, and
> returns ret (the callback's R0) to the caller's unwind pad after its stac=
k
> frame is popped.
>
> In the verifier, set_user_ringbuf_callback_state() initializes the
> callback's R1 using mark_dynptr_cb_reg(), which sets R1 to
> CONST_PTR_TO_DYNPTR with a fresh id that is not backed by a STACK_DYNPTR
> slot in the callee's BPF stack:
>
> kernel/bpf/verifier.c:set_user_ringbuf_callback_state() {
>         ...
>         bpf_mark_reg_not_init(env, &callee->regs[BPF_REG_0]);
>         mark_dynptr_cb_reg(env, &callee->regs[BPF_REG_1], BPF_DYNPTR_TYPE=
_LOCAL);
>         callee->regs[BPF_REG_2] =3D caller->regs[BPF_REG_3];
>         ...
> }
>
> When the callback executes unwind_exit, prepare_func_exit() only rejects
> PTR_TO_STACK in R0, copies callee->regs[BPF_REG_0] into
> caller->regs[BPF_REG_0], and calls destroy_dynptrs_in_stack_slots(), whic=
h
> only invalidates STACK_DYNPTR slots in the callee's stack frame:
>
> kernel/bpf/verifier.c:prepare_func_exit() {
>         ...
>                         caller->regs[regno] =3D callee->regs[regno];
>                         bpf_diag_mod_end(env);
>                 }
>         }
>
>         /* Invalidate callee-local dynptrs and their slices before the fr=
ame goes away. */
>         err =3D destroy_dynptrs_in_stack_slots(env, callee, 0,
>                                              callee->allocated_stack / BP=
F_REG_SIZE - 1);
>         ...
> }
>
> On the revisit of BPF_FUNC_user_ringbuf_drain in check_helper_call(),
> unwound_r0 is preserved across caller-saved register scrubbing without
> invalidating the callback's dynptr id:
>
> kernel/bpf/verifier.c:check_helper_call() {
>         ...
>         if (env->cur_state->unwound) {
>                 regs[BPF_REG_0] =3D unwound_r0;
>                 goto unwound;
>         }
>         ...
> }
>
> Wouldn't this leave the caller's unwind pad with a live CONST_PTR_TO_DYNP=
TR
> pointing to the popped C stack frame of bpf_user_ringbuf_drain(), or a li=
ve
> PTR_TO_MEM slice pointing to the already-released user ringbuf sample?

Known bug which Ihor is already fixing.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793147364.=
git.memxor@gmail.com?part=3D8
