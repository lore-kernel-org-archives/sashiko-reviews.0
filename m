Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AF71DDC38
	for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 03:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779594733; cv=pass; b=TMbQupvzERjmhPygbgZqS0w35vwssONfJRHKvoFzajw/CnK/Pr4bRQxu6GyWVB6+SLJUli/B9rbxsi0DyRBKkNZ0ljqMlD80zxnTgIq/9YZ1FnQtK2tZPXZuEzO3HlHgkTKGAojD0sagc/uNeEDb6yhyzyU6H5E9ajYjBiiXkIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779594733; c=relaxed/simple;
	bh=uV1E8iHkG/G3zQNseFTbJjQByr54VkxJaRdd/6skFgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLACeU/MonqjlYj5Aq/CizJTS8S87crup1Rzg9bd3JI0Nyk8TLdX3G99F1Lk7REFOm0vfgax796Xz59GmTsUWM6hwhwbMYjE4tUGGPNydc2wMbBhi3SxMlQ6yTUDzxil+KxmIaoEaX/pMwuR83a8r8zcuf2O+0SjrGQ/qcfRO3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dAXJ0Sb9; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dAXJ0Sb9"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-136a89595c3so614005c88.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 23 May 2026 20:52:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779594731; cv=none;
        d=google.com; s=arc-20240605;
        b=icm46v9Za/G8M4ulycc1O6eoUZyQAEAaHrbreUY6VHZJByvkLwa1TyzdWvE9q+G/KQ
         fCGsWz43re+oAZr7ZKSMWNIdcxJXnlWcapwtWfFDufOVWV0KHh9YbApy9m63deJsExhR
         fWf6KvatzvtYQdMpfT5HJcMlXgicYZFr/bwvvkNNg8U207VO8RV2dWryg/neeD4UnvvL
         UD0jJntr8vzdZXqr6hFGGpaTsHCU4u1LIXEGXK5BuYhM9LoaVsIBjNfEzBuwsqUNvSMG
         IQ5mB8wdeLfzvqNkCGPZsbnGB8P+5JcWZljGPw61hylsMDZCGS102zml5G45b7csfqeK
         R4tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dGy8YHOGuSh2N3eIcWlk7IPH/bQpL0e0bWKETQzWtaM=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=Vi3pCGiauPddatB2HtcB601mU/+JkKOlQpE09WUp4lNXUv0InjAoiG+3nxB2RYEs8K
         dZV4JzpuDMwtOq7qg0+atGbw9RsVNqlkARBP6J7GenqSbChlJyw9f/5R+/PDw1UCEmm7
         UOt+vJDlOEJfGsa9oBMsfCPgIeAufDzLjGsZDyrYf78hoj2fseRMZwWePax+ESJ7DFfj
         WrTHxkPqLB++0FY8+C/nWx5MyhxApGOWoZ3WCPnB1ptVADosr022k4OuzumT9TIRExUa
         boDGsV35rfc4LMBOTeP9vweZkgWfANVGfaT3sfDUyexiCq+d1CrQXXE2WlefqigBdJhb
         XZmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779594731; x=1780199531; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGy8YHOGuSh2N3eIcWlk7IPH/bQpL0e0bWKETQzWtaM=;
        b=dAXJ0Sb9v8bZG1rA/zmBFP+1B6jSfUzHS413/3MfnfZ3xZ0BYNIejD1BwlFd8gfRXZ
         pvsDgwJrFCa13OAPGj9ZaJH2DafE58o4bcsTsOc/ZhDRY6SvjN8MrChQoxmv3L0EUxRQ
         f36mrIDHW0w6C3gSbFbh/E1nhmYOEkkToo8chHMmY14JEuHiwuQFalClerC9AaCgYGtV
         cVY+vcmmyqsfjMhQHfojAspme/RqzvyOxU9sYjcqLe033T5T4mYtOqsdEGdjuSCoHPwS
         BPI2cUjL5ulcpMv2sSo87yOw/oWReviJ/LMNjnS+n9OhObsQeSrbbnHgtlrP8YOb3k56
         h7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779594731; x=1780199531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dGy8YHOGuSh2N3eIcWlk7IPH/bQpL0e0bWKETQzWtaM=;
        b=m3975yXGZd6RDojhQrTpHRwieltIZ2yynW1jYJkEbjprwrqYerxng8zF/fQEia4GY9
         Adt3ybMScdoWDzc5YjMzEsyZsCSpLEiKB5JFEpVeepNBFSz0gTC4Vw0IZlZybOLLb9E3
         PUqbV+YXshtMOGTswN3QDD9wI2UQ5JJ4jvIqq19361DC4kwDHxdWjVaTHhQvaMix4TcX
         L9X5l8s9K3dAkIk7YIVCS8cg+tG5umGCip7/+ekxIPDm9sYOtikp+SPoNTZz+CjsruPo
         /TZC54Pz4sVzOT4qfOZOgu4zXxbv2xGm53BeRsbvPkZWH4E5bHhcDGQEGwCnj/FOaeqX
         wLnw==
