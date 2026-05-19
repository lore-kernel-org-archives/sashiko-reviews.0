Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E464C21D5B0
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 19:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779220689; cv=pass; b=WSRxpHr2muAsFLC+zzoIjyAzSQ5MqlQMCFLPCEXsjtzLmwrXwsVjCod1WsysX+k0bmc+i33r16dIRpyHdgbS+v8aVVLaX/uExu1b1fH4ee9RP0QnWT6sc4Prjmvq7J2w27gZ9F8PLxOeMfj/TscdKSsxYK9tjMamTI5+SZqIh2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779220689; c=relaxed/simple;
	bh=MkQ41IfwJ0nvjPn4fveYrRfBVnbitV8rEVwRZYxgI1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRcga3TfpG7UhztNjTOHZx9UhTi3xCkibTRzE3SUn309KQkzdww0s6GtlGcV36siMyVhqIMkJFjEeeJ2RB313Ky027i4hDZI/E/61/klyTq8lFZVgsuOjumaTFVcZ7aDfMkv9jTVzGHi3W7z58UFTpEcZzSbZXZFo55zRkBblvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdNXNjIO; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdNXNjIO"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7bd4c61765dso36854657b3.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 12:58:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779220687; cv=none;
        d=google.com; s=arc-20240605;
        b=YHU7w8HHANXEW2Xoe1uLiaL4T/rIyHchdeCidD6WNT11G3a5kMvSWv91ZMXJF3rX4t
         rZFtjnqhZR0Ogu3m+HAxXZCf//98EeoFSlIs/Ik2VAmpUP8W5gARACEj1xnLB6hvmNk+
         bVSjMJkhMS0KJjmcJ4kVLzsrvgp/26SONiQN4sX3NFJqxJoIz6WI4rYusWtusXogSnZd
         910V+dZESskegs5CnY6pdBc5xghiyOavFLagdZMpkXGvLJ4lLeOV7onK847mJZO7hfqN
         wrs/agEdoK8k2xfE3mvhiJmOAe9ZjnQDThU4Hmcsq5Zc3Ud6tuJ9phBtP/apUcMEPoFi
         oIwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OkKi7olYT0UMvP1V+ApFdiGBxqqlUbmJyXbpHlsr2iM=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=hdmqnRWxh9KESJ1UKdhhMikD9Dh+1lHOikTqr2a8mfgOv/yD8Pl5RVYw9XhLe4u0o2
         h6TnAwq8aNeJHUxS8eMF6H0xDLIZBd7bFXsuNlwJIjqTK2LBbV+vpnRf2gEtwBESFasr
         DMbWBArX04WYLfScPL+WA4/OrP6nSSFKhrm7uxGbPZqDWszHgHI06PmFUqGLW6Nn4Q2B
         +EEEOUwL9KIsblMfmPpJ2T6SODz3EHihPlEOf7YeBc8l0kLJtU5i1nmM7LEFqDaWKSNT
         foBlyp0ljHzlO2CLaFV65ZydtQTbrYXN6zC9+orxsTcJzGPRqHE2GMhA5HdpdKazEsKw
         9TeQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779220687; x=1779825487; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkKi7olYT0UMvP1V+ApFdiGBxqqlUbmJyXbpHlsr2iM=;
        b=mdNXNjIOySxqW+uBv7bRLQKvZAC/OGxfj8VO9PQ2nvpLGpNlN2mj0qAk4KMQtEf/DK
         JYsk513ogy93Jdy6XAF+EHjLWBFBkt2iqFiN6MZ829mmJ5HrttVVcMrzAkoiRsVmOV2l
         Q8BCbzwYHN8VbrVhYaz+MRWzIgyy4FfJJCP8a+LsnbQOOSnsf4LuxvqQjhB9+wkxOGes
         I/6JnTJgwSgTDzXObHQVEcSRiiA/nwvQJj9Hknzn+SoB57g1NFAUwFGYQ3GfEI7nUjvf
         vvk2hmz+Dt1IqKYxvfYeQ9IWNAWKV0xL0VIO+FmdBrs2BDNTJCcXA9O82etLkADvFtP9
         dk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779220687; x=1779825487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OkKi7olYT0UMvP1V+ApFdiGBxqqlUbmJyXbpHlsr2iM=;
        b=gn5V4SvaLOd0H246Ju2N3g+eXnI57I/Buyj9fJLwfmkxrWtx5jhd9xnBm2oBJ+WYZh
         v5bILRAxviENXYAs1QRr1nkh7TuOJ4wkus5KfmIjfsPDIz7jA3bRmmi/lKwXNAfPTNwF
         FkBAhJB+M1TzZZhuFtKChozIGWuUfKzX9WF+BwLCFqpvjybQ84Bz3J1JG8KTYFRSRfqU
         3V845U1cD4AEWmxZfdEn9utDvRmxc7VW4yxmS5ziVzH5xjj9+foZap9pDVBCT7FNJxFn
         pg49iLPKJq2hO6guYI44cb2YzOdR9MHdBhfFPGkV27HPCazQBMVKjfIKzpS5eUi14Xsp
         ijdw==
