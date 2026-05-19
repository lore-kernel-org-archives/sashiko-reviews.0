Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740913358DA
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 11:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779191447; cv=pass; b=AnZpxmrvrg5GA7iQsKhNy/9I4dEgDoKhXqJAvwKYPNAQ4LuvtpnzSoNHIvtCUwkz7UiNN3vxMUOobraLY5FhBJ3xYgf/+37SCse/fYJs2EYlr9i536pFNgvu3HdTYeGQiaVV8Uco5eRM1QZh18a+BVaAxCePXvBiY5USXfiU4XM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779191447; c=relaxed/simple;
	bh=QJzDa9BGAfImrSXnbL9DptnBQ0lviJmd7Y3LBBtzBjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MigA4RC6AOCQuEvNZh3Ly5eCzxrGO/tY0TaNkRsNXUZIcuiT9bJVAn5kYiZQ13O/ffOEgiqFLFN1qjf6Jxu9HejcifXp2FvXM1wvBE2CUh+2IZ4fO71JBKlFC4F0eISadgL0EXwT2KelBd2/05Vz57pm9yawhxsCy8kPosCbpiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaAHBkly; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaAHBkly"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a8704dc3a8so3803203e87.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 04:50:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779191443; cv=none;
        d=google.com; s=arc-20240605;
        b=ari4szVaerleWeqih5l7Rxvyk2zhWc+fEwMDuj3DDaUdGK4c8j6ZrR17qRnAsA3+fz
         CH55bjiARfSRNKFeIj8+oBvWW3jiRSvE5SK0FZFcUd36UyEXNmm80un+5O+OFIyVD/lH
         wzWYxcZ6WwMTXBH7lpB4J/VQJcaVF89VXtbR8uU3+2RAsg5tFKswyTX7BxIoUjcXhMOH
         77zfPwgnrMTYiTEArdGu7ZAOrHAYlF1Nbmot1juBfNAPc1IpczazNQcY6BMzVLlWvfAM
         tpfzBx7jZQyVLCF6ypDhJwvFfMS/dthAQ5zW2gGo3a8QfA/kg4OJENNgckvSUFilf+fw
         YQ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fC4uhJe1yFAxqc/8/hROeQyQEZWu7EVe2jEzXlw3jZY=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=Mkela3WndPOwpBQC5lRaCxu9lsa/+GKYPPOij5fhmkIC2nU4CxzNar9gTG9fVSKfzk
         P+Y+4F6DQUF7EYIAx7zhm4Ebp03iA+ZrFQ4gUJ0cluJikPdthKJC5ySXfbBOyyX1cs3N
         6JXbt/Rgghh5m3Ho8KEMkMb6hH4I+pplRMXM+2KZ3AjZwdePrcKt+euyweq49R7IW5sW
         IbdRwnIT/yBDHnJLtKVTHUZz9gd+Wtdg6JzCrNLYBvH1nonDA4oJLxgDR+RxfFFBC0dQ
         jd/KC5bNXVJKjwrhvB4GL4B0gdOlV/VHxhp/2OvO39uvrbFM4sxY3Nm6A7KXGgtSuwbF
         m4/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779191443; x=1779796243; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fC4uhJe1yFAxqc/8/hROeQyQEZWu7EVe2jEzXlw3jZY=;
        b=CaAHBklyKb5ZVYV8XwzLxNvjCf/PMBBl/b5QGLDVUwG8VZSJmU3A5B8XZt0KQ8CHKM
         ms3dzJ297BwtXj3paBqzlBJXadaInqDx+B19I3cFbmmfbZ3jlPTB3YUOQHIsdauZn20T
         vepo+xxpVnSpUV5E7Ibekgsa1A3FITlnLQ8F7Xg4LM6w9dMKzQBOipFOS5ii4i5P4o+I
         b4Hbver+CKFn0I6kzqrWR6ah1NhxdgNvfOgYyV4MEBg0zYN/W54HdER9Y//XoojH0hOW
         xRUVpzVjBehjY6GejO2rlwkUgK2fCIJ5QQCrAqHSjEHu4HOabyigyCTK0V8t/j+K+N6Z
         OaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779191443; x=1779796243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fC4uhJe1yFAxqc/8/hROeQyQEZWu7EVe2jEzXlw3jZY=;
        b=Xn06BPwlxETFV+RvkOm9rHkzEZw6hKRdnLoWHuF43CjsFjW8rOVU9mBrj0GGetd40t
         FvRgiy2OafjU06pW8V5lklLSyKASplTUXvi+55kxT/eAO0ARyxzG9kg+wq2HxTsPbrSL
         Akk0FsSovZM+uTZeJjm0+DReNWyZlIAXklxPFnbR0Mt6fswfrsI8nNEIVR2CKUe1PQTj
         Y243r5TMYCBd9to7qLa4P1V9AzACqAy1t/w9/UcZGAnUBLq4Km7zQC6DAKj3KZmp8wFx
         XMvNGwoVgDd7v4c1KFj1znKgpPPyu0K+zkDO/GRZYcvNVc7/8m6a/VWP9jupmWmuRLmH
         afWQ==
X-Gm-Message-State: AOJu0YwBQWjN1WxDj2vck/Pv8h86AT+RMA1eYevK4XozfuTMJLKLqxl3
	0szPEuA6HzVqZOJ9vuIR8KigdtGx3L1+X3sBqKZnOLZQSzwH++zdlfR+3T7OMABkpqnZZvh/F8q
	hhWz4o36b2qa+C5iWBWWrhtA5JYQKr+Q6csEfi2v0lA==
