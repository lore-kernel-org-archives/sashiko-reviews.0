Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794830617;
	b=Ne8Fw/uMiU59RAxa6R3qZQwVPp+9UWYURfr3ynNCCBab6/Y3diQgwDZuWnOyWuNAd4KD
	 lG5iClS7L62bjYluV1R2vaM1tAxvefj0ahHtr+BJFdKvhI3lV5SHAoKaCbnM9tx05c4I3
	 fKECYQ6j244hJJZ3scOHbmlUy2LelvWCpyeD3Il4v8g2AWRHORWulPK4vfgp3YGBPyWJ6
	 9NYRsZe51P1WhRQ8h6FsnkBu3nrEILYcRE6nvehbDLDDUDWSx5/Ga1ZfZ/fAW5wiOoM0P
	 p55vCJj49vIK5kLk9xw+juxTd1oVBap8KevFNFb/GYoaz5uA3ndaRvEsHVibnngWVUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=WiA9mgxsVKJJE+AKOVKJEbQPnJuFJZeJObt4tmh0PaQ=;
	b=cHFY2bLgJlkTUhos/8PhwTkWTIhXL83RJKyFG0x1Y0LQkwDIHsOnjN0P5LnA7YqsRyUv
	 3uzG2HpCqsATHS7NAYyIiVmZFZXPcra2eIYAlpCj6f6BpMT6i0bYD+IK60ld8xIn49gMG
	 jWKaEiB7wMMdujol4jKbVMCVf37r8GjMb2qxh768/oLmxztoP6dVsmSP8WG/Tjm8N7KlD
	 xZYXw3EauquhxiswuuhcpcLMsLQuCu8PF22uJULuwh/lyNWZ+biQvcfQ/FB0O0+raoK2B
	 oUb7W79gvDYwO/VLJzR1LEBs58++FDO3ELZcOLjxPqDjxFdEOmKfE1MG4t1ff4AoDuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=ynDMEFrd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDDC606A33A
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 12:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DDDC606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=ynDMEFrd
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1532637b3a.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 04:03:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794830616; cv=none;
        d=google.com; s=arc-20260327;
        b=enOcaQ2JfVQ4qGXprld78uusvLvRrEBlL1Cmq1M85u3n4GtZybpVeErtT2TjxT9wsD
         rl8vQASXA8mXlA3C9fIqv1BKSWEQha8rFc5TC9cEl/WvyQccpRBWzALmHDGvb5A78oWi
         +6gESPIAZwuA/mvJbQGJDWCa3Jiqo5mog9jLk4w24jkEk6sLL6nDNyWypszOs1oNExW6
         NK28LoLj8Lflwux24XdXntAXssnVoTj/AU7mliNed/8LzgIGt5Nyy+FXDswBk4ETCKZM
         Sci3LnT1QFdRmmxN47H6yGmrBgVICfoTr3mo9k+m1kmufo3zozfSnGn8QyhWI4EGhe8P
         jZtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WiA9mgxsVKJJE+AKOVKJEbQPnJuFJZeJObt4tmh0PaQ=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=GcLuaItpdKlz62mGQJoiU7JTVat7/xOEgIku7HgCHps0L7L1YdK6IB+cbXufVUaoVT
         f+9i62IOspGVCDwO2busYDmvc0y0AaeMgYA5PK4p6VC+gcn3NG2bItHzUfBwys4I0siR
         vw8j1xAba+RkBFhkW0NaIGlXWkMspThOg/X1qrPSmngyjsErdYr/Q88RdnI2aejUear9
         jtBvQ4P3d03nZdhFsKmFhjU6hZySUCVwyIorJFCSeV+m3h4/vU07dolnmeVh6Omb3o71
         N4li8LABJQ4qXe83XXDDZIfw3fGOxE0RZj0Ff4l8vYJnqLowHedLpEo5BxLxHZK++/Eh
         Z6qQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794830616; x=1795435416; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WiA9mgxsVKJJE+AKOVKJEbQPnJuFJZeJObt4tmh0PaQ=;
        b=ynDMEFrdnOInCwA2dMOcGW7D9IWrAToWBWVlaRkPVsIYXowRtWntWvU1PTFG22r5rq
         hQc01Nzj/W0R/uu+ays7IpC9SHWaL8UM09T2LO+xeyHpwVZ33gDAeV44uqB3BEKQ3BPn
         FH35n/44KZxQLZmn33IOjhuYBspCzqldSTZWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830616; x=1795435416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WiA9mgxsVKJJE+AKOVKJEbQPnJuFJZeJObt4tmh0PaQ=;
        b=rPOwHBfpioKljWiAmVnNHawlSs26IEy1UqwR1tT2aS90bNjF68Bnbwu0CJ1+WZrqw/
         PvtIyYNsysE1CPPSePF0OSKCgL1xpqWHxyXpIaS7RQfF4cOrRZXEoAOLWoC7ZzQscjIc
         9Z/4wKAC9Wyf2V5ph0aj5gpKtwPgkL/5bsdNRm8Jt+SsblnmvTQDtL/hM4toeLrSEHcl
         JGKJF1pzhLBXKnVheK5KhMNEPNxLzYH7Lp2pjaEihB3VwbzAo/3HcVkyEfUhPy2qm3Nt
         4eiz8MPEhOcoyyBWxRdIf3qSgiYtYXC1aYiU6slKHeLWfXeGMKZzs6azX53+wtnaiAc/
         Y2YA==
