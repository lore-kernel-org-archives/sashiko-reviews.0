Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9CA372058
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780565305; cv=pass; b=jNhR7Gv4v9zXMavpFC/K/MH6ACvBnuVasPsV5BCeGdp/IFtz1Elbege4BhcoTiIMOX3cMVJAxeHBWFNRP1iP7HHS2AItAwZ79YosEkfUBZw9EPJHimiZc2fwZ0a5hLaLRYfZoKxrmPQA3xDk1qnHu9BsfYGc0u5/N2oibP1Ll+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780565305; c=relaxed/simple;
	bh=wg7lRJNlsW0oBCESMFNCRkAIROxOMlKhfCp9PuczJeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Um4capT6RR6vITO5smbC1XmEz54wakkpujyPWccNg4wvc13/N6ZaBQQDewP6Bb6IX1jbIuwD4Hd1I1D/3u0NcuhBDJ9XWlbcygoXPuJVLvRvySAlcHNTfdj/57fSyHl47wVQ740erN6WMlilCYHCz0nRaWN5LORXOG32+pqYMWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=FnMQZr/E; arc=pass smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FnMQZr/E"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-59ebb89109aso390177e0c.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 02:28:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780565303; cv=none;
        d=google.com; s=arc-20240605;
        b=b3FsT08g/p8lWvAeV7kpapXgmy+ShI2FxybS0PDllmusgSAOIdHsWNq6Ps90PItt5P
         RRABvia6EcdOeQRcFfnG2NoyLlNcRD7uzJu5iSuk0UnaCR+cKydVWphzdoXdVChdhR39
         DBX/ZIwj5H0cZ9ov3RVFZfusR7fkb+y9lPvsHIT0i9uNkMMDBDIz1e9VHUb7vWeZ1Kgw
         OF7ybqhAJfyzRilZ9jvzKo6qb5qHUVajENRKLsV6ufFurHFm+JjfDBnZbfLfHwaJ/PiS
         biXD/6RjvfXkDGIqBE03cLeBidbl3faCQ29GyFqoM8MmpUExFF3uTDBNy79i5EQVdwVZ
         jv4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RCL4lcQvD3orPEEgkWOhjChzr8i+E32h69rRAld3F+M=;
        fh=fItrUtV5UsY1KSNx1ZNnzv3miYMbODbRRQWQ18AP5Zc=;
        b=asbP+/15mwwhXN6mn9NP2n6IJOKdQYgdKu9TP6cvmc0OfppGLPfAZxniGg444pz5k/
         IuIa45VdyHv5SibIrHtE3tJI4RF3DejmAd8XrnN3nGUSKU4eJs2V83tp0lUWtcwSIQSi
         2X+lsoE1Mv2I/6gpzMFgBBsNnS449EuqRBryyMEKn23t+wDzAvFNksKZUjA/qvYdmt1d
         Fjd6V4hplPyCnkbIorCMAKuCPxCIgE210uh4o2rQbuRQfmrd6SkgNR1bwSxVGu2meWog
         z5vrZaOeSk3Nlwn9yBi0VWyKWOMyekQY+bUVjYx1s8Hqw5XBvMcweWqpNTftzwEdwUIJ
         5QCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1780565303; x=1781170103; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCL4lcQvD3orPEEgkWOhjChzr8i+E32h69rRAld3F+M=;
        b=FnMQZr/E9PEl5pGGrI3VXY64mcXrUCHIKy/VyHnCW97Ic4mJRa2B0nTuCJR+6MEwHW
         y3MQQYn6JPxpNueK+hNp7bQMPgQNcq9nlmWAW7DkOCWyFRM8k8h8YsxPn4xIRqWGnT4x
         SkMJEXLU49kEXhFAZhoIF15kyeYyC5DpzF2r2xQZngdyP2GH4Ar4VQrZ216KtH9pl+zm
         hP1VUwiNjsVe+nwF8FRGwUtPHDHk+ZZlXviTS+o1GMVLaf0/nhcmtCPj3oMPjxKd1yq4
         NFGoPeCSW1ljuBepsd+gFSQ9puklZrV+93SB4xalrGI/CyA10MSLQPOkF9NJwW9cS4HN
         JagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780565303; x=1781170103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RCL4lcQvD3orPEEgkWOhjChzr8i+E32h69rRAld3F+M=;
        b=A0dzQE1JVEWUGmd1yJBdL2db7tDnTjGyPUplAdxS5VD5TwbmWxQ+4zXJBIOxiLa3jE
         cAFR0ASbEhWOAC21fg9+XzUgq0xBFyr/wxx3LEwuiWpHWa0bIMc6EqQX3DY9z1N6/gVE
         yLx06HbGpth7G9FBGVpAY8nzn/eJVYWcQj1e2Qy/wxak6Ya0RRcHw/+ur+tqSmxSM3HY
         3pdH+9TSzfeqUqWamI+RsRWigupg2sOFf9X29ZDjcD0FOxEkxfH0gMfoGiDnjlEAwPaI
         uEH67t9okjjt8V1H95/v8qG+NAheUFB6EFPezY3iESvgmArT4/yets7j1TNQUZyNvpaq
         SvIQ==
