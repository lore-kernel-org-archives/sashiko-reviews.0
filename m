Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692FD3AE1B4
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 14:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788791398; cv=pass; b=bhKHsw6H1PztQ44K0Wtoq1dCwzCOcDniwsUl1OZ5HQoCMyhJGkAxXwPfj/XXLLwaHdy5GF7WKA1eSvr5dro15lcrubbg5Cs0H7JWXYTF10XaQxs9rPqfkMj2zvGqWbeKfqt1SXdMOxmjhuQEBwdsrRBSKXkHYADqR3ZHegjRpKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788791398; c=relaxed/simple;
	bh=GnyiwNnusHkZANyFs0hYxcokbVAXMt7R3A4orSUAYCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vucjo2OfFJ6Makz3AKhRDFud0yBwUBzWTt6XPHsarlFklO5ojUc760Sy34yJmCY2KBoBJJc/ibNNAkBXf3pxYZPK0pP4eKbw3SXl63HRfnsOr8kpnxfp4DtUj1pd5eptGaMHL0ibf6b7yGIBnkQqW18k9ZOSLQkKiO1XMgTIpto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7ffxmmR; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7ffxmmR"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c250c6a6a6eso469394366b.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 07:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788791394; cv=none;
        d=google.com; s=arc-20260327;
        b=l/Gvyh61lDEYyUA0RLHJZ4pQDHmhFabPcYfKdsbvWROZK4dqUi3CHncqoHOOD0S14q
         Asl+MX3NDRvPWkFAuGb2se1HZ6a6+iJJ+9faXU3ouKT4S5VPm836EyvgXOomGnYKtCEr
         BngpR9gq3o45DyQHrRRrnUqYWMMcJeAtsrlRJt/ROGj3qvlxW6dj4uKda0Dgpbwjs3mQ
         slOWw+Onq3Ekq7teAx3OcLOai3ngeX96YNPOs54TKZ8iPoeM8jnKh1ijZiH0EEfRB8wZ
         VCmlI4IY3IktY25VGrJfxYnoqEFB6Ye2xtzeMlBB/iUxSsr9UZ21XaaJ67lZAHfbXD39
         Nasw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8qZMkf0jfpR8nCae8dl7Goo8CyHWdi8M7u3xND3CPYw=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=BHVRTQZNKEO3SCFE6PKa47dD+ddNnWy7NGJXi65WF7SSpNA6RN6BzDi/9Brlyfa+1y
         0oNRH52rHx2XrtYNQDNqcCb8BfugElMMoqS22SbAMIKAKKTHk0B8OLNhsITAcOHtJeI0
         PyukDD4O1oPIod5MUSnKepZveX8KulwgcQdpDq+mGgi9qlegSn7RGhfycY0OHCX7cHWp
         tQ7d4YX49jAC1AQMYaVY5Q9R40IFDazZ2zz8F27IA0exSZBbnvjotSBHuX879eeri4SX
         WtzTaKYgSUd+BI4w/FVs5VuMqGJSdIneGuwGBz80XyFtX6bsHCU/MBql7lM3vkmcWu1C
         X1Pg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788791394; x=1789396194; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8qZMkf0jfpR8nCae8dl7Goo8CyHWdi8M7u3xND3CPYw=;
        b=V7ffxmmRS1sdKieLAt6XLZNrBe3qHmTAfCdGngNAjoSUA94X5H71Ls1FbFF9WfLlx1
         T515i4neC2WaKGlG0l25UCrE0lcI3qUnjbUlvLKLBnOtPs93A0Z/YMcWPcLydp6NH/+W
         +cal74vSNu9jAxSS/OEj6qO4rKmnm8As2r3M7bmEMCHb1cwNz3/ipmKyqHE+TY7VhlFD
         sbzb38wEUad3PWoKE5a+uMJX+5V0SWpJ7Q0RVJ/sIyINc4IfkrEBoVNTXr/IAZXcwvrp
         JBIiWGF9+GSOgGUzDr0hFmSizOwN8KJz4N0phMwVRA9nfy2B7KBKV6t8Jw6EvImqYuvE
         keyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788791394; x=1789396194;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qZMkf0jfpR8nCae8dl7Goo8CyHWdi8M7u3xND3CPYw=;
        b=b5aZm7FHnEu8wMc7Kntw7kSNEXENzkuTaYwqxlnzPBqlGWc13HBs6gBQS1SSgsVIj2
         6RsC+HDtBEPoNVDm0ZtS8a0XtSpj3tQ9Ue53rh+5scQVUB/h9WXmW1llAJJMXgVnWHp5
         zhGN60rLvNk01AD3azUiSr0G3cE7mmuWZ/BVRXoEnkp4aeRf5lHvFJhEM/D0ebtjQrDr
         M73nZCBKT49kDW42hEnP1FEb1loQzVUhGa8OfpRRFB+vz/es38DauO8uLhqlG+FupThB
         Ee93P14t5rtwVXSOKzBpjMWadShKUS82uvWF8UsVPJ4+gJEbrZUzLvJVH/77+tqP5J4q
         ISMQ==
