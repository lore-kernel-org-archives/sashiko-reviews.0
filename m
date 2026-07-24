Received: from mail-wm2-f2.google.com (mail-wm2-f2.google.com [74.125.225.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40F13B42D0
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 21:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784928602; cv=none; b=ePv7qUjjzWDcfJgXKiyur31b2+XGIzK/KeEGs6c6YbBFBtzM8Y+pTLPjgsm8oGtCz79bLwJr2ONe6pkqFlB2JivTmcQ8vTn240GbT13wTZWeFLg1sPliml4mCZGzr8ceo0T8lHj0ZZBd/+OHAZBRaxTZ9EbxZj58yvetL6lsq1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784928602; c=relaxed/simple;
	bh=zMBmgg/RBhSAgDWS7HX1nOGrgYSD0b1YbDOMXyaJheg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=aZr/0/hQQ9n/QLFbm9Koo3+3INV5ira96prDnVTuMBSn94U1mASvHSojTMTex5wNkDVIvZSkZ1bXZIg9Todujm02PhrDNv8/in7rmTbVIodv0JlxaeT4RQptWXLGh3w/EtzD/UcvXhm3cWVT9LoykGC5RPsCNLMfBAlK6FMFvts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drfZRvEM; arc=none smtp.client-ip=74.125.225.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drfZRvEM"
Received: by mail-wm2-f2.google.com with SMTP id 5b1f17b1804b1-493b9643ab5so2231365e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 14:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784928599; x=1785533399; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vxFBFm2O/i4oFd59BqOJqDt/u+w3rUv+XhurUQThtEo=;
        b=drfZRvEM+rkL2agT3jb1GvNDhU8zVOHpEKZjOcCq6uk4hyCHHW9ychyHMMShShOVEX
         yRSNX2ztIrYyttl0p7JXgBOBDmWQiYViQlNvD2rWeS4+8HHTMEyiGbw69H5/km06c0yk
         KoZpMoqL8IXAgPDLLR1ee/F8glM0F485qrCNWBaZGwanzYu+HJEVStLwz3ZLysEX7UD2
         tqkXokk8iA6utJ0vk0QvindTGImRCxjjnc7nINXurE4sZ9vDpwrl2V01l7aqVD9okzNH
         tBjiS2ygzCNONJr5iISfKx/U9W+oj6GBDu26qk9Bu3Z7Ybmt7nP5OUmMD8h3Eop6Hk/8
         GbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784928599; x=1785533399;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxFBFm2O/i4oFd59BqOJqDt/u+w3rUv+XhurUQThtEo=;
        b=L+ZX7F7q6Aw4A/h4WxOMGSPCWQu09pX+do2GQjos6pOmoTDGagVQcO9GQ7fSPH1Zke
         CKxfxL3R8Oj86PGwh12U/L3+f62P2wRejLogapq8sQQLF/qTBJB4YtENYsCfREQ2Rsn1
         40bqXB//1YwTEpIxklvqatveXrqppihFfwhAnvJAJHV33XpibNTcLKnEl9RRU4PmXgfQ
         mkkWj84vxNhsxVkxAnfF6KDaLGNjN54R9tIi7/wG7xqCK9ktQy7XUwuA31zhOxWxArwh
         6nYvEkRdfvz7aKP3PGjWwnqIVc65wM10Kc6rp96pJaJmwvAhZjcrOrGcpTYFZ8GKWmz1
         5evw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+KerROJWXczUsqsEDP2jUBStkCuaofGPcQMI0Ae/fP30DfIN/PwPGbHOT0T4a5WVRlsbGYwlDlOXZgl7BlUU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2Uj2cRbbK1DEkuiI7tG/7/Bz5GnCaZjp+NBqTLSE8VPAJKSOx
	B9kpDxqzX1CISJw8y1wlzLQBATYkTp1+cjmYmX0hLGhVGyeH9d0Kw0/xJ980Rwfz
X-Gm-Gg: AR+sD13ZbXpTkZQUyLK/hd7/8UMziFBg5AhiK7D7I0cvU//r2DXX7XSKUqlY5tt9yY3
	Jp1GSZnwel9WXJ9X8LKdgUmq5om55J7KtX5lsPExw6Qqdqlk/gxZv3BIGLPj6lsBgchqMaY/ARh
	AJG5EqY7/d/dLBLDa7xuam498EZhxNEYbpHnZ+puioz3ijVTvSleG8oUEh/dqrXfsZT/oYbnf7V
	aVMXnrz6umdNU+pPKTaiBsyHcw5zKgtkMzYADB4nxokvUpN9EZrZ9BmgSeIwq6c01ZHqqQmblRF
	qt8c+l99BXfFQDbrbTNFSV9LnhoAirgRxPAfXIDm/sEAV2iQwPEj+/HRsJpiPID6W7+r430ztyu
	MnTzcaqoc9Y3xMzaVMir2hMyU1V5S519x/J7vfHj69kt3VpbBpim6WRwdtyTMcyZqHSuKRj2Q8Y
	u720s/nDMPwRIkthVb8uGMPQ7kEcuVsuhDZ/DAV+EJuIb32MEFAyE/lnWbg4Q73VQTRCXGq4gW7
	9yMgotmQK9+fILj3rx0t2GlFSB3aieqqcabeJ8QawXk
X-Received: by 2002:a05:600c:500d:b0:493:e583:7053 with SMTP id 5b1f17b1804b1-496b5728b27mr236365e9.35.1784928598853;
        Fri, 24 Jul 2026 14:29:58 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f33b73sm12707905e9.14.2026.07.24.14.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 14:29:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 23:29:58 +0200
Message-Id: <DK74DPZIPH5I.2ZST2KB0Y63PY@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 02/18] bpf: Unify const map ptr argument
 checking for helpers and kfuncs
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Amery Hung" <ameryhung@gmail.com>, <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260724190813.1458271-1-ameryhung@gmail.com>
 <20260724190813.1458271-3-ameryhung@gmail.com>
 <20260724192840.1BB2D1F000E9@smtp.kernel.org>
 <CAMB2axPaPthdQ-pVG0PV21Wzw=dgWnFdPqi5FuJ1EeAEde-P1w@mail.gmail.com>
In-Reply-To: <CAMB2axPaPthdQ-pVG0PV21Wzw=dgWnFdPqi5FuJ1EeAEde-P1w@mail.gmail.com>

On Fri Jul 24, 2026 at 10:49 PM CEST, Amery Hung wrote:
> On Fri, Jul 24, 2026 at 12:28=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 3 potential iss=
ue(s) to consider:
>>
>> New issues:
>> - [Low] Multi-line comment does not follow the required BPF subsystem co=
mment style.
>>
>> Pre-existing issues:
>> - [Critical] Pre-existing verifier panic when an array map is passed to =
kfuncs like `bpf_wq_init`.
>> - [High] Pre-existing logic bug allows mismatching maps to bypass safety=
 checks in kfuncs.
>> --
>>
>> --- Patch [2]: [PATCH bpf-next v2 02/18] bpf: Unify const map ptr argume=
nt checking for helpers and kfuncs ---
>> commit 08bfe87a36be7126ec3db2d3ab4783e72b62e453
>> Author: Amery Hung <ameryhung@gmail.com>
>>
>> bpf: Unify const map ptr argument checking for helpers and kfuncs
>>
>> Both the helper ARG_CONST_MAP_PTR and the kfunc KF_ARG_PTR_TO_MAP
>> recorded the map pointer in meta->map and, when a map was already
>> bound by a preceding timer/workqueue/task_work argument, rejected a
>> mismatching map. This logic is factored into a single process_map_ptr_ar=
g()
>> used by both paths.
>>
>> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> > index e8c76abbf76a2..a3429610b426e 100644
>> > --- a/kernel/bpf/verifier.c
>> > +++ b/kernel/bpf/verifier.c
>> > @@ -8274,6 +8274,44 @@ static int get_constant_map_key(struct bpf_veri=
fier_env *env,
>> >
>> >  static bool can_elide_value_nullness(const struct bpf_map *map);
>> >
>> > +static int process_map_ptr_arg(struct bpf_verifier_env *env, struct b=
pf_reg_state *reg,
>> > +                            argno_t argno, struct bpf_call_arg_meta *=
meta)
>> > +{
>> > +     /* Use map_uid (which is unique id of inner map) to reject:
>>
>> [Severity: Low]
>> This isn't a bug, but does this multi-line comment follow the preferred =
BPF
>> subsystem formatting?
>>
>> According to the subsystem guidelines, multi-line comments should have t=
he
>> opening /* on its own line:
>>
>> /*
>>  * Use map_uid (which is unique id of inner map) to reject:
>>  * ...
>>  */
>>
>> [ ... ]
>>
>> > @@ -12122,36 +12140,9 @@ static int check_kfunc_args(struct bpf_verifi=
er_env *env, struct bpf_call_arg_me
>> >                                       reg_arg_name(env, argno));
>> >                               return -EINVAL;
>> >                       }
>> > -                     if (meta->map.ptr && (reg->map_ptr->record->wq_o=
ff >=3D 0 ||
>> > -                                           reg->map_ptr->record->task=
_work_off >=3D 0)) {
>>
>> [Severity: Critical]
>> This is a pre-existing issue that was not introduced by this patch (in f=
act,
>> the patch appears to fix it!), but could the old code crash the verifier=
 here
>> if a BPF program called bpf_wq_init(wq, map, 0) and passed an array map
>> without BTF for the map argument?
>>
>> Since an array map without BTF has a NULL record, evaluating
>> reg->map_ptr->record->wq_off would result in an unconditional NULL point=
er
>> dereference, leading to a panic. This could be triggered by any user wit=
h
>> privileges to load BPF programs.
>
> [...]
>
>>
>> [Severity: High]
>> This is also a pre-existing issue that was not introduced by this patch,=
 but
>> did this original condition allow mismatching maps to bypass safety chec=
ks?
>>
>> If a BPF program called bpf_wq_init(wq, map, 0) with a valid workqueue b=
ut
>> passed a mismatched map (like a map containing only a bpf_timer), the
>> mismatched map would lack both wq_off and task_work_off. This would make=
 the
>> condition evaluate to false, bypassing the mismatch rejection and potent=
ially
>> leading to type confusion or memory corruption during runtime callbacks.
>>
>> > -                             /* Use map_uid (which is unique id of in=
ner map) to reject:
>> > -                              * inner_map1 =3D bpf_map_lookup_elem(ou=
ter_map, key1)
>
> Yes and that is why this patch use meta->map.ptr->record that is
> already verified. I can also separate it into a standalone fix
> targeting bpf if needed.
>

I think keeping it in your set is fine. Since this is not reported I doubt
anyone hit this in practice, though I agree it's worth fixing.

>>
>> --
>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724190813.1=
458271-1-ameryhung@gmail.com?part=3D2

