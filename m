Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794394702;
	b=1SVQNBPHQecggzPefRSW5+B//EtRIX8eYGAZcPwBhjJ3mD4l+pG/vLde/s9Id06TrzRb
	 ydsQQ8Cd6mETnTyq0Ynm21IV//DrUNDo8wkC0lsDPOY0M64LOolwELIgN7YBtqd+5M0al
	 ZMPRU7O8VbxWLOs9qMOD/W6jp9/NcvPuVutThHU1CHq9Jd5X446VJ90iPcIxxPj18TwkO
	 RWf9Z7rCV1c6Z8gUH3epIO1Exqv6w2dNgOLKdXWkrrP/UdKolrQDoMN6dJWbKOFqqyaSv
	 X8moKbvN1DHoxHfxvcOY7geOtZXX9FemzlKQeI5l2XPu6x/wzSrWAGC4SexekgmC9aQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=jSNboseJHmMbjWA7WKSfZ1vyDpr+PcUdD6zBvgewwJQ=;
	b=O79rq6UMhKKnwXDITd+j8U+5oQ1P+oIMA6qqXEzP1ogmPWjQkEXcN0lt3x6Znfyujz7x
	 id1JIvoVVdGoUw37+WkkLzOI9tP52x28v345YX0UV5zjviU3IH2sT7yvEng9oH1M/9PPs
	 lMLoaOXjjlugsxpBGuJIuB6SdqGoONGstsAkan/eVTrvcDbeg6gyhSwkF6Alt5VlIUp8S
	 WwC3uR5njTiar5UepmfJP7GHRnk5B8oPOrn68fhxXMf5SBIK/kpywUwQTM0u5cIKe9JqR
	 kiw43jMxeUweg1/CruC5m276iiNU+loxuHOONtyQJUlh7u9Zdz7zWgEW2tpBvNlLNsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="p7ZS+1/B";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3C1606A324
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 10:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE3C1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p7ZS+1/B
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67583c777abso3646134d50.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 02:58:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794394701; cv=none;
        d=google.com; s=arc-20260327;
        b=mj80p+2gttzDYjFhO+PViXZP1t9SZmucrQnMWcdtmdmA5ZW8pMwS8B7CJKzkR2CeUZ
         JIC2clBy6rVL8a7y+d/OSfYcz3ZMKi073iYEZcYbxHjHc0bRs+rEaH+EbtyQFzJWS4X0
         bbINdInwnCSok+C5fHUxsjSVdWhLKa7WHtXdyUDbz+lxOor7CQ6uEFucOZMauFYCAyHH
         b5ErcvaAp5U5YMzHgbLo9KiVA0uYOgVIFFFm2E8ZI9zBZlW67gj+Dy/3CeTysPk6McV9
         sIZv+5hNAJntL6Fxl4gbRczzvYgez4/pXttAcMK4SpDxlIa3373RdaRs7eUXJrm117sh
         Jang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jSNboseJHmMbjWA7WKSfZ1vyDpr+PcUdD6zBvgewwJQ=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=h+5BbXPGRJOUvPxVgXI2OW1+92CMZTrZdBL1cj3N8JEDlgw0u40XfdxAdjuMTJv5Fa
         tok09t1TwPurX1CK2HICnbQFF9YMZIrSHim8rortOwD+u5dxzLHnqqQklSGmsKhH3DOx
         R7iG26F6CUzEwvYKQ8HVGM7tN8DfVVh5RuohrMqJxAdRP89m6v/LotweWrecA8f2MKtv
         +g2adAXbAHZOZzVflkaHucWCguwaKzKLbYIzzWE52mz0Reh0eIfXNb30NaSiXj8PAf7x
         ThVn3Qr3/mt5i8kl6IWf2LTYggCRisGoHkMf1o4nlqZpxEQqVnTOJXuxb1KkdWtlY/hj
         9rng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794394701; x=1794999501; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jSNboseJHmMbjWA7WKSfZ1vyDpr+PcUdD6zBvgewwJQ=;
        b=p7ZS+1/BoTd1SLHw6mschGXXXpg50YcCcCj1xMm5CNlio0J3PZy2M7MUZQ1c5ZZXQH
         5PIunB5GBEjGWh3ebcgF/nkUOhm/Q1vcGmHQ22Al5mqp0BKmVK4sTw2gQE+9qp632s6Q
         FWhPIyCN2fdSo/WyYZOCSNCUwfKGP0NR5KXROyqckM9vFi58/Ns8PrYVMlePR89WaJHb
         YTma5NDpn50zJY0JkgLShawtlQEIHopsCqQtchuEWMpfH70s1CnhYn7uYgyUmMgeYgUe
         Fyv0wMA3O91hKlBc2QKHMAd3T1U/EwzOsAjsNcGmE8A/T6cCXx6uMVs9KuQ9u/Bp5wB8
         EA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794394701; x=1794999501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSNboseJHmMbjWA7WKSfZ1vyDpr+PcUdD6zBvgewwJQ=;
        b=l/l0LP4Ds/idtSLn3GvY1bqMYfD1NnC70vokZOlJqQCzo7rD2g/TTUaKoFCucBSOOx
         QnYI33DgAVZllN7LIL5SYB4/ST0g4EozhiJZ6QOG8/Gprl7YHDu8v86yzjqQ4vHVxdXo
         5EouAblYccA/UIrmcZGTEiGxvL8FqEy9wOcN8R19FZS0GiEs3DKiMHfBCzUylNE2sDvx
         JLaK5QAZQocKud1VlvhmocmuUHi79gpAhI6rLFCMK6x/mb+7NEL7WJKv3RGGbF7RdBWv
         VQreOA8AxE4wIcFHNgQzIO/0NZppzvTsf8VAsR8Zz6SyxMxUrrgy9fWr/s4BOU8rWoHN
         VT5Q==