X-Gm-Message-State: AOJu0YypgH1+hmnaPR+t49TOW+EmPzqu7q2QOprqxWISH/4cyAfZKkyW
	jih1+qg0zd4kwFp88+6UTDYurJ+Dr0NbtBHs8DMRPtyKI0YvmH/EsU72O9kx9yr66W9Ip6ObSQb
	odc/gnuEh0vvijbIsNW2wasSwsXoADmX11Z1HFqGNf1hSKs7Y6p0dmNY9LQ==
X-Gm-Gg: Acq92OE17bzqSCoCuVyxBECZlAr//sWtGdUYzJ9f3mIRmHu2moW3DSTi4m6cUony+5B
	4sJL+f86VT5qj35Q+aWa3VFAvochcqo+zZf8oxi4KBYfMHhszkyeMlvhdXRdEfbBffxgIGq73rL
	syXdRoJPY7j02SLJ/K0wPtiK+DEHm8NdBw8k2gy8PK5I8a1aSL6BEm9lUNpEI2R1bUSjUlWkY8Q
	m6wpEE56OOtxRhFbUgOmcmwFNTjNRynfeLtlieblE7ijwlDzJ0CG3QeE8qKvKTTzOc0IgyB/GBj
	tl6jpKRC1rWL/fl9AvmV
X-Received: by 2002:a05:6122:8b01:b0:59b:396b:cea7 with SMTP id
 71dfb90a1353d-5a6e852f461mr4558017e0c.9.1780565302845; Thu, 04 Jun 2026
 02:28:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260601-kvm-get_reg_list-v2-v5-5-415d08a2813b@sifive.com> <20260601115444.8FA2E1F0089A@smtp.kernel.org>
In-Reply-To: <20260601115444.8FA2E1F0089A@smtp.kernel.org>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Thu, 4 Jun 2026 17:28:11 +0800
X-Gm-Features: AVVi8CeZRd_Q-LBEz-R52ZmAsGdJ0GpJ5AL3CndkzKAkQ3KhAAdQ_zLy8QAqlUs
Message-ID: <CAMWQL2jD_QKcEBRERJHnObgWYO8gApyM+LEG8NU5dwSurYX9yw@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] KVM: riscv: selftests: Split SBI FWFT into
 separate feature-specific sublists
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 7:54=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The `pointer_masking` FWFT registers are omitted from `filter_reg=
()`, causing spurious "new registers" output when testing other FWFT config=
urations.
> --
>
> commit aac064e5a6f0dbfa5efc45c4b208f71e477aa98e
> Author: Yong-Xuan Wang <yongxuan.wang@sifive.com>
>
> KVM: riscv: selftests: Split SBI FWFT into separate feature-specific subl=
ists
>
> Divide the monolithic SBI FWFT register list into separate sublists, each
> testing a specific FWFT feature independently. This allows tests to run
> correctly on platforms where not all FWFT features are available.
>
> > diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/t=
esting/selftests/kvm/riscv/get-reg-list.c
> > index 5033c09201ef1..cb86cb6b36355 100644
> > --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> [ ... ]
> > @@ -149,6 +150,14 @@ bool filter_reg(__u64 reg)
> >       case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CS=
R_AIA_REG(iprio1h):
> >       case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CS=
R_AIA_REG(iprio2h):
> >               return isa_ext_cant_disable[KVM_RISCV_ISA_EXT_SSAIA];
> > +     /*
> > +      * FWFT misaligned delegation registers are always visible when t=
he SBI FWFT
> > +      * extension is enable and the host supports the misaligned deleg=
ation.
> > +      */
> > +     case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_R=
ISCV_SBI_FWFT_REG(misaligned_deleg.enable):
> > +     case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_R=
ISCV_SBI_FWFT_REG(misaligned_deleg.flags):
> > +     case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_R=
ISCV_SBI_FWFT_REG(misaligned_deleg.value):
> > +             return sbi_ext_enabled[KVM_RISCV_SBI_EXT_FWFT];
>
> [Severity: Low]
> Should the pointer_masking FWFT registers be included here as well?
>
> If config_sbi_fwft_misaligned_deleg is tested on a host where the SMNPM
> extension is available and cannot be disabled, KVM will expose the
> pointer_masking registers. Because they are omitted from filter_reg(), wo=
n't
> the test framework spuriously report them as new registers?

The SMNPM extension can be disabled so the KVM won't expose the pointer_mas=
king
registers when testing config_sbi_fwft_misaligned_deleg.

>
> >       default:
> >               break;
> >       }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-kvm-get_=
reg_list-v2-v5-0-415d08a2813b@sifive.com?part=3D5
