Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792625897;
	b=dQyJGibmPr8Jf++dBdm0yvaZjT9EQytwL606RFWNG73EIu53SiP1oDWCEaW06WXya1Ll
	 0OMWXjKhTjKa1FExtVgaYExim6PhUsfubG1VySLfjdWy05u22nEw1lSmDD3lT7oGee9j7
	 sifCZCbcrU3+OMpZw06PseMaaTMuBFCecPv2hd5oF6X06sYk5scMYvIdRfDU67U75UO4/
	 gHHzAAeqeMTCOkyavC7qENr9Kinod0kUhm544l1eZtLbrMCYpC0Ri2hQssqpZ2TU8+sOJ
	 5g8tAEsaY9xjKksMXat2jYX7ZZG0MHZeqFTCpNlVo98L6Z9YV5jlNv+M57gHMqk0jJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792625897;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=XKZAiKGbiib5zp4TSw/Q6LRpir6OwzmcI8NEHPK6cRM=;
	b=QCv/i2GCdzCV4195VuXe4medifnbtRhCyF4TFHtuF3lm9QvKvwrSyYCIOg3FXmvTbIkh
	 3Dan6V05FQqDBfgTW2yfjZ3WIB7pytDVxur5/Ko1lIA1Z+QNyPED3Ec95OXfHx2hfUAal
	 L+W3nH+nT4VpZpmNSOg7TJEtqZ4hS455pZgPFlXD8BUsJkeBRUiVEilYL2YH1MuUdjr8c
	 8a+JP/o0QRAipzrWVgbPmss40+MclEcrtPnSlTQFUep289WTfIjcuRp9ZncW5jTL5H0Br
	 Vx5wDhYQS4DB0YxQcAYYP92vpWEFLjpeXmJK22qcSf2qsep+GmOZLoHlXjjnMUdxsHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MgMVqk7b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6249E606A31B
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 23:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MgMVqk7b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079FE1F000C7
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 23:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792625896;
	bh=XKZAiKGbiib5zp4TSw/Q6LRpir6OwzmcI8NEHPK6cRM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MgMVqk7bGrp6Ls7lIijkuqzS2bPELzf388vN3Ahkv5vSs3t+pZAr/5v6ecs8I+Nlj
	 YapOkwComR8CE1pa9p/RwTVrAJjY+ia3CF2mHTdISibWS8FPYu7yTOBk4OcOqYQ2af
	 c0Jma87QHmwk+xshEgSyGx/7BgGVnlxVosa+bJcEIybK5qRqmR5VpeNDPgD4JnT24C
	 f5h+hu4mrZzK/Yq32b4XNEmV4F5lvAIfY+7WC0DtDHfdfhOBQ5iPiP+mS/0fPyv7nO
	 SI4SMRGI+SBLSwdBE0cJ2VOWmmtTkU8ngaa/YaKSbvtOKmvpBhMCD5+QchN+H18QXq
	 +LGw1gIU0ZesA==
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f079a63b8so130708685a.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 16:38:15 -0700 (PDT)
X-Gm-Message-State: AFq9FYLNg0H/CQ1MWKvuTrjMPrxBSEynsqEjjnVgt6XhgyicPJFgTFCj
	o3jiG5OsX7BsKdepYcgktKr65FYdTHj/N4ONGK5DD2ImyyICNEFU96PhtQCOcJwyqrItgbKIAL6
	wR3tYw/Zp6WpuX4qxgS/pIXtZYhC6vik=
X-Received: by 2002:a05:620a:601a:b0:93e:5daa:67a4 with SMTP id
 af79cd13be357-93f57f0a0d9mr727720585a.29.1792625895221; Wed, 21 Oct 2026
 16:38:15 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021222255.3124940-1-song@kernel.org> <sashiko-outbox-180771@kernel.org>
In-Reply-To: <sashiko-outbox-180771@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 21 Oct 2026 16:38:03 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5BhxAUC=OE=mjZ32vtYpsGM2WYw6bKTXF5GrTDh8CiSA@mail.gmail.com>
X-Gm-Features: AclHuK_CkLDvphCAJPCC_oZ2GWHVamkqhlYW3dwZFYCLJHlJKYBN8UaCaDlSLYA
Message-ID: <CAPhsuW5BhxAUC=OE=mjZ32vtYpsGM2WYw6bKTXF5GrTDh8CiSA@mail.gmail.com>
Subject: Re: [PATCH] compiler_types: Do not mark inline functions notrace
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 4:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
> - [Critical] x86/paravirt: removing notrace from inline instruments pv_op=
s and resume
> - [High] tracing: removing notrace from inline breaks ftrace recursion pr=
otection
> - [High] rcu: srcu_read_lock_fast_notrace() and tracepoints lose notrace =
attribute
> - [High] bpf: removing notrace from inline exposes trampoline helpers to =
fentry
> - [High] entry: removing notrace from inline instruments unvalidated entr=
y helpers

Wow. I didn't expect this from Sashiko.

> --
>
> commit 1eb6626c4a5ab70e5858a8a8f1c9edfca235db57
> Author: Song Liu <song@kernel.org>
>
> compiler_types: Do not mark inline functions notrace
>
> This commit removes the notrace attribute from the inline macro definitio=
n
> in include/linux/compiler_types.h so that inline functions emitted
> out-of-line by the compiler can be traced by ftrace, attached to via BPF
> fentry/fexit, and livepatched.
>
> > diff --git a/include/linux/compiler_types.h b/include/linux/compiler_ty=
pes.h
> > index c5921f1390079..ea7f2a928b4da 100644
> > --- a/include/linux/compiler_types.h
> > +++ b/include/linux/compiler_types.h
> > @@ -230,9 +230,8 @@ struct ftrace_likely_data {
> >   * externally visible function. This makes extern inline behave as per=
 gnu89
> >   * semantics rather than c99. This prevents multiple symbol definition=
 errors
> >   * of extern inline functions at link time.
> > - * A lot of inline functions can cause havoc with function tracing.
> >   */
> > -#define inline inline __gnu_inline __inline_maybe_unused notrace
> > +#define inline inline __gnu_inline __inline_maybe_unused
> >
> >  /*
> >   * gcc provides both __inline__ and __inline as alternate spellings of
>
> [Severity: Critical]
> Could removing notrace from inline cause a triple-fault during x86 suspen=
d
> resume, secondary CPU bringup, or kexec when function tracing or call-dep=
th
> tracking is active?
>
> In include/linux/compiler_attributes.h, __always_inline expands to inline=
:
>
>     #define __always_inline inline __attribute__((__always_inline__))

I wonder whether we need __always_inline to be notrace, and whether
this resolves any of these concerns.

Thanks,
Song

>
> Because __always_inline only inherits notrace through inline, removing
> notrace here strips notrace from both inline and __always_inline function=
s
> whenever their address is taken and the compiler emits an out-of-line cop=
y.
>

[...]
