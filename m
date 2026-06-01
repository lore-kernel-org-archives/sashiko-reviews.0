Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3BE34753F
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 07:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780299665; cv=pass; b=InpuhI5VjHnV3Nz6/OXEsP+V6rprFyqX15dLewRlO81OJmKsmegFAI9Vg/A0PLuaQSu4IHt/xWP6skBXwpKoksrUzbCCRSJOwcBi9wybAKDFs/oz2fi6j9WlQVU/+ulCRunPU+qR/s/kRk/74alV04kwM+h7XHTMZsa1yUhq/oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780299665; c=relaxed/simple;
	bh=uldws4YYrDuKQMGKGb313TUyZ0lHqaMjeH0b+jr1WNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=siNuzZLmg0dhJypus46aSpPlQHAT/W+wlyeuk+QqouvDkKfZKSyO3RHaXERB8+SA9EajzVgquaEBrEob1Eu1/keToDXcD383AWCYr2+1R+Zu1eE3HBBUPgRF0SgIAxO0td/TWZ5oRhGvK5Es6tC2VUh1SLkZjITRVuqI2C1sn5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=nB8PnoZU; arc=pass smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="nB8PnoZU"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-59aaca022easo1855934e0c.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 00:41:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780299663; cv=none;
        d=google.com; s=arc-20240605;
        b=X8NssddBt1NOdeoXtrezNeVWa906YNmn0rt3/2NPcx+rUs38VGeOTChBSdYl61FEEg
         Oy0K9msk7hLeiw2ZVyoD4WsV+mp07zMd6k0nFTEQTCJcFBMaeV1IwKfBjC37HJZHFiDm
         EeMm56qKwPB372/bMwUnNosf5J28ZcZkeXRm1WLmLOpqYb7N7++vxQ43TLn08cMO/4wP
         MvBNuc0a+px4Gg5kkO94kFNw1QGK5HS9brJ7JNNZV+05LNhpwDOuiM/ixx8eJ8YNcOxU
         8GaU9pCk5H5w3CBH6oSpUgvfVURaWMNCJpWFycEAuV7WTbJTeGhxKPU4VbgS8/3nd3FM
         PZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XnpovSeu5LTyBOUlAh1dxONh9WzZ8VZmHp/ieSTt+w0=;
        fh=fItrUtV5UsY1KSNx1ZNnzv3miYMbODbRRQWQ18AP5Zc=;
        b=ghdwGUDE6CIQ5YWBZlPz2MKaDfHII8QqFi1OMAwxHHbYkXk17Rwg6ZhI9qGQ4Xv4HD
         0nV982aEuCzgME8ZBNaVUx2k15EV8Nmqdu8jbQIASllWu1phJpbXLryTtaIIPZXuhPrT
         9oK2AUSsOal1u6GwXFKjLUJwKqT78F964U4nQlZdY4qIODnoitZmy4TMXv87qcQOpiBD
         xQ26G9h0wGo9oMxaBfbrVNCx4UHMqTQmRfavFLw1NS9N1vgSJew7xcbTRczm0aqPG9PN
         QZtPJnYDFEPbSqHmiYhR9s9TzZ/nyegj5l9aUouyHL7BrahQ4F0sgdJJTk3iD4J4LjsN
         maig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1780299663; x=1780904463; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnpovSeu5LTyBOUlAh1dxONh9WzZ8VZmHp/ieSTt+w0=;
        b=nB8PnoZUyfsblaDvZjvpkSKoxdJkSjDE/Ji9ucMEBlPI3/y47z9e+b5anjJPz+CtKz
         c1O+NNJebbtbyPMYPdWOdwKMRhJM6I+ETqnQZHNFO3Fp6gkrulOabDb1PCDj4c5vnKQ6
         OdiaxaYPkITwBDK62HtAHiGMwca40FQ4RaiUFSgHNbJP+bGBtdR0ppLa9DxAnXcCm2O8
         kpDMYk6fcpFhiIn9t/hCS5zCIMPFmlzHDrP6xTkzgg6pfi6641Tn+CR2qMIDTQYMZUPp
         RWKR6Cd5kBrbcii1oH2FIfNQnEJoNwD3ej3o8O6XUgtF5enFg8yEJlgri+kzDe2gS5FD
         UaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780299663; x=1780904463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XnpovSeu5LTyBOUlAh1dxONh9WzZ8VZmHp/ieSTt+w0=;
        b=QBKTcUzrhqv1kriJIm+wnH7g4LKFon3XJYX9LlR4LX1VDK8ePiSpo4tYe2ZooLkOGd
         I1Upgt//dEIVmJxMN4yMKEV17+3MNGo0Ia6qSy68DB8GK/KP5pDGPwmSa9Licvw/FgFM
         QPAuCNPxw9cUlc6EXT+e7pfuXI8Kuy0ZvTAoDJRdDDSS6uu9rnchqGUliXMA2jwwGNr/
         3O7/IBdnWcBkybj3KD/8AUvxnK/3ubmF1ueYxUdeSO1clFLbpStxNm/OV66ViBR8al3H
         qhcI/nQVPjQcaPhRkBveVEMjXnKsvTs1p8AMhmehwGvSFrUL/d3lnrDccX458f+Sp69t
         +QDw==