X-Gm-Message-State: APuU4Z+9J3ZyMTb7u8fkBnHh+73Pz0EsQ5IT4tOGReYGVBdKhsYjMZCl
	cuHnzGpn2TIR9C+249RP2ioYneyNWQ0EWM1bDlynQdf4zCosKO0zWqxtPGhuHcoqNtcLOCXkYkG
	18w5qPYHk8ljA2kvN7MGKy2ZIll5oTPa95X+XGkY=
X-Gm-Gg: AYBFou1F13cfZxUZJ+6gOA+mzyU8kVe3Pb8HjRFUb/Vb1/NiTJ5VK2Ehz+iQkOI4LZ1
	fYZEthmzQKBDqWwXARSK8ZqG0sBuiV7TzqQvm8ia7KvfpQEpgVgA/LuOLWR9uWTeo2DyQpWqI1B
	zLtKLFVExb9jNewt1HN1r6i7ma3iLWKyPyHO7pEacqmw0tpJfYwhu2CbIwd3gbx906JWtESl40R
	I+k1kDAipTOwlusYjK87S7+OR8tR6F4qulJ0hx/C+dUNq2ZVJzZaDQGFEJX0YBm544Du7Uxovw2
	QvByw0+Kd2+CojO++7+exenakNVCAl230alYImBVES9AsZiJN7/K/sMio08OfU1BKH+zTiWGaem
	NRVmh7AyOWEWTAtFpozBSxuu30L1nCrZyhJM3aQ==
X-Received: by 2002:a05:690e:450c:20b0:677:eb7b:c701 with SMTP id
 956f58d0204a3-67c5703859emr2240271d50.39.1794394700644; Wed, 11 Nov 2026
 02:58:20 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110164046.454431-1-a.s.protopopov@gmail.com>
 <20261110164046.454431-15-a.s.protopopov@gmail.com> <sashiko-outbox-207493@kernel.org>
In-Reply-To: <sashiko-outbox-207493@kernel.org>
From: Anton Protopopov <a.s.protopopov@gmail.com>
Date: Wed, 11 Nov 2026 11:58:08 +0100
X-Gm-Features: AclHuK-Q4Eu_FS1-HlF4vKvLEdt8PMH7aN4qBEVYkbkPzJS8znNp5Ggh9wBRWMo
Message-ID: <CAGn_itzg7de6tt_W6UQ=aHyUCVDU3dOX9T7yv4vNz5-mAXCMMQ@mail.gmail.com>
Subject: Re: [PATCH v3 bpf-next 14/18] bpf: Require the JIT for fmod_ret
 programs on found 64-bit targets
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 6:38=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] bpf: missing jit_required in fmodret_retval_init() for 32-bit
>   int on ppc64
> --
>
> commit be8ba9e6d31af4b7ee8b1ec3bc7241dc8e6ff517
> Author: Anton Protopopov <a.s.protopopov@gmail.com>
>
> bpf: Require the JIT for fmod_ret programs on found 64-bit targets
>
> This commit sets jit_required for fmod_ret programs attached to found
> targets with 8-byte return types so the BPF interpreter does not truncate
> 64-bit return values to 32 bits.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index b12b57c7403e4..920ff39aac429 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -23883,6 +23883,9 @@ static int fmodret_retval_init(struct bpf_verif=
ier_env *env, u32 btf_id,
> >
> >       aux->fmodret_retvals =3D retvals;
> >       aux->fmodret_retval_cnt =3D cnt;
> > +     /* The interpreter returns only 32 bits */
> > +     if (size =3D=3D 8)
> > +             env->prog->jit_required =3D 1;
>
> [Severity: Medium]
> Does fmodret_retval_init() also need to set jit_required when size =3D=3D=
 4?
>
> On 64-bit PowerPC (which supports BPF trampolines without selecting
> ARCH_WANT_BPF_JIT_ALWAYS_ON), the ELF ABI requires a callee returning a
> 32-bit signed int to sign-extend r3 to 64 bits, and callers inspect all 6=
4
> bits of r3.  DEFINE_BPF_PROG_RUN() defines the interpreter entry points a=
s
> returning unsigned int, which zero-extends r3 to 64 bits.
>
> In arch/powerpc/net/bpf_jit_comp.c, invoke_bpf_prog() and
> __arch_prepare_bpf_trampoline() save and restore all 64 bits of r3 withou=
t
> sign-extending 32-bit return values, so when the interpreter runs an
> fmod_ret program on a target returning int, a negative error return value
> is zero-extended to a positive 64-bit value in r3 while skipping the
> target function.

PowerPC is not part of this patchset. However, in fact, I think I will just
remove this "if (size) =3D=3D 8" and force jit for all new progs. This does=
n't
break any old functionality, only new functions are getting here.

Will send it for v4 or as follow-up.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110164046.45=
4431-1-a.s.protopopov@gmail.com?part=3D14