X-Gm-Message-State: AOJu0Yz4hl1UEtPnq9t0WT6Ct0Trgjxcul2s/XQqiB6EtTEGgyqnyunF
	ck31PJF2UgjDwpfk/KylEICil9i0nXRSjjshi7UUW+oCibcvoLlXgrAbqCiJ3JoNeH5Ev89p9Cl
	2yqw6vLO8/vqd0PMU+Qm26K8pNwLxq8zzezpk
X-Gm-Gg: Acq92OGsx8gLH39YydVzIp3Q6j4LoGS3+sjDWkyZzyY7et241TT2r6TOP0RxpwNz1yU
	9k7Ie33n3RDJT+DqRj3Gx5/WUMKsjbxac6NByC0CaJ5ikGibmYof51xKfioMBzdp9L5Anv449lW
	ogQO06s71y4a7OhZ301iGM9yau8gAlKHh6kUmK/VMs8KDnJ23OCNXQ2jCCGdnS60NK9Y1KPD/j0
	fLbP7BT4BCTwKLFBymKWiesSQeVwVlIhzyGwVcOUBwO+LZwdTL5wr2K2/quh9U98Y7wRPWxbJl4
	dJuTDH6DH1M4IN2PVbwwl0xlM3I6/Qw=
X-Received: by 2002:a05:690c:e3ce:b0:7bd:8cc5:6bdb with SMTP id
 00721157ae682-7c95c6edd6emr231497557b3.35.1779220686647; Tue, 19 May 2026
 12:58:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260519181314.2731658-8-ameryhung@gmail.com> <20260519185519.A746A1F000E9@smtp.kernel.org>
In-Reply-To: <20260519185519.A746A1F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Tue, 19 May 2026 12:57:53 -0700
X-Gm-Features: AVHnY4JmK8v0DHREJQ1CnU9JGl1GTlGh1s6crkftapNbTQuHiwMwEo1ZwnKJJHM
Message-ID: <CAMB2axOdxq241ZGHGqeT2OPNtW5r8bkMu9egdso5W2OBbRsexg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 07/14] bpf: Unify referenced object tracking
 in verifier
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 11:55=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Unused legacy fields `ref_obj_id` and `id` remain in `struct bpf_=
call_arg_meta`.
> --
>
> commit ff3476feb916076d44d843f726cd0727a0a067bc
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Unify referenced object tracking in verifier
>
> This commit unifies referenced object tracking in the verifier by introdu=
cing
> struct ref_obj_desc to consolidate the id and ref_obj_id fields. It updat=
es
> kfuncs and helpers to use this shared structure, replacing open-coded upd=
ates
> with shared helper functions.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index edebeb3ad3635..bc7f8725cc698 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
>
> [ ... ]
>
> > @@ -231,9 +231,28 @@ static void bpf_map_key_store(struct bpf_insn_aux_=
data *aux, u64 state)
> >                            (poisoned ? BPF_MAP_KEY_POISON : 0ULL);
> >  }
> >
> > +static void update_ref_obj(struct ref_obj_desc *ref_obj, struct bpf_re=
g_state *reg)
> > +{
>
> [ ... ]
>
> >  struct bpf_call_arg_meta {
> >       struct bpf_map_desc map;
> >       struct bpf_dynptr_desc dynptr;
> > +     struct ref_obj_desc ref_obj;
> >       bool raw_mode;
> >       bool pkt_access;
> >       u8 release_regno;
>
> [Severity: Low]
> Since this patch consolidates id and ref_obj_id into the new ref_obj fiel=
d,
> should the legacy ref_obj_id and id fields be removed from struct
> bpf_call_arg_meta as well?
>
> Looking at the rest of struct bpf_call_arg_meta, it appears these old fie=
lds
> were successfully removed from struct bpf_kfunc_call_arg_meta but were le=
ft
> behind here.
>

Right. bpf_call_arg_meta::id should be removed as part of this patch.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519181314.27=
31658-1-ameryhung@gmail.com?part=3D7