X-Gm-Message-State: AFuF++ldcaROU4OFkvf543XHDno1zb6CGQWUfShsVPGYNwVXP3KYw5jg
	n61kHzpLnCcclLANqZ2pcqI/hp/kRs7uNKivtAGYu4SaZQDVKSCC7ctxolL53k+YUQDVcvY6u0s
	gEQPFmz3SNmsSOKA6XJDIAxjw0YYaEsmvR1NW
X-Gm-Gg: AYBFou01yXpvrRB686oyPaFGHQUIrgPIvmFYDR1fKztEv3YvaSX2pO9E7wSoGsatF4l
	sPU8S9IycTJsZmgcrErLxiZLFyw/i42GvrOVlTiDzJbhfEnsS9DuDz2qnPORTZzBKfphYg8o9bl
	kR7I5ND2h9KUqmPzEvxPUc6XYk3NfeOO3/T81PmuCgQjELv7wFDHKVr2CWIvIc7quZP4uoYo5xG
	4H3XxoIBzvDl3NTSiVXJdmqeKo2NLhCZLg94D4iZlQDztDns4rNry5MZYzFVEjbAN2RmQeWSQgW
	VbbVif8kN/HMBZ/86j1W5kDdUe6UYbQQ5scdZlhLr3Wewhjs6v0gwsL3/K8n
X-Received: by 2002:a17:907:3f0c:b0:c25:10a:4020 with SMTP id
 a640c23a62f3a-c260ca19c10mr922806766b.16.1788791394189; Mon, 07 Sep 2026
 07:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907134552.1772405-1-puranjay@kernel.org> <20260907134552.1772405-2-puranjay@kernel.org>
 <20260907140642.B02581F00A3A@smtp.kernel.org>
In-Reply-To: <20260907140642.B02581F00A3A@smtp.kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 7 Sep 2026 15:29:38 +0100
X-Gm-Features: AcwNN1VweubETCOFNIB6vM400BaiT3fpYhkl79vbAZ8EO-1z6g0ay3X2vhr8_to
Message-ID: <CANk7y0j33fmyQyTvL37Tx6Ua_bGfT5n_=Smw44u_H7G6rMcr_Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/4] bpf: Add bpf_call_rcu() kfunc
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 3:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Calling `bpf_call_rcu` from NMI context causes a raw spinlock de=
adlock because `call_rcu()` is not NMI-safe.
> --
>
> commit 3385037afe11a72dffbb6db99b4174626596c231
> Author: Puranjay Mohan <puranjay@kernel.org>
>
> bpf: Add bpf_call_rcu() kfunc
>
> This commit adds a new bpf_call_rcu kfunc that allows BPF programs to def=
er
> operations using RCU grace periods.
>
> > diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> > --- a/kernel/bpf/helpers.c
> > +++ b/kernel/bpf/helpers.c
> [ ... ]
> > +__bpf_kfunc int bpf_call_rcu(struct bpf_rcu_head *rh, void *map__const=
_map,
> > +                          bpf_rcu_callback_t callback, struct bpf_prog=
_aux *aux)
> > +{
> [ ... ]
> > +     rhk->callback_fn =3D (bpf_callback_t)(void *)callback;
> > +     rhk->map =3D map;
> > +     rhk->prog =3D prog;
> > +     call_rcu(&rhk->rcu, bpf_rcu_run_callback);
>
> [Severity: High]
> Does this code risk a raw spinlock deadlock if called from an NMI context=
?
>
> Because bpf_call_rcu is exposed to tracing programs, it can be invoked fr=
om
> NMI contexts, such as when a tracing program is attached to a perf event.
> However, call_rcu acquires rcu_node raw spinlocks and is not NMI-safe. If
> the NMI interrupts a path that already holds the same rcu_node lock, the
> system will attempt to re-acquire the lock, resulting in a deadlock.
>
> Should the verifier restrict this kfunc from being called in NMI contexts=
,
> similar to how it uses btf_record_has_nmi_unsafe_fields for bpf_obj_drop?

This set is supposed to land after the rcu changes that allow call_rcu
to work from NMI have landed. Please see the cover letter for the link
to that patchset.