X-Gm-Message-State: APuU4Z8z3v6HTRbAGtfC2cOjBYX+XQcwiM7Bapman8ZFGWL4q5URXdIg
	Pky2rkfwDjasCzgPatxZ6PTKyHal1ok9PZ3fwtPSnw4YUaPfoSgNtlj0pSLWyowXUeVxkRMjNJ3
	t2/jrEOErxeSY4Cx5dylzIDAAKhApQu9HkSfFVAbu+jq0+jsM7TY=
X-Gm-Gg: AYBFou3qIASzZ1zdWBOUZbFEq73GKAC0CWYZqDL8ScuGvvU1ieNVlTyEGuigwLKFVWc
	b/HpHYrioRewstQzLnmQEQ7nmxEGZ5aNKJULXdvxhNpdNGTZfU+fQKuLaWuYgDZyLZIAuLm5lyX
	L37Il2PcN0FVJNyULPvr7MLPIxOUQIT3Rb0V6myzFHtqk46GMl+rTfz7/NzPG0R4ZgmJqnu1hi1
	KnJ9XnU5utEhqP4ZivDQU8I/v0KNnlzIgLrnPlkGzqVY/NIDVxxlTlFDmmP0eCfJE++HtQwye6m
	0TRNxkudkxUDZQ80xeLgO5VjBCPpKepjkHTcDy05Dt0eJfaMQZaF2soJajd+8cvzZ6FHFAWYGae
	Uy6PivqfHG7zuer4M6iVALJmXtTLSaTDqlS+p22xy/qi1NhEM3YISKwI1/G7fozdiGJF7D4yx6y
	E6KyzINEo7lAqijTY=
X-Received: by 2002:a05:6a00:995:b0:89a:5:92c1 with SMTP id
 d2e1a72fcca58-8beb772bd38mr9332011b3a.56.1794830615662; Mon, 16 Nov 2026
 04:03:35 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CORE-9NOG.v3.r0.20261115050625@mojatatu.com> <CORE-9NOG.v3.r0.20261115050625-1@mojatatu.com>
 <sashiko-outbox-216710@kernel.org>
In-Reply-To: <sashiko-outbox-216710@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Mon, 16 Nov 2026 07:03:23 -0500
X-Gm-Features: AclHuK-I44M3b7jIQkev6qAYIWNeFTMf2zzj3IKpSjGp9BFft7gh55IgmHG7xkk
Message-ID: <CAM0EoMn0Hq9xZS=zOm5-Bj-y6jkLbtLKsxxOAKnFhAWK8SJLfQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/4] net: xfrm: interface: restore dst_orig on
 every xfrm interface
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 5:19=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] xfrm: interface: missing Fixes trailer in bug-fix commit message


Remember this for the future: net-next patches do not carry Fixes trailers.
This is a net next patch. Just because i use the terms "bug" and "The
Fix" doesnt qualify i put a fixes patch.

cheers,
jamal