X-Gm-Gg: Acq92OGtGL2YDJG6UjIxMxXjDDTdFykTQSTt+7kg6zL2V9lW2voPwonOhzN9lrsVArb
	sVhzBtJNVwJWaMGI9YzOLp8+9xQdTE/A6i4GmJ+/CpiGCNk4rq2yem9Tby81ITKgFurdLh6afwf
	KwnXBgaNZqEcw72Ir7TMyl7oXVqNtG2/mDG7HPPVOTSxA2kbAjX33YG4ZOhqOjvOeSK0MMbGEMD
	FTRYExub/0BRBmkgMxqaH0ZhtV1xOHs6UZ1uxKcF9DbUjuLhoEei1vCRk4aEe/8j4kiTQTM7Aww
	FVhKn8sBzH7sQ2jGVbYQ//m7YBDMI6wzQ57gZ/V7
X-Received: by 2002:a05:6512:39cb:b0:5a8:d1ef:caad with SMTP id
 2adb3069b0e04-5aa0e733fb7mr5371601e87.4.1779191442645; Tue, 19 May 2026
 04:50:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518082344.96647-3-kerneljasonxing@gmail.com> <20260519082513.D38EFC2BCC6@smtp.kernel.org>
In-Reply-To: <20260519082513.D38EFC2BCC6@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 19 May 2026 19:50:03 +0800
X-Gm-Features: AVHnY4IeBHzVPRu7LSGThA5UlHE4ZYixCeJRIL6bfCGxUd-Kyii8UdDT0FIGGPc
Message-ID: <CAL+tcoDpJZjsh_3-=YDJi=2CMDNhDJ=RgNr2yKkV+8mU08wL0A@mail.gmail.com>
Subject: Re: [PATCH net-next 2/6] net: export sock_disable_timestamp() declaration
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 4:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Calling `bpf_setsockopt` to enable or disable `SK_BPF_CB_RX_TIME=
STAMPING` from BPF hooks executing in softirq will trigger a kernel panic (=
sleep in atomic context) if `CONFIG_JUMP_LABEL` is not enabled.
> - [Low] API asymmetry between `sock_enable_timestamp` and `sock_disable_t=
imestamp` creates a dangerous bitmask trap.
> --
>
> commit ae551b79a5c9f8c77421dc360627b1e40e3ceaec
> Author: Jason Xing <kerneljasonxing@gmail.com>
> Subject: net: export sock_disable_timestamp() declaration
>
> This patch removes the static modifier from sock_disable_timestamp() and =
adds
> its declaration to include/net/sock.h. This change exposes the function t=
o the
> rest of the kernel, specifically allowing the BPF subsystem to dynamicall=
y turn
> off the global time record function.
>
> > diff --git a/include/net/sock.h b/include/net/sock.h
> > index dccd3738c3687..8a49312ee0976 100644
> > --- a/include/net/sock.h
> > +++ b/include/net/sock.h
> > @@ -3038,6 +3038,7 @@ static inline bool sk_listener_or_tw(const struct=
 sock *sk)
> >  }
> >
> >  void sock_enable_timestamp(struct sock *sk, enum sock_flags flag);
> > +void sock_disable_timestamp(struct sock *sk, unsigned long flags);
>
> This isn't a bug, but does exporting these two functions with asymmetrica=
l
> signatures create a bitmask trap?
>
> The newly exported sock_disable_timestamp() expects a bitmask (unsigned l=
ong
> flags), while sock_enable_timestamp() expects an enum index (enum sock_fl=
ags
> flag).
>
> If a future developer mistakenly passes an enum index (like SOCK_TIMESTAM=
P
> which has value 7) to sock_disable_timestamp(), wouldn't it silently clea=
r
> multiple unrelated socket flags (bits 0, 1, and 2) instead of the intende=
d
> flag?

You said what if someone makes a mistake... At least so far we're able
to handle this.

The existing impl was deliberately designed. See how __sk_destruct()
works with the function.

>
> >  int sock_recv_errqueue(struct sock *sk, struct msghdr *msg, int len, i=
nt level,
> >                      int type);
>
> [ ... ]
>
> > diff --git a/net/core/sock.c b/net/core/sock.c
> > index b37b664b6eb92..2d552ae5edd42 100644
> > --- a/net/core/sock.c
> > +++ b/net/core/sock.c
> > @@ -474,7 +474,7 @@ static bool sock_needs_netstamp(const struct sock *=
sk)
> >       }
> >  }
> >
> > -static void sock_disable_timestamp(struct sock *sk, unsigned long flag=
s)
> > +void sock_disable_timestamp(struct sock *sk, unsigned long flags)
> >  {
> >       if (sk->sk_flags & flags) {
> >               sk->sk_flags &=3D ~flags;
>
> If BPF programs running in an atomic softirq context call bpf_setsockopt(=
) to
> disable SK_BPF_CB_RX_TIMESTAMPING, could this trigger a panic?
>
> Looking at net_disable_timestamp() which is called immediately after this
> bitmask update, if CONFIG_JUMP_LABEL is not enabled, the code falls back =
to
> calling static_branch_dec() on netstamp_needed_key.
>
> This expands to static_key_slow_dec(), which unconditionally acquires
> jump_label_mutex and cpus_read_lock().

No. When !CONFIG_JUMP_LABEL is met, the following code is the right
place that you need to look into:
static inline void static_key_slow_dec(struct static_key *key)
{
        STATIC_KEY_CHECK_USE(key);
        atomic_dec(&key->enabled);
}

So in this circumstance, no sleep at all. You were analyzing another one :(

>
> Since acquiring a sleeping mutex inside a softirq context triggers a
> sleep-in-atomic panic, will this cause a deterministic crash when users
> dynamically attach these BPF programs?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518082344.96=
647-1-kerneljasonxing@gmail.com?part=3D2