X-Gm-Message-State: AOJu0YwNOgUOSDJO3QyMSjq0hYASyzrZsA6thkgNP+U9a8sQhiz5zfg2
	ieMMq/UcXC0wFTB42DpiSk51Hdtsf+J/uzV8+RLRVRJ+62PtndFyODk3b0b7EYu9Zh/Vu55UfZR
	J6FjCd3LqNetICPC2nSBZju+JjkEg4W/mAIk48iDgYR2Xx8xYm2YwGAA=
X-Gm-Gg: Acq92OG0zaj2QYkPjwl/3yjH5CNPHufAy6Ofuntivw2CaDy45/PlSb40pkON/kr/GcX
	nvtEJ3+c1U1JkuKEbAKLZ0XLZywu53l3RYinm1xphHVU3HVZu5o3ZsN+dNWm44Adgopiu2xEwn0
	8B4eUiLGzFkw0/hnmYrI+A4g3W3Aj6kqsemS3Zq81kq842ejxNYejTtIcKK+L5yYdQASxFlBVJz
	4PvYTxK5zwomD6OGIIVXCOPpEsnRiZVi98bLLDznSs3UOwdzfyl2hMW+2+VBkVOQ8Unvq6ZGxnF
	D1k9qQS5SyehF1DMkLl3
X-Received: by 2002:a05:6122:4f9e:b0:55b:d85:5073 with SMTP id
 71dfb90a1353d-59bf1653ac0mr3993732e0c.4.1780299663078; Mon, 01 Jun 2026
 00:41:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528-kvm-get_reg_list-v2-v3-3-170969a8599f@sifive.com> <20260529081023.AE75B1F00893@smtp.kernel.org>
In-Reply-To: <20260529081023.AE75B1F00893@smtp.kernel.org>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 1 Jun 2026 15:40:51 +0800
X-Gm-Features: AVHnY4LUldgfv3tioL_N-gmyL6cy_L6milyQSwqu74UtlVs6iKLMpqgiXSjgX20
Message-ID: <CAMWQL2iGu4VPBsJ5dFJp2O8hjzxxOvuLTzP76_B=7vAGnyyoJg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] KVM: riscv: selftests: Split SBI FWFT into
 separate feature-specific sublists
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 4:10=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] FWFT pointer masking registers are incorrectly handled in chec=
k_supported_reg() instead of filter_reg(), leading to dead code and potenti=
al false positive test failures.
> --
>
> commit c0f0519ecd25fb69f07c9b166dfd4ccf59ef2905
> Author: Yong-Xuan Wang <yongxuan.wang@sifive.com>
>
> KVM: riscv: selftests: Split SBI FWFT into separate feature-specific subl=
ists
>
> This commit divides the monolithic SBI FWFT register list into separate
> sublists to test features independently. It adds check_supported_reg() an=
d
> check_fwft_feature() to validate register and feature availability at
> runtime. This prevents tests from failing when only a subset of FWFT
> features or their dependent ISA extensions are available on a given
> platform.
>
> > diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/t=
esting/selftests/kvm/riscv/get-reg-list.c
> > index 5033c09201ef1..7ae55fbad29aa 100644
> > --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > @@ -27,6 +27,23 @@ enum {
> >  };
> >
> >  static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
> > +static bool isa_ext_enabled[KVM_RISCV_ISA_EXT_MAX];
> > +static bool sbi_ext_enabled[KVM_RISCV_SBI_EXT_MAX];
> > +
> > +bool check_supported_reg(struct kvm_vcpu *vcpu, __u64 reg)
> > +{
> > +     switch (reg & ~REG_MASK) {
> > +     case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_R=
ISCV_SBI_FWFT_REG(pointer_masking.enable):
> > +     case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_R=
ISCV_SBI_FWFT_REG(pointer_masking.flags):
> > +     case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_R=
ISCV_SBI_FWFT_REG(pointer_masking.value):
> > +             return sbi_ext_enabled[KVM_RISCV_SBI_EXT_FWFT] &&
> > +                    isa_ext_enabled[KVM_RISCV_ISA_EXT_SMNPM];
> > +     default:
> > +             break;
> > +     }
> > +
> > +     return true;
> > +}
>
> [Severity: Medium]
> Should these pointer masking registers be handled in filter_reg() instead=
 of
> here?
>
> When testing the config_sbi_fwft_pointer_masking sublist,
> check_fwft_feature() iterates over the expected registers and invokes
> __TEST_REQUIRE(!rc, ...) which skips the test if any are missing. This
> means the test exits early, and the core loop that calls
> check_supported_reg() for missing registers is never reached.

Oh yes the check_supported_reg() can be removed now.

>
> Moving this logic to filter_reg() also seems necessary to avoid false
> positive test failures. If a user runs the config_sbi_fwft_misaligned_del=
eg
> configuration on a host where the SMNPM ISA extension cannot be disabled
> (isa_ext_cant_disable[SMNPM] =3D=3D true), both FWFT and SMNPM extensions=
 will
> be active. KVM will naturally expose the pointer_masking registers in thi=
s
> state.
>
> Because they are not in the misaligned_deleg sublist and are omitted from
> filter_reg(), will the test incorrectly flag them as unexpected new
> registers and fail?

The SMNPM ISA extension can be disabled for a VM, so the
isa_ext_cant_disable[SMNPM] won't be true. Both FWFT and SMNPM
extensions will be active only when testing the new
config_sbi_fwft_pointer_masking sublist.

>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528-kvm-get_=
reg_list-v2-v3-0-170969a8599f@sifive.com?part=3D3