X-Gm-Message-State: AOJu0Yw3QJX9h6TwJ7I4moEUZfTpFc/L5IJRSjizozqjuJwOZLx4/3G4
	ywwpQ956Zb9fFIzHB/A3TzopwXEzVn6eTqZBh3f+FKJSZoMo+VwLgGIDwlCLbr9RJM8qKwMp1oN
	ZVVor6pZmmQLfP2NUbro1jQ0BFKagBD/CDJ57l1qI7x2rvhcyijbji1TC51g=
X-Gm-Gg: Acq92OHIjnIO3pNuUnB0/XC8SvvjX4xiVpNdhZp5lKuT0YLWR3CFXCZuxgP9UEi1afj
	BenfJ2cTQmGMq7/AgwNycqF6I0LiWR+DMadqsCpMob3oFggYArYqUHbuUpH2CKRjc0hKirejRFz
	yFlb8Vb8MVCj9B6uNoJ9Pxf3uvXJ5eQWjXNMOU6InEJQa1oeVIUdLK8swLee65tWUgHmmrGluGK
	VQqmKIkEmFZX2EryTDQldHVzPH4t3w9/g4ARrrXLrpinTJ9sqiWzSO1LB/NLQbkpvoJFK+5d3GY
	oxz3FNfp4lRWhbk7QpxyytAD2vTpteyJ9+RwqvFezOz75gfP+2FeV3PsodaBhqZC/pmVkGhO9S8
	jjKhQsiST5JuvwKIhinGepFkR1qU4nb95z1xXJpF6UL/NSUFxn72lzNG6gXhqHp0G2PyrMTVcBw
	==
X-Received: by 2002:a05:7022:e98d:b0:130:9bbd:47ec with SMTP id
 a92af1059eb24-1365f6fe11cmr3076626c88.9.1779594730148; Sat, 23 May 2026
 20:52:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260523083001.2911931-9-kuniyu@google.com> <20260523094252.99DAA1F000E9@smtp.kernel.org>
In-Reply-To: <20260523094252.99DAA1F000E9@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 23 May 2026 20:51:58 -0700
X-Gm-Features: AVHnY4LBikqAQlB4TMDabsQ3-7UpeagswaGMzjUl3CfqnJQs9wfnmdWVOYkG5AE
Message-ID: <CAAVpQUCw2i_XtBSrU9t_6gDsus2X0=cwjg_27CHH400ryQo_ew@mail.gmail.com>
Subject: Re: [PATCH v3 bpf-next 08/11] bpf: tcp: Reject BPF_SOCK_OPS_RCVQ_CB
 if receive queue is not empty.
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 2:42=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Lockless call to `skb_queue_empty()` on `sk_receive_queue` causes=
 a data race.
> --
>
> commit 928b34616ed5f1b766d25ef2fd83e4165fe1e903
> Author: Kuniyuki Iwashima <kuniyu@google.com>
>
> bpf: tcp: Reject BPF_SOCK_OPS_RCVQ_CB if receive queue is not empty.
>
> This commit modifies the behavior of BPF_SOCK_OPS_RCVQ_CB to explicitly f=
ail
> if it is enabled while the receive queue is not empty. It returns -EUCLEA=
N
> to signal that the caller must drain the queue first.
>
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > index 82ec2291d6f00..4041b9fc1c741 100644
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
> > @@ -5390,6 +5390,9 @@ static int __bpf_sock_ops_cb_flags_set(struct soc=
k *sk, int val)
> >               return 0;
> >       }
> >
> > +     if (!skb_queue_empty(&sk->sk_receive_queue))
> > +             return -EUCLEAN;
>
> [Severity: Low]
> Does this lockless call to skb_queue_empty() cause a data race?

No, the socket is under lock_sock() here.


>
> The __bpf_sock_ops_cb_flags_set() function can be executed without the so=
cket
> lock via the bpf_unlocked_sk_setsockopt() helper. At the same time, TCP
> softirq processing like tcp_queue_rcv() may enqueue packets and modify
> the receive queue.
>
> Since skb_queue_empty() performs a plain read of list->next without
> READ_ONCE(), this concurrent access can trigger KCSAN splats. Would it be
> better to use skb_queue_empty_lockless() here to safely check the queue
> state from potentially unlocked contexts?
>
> > +
> >       if (unlikely(sk_is_mptcp(sk)))
> >               return -EOPNOTSUPP;
> >
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523083001.29=
11931-1-kuniyu@google.com?part=3D8