> --
>
> commit fc50a8a0e09367a243cf350a9e4dc409fd76b617
> Author: Jamal Hadi Salim <jhs@mojatatu.com>
>
> > net: xfrm: interface: restore dst_orig on every xfrm interface
> >
> > Found while testing the dst release for the two producers that steer a
> > packet to another device, fixed later in this series. One of the consum=
ers
> > of the metadata such a release installs is an xfrm interface, which
> > restores the original route before the xfrm lookup; the swap warned on =
the
> > metadata dst still installed in the skb, and only the collect_md arm
> > restored the route at all.
> >
> > The issue:
> > An xfrm interface takes the if_id and the underlying device either from=
 its
> > configuration or, in collect_md mode, from the xfrm metadata on the skb=
.
> > When that metadata also carries the route the packet arrived through,
> > xfrmi_xmit2() puts the route back on the skb, because the xfrm lookup t=
akes
> > the address family from it. skb_dst_set() expects the dst slot to be em=
pty
> > for a reference counted dst and warns when it is not, so the route land=
ed
> > over a metadata dst that was still there; a kernel built with
> > CONFIG_DEBUG_NET=3Dy panics on the first packet that takes this path wh=
en
> > panic_on_warn is set.
> >
> > Two more defects sit in the same place. An interface with a configured
> > if_id never restores the route: it takes the metadata dst as it is, who=
se
> > address family is AF_UNSPEC, so the lookup finds no policy and the pack=
et
> > is dropped as a link failure instead of being transformed. And the rest=
ore
> > moved the route out of the metadata dst, which a clone of the skb share=
s,
> > so the clone that reached the interface first left the original packet =
with
> > nothing to restore.
> >
> > The same slot overwrite is in the unstable helper a tc-bpf program uses=
 to
> > attach that metadata: bpf_skb_set_xfrm_info() records the route as dst_=
orig
> > and installs a per-cpu metadata dst over it. The per-cpu dst is shared =
by
> > every invocation of the program, so the restore cannot keep anything in=
 it.
> >
> > The Fix:
> > Restore dst_orig in both arms of xfrmi_xmit2(), taking a reference with
> > dst_clone() so the metadata dst keeps its own, and empty the counted sl=
ot
> > with skb_dst_drop() before the route is installed. The helper allocates=
 a
> > metadata dst per skb instead of a per-cpu one, so the route it records
> > belongs to that skb and is released with it; the per-cpu allocation is =
no
> > longer used and goes away.
> >
> > Conditions to recreate the bug:
> > A tc-bpf program that records the route as dst_orig with
> > bpf_skb_set_xfrm_info() and redirects the packet to an xfrm interface i=
s
> > the shortest way to hit the overwrite. A netdev egress fwd rule that st=
eers
> > a packet routed with an xfrm encapsulation into an interface reaches th=
e
> > same place once the dst release earlier in this series keeps the route:
> >
> >     ip link add xf0 type xfrm if_id 42
> >     ip link set xf0 up
> >     ip neigh replace 10.20.0.1 lladdr 02:aa:00:00:00:ab \
> >             dev va nud permanent
> >     ip route add 10.20.0.1/32 dev va encap xfrm if_id 42
> >     nft add rule netdev t c fwd ip to 10.1.0.2 device xf0
> >
> > Send one packet to 10.20.0.1. With CONFIG_DEBUG_NET=3Dy and panic_on_wa=
rn=3D1
> > the kernel panics in xfrmi_xmit() with the metadata dst still installed
> > while the route is put back. The interface with the configured if_id dr=
ops
> > the packet as a link failure without consulting the outbound policy, an=
d a
> > clone made after the metadata was attached consumes the route before th=
e
> > original packet arrives.
> >
> > Reviewed-by: Victor Nogueira <victor@mojatatu.com>
> > Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
>
> [Severity: Low]
> This fixes runtime defects in bpf_skb_set_xfrm_info() and xfrmi_xmit2().
> Should the commit message include a Fixes tag:
>
>   Fixes: 94151f5aa966 ("xfrm: interface: Add unstable helpers for setting=
/getting XFRM metadata from TC-BPF")
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/CORE-9NOG.v3.r0.2=
0261115050625@mojatatu.com?part=3D1
